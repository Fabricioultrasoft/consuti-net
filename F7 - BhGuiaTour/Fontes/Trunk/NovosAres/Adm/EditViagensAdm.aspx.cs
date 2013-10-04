namespace NovosAres.Adm
{
    using System;
    using System.Collections.Generic;
    using System.Configuration;
    using System.Data;
    using System.IO;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using AjaxControlToolkit;
    using NovosAres.Blog;
    using NovosAres.Service;
    using System.Collections;

    /// <summary>
    /// Classe da tela de alteração/exclusão de destinos.
    /// </summary>
    public partial class EditViagensAdm : System.Web.UI.Page
    {
        /// <summary>
        /// Define quantas imagens podem ser inseridas para cada destino.
        /// </summary>
        private readonly int DefineQuantidadeDeImagens = int.Parse(ConfigurationManager.AppSettings["DefineQuantasImagensPodeSerInseridasParaCadaDestino"]);

        /// <summary>
        /// Defina a extensão das imagens.
        /// </summary>
        private readonly string ExtensaoDasImagens = ConfigurationManager.AppSettings["ExtensaDoArquivoDasImagens"];

        /// <summary>
        /// Define o caminho das imagens no servidor.
        /// </summary>
        private readonly string CaminhoDasImagensNoServidor = ConfigurationManager.AppSettings["CaminhoDasImagensNoServidor"];

        /// <summary>
        /// Armazena o nome antigo do destino, caso o mesmo seja alterado.
        /// </summary>
        private string nomeDoDestinoAnterior = string.Empty;

        /// <summary>
        /// Responsável por efetuar o carregamento da página.
        /// </summary>
        /// <param name="sender">Objeto gerador do eventos.</param>
        /// <param name="e">Contém os parâmetros do evento gerado.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.CarregaDestinosCadastrados();
            }
        }

        /// <summary>
        /// Carrega todos os destinos cadastrados.
        /// </summary>
        protected void CarregaDestinosCadastrados()
        {
            BdDestinos destinos = new BdDestinos();
            this.ddlDestinos.DataSource = destinos.RecuperaTodosDestinosCadastrados();
            this.ddlDestinos.DataBind();
            this.ddlDestinos.Items.Insert(0, "<Selecione um Destino>");
        }

        /// <summary>
        /// Preenche o DropDownList de países de acordo com o continente selecionado.
        /// </summary>
        /// <param name="sender">Objeto gerador do eventos.</param>
        /// <param name="e">Contém os parâmetros do evento gerado.</param>
        protected void ddlContinente_SelectedIndexChanged(object sender, EventArgs e)
        {
            Destinos destinosService = new Destinos();
            ddlPais.DataSource = destinosService.GetPaisesByContinente(Convert.ToInt32(ddlContinente.SelectedItem.Value));
            ddlPais.DataBind();
            ddlPais.Items.Insert(0, "<Selecione um país>");
        }

        /// <summary>
        /// Preenche o DropDownList de cidades de acordo com o país selecionado.
        /// </summary>
        /// <param name="sender">Objeto gerador do eventos.</param>
        /// <param name="e">Contém os parâmetros do evento gerado.</param>
        protected void ddlPais_SelectedIndexChanged(object sender, EventArgs e)
        {
            Destinos destinosService = new Destinos();
            ddlCidade.DataSource = destinosService.GetCidadesByPaises(Convert.ToInt32(ddlPais.SelectedItem.Value));
            ddlCidade.DataBind();
            ddlCidade.Items.Insert(0, "<Selecione uma cidade>");
        }

        /// <summary>
        /// Evento de clique do botão de alteração.
        /// </summary>
        /// <param name="sender">Objeto gerador do eventos.</param>
        /// <param name="e">Contém os parâmetros do evento gerado.</param>
        protected void BtnAlterarDestino_Click(object sender, EventArgs e)
        {
            BdDestinos alteraDestino = new BdDestinos();
            bool nomeDoPacoteFoiAlterado = false, novoNomeDoPacoteEValido = true;
            ArrayList nomeDasImagens = null;

            if (alteraDestino.ValidaSeODestinoJaEstaCadastrado(this.txtNomeDoPacote.Text,
                Convert.ToInt32(this.ddlDestinos.SelectedItem.Value)) == true)
            {
                nomeDoPacoteFoiAlterado = true;

                this.RenomeiaImagensNoServidor();

                if (alteraDestino.ValidaSeODestinoJaEstaCadastrado(this.txtNomeDoPacote.Text) == false)
                {
                    novoNomeDoPacoteEValido = false;
                }
            }

            if (novoNomeDoPacoteEValido)
            {
                try
                {
                    alteraDestino.AtualizarDestino(this.txtNomeDoPacote.Text,
                        Convert.ToInt32(this.ddlCidade.SelectedItem.Value),
                        Convert.ToInt32(this.ddlPais.SelectedItem.Value),
                        Convert.ToInt32(this.ddlContinente.SelectedItem.Value),
                        this.wucTxtDescricao.GetValue(),
                        this.txtLinkPostBlog.Text,
                        this.txtLinkGoogleMaps.Text,
                        Convert.ToInt32(this.ddlDestinos.SelectedItem.Value));

                    if (this.lbImgs.Items.Count > 0)
                    {
                        nomeDasImagens = this.RecuperaNomeDasImagens();
                        alteraDestino.DeletaImagens(Convert.ToInt32(this.ddlDestinos.SelectedItem.Value));
                        alteraDestino.CadastrarImagens(nomeDasImagens,
                            Convert.ToInt32(this.ddlDestinos.SelectedItem.Value));
                    }

                    ExibeMensagemPopUp("Destino alterado com sucesso!");
                }
                catch
                {
                    ExibeMensagemPopUp("ERRO! Destino não alterado. Verifique os dados e tente novamente mais tarde. " +
                            "Caso o problema persista, contate Administrador");
                }
                finally
                {
                    alteraDestino.Dispose();
                }
            }
            else
            {
                ExibeMensagemPopUp("ERRO! Nome do destino já cadastrado.");
            }
        }

        /// <summary>
        /// Verifica se existem imagens para o destino selecionado no servidor, caso exista renomeia.
        /// </summary>
        protected void RenomeiaImagensNoServidor()
        {
            for (int i = 0; i < lbImgs.Items.Count; i++)
            {
                if (File.Exists(Server.MapPath(CaminhoDasImagensNoServidor) + lbImgs.Items[i].ToString()))
                {
                    File.Copy(Server.MapPath(CaminhoDasImagensNoServidor) + lbImgs.Items[i].ToString(),
                        Server.MapPath(CaminhoDasImagensNoServidor) + txtNomeDoPacote.Text + "_" + (i + 1) + ".jpg", true);
                    File.Delete(Server.MapPath(CaminhoDasImagensNoServidor) + lbImgs.Items[i].ToString());
                }
            }

            this.CarregaImagens(this.txtNomeDoPacote.Text);
        }

        /// <summary>
        /// Recupera o nome das imagens do destino.
        /// </summary>
        /// <returns>ArrayList com o nome das imagens.</returns>
        protected ArrayList RecuperaNomeDasImagens()
        {
            ArrayList listaDeImagens = new ArrayList();

            for (int i = 0; i < this.lbImgs.Items.Count; i++)
            {
                listaDeImagens.Add(this.lbImgs.Items[i].Text);
            }

            return listaDeImagens;
        }

        /// <summary>
        /// Evento de clique do botão de exclusão.
        /// </summary>
        /// <param name="sender">Objeto gerador do eventos.</param>
        /// <param name="e">Contém os parâmetros do evento gerado.</param>
        protected void BtnExcluirDestino_Click(object sender, EventArgs e)
        {
            BdDestinos excluirDestino = new BdDestinos();

            try
            {
                excluirDestino.ExcluirDestino(Convert.ToInt32(this.ddlDestinos.SelectedItem.Value));
                this.ApagaImagensDoServidor(this.txtNomeDoPacote.Text);
                ExibeMensagemPopUp("Destino " + txtNomeDoPacote.Text + " excluído com sucesso!");
                Response.Redirect("~/Adm/EditViagensAdm.aspx");
            }
            catch
            {
                ExibeMensagemPopUp("Erro! Operação não realizada. Verifique os dados e tente novamente. " +
                    "Se o erro persistir, contate o administrador.");
            }
            finally
            {
                excluirDestino.Dispose();
            }
        }

        /// <summary>
        /// Evento Change do DropDownList de destinos.
        /// </summary>
        /// <param name="sender">Objeto gerador do eventos.</param>
        /// <param name="e">Contém os parâmetros do evento gerado.</param>
        protected void ddlDestinos_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.pnlSelecionaDestino.Visible = false;
            this.pnlAlteraDestino.Visible = true;
            this.CarregaDadosDoDestinoSelecionado(Convert.ToInt32(this.ddlDestinos.SelectedItem.Value));
        }

        /// <summary>
        /// Carrega os dados do destino selecionado na tela.
        /// </summary>
        /// <param name="idDestino">ID do destino selecionado.</param>
        protected void CarregaDadosDoDestinoSelecionado(int idDestino)
        {
            BdDestinos destino = new BdDestinos();
            string caminhoDasImagens = CaminhoDasImagensNoServidor;

            try
            {
                DataSet dsDestinos = destino.RecuperaDestinoPeloID(idDestino);
                DataRow drDestinos = dsDestinos.Tables[0].Rows[0];

                this.CarregaContinentes();
                this.CarregaPaises(Convert.ToInt32(drDestinos["IdContinente"]));
                this.CarregaCidades(Convert.ToInt32(drDestinos["IdPais"]));

                this.txtNomeDoPacote.Text = drDestinos["Nome"].ToString();
                this.wucTxtDescricao.SetValue(drDestinos["Descricao"].ToString());
                this.txtLinkPostBlog.Text = drDestinos["LinkPostBlog"].ToString();
                this.txtLinkGoogleMaps.Text = drDestinos["LinkGoogleMaps"].ToString();
                this.ddlCidade.SelectedValue = drDestinos["IdCidade"].ToString();
                this.ddlPais.SelectedValue = drDestinos["IdPais"].ToString();
                this.ddlContinente.SelectedValue = drDestinos["IdContinente"].ToString();
                this.CarregaImagens(this.txtNomeDoPacote.Text);
            }
            catch
            {
                ExibeMensagemPopUp("Erro ao carregar dados do destino. Tente novamente e se o erro persistir contate o Administrador.");
            }
            finally
            {
                destino.Dispose();
            }
        }

        /// <summary>
        /// Verifica se existe imagens no servidor para o destino selecionado, caso exista, exibe o nome das mesmas
        /// no ListBox.
        /// </summary>
        /// <param name="nomeDoPacote">Nome do pacote selecionado.</param>
        protected void CarregaImagens(string nomeDoPacote)
        {
            this.lbImgs.Items.Clear();

            string caminhoDasImagensNoServidor = Server.MapPath(this.CaminhoDasImagensNoServidor);

            for (int i = 1; i <= DefineQuantidadeDeImagens; i++)
            {
                if (File.Exists(caminhoDasImagensNoServidor + nomeDoPacote + "_" + i + ".jpg"))
                {
                    this.lbImgs.Items.Add(nomeDoPacote + "_" + i + ".jpg");
                }
            }
        }

        /// <summary>
        /// Método responsável por apagar as imagens no servidor do destino que está sendo removido.
        /// </summary>
        /// <param name="nomeDoDestino">Nome do destino que está sendo removido.</param>
        protected void ApagaImagensDoServidor(string nomeDoDestino)
        {
            this.lbImgs.Items.Clear();

            string caminhoDasImagensNoServidor = Server.MapPath(this.CaminhoDasImagensNoServidor);

            for (int i = 1; i <= DefineQuantidadeDeImagens; i++)
            {
                if (File.Exists(caminhoDasImagensNoServidor + nomeDoDestino + "_" + i + ".jpg"))
                {
                    File.Delete(caminhoDasImagensNoServidor + nomeDoDestino + "_" + i + ".jpg");
                }
            }
        }

        /// <summary>
        /// Adiciona a lista de imagens a imagem pré-carregada
        /// </summary>
        /// <param name="sender">Objeto gerador do eventos.</param>
        /// <param name="e">Contém os parâmetros do evento gerado.</param>
        protected void imgBtnAdd_Click(object sender, ImageClickEventArgs e)
        {
            if (lbImgs.Items.Count < DefineQuantidadeDeImagens)
            {
                string mensagemDoResultadoDaValidacao = ValidaConteudoDoAsyncFileUpload(afuImg, txtNomeDoPacote.Text + "_" + (lbImgs.Items.Count + 1));

                if (mensagemDoResultadoDaValidacao.Equals(string.Empty))
                {
                    lbImgs.Items.Add(txtNomeDoPacote.Text + "_" + (lbImgs.Items.Count + 1) + ExtensaoDasImagens);
                    afuImg.Dispose();
                }
                else
                {
                    ExibeMensagemPopUp(mensagemDoResultadoDaValidacao);
                }
            }
            else
            {
                ExibeMensagemPopUp("Limite de imagens excedido. Máximo 5!");
            }
        }

        /// <summary>
        /// Valida o conteudo do AsyncFileUpload.
        /// </summary>
        /// <param name="asyncFileUpload">Conteúdo do AsyncFileUpload a ser validade.</param>
        /// <param name="nomeDestino">Nome do destino a ser associado com a imagem.</param>
        /// <returns>Mensagem com o resultado da validação.</returns>
        protected string ValidaConteudoDoAsyncFileUpload(AsyncFileUpload asyncFileUpload, string nomeDestino)
        {
            string mensagem = string.Empty;
            string nomeDoArquivoSelecionado = asyncFileUpload.FileName;
            string extensaoDaImagem = string.Empty, nomeDaImagem = string.Empty, caminhoImagem = Server.MapPath(CaminhoDasImagensNoServidor);

            if (asyncFileUpload.HasFile)
            {
                extensaoDaImagem = nomeDoArquivoSelecionado.Substring(nomeDoArquivoSelecionado.Length - 4).ToLower();

                if (String.Compare(extensaoDaImagem, ExtensaoDasImagens) == 0)
                {
                    nomeDaImagem = nomeDestino + extensaoDaImagem;

                    if (!File.Exists(CaminhoDasImagensNoServidor + nomeDaImagem))
                    {
                        asyncFileUpload.SaveAs(caminhoImagem + nomeDaImagem);
                    }
                    else
                    {
                        File.Delete(caminhoImagem + nomeDaImagem);
                        asyncFileUpload.SaveAs(caminhoImagem + nomeDaImagem);
                    }
                }
                else
                {
                    mensagem = "Formato do Arquivo Inválido! Selecione um arquivo no formato JPG.";
                }
            }
            else
            {
                mensagem = "Campo obrigatório para adicionar imagem.";
            }

            return mensagem;
        }

        /// <summary>
        /// Exclui imagens do ListBox.
        /// </summary>
        /// <param name="sender">Objeto gerador do eventos.</param>
        /// <param name="e">Contém os parâmetros do evento gerado.</param>
        protected void ImgBtnExcluir_Click(object sender, ImageClickEventArgs e)
        {
            if (lbImgs.SelectedItem != null)
            {
                try
                {
                    this.RemoverImagensDeletadasDoListBoxDoServidor(this.lbImgs.SelectedItem.ToString());
                    this.lbImgs.Items.Remove(this.lbImgs.SelectedItem);                    
                    this.ExibeMensagemPopUp("Imagem excluída com sucesso!");
                }
                catch (Exception)
                {
                    this.ExibeMensagemPopUp("ERRO! Imagem não excluída. Tente novamente ou procure o Administrador.");
                }
            }
            else
            {
                this.ExibeMensagemPopUp("Selecione um item na lista!");
            }
        }

        /// <summary>
        /// Remove as imagens deletadas do listbox do servidor.
        /// </summary>
        /// <param name="nomeDaImagem">Nome da imagem removida do listbox.</param>
        protected void RemoverImagensDeletadasDoListBoxDoServidor(string nomeDaImagem)
        {
            string caminhoDasImagensNoServidor = Server.MapPath(this.CaminhoDasImagensNoServidor);

            for (int i = 1; i <= DefineQuantidadeDeImagens; i++)
            {
                if (File.Exists(caminhoDasImagensNoServidor + nomeDaImagem))
                {
                    File.Delete(caminhoDasImagensNoServidor + nomeDaImagem);
                }
            }
        }

        /// <summary>
        /// Responsável por carregar do drop down list de continentes.
        /// </summary>
        protected void CarregaContinentes()
        {
            Destinos destinosService = new Destinos();
            this.ddlContinente.DataSource = destinosService.GetContinentes();
            this.ddlContinente.DataBind();
            this.ddlContinente.Items.Insert(0, "<Selecione um continente>");
        }

        /// <summary>
        /// Responsável por carregar do drop down list de países.
        /// </summary>
        protected void CarregaPaises(int idContinente)
        {
            Destinos destinosService = new Destinos();
            this.ddlPais.DataSource = destinosService.GetPaisesByContinente(idContinente);
            this.ddlPais.DataBind();
            this.ddlPais.Items.Insert(0, "<Selecione um país>");
        }

        /// <summary>
        /// Responsável por carregar do drop down list de cidades.
        /// </summary>
        protected void CarregaCidades(int idPais)
        {
            Destinos destinosService = new Destinos();
            this.ddlCidade.DataSource = destinosService.GetCidadesByPaises(idPais);
            this.ddlCidade.DataBind();
            this.ddlCidade.Items.Insert(0, "<Selecione uma cidade>");
        }

        /// <summary>
        /// Exibe mensagem popup.
        /// </summary>
        /// <param name="mensagem">Mensagem a ser exibida no popup.</param>
        private void ExibeMensagemPopUp(string mensagem)
        {
            ClientScript.RegisterStartupScript(
                            this.GetType(),
                            "arquivo",
                            "alert('" + mensagem + "');",
                            true);
        }
    }
}
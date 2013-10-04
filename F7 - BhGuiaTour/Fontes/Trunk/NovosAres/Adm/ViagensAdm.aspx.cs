namespace NovosAres.Adm
{
    using System;
    using System.Collections.Generic;
    using System.Collections.Specialized;
    using System.Linq;
    using System.Web;
    using System.Web.Services;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using AjaxControlToolkit;
    using NovosAres.Blog;
    using NovosAres.Service;
    using System.Data;
    using System.Collections;
    using System.IO;
    using System.Configuration;

    /// <summary>
    /// Classe da tela de Viagens.
    /// </summary>
    public partial class ViagensAdm : System.Web.UI.Page
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
        /// Responsável por efetuar o carregamento da página.
        /// </summary>
        /// <param name="sender">Objeto gerador do eventos.</param>
        /// <param name="e">Contém os parâmetros do evento gerado.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
           // if (String.IsNullOrEmpty(this.Context.User.Identity.Name))
           // {
           //     Response.Redirect("~/Adm/UserAdm.aspx");
           // }
           // else
           // {
                if (!IsPostBack)
                {
                    this.CarregaContinentes();
                }
                else
                {
                    BdDestinos validaNomeDestino = new BdDestinos();

                    if (validaNomeDestino.ValidaSeODestinoJaEstaCadastrado(this.txtNomeDoPacote.Text))
                    {
                        ImgBtnExcluir.Enabled = true;
                        imgBtnAdd.Enabled = true;
                    }
                    else
                    {
                        this.imgBtnAdd.Enabled = false;
                        this.ImgBtnExcluir.Enabled = false;
                        ExibeMensagemPopUp("Já existe um produto cadastrado com o nome [" + this.txtNomeDoPacote.Text +
                            "], favor cadastrar com outro nome.");
                        this.txtNomeDoPacote.Text = "";
                    }
                }
           // }
        }

        /// <summary>
        /// Responsável por carregar do drop down list de continentes.
        /// </summary>
        protected void CarregaContinentes()
        {
            Destinos destinosService = new Destinos();
            ddlContinente.DataSource = destinosService.GetContinentes();
            ddlContinente.DataBind();
            ddlContinente.Items.Insert(0, "Selecione um continente...");
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
            ddlPais.Items.Insert(0, "Selecione um país...");
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
            ddlCidade.Items.Insert(0, "Selecione uma cidade...");
        }

        /// <summary>
        /// Evento de clique do botão de cadastro.
        /// </summary>
        /// <param name="sender">Objeto gerador do eventos.</param>
        /// <param name="e">Contém os parâmetros do evento gerado.</param>
        protected void BtnCadastrarDestino_Click(object sender, EventArgs e)
        {
            BdDestinos cadastrarDestino = new BdDestinos();
            
            ArrayList nomeDasImagens = null;
                        
            try
            {
                int idDestinoCadastrado = cadastrarDestino.CadastrarDestino(this.txtNomeDoPacote.Text,
                    Convert.ToInt32(this.ddlCidade.SelectedItem.Value),
                    Convert.ToInt32(this.ddlContinente.SelectedItem.Value),
                    Convert.ToInt32(this.ddlPais.SelectedItem.Value),
                    this.wucTxtDescricao.GetValue(),
                    this.txtLinkPostBlog.Text,
                    this.txtLinkGoogleMaps.Text);

                if (this.lbImgs.Items.Count > 0)
                {
                    nomeDasImagens = this.RecuperaNomeDasImagens();
                    cadastrarDestino.CadastrarImagens(nomeDasImagens, idDestinoCadastrado);
                }                

                this.LimparCampos();
                ExibeMensagemPopUp("Destino cadastrado com sucesso!");
            }
            catch
            {
                ExibeMensagemPopUp("Erro! Destino não cadastrado. Verifique os dados e tente novamente mais tarde. " +
                        "Caso o problema persista, contate Administrador");
            }
            finally
            {
                cadastrarDestino.Dispose();
            }
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
        /// Método responsável por apagar o conteudo dos campos da tela.
        /// </summary>
        protected void LimparCampos()
        {
            this.txtLinkGoogleMaps.Text = string.Empty;
            this.txtLinkPostBlog.Text = string.Empty;
            this.txtNomeDoPacote.Text = string.Empty;
            this.wucTxtDescricao.SetValue(string.Empty);
            this.lbImgs.Items.Clear();
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
                    lbImgs.Items.Remove(lbImgs.SelectedItem);
                    ExibeMensagemPopUp("Imagem excluída com sucesso!");
                }
                catch (Exception)
                {
                    ExibeMensagemPopUp("ERRO! Imagem não excluída. Tente novamente ou procure o Administrador.");
                }
            }
            else
            {
                ExibeMensagemPopUp("Selecione um item na lista!");
            }
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
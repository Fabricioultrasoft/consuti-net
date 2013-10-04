using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.Configuration;
using System.IO;
using NovosAres.Blog;
using System.Data;

namespace NovosAres.Adm
{
    public partial class AntesViajar : System.Web.UI.Page
    {
        /// <summary>
        /// Defina a extensão das imagens.
        /// </summary>
        private readonly string ExtensaoDoManual = ConfigurationManager.AppSettings["ExtensaDoManualAntesViajar"];

        /// <summary>
        /// Define o caminho das imagens no servidor.
        /// </summary>
        private readonly string CaminhoDoManualNoServidor = ConfigurationManager.AppSettings["CaminhoDoManualNoServidor"];

        /// <summary>
        /// Responsável por efetuar o carregamento da página.
        /// </summary>
        /// <param name="sender">Objeto gerador do eventos.</param>
        /// <param name="e">Contém os parâmetros do evento gerado.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.CarregaDadosManual();
            }
        }

        protected void CarregaDadosManual()
        {
            // Carregar os dados na tela caso exista registro no banco de dados.
            BdAntesViajar bdAntesDeViajar = new BdAntesViajar();

            try
            {                
                DataSet dsAntesDeViajar = bdAntesDeViajar.RecuperaDadosAntesDeViajar();

                if (dsAntesDeViajar != null)
                {
                    DataRow drAntesDeViajar = dsAntesDeViajar.Tables[0].Rows[0];
                    this.TxtTitulo.Text = drAntesDeViajar["Titulo"].ToString();
                    this.wucTxtDescricao.SetValue(drAntesDeViajar["Descricao"].ToString());
                    this.nomeManual.Visible = true;
                    this.btnCadastrarAntesViajar.Visible = false;
                    this.btnAtualizarAntesViajar.Visible = true;
                }
                else
                {
                    this.nomeManual.Visible = false;
                    this.btnCadastrarAntesViajar.Visible = true;
                    this.btnAtualizarAntesViajar.Visible = false;
                }
            }
            finally
            {
                bdAntesDeViajar.Dispose();
            }
        }

        /// <summary>
        /// Evento de clique do botão de atualização.
        /// </summary>
        /// <param name="sender">Objeto gerador do eventos.</param>
        /// <param name="e">Contém os parâmetros do evento gerado.</param>
        protected void BtnAtualizarAntesViajar_Click(object sender, EventArgs e)
        {
            string mensagemDoResultadoDaValidacao = ValidaConteudoDoAsyncFileUpload(this.afuManual);
            BdAntesViajar bdAntesDeViajar = new BdAntesViajar();

            if (mensagemDoResultadoDaValidacao.Equals(string.Empty))
            {
                try
                {
                    bdAntesDeViajar.AtualizarAntesDeViajar(this.TxtTitulo.Text,
                        this.wucTxtDescricao.GetValue());
                    ExibeMensagemPopUp("Atualização realizada com sucesso!");
                    this.CarregaDadosManual();
                }
                catch
                {
                    ExibeMensagemPopUp("ERRO! Dados não alterados. Verifique os dados e tente novamente mais tarde. " +
                                "Caso o problema persista, contate Administrador");
                }
            }
            else
            {
                ExibeMensagemPopUp(mensagemDoResultadoDaValidacao);
            }
        }

        /// <summary>
        /// Evento de clique do botão de cadastro.
        /// </summary>
        /// <param name="sender">Objeto gerador do eventos.</param>
        /// <param name="e">Contém os parâmetros do evento gerado.</param>
        protected void BtnCadastrarAntesViajar_Click(object sender, EventArgs e)
        {
            string mensagemDoResultadoDaValidacao = ValidaConteudoDoAsyncFileUpload(this.afuManual);
            BdAntesViajar bdAntesViajar = new BdAntesViajar();

            if (mensagemDoResultadoDaValidacao.Equals(string.Empty))
            {
                try
                {
                    bdAntesViajar.CadastrarAntesDeViajar(this.TxtTitulo.Text,
                        wucTxtDescricao.GetValue(),
                        CaminhoDoManualNoServidor + "ManualAntesDeViajar.pdf");
                    this.LimparCampos();
                    ExibeMensagemPopUp("Cadastrado realizado com sucesso!");
                }
                catch (Exception)
                {
                    ExibeMensagemPopUp("Erro! Falha ao cadastrar. Verifique os dados e tente novamente mais tarde. " +
                        "Caso o problema persista, contate Administrador");
                }

                finally
                {
                    bdAntesViajar.Dispose();
                }
            }
            else
            {
                ExibeMensagemPopUp(mensagemDoResultadoDaValidacao);
            }
        }

        /// <summary>
        /// Valida o conteudo do AsyncFileUpload.
        /// </summary>
        /// <param name="asyncFileUpload">Conteúdo do AsyncFileUpload a ser validade.</param>
        /// <param name="nomeDestino">Nome do destino a ser associado com a imagem.</param>
        /// <returns>Mensagem com o resultado da validação.</returns>
        protected string ValidaConteudoDoAsyncFileUpload(AsyncFileUpload asyncFileUpload)
        {
            string mensagem = string.Empty;
            string nomeDoArquivoSelecionado = asyncFileUpload.FileName;
            string extensaoDoManual = string.Empty, nomeDoManual = string.Empty, caminhoManual = Server.MapPath(CaminhoDoManualNoServidor);

            if (asyncFileUpload.HasFile)
            {
                extensaoDoManual = nomeDoArquivoSelecionado.Substring(nomeDoArquivoSelecionado.Length - 4).ToLower();

                if (String.Compare(extensaoDoManual, ExtensaoDoManual) == 0)
                {
                    nomeDoManual = "ManualAntesDeViajar" + extensaoDoManual;

                    if (!File.Exists(CaminhoDoManualNoServidor + nomeDoManual))
                    {
                        asyncFileUpload.SaveAs(caminhoManual + nomeDoManual);
                    }
                    else
                    {
                        File.Delete(caminhoManual + nomeDoManual);
                        asyncFileUpload.SaveAs(caminhoManual + nomeDoManual);
                    }
                }
                else
                {
                    mensagem = "Formato do Arquivo Inválido! Selecione um arquivo no formato PDF.";
                }
            }
            else
            {
                mensagem = "Por favor, escolha um arquivo para cadastrar o manual.";
            }

            return mensagem;
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

        /// <summary>
        /// Método responsável por apagar o conteudo dos campos da tela.
        /// </summary>
        protected void LimparCampos()
        {
            this.TxtTitulo.Text = string.Empty;
            this.wucTxtDescricao.SetValue(string.Empty);            
        }
    }
}
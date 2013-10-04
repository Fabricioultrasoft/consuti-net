namespace NovosAres.Adm
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using NovosAres.Blog;
    using System.Data;

    /// <summary>
    /// Classe da tela Seja Bem Vindo.
    /// </summary>
    public partial class SejaBemVindo : System.Web.UI.Page
    {
        /// <summary>
        /// Responsável por efetuar o carregamento da página.
        /// </summary>
        /// <param name="sender">Objeto gerador do eventos.</param>
        /// <param name="e">Contém os parâmetros do evento gerado.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (String.IsNullOrEmpty(this.Context.User.Identity.Name))
            //{
            //    Response.Redirect("~/Adm/UserAdm.aspx");
            //}
            //else
            if (!IsPostBack)
            {
                this.PreencheCamposTelaSejaBemVindo();
            }
        }

        /// <summary>
        /// Evento de clique do botão de cadastro.
        /// </summary>
        /// <param name="sender">Objeto gerador do eventos.</param>
        /// <param name="e">Contém os parâmetros do evento gerado.</param>
        protected void BtnCadastrarSejaBemVindo_Click(object sender, EventArgs e)
        {
            BdSejaBemVindo cadastraMensagemSejaBemVindo = new BdSejaBemVindo();

            try
            {
                cadastraMensagemSejaBemVindo.CadastrarMensagemSejaBemVindo(TxtTitulo.Text, wucTxtDescricao.GetValue());
                TxtTitulo.Text = string.Empty;
                wucTxtDescricao.SetValue(string.Empty);
                ExibeMensagemPopUp("Cadastro Realizado com sucesso.");
            }
            catch (Exception)
            {
                ExibeMensagemPopUp("Ocorreu uma falha ao tentar cadastrar o conteúdo da tela Seja Bem Vindo.");
            }
        }

        /// <summary>
        /// Preenche os campos da tela caso existe algum dados cadastrado no banco de dados.
        /// </summary>
        public void PreencheCamposTelaSejaBemVindo()
        {
            BdSejaBemVindo bdAtualizarSejaBemVindo = new BdSejaBemVindo();

            try
            {
                DataSet dsSejaBemVindo = bdAtualizarSejaBemVindo.RecuperaDadosSejaBemVindo();

                if (dsSejaBemVindo != null)
                {
                    DataRow drAntesDeViajar = dsSejaBemVindo.Tables[0].Rows[0];
                    this.TxtTitulo.Text = drAntesDeViajar["Titulo"].ToString();
                    this.wucTxtDescricao.SetValue(drAntesDeViajar["Descricao"].ToString());                    
                    this.btnCadastrarSejaBemVindo.Visible = false;
                    this.btnAtualizarSejaBemVindo.Visible = true;
                }
                else
                {
                    this.btnCadastrarSejaBemVindo.Visible = true;
                    this.btnAtualizarSejaBemVindo.Visible = false;
                }
            }
            finally
            {
                bdAtualizarSejaBemVindo.Dispose();
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

        /// <summary>
        /// Evento de clique do botão de atualização.
        /// </summary>
        /// <param name="sender">Objeto gerador do eventos.</param>
        /// <param name="e">Contém os parâmetros do evento gerado.</param>
        protected void BtnAtualizarSejaBemVindo_Click(object sender, EventArgs e)
        {
            BdSejaBemVindo bdAtualizarSejaBemVindo = new BdSejaBemVindo();

            try
            {
                bdAtualizarSejaBemVindo.AtualizarSejaBemVindo(this.TxtTitulo.Text,
                    this.wucTxtDescricao.GetValue());
                ExibeMensagemPopUp("Atualização realizada com sucesso!");
                this.PreencheCamposTelaSejaBemVindo();
            }
            catch
            {
                ExibeMensagemPopUp("ERRO! Dados não alterados. Verifique os dados e tente novamente mais tarde. " +
                            "Caso o problema persista, contate Administrador");
            }
            finally
            {
                bdAtualizarSejaBemVindo.Dispose();
            }
        }
    }
}
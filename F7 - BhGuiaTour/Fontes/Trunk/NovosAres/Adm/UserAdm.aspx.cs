namespace NovosAres.Adm
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.Security;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using NovosAres.Blog;

    /// <summary>
    /// Classe da tela de Login.
    /// </summary>
    public partial class UserAdm : System.Web.UI.Page
    {
        /// <summary>
        /// Responsável por efetuar o carregamento da página.
        /// </summary>
        /// <param name="sender">Objeto gerador do eventos.</param>
        /// <param name="e">Contém os parâmetros do evento gerado.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        /// <summary>
        /// Evento de clique do botão login.
        /// </summary>
        /// <param name="sender">Objeto gerador do eventos.</param>
        /// <param name="e">Contém os parâmetros do evento gerado.</param>
        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            BdUsuario bdUsuario = new BdUsuario();

            if (bdUsuario.VerificaUsuarioAdmin(TxbLogin.Text, TxbSenha.Text))
            {
                FormsAuthentication.RedirectFromLoginPage(TxbLogin.Text, false);
            }
            else
            {
                ExibeMensagemPopUp("Usuário e/ou senha inválidos.");
            }
        }

        /// <summary>
        /// Evento de clique do botão voltar.
        /// </summary>
        /// <param name="sender">Objeto gerador do eventos.</param>
        /// <param name="e">Contém os parâmetros do evento gerado.</param>
        protected void BtnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
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
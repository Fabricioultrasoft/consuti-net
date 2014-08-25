using System;
using Sistema_Life_Planner_Agenda.Classes;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Sistema_Life_Planner_Agenda
{
    public partial class WebForm1 : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void novoUsuarioLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("CadastroUsuario\\Default.aspx");
        }

        protected void okButton_Click(object sender, EventArgs e)
        {
            AuthenticateEventArgs a = new AuthenticateEventArgs();
            string nomeUsuario = ValidarDadosAcesso(emailTextBox.Text, senhaTextBox.Text);
            if (nomeUsuario.Equals(string.Empty))
            {
                a.Authenticated = false;
                ExibeMensagemPopUp("Dados de acesso não conferem! Verifique e-mail e senha informados.");
            }
            else
            {
                a.Authenticated = true;
                FormsAuthentication.RedirectFromLoginPage(nomeUsuario, false);
            }
        }

        protected void esqueciSenhaLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("RecuperarSenha\\Default.aspx");
        }

        /// <summary>
        /// Busca nome do usuário se dados de acesso forem válidos
        /// </summary>
        /// <param name="email">email para validação</param>
        /// <param name="senha">senha para validação</param>
        /// <returns>String com o nome do usuário autenticado</returns>
        private string ValidarDadosAcesso(string email, string senha)
        {
            //TODO: validar login
            string nomeUsuario = string.Empty;

            return nomeUsuario;
        }
    }
}
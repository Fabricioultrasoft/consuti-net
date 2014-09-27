using System;
using Sistema_Life_Planner_Agenda.Classes;
using Sistema_Life_Planner_Agenda.BD;
using System.Configuration;

namespace Sistema_Life_Planner_Agenda.RecuperarSenha
{
    public partial class Default : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cancelarButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\Login.aspx");
        }

        protected void okButton_Click(object sender, EventArgs e)
        {
            string senhaRecuperada = string.Empty;
            try
            {
                senhaRecuperada = EmailCadastrado(emailTextBox.Text);
                if (string.IsNullOrEmpty(senhaRecuperada))
                {
                    ExibeMensagemPopUp("E-mail " + emailTextBox.Text + " não cadastrado!");
                }
                else
                {
                    EnviaEmail(
                    "SisLPA",
                    ConfigurationManager.AppSettings["emailDestinatarioRecuperarSenha"].ToString(),
                    emailTextBox.Text,
                    string.Empty,
                    "<html><head></head><body>" +
                    "Recuperação de acesso ao SisLPA",
                    "Olá! <br /> Foi solicitado em " + DateTime.Now + " a recuperação da senha de acesso ao sistema SisLPA.<br /><br />" +
                    "Senha: " + senhaRecuperada + "<br /><br />Favor não responder este e-mail." +
                    "<br /> <br /><br /><br />Sistema Life Planner Agenda </body></html>",
                    string.Empty);

                    ExibeMensagemPopUp("E-mail de recuperação de acesso enviado para " + emailTextBox.Text + ".");
                }
            }
            catch (Exception ex)
            {
                ExibeMensagemPopUp("Erro interno no servidor (" + ex.Message + "). Tente novamente mais tarde.");
            }

        }

        /// <summary>
        /// Verifica se o e-mail informado está cadastrado no sistema.
        /// </summary>
        /// <param name="email">E-mail a ser verificado.</param>
        /// <returns>True se e-mail for válido; false caso contrário.</returns>
        private string EmailCadastrado(string email)
        {
            return new UsuarioBD().RecuperarSenha(email);
        }
    }
}
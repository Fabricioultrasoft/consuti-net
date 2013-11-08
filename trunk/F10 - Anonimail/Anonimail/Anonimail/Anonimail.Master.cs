using System;
using System.Web.UI;
using MySql.Data.MySqlClient;
using Anonimail.Utilitarios;
using System.Configuration;

namespace Anonimail
{
    public partial class Anonimail : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AnoLabel.Text = DateTime.Now.Year.ToString();
            }
            //TODO: ajustar envio da resposta. Deve agrupar por ordem decrescente os emails enviados.
        }

        protected void BloquearEmailButton_Click(object sender, EventArgs e)
        {
            string codDesbloqueio = Guid.NewGuid().ToString().ToUpper();
            try
            {
                new Banco.EmailBloqueado().BloquearEmail(BloquearEmailTextBox.Text, codDesbloqueio);
                EnviarEmailConfirmaBloqueio(codDesbloqueio, BloquearEmailTextBox.Text);
                ExibeMensagemPopUp("E-mail " + BloquearEmailTextBox.Text + " bloqueado com sucesso!");
            }
            catch (MySqlException)
            {
                ExibeMensagemPopUp("O e-mail " + BloquearEmailTextBox.Text + " já está bloqueado.");
            }
            catch (Exception ex)
            {
                ExibeMensagemPopUp("Erro ao tentar bloquear o e-mail " + BloquearEmailTextBox.Text + ". Detalhes: " + ex.Message);
            }
            finally
            {
                BloquearEmailTextBox.Text = string.Empty;
            }
        }

        protected void LogoImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        /// <summary>
        /// Exibe mensgem em popUp para usuário
        /// </summary>
        /// <param name="mensagem">mensagem a ser exibida</param>
        public void ExibeMensagemPopUp(string mensagem)
        {
            Page.ClientScript.RegisterStartupScript(
                            this.GetType(),
                            "arquivo",
                            "alert('" + mensagem + "');",
                            true);
        }

        private void EnviarEmailConfirmaBloqueio(string codDesbloqueio, string destinatario)
        {
            try
            {
                new Email().EnviaEmail(
                 ConfigurationManager.AppSettings["emailRemetente"].ToString(),
                 destinatario,
                 "Bloqueio de email do AnôniMail",
                 @"Seu e-mail foi bloqueado e não receberá mais AnôniMails. Para desbloquear basta clicar no link abaixo.
                 <br />" + ConfigurationManager.AppSettings["siteAnonimail"].ToString() + "\\DesbloquearEmail\\?codDesbloqueio="
                         + codDesbloqueio);
            }
            catch (Exception)
            {
                //TODO: armazena erro no log
            }
            
        }
    }
}
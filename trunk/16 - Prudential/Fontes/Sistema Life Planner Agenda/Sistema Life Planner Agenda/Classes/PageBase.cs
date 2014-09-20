using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

namespace Sistema_Life_Planner_Agenda.Classes
{
    public class PageBase : System.Web.UI.Page
    {
        /// <summary>
        /// Exibe mensgem resultado
        /// </summary>
        /// <param name="mensagem">mensagem a ser exibida</param>
        public void ExibeMensagemPopUp(string mensagem)
        {
            ClientScript.RegisterStartupScript(
                            this.GetType(),
                            "arquivo",
                            "alert('" + mensagem + "');",
                            true);
        }

        /// <summary>
        /// Envia emails
        /// </summary>
        /// <param name="nomeRemetente"></param>
        /// <param name="emailRemetente"></param>
        /// <param name="emailDestinatario"></param>
        /// <param name="emailComCopiaOculta"></param>
        /// <param name="assuntoMensagem"></param>
        /// <param name="conteudoMensagem"></param>
        /// <param name="caminhoAnexo"></param>
        public void EnviaEmail(
            string nomeRemetente,
            string emailRemetente,
            string emailDestinatario,
            string emailComCopiaOculta,
            string assuntoMensagem,
            string conteudoMensagem,
            string caminhoAnexo)
        {
            SmtpClient clienteSmtp = new SmtpClient("localhost");
            MailMessage email = new MailMessage(emailDestinatario, emailDestinatario);

            try
            {
                if (!string.IsNullOrEmpty(emailComCopiaOculta))
                {
                    email.Bcc.Add(emailComCopiaOculta);
                }
                if (!string.IsNullOrEmpty(caminhoAnexo))
                {
                    email.Attachments.Add(new Attachment(caminhoAnexo));
                }
                email.IsBodyHtml = true;
                email.ReplyTo = new System.Net.Mail.MailAddress(nomeRemetente + "<" + emailRemetente + ">");
                email.Subject = assuntoMensagem;
                email.Body = conteudoMensagem;

                clienteSmtp.Send(email);
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                email.Dispose();
            }
        }
    }
}
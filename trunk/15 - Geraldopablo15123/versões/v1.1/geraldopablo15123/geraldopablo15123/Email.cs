using System;
using System.Net.Mail;

namespace geraldopablo15123
{
    public class Email
    {
        /// <summary>
        /// envia email 
        /// </summary>        
        /// <returns>false se não enviado, true se enviado</returns>
        public bool EnviaEmail(
            string nomeRemetente,
            string emailRemetente,
            string emailDestinatario,
            string emailComCopiaOculta,
            string assuntoMensagem,
            string conteudoMensagem)
        {
            bool Retorno = true;

            SmtpClient clienteSmtp = new SmtpClient("localhost");
            MailMessage email = new MailMessage(emailDestinatario, emailDestinatario);

            try
            {
                email.Bcc.Add(emailComCopiaOculta);
                email.IsBodyHtml = true;
                email.ReplyTo = new System.Net.Mail.MailAddress(nomeRemetente + "<" + emailRemetente + ">");
                email.Subject = assuntoMensagem;
                email.Body = conteudoMensagem;
                clienteSmtp.Send(email);
            }
            catch (Exception)
            {
                Retorno = false;
            }
            finally
            {   
                email.Dispose();
            }
            return Retorno;
        }
    }
}
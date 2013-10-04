using System;
using System.Net.Mail;
using System.Web.UI;

namespace leptonbrasil.Ferramentas
{
    public class Correio
    {
        /// <summary>
        /// envia email 
        /// </summary>
        /// <param name="nomeRemetente"></param>
        /// <param name="emailRemetente"></param>
        /// <param name="emailDestinatario"></param>
        /// <param name="emailComCopia"></param>
        /// <param name="emailComCopiaOculta"></param>
        /// <param name="assuntoMensagem"></param>
        /// <param name="conteudoMensagem"></param>
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
                //excluímos o objeto de e-mail da memória
                email.Dispose();
                //anexo.Dispose();
            }
            return Retorno;
        }        
    }
}
using System.Net.Mail;
using System.Text.RegularExpressions;

namespace Anonimail.Utilitarios
{
    public class Email
    {
        public void EnviaEmail(string remetente, string destinatario, string titulo, string mensagemEmail)
        {
            SmtpClient clienteSmtp = new SmtpClient("localhost");
            MailMessage email = new MailMessage();
            email.From = new MailAddress(remetente);
            email.To.Add(destinatario);
            email.Subject = titulo;
            email.Body = mensagemEmail;

            email.Priority = MailPriority.High;
            email.SubjectEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");
            email.BodyEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");
            email.IsBodyHtml = true;

            clienteSmtp.Send(email);
            email.Dispose();
        }

        /// <summary>
        /// Trata e formata o conteúdo do email a ser enviado.
        /// </summary>
        /// <param name="txtEmail"></param>
        /// <param name="codigoAnonimail"></param>
        /// <param name="emailResposta"></param>
        /// <returns></returns>
        public string TratarConteudoEmail(string txtEmail, string codigoAnonimail, string emailResposta)
        {
            //TODO: trata os palavroes e coloca o link no final do texto do email para resposta 
            //além de colocar a assinatura do site. Se não possui email resposta não envia link e informa que o quem enviou não deseja receber replica
            //TODO: Criar um e-mail mais adequado para identificar o envio de anonimail 
             string textoEmail = txtEmail + codigoAnonimail + emailResposta;

            return textoEmail;
        }

        public bool ValidaEmail(string email)
        {
            Regex rg = new Regex(@"^[A-Za-z0-9](([_\.\-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)*)\.([A-Za-z]{2,})$");

            if (rg.IsMatch(email))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
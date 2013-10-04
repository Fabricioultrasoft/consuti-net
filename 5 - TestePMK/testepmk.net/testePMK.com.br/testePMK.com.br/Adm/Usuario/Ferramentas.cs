using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

namespace testePMK.com.br.Adm.Usuario
{
    public class Ferramentas
    {
        public Ferramentas()
        {


        }

        public void EnviaEmail(string emailFrom, string emailTo, string assunto, string mensagemEmail, string replyTo)
        {
            SmtpClient clienteSmtp = new SmtpClient("localhost");
            MailMessage email = new MailMessage();
            email.From = new MailAddress(emailFrom);
            email.Bcc.Add("correio@consuti.net");
            email.ReplyTo = new MailAddress(replyTo);
            email.To.Add(emailTo);
            email.Priority = MailPriority.High;
            email.SubjectEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");
            email.BodyEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");
            email.IsBodyHtml = true;
            email.Subject = assunto;
            email.Body = mensagemEmail;

            clienteSmtp.Send(email);

            email.Dispose();

        }
    }
}
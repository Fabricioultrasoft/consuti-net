using System;
using System.Net.Mail;

namespace Consuti.net
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(name.Text)
                && string.IsNullOrEmpty(email.Text)
                && string.IsNullOrEmpty(subject.Text)
                && string.IsNullOrEmpty(message.Text))
                {
                    ExibeMensagemPopUp("Prencha todos os campos para enviar.");
                }
                else
                {
                    EnviaEmail(
                        name.Text,
                        "consuti@consuti.net",
                        "cristian.co.gomes@gmail.com",
                        "Contato ConsuTI - " + subject.Text,
                        email.Text + " - " + message.Text,
                        string.Empty);
                    ExibeMensagemPopUp("Mensagem enviada com sucesso!");
                }
            }
            catch (Exception)
            {
                ExibeMensagemPopUp("Prencha o e-mail corretamente para enviar.");
            }
        }

        protected void resetButton_Click(object sender, EventArgs e)
        {
            subject.Text =
                email.Text =
                name.Text =
                message.Text =
                string.Empty;
        }

        /// <summary>
        /// Envio email
        /// </summary>
        /// <param name="nomeRemetente"></param>
        /// <param name="emailRemetente"></param>
        /// <param name="emailDestinatario"></param>
        /// <param name="assuntoMensagem"></param>
        /// <param name="conteudoMensagem"></param>
        public void EnviaEmail(
            string nomeRemetente,
            string emailRemetente,
            string emailDestinatario,
            string assuntoMensagem,
            string conteudoMensagem,
            string caminhoAnexo)
        {
            //Cria objeto com dados do e-mail.
            MailMessage objEmail = new MailMessage();

            //Define o Campo From e ReplyTo do e-mail.
            objEmail.From = new System.Net.Mail.MailAddress(nomeRemetente + "<" + emailRemetente + ">");

            //Define os destinatários do e-mail.
            objEmail.To.Add(emailDestinatario);

            //Define a prioridade do e-mail.
            objEmail.Priority = System.Net.Mail.MailPriority.Normal;

            //Define o formato do e-mail HTML (caso não queira HTML alocar valor false)
            objEmail.IsBodyHtml = true;

            //Define título do e-mail.
            objEmail.Subject = assuntoMensagem;

            //Define o corpo do e-mail.
            objEmail.Body = conteudoMensagem;

            //Adciona anexo
            if (!string.IsNullOrEmpty(caminhoAnexo))
            {
                objEmail.Attachments.Add(new Attachment(caminhoAnexo));
            }

            //Para evitar problemas de caracteres "estranhos", configuramos o charset para "ISO-8859-1"
            objEmail.SubjectEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");
            objEmail.BodyEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");

            //Cria objeto com os dados do SMTP
            System.Net.Mail.SmtpClient objSmtp = new System.Net.Mail.SmtpClient();

            //Alocamos o endereço do host para enviar os e-mails, localhost(recomendado) ou smtp2.locaweb.com.br
            objSmtp.Host = "localhost";
            objSmtp.Port = 25;

            //Enviamos o e-mail através do método .send()
            try
            {
                objSmtp.Send(objEmail);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                //excluímos o objeto de e-mail da memória
                objEmail.Dispose();
            }
        }

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
    }
}
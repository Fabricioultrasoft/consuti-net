using System;
using System.Configuration;
using Anonimail.Banco;
using Anonimail.Utilitarios;

namespace Anonimail
{
    public partial class WebForm1 : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                new ContadorAcesso().AdicionarAcesso(
                    Context.Request.UserHostAddress.ToString(),
                    DateTime.Now,
                    "Enviar",
                    Context.Request.Browser.Type);
            }
        }

        protected void LimparTudoButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void EnviarButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (!new EmailBloqueado().VerificaEmailBloqueado(EmailDestinoTextBox.Text)) //TODO colocar essa verificação no lost focus do campo destinatário e exibir uma imagem (v ou x) com resultado
                {
                    EnviaAnonimail();
                    LimpaCampos();
                    ExibeMensagemPopUp("AnôniMail enviado com sucesso!");
                }
                else
                {
                    ExibeMensagemPopUp("Não foi possível enviar o AnôniMail. O email " + EmailDestinoTextBox.Text + " está bloqueado para receber AnôniMails.");
                }
            }
            catch (Exception ex)
            {
                ExibeMensagemPopUp("Mensagem não enviada! Tente novamente mais tarde ou entre em Contato. \n\r Detalhes: " + ex.Message);
            }

        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            Captcha1.ValidateCaptcha(txtCaptcha.Text.Trim());
            if (Captcha1.UserValidated)
            {
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Valid";
            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "InValid";
            }
        }

        /// <summary>
        /// Salva o anonimail no banco e envia para o destinatário
        /// </summary>
        private void EnviaAnonimail()
        {
            string codigoAnonimail = Guid.NewGuid().ToString();//gera o guid que será utilizado como código no banco

            new AnonimailEnviado().Incluir(
                EmailDestinoTextBox.Text,
                DateTime.Now,
                TextoTextBox.Content.ToString(),
                TituloTextBox.Text,
                codigoAnonimail,
                EmailRespostaTextBox.Text);

            new Email().EnviaEmail(
                ConfigurationManager.AppSettings["emailRemetente"].ToString(),
                EmailDestinoTextBox.Text,
                TituloTextBox.Text,
                new Email().TratarConteudoEmail(TextoTextBox.Content.ToString(), codigoAnonimail, EmailRespostaTextBox.Text));

        }

        private void LimpaCampos()
        {
            TextoTextBox.Content =
                TituloTextBox.Text =
                EmailDestinoTextBox.Text =
                EmailRespostaTextBox.Text = string.Empty;
        }
    }
}
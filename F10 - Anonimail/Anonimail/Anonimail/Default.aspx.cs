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
                try
                {
                    new ContadorAcesso().AdicionarAcesso(
                    Context.Request.UserHostAddress.ToString(),
                    DateTime.Now,
                    "Enviar",
                    Context.Request.Browser.Type);
                }
                catch (Exception)
                {
                    //Não é necessário tratar esta exceção
                }
            }
            else
            {
                if (!EmailDestinoTextBox.Text.Equals(string.Empty))
                {
                    VerificaEmailBloqueado();
                }
            }
        }

        private void textBox1_LostFocus(object sender, System.EventArgs e)
        {
            VerificaEmailBloqueado();
        }

        protected void LimparTudoButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void EnviarButton_Click(object sender, EventArgs e)
        {
            if (ValidaCaptcha())
            {
                try
                {
                    EnviaAnonimail();
                    LimpaCampos();
                    ExibeMensagemPopUp("AnôniMail enviado com sucesso!");

                }
                catch (Exception ex)
                {
                    ExibeMensagemPopUp("Mensagem não enviada! Tente novamente mais tarde ou entre em Contato. \n\r Detalhes: " + ex.Message);
                }
            }
        }

        private void VerificaEmailBloqueado()
        {
            try
            {
                if (!new Email().ValidaEmail(EmailDestinoTextBox.Text))
                {
                    EmailBloqueadoImage.ImageUrl = "~/Imagens/warning.png";
                    EmailBloqueadoImage.AlternateText =
                        EmailBloqueadoImage.ToolTip = "O valor informado para e-mail não é válido.";
                }
                else
                {
                    if (new EmailBloqueado().VerificaEmailBloqueado(EmailDestinoTextBox.Text))
                    {
                        EmailBloqueadoImage.ImageUrl = "~/Imagens/error.png";
                        EmailBloqueadoImage.AlternateText =
                            EmailBloqueadoImage.ToolTip = "O email " + EmailDestinoTextBox.Text + " está bloqueado para receber AnôniMails.";
                    }
                    else
                    {
                        EmailBloqueadoImage.ImageUrl = "~/Imagens/tick.png";
                        EmailBloqueadoImage.AlternateText =
                            EmailBloqueadoImage.ToolTip = "O email " + EmailDestinoTextBox.Text + " está ok!";
                    }
                }
            }
            catch (Exception)
            {
                EmailBloqueadoImage.ImageUrl = "~/Imagens/warning.png";
                EmailBloqueadoImage.AlternateText =
                    EmailBloqueadoImage.ToolTip = "Não foi possível validar se o email " + EmailDestinoTextBox.Text + " está bloqueado.";
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

        protected void CancelarButton_Click(object sender, EventArgs e)
        {
            txtCaptcha.Text = string.Empty;
        }

        private bool ValidaCaptcha()
        {
            Captcha1.ValidateCaptcha(txtCaptcha.Text.Trim());
            if (Captcha1.UserValidated)
            {
                txtCaptcha.Text = string.Empty;
                codVerificadorPanel.BackColor = System.Drawing.Color.FromName("#87ae12");
                CodInvalidoLabel.Text = string.Empty;
                return true;
            }
            else
            {
                txtCaptcha.Text = string.Empty;
                codVerificadorPanel.BackColor = System.Drawing.Color.Red;
                CodInvalidoLabel.Text = "- Inválido!";
                return false;
            }
        }
    }
}
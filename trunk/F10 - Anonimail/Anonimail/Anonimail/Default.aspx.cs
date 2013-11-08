﻿using System;
using System.Configuration;
using Anonimail.Banco;
using Anonimail.Utilitarios;
using System.Collections.Generic;

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
                    LimparCampos();
                    ExibeMensagemPopUp("AnôniMail enviado com sucesso!");

                }
                catch (Exception ex)
                {
                    ExibeMensagemPopUp("Mensagem não enviada! Tente novamente mais tarde ou entre em Contato. \n\r Detalhes: " + ex.Message);
                }
            }
        }

        /// <summary>
        /// Verifica o email informado se está bloqueado ou se é válido
        /// </summary>
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
            List<string> listaPalavroes = new Email().BuscaPalavroesTexto(TextoTextBox.Content.ToString());
            if (listaPalavroes.Count < 1)
            {
                string codigoAnonimail = Guid.NewGuid().ToString().ToUpper();//gera o guid que será utilizado como código no banco

                new AnonimailEnviado().Incluir(
                    EmailDestinoTextBox.Text,
                    DateTime.Now,
                    TextoTextBox.Content.ToString(),
                    "[ANONIMAIL] " + TituloTextBox.Text,
                    codigoAnonimail,
                    EmailRespostaTextBox.Text);

                new Email().EnviaEmail(
                    ConfigurationManager.AppSettings["emailRemetente"].ToString(),
                    EmailDestinoTextBox.Text,
                    "[ANONIMAIL] " + TituloTextBox.Text,
                    new Email().TratarConteudoEmail(TextoTextBox.Content.ToString(), codigoAnonimail, EmailRespostaTextBox.Text));
            }
            else
            {
                string pls = string.Empty;
                foreach (var palavra in listaPalavroes)
                {
                    pls += palavra + ";";
                }
                ExibeMensagemPopUp("Não foi possível enviar AnoniMail. Remova as seguintes palavras do seu texto: " +
                    pls);
            }
        }

        /// <summary>
        /// Limpa todos os campos da tela.
        /// </summary>
        private void LimparCampos()
        {
            TextoTextBox.Content =
                TituloTextBox.Text =
                EmailDestinoTextBox.Text =
                EmailRespostaTextBox.Text =
                EmailBloqueadoImage.ToolTip =
                EmailBloqueadoImage.AlternateText =
            EmailBloqueadoImage.ImageUrl = string.Empty;
        }

        /// <summary>
        /// Valida o captcha
        /// </summary>
        /// <returns>false se inválido; true se válido.</returns>
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
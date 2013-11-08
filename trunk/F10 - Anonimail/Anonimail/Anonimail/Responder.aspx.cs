using System;
using Anonimail.Banco;
using Anonimail.Utilitarios;
using System.Configuration;
using System.Collections.Generic;

namespace Anonimail
{
    public partial class WebForm2 : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                new ContadorAcesso().AdicionarAcesso(
                    Context.Request.UserHostAddress.ToString(),
                    DateTime.Now,
                    "Responder",
                    Context.Request.Browser.Type);

                if (Request.QueryString["codAM"] != null)
                {
                    CodigoTextBox.Text = Request.QueryString["codAM"].ToString();
                    CodigoTextBox.ReadOnly = true;
                    CodigoTextBox.CssClass = "desativado";
                }
            }
            else
            {
                if (!CodigoTextBox.Text.Equals(string.Empty))
                {
                    VerificaCodigoResposta();
                }
            }
        }

        protected void LimparTudoButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Responder.aspx");
        }

        protected void EnviarButton_Click(object sender, EventArgs e)
        {
            //if (ValidaCaptcha())
            //{
            try
            {
                EnviaAnonimailResposta();
                LimparCampos();
                ExibeMensagemPopUp("AnôniMail enviado com sucesso!");

            }
            catch (Exception ex)
            {
                ExibeMensagemPopUp("Mensagem não enviada! Tente novamente mais tarde ou entre em Contato. \n\r Detalhes: " + ex.Message);
            }
            //}
        }
        /// <summary>
        /// Salva o anonimailResposta no banco e envia para o destinatário
        /// </summary>
        private void EnviaAnonimailResposta()
        {
            List<string> listaPalavroes = new Email().BuscaPalavroesTexto(TextoTextBox.Content.ToString());
            if (listaPalavroes.Count < 1)
            {
                new AnonimailEnviado().Incluir(
                    DateTime.Now,
                    TextoTextBox.Content.ToString(),
                    TituloTextBox.Text,
                    CodigoTextBox.Text);

                //new Email().EnviaEmail(
                //    ConfigurationManager.AppSettings["emailRemetente"].ToString(),
                //    EmailTextBox.Text,
                //    "[ANONIMAIL] " + TituloTextBox.Text,
                //    new Email().TratarConteudoEmail(TextoTextBox.Content.ToString(), CodigoTextBox.Text));
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

        private void LimparCampos()
        {
            TextoTextBox.Content =
                TituloTextBox.Text =
                CodigoTextBox.Text =
                CodigoInvalidoImage.ToolTip =
                CodigoInvalidoImage.AlternateText =
            CodigoInvalidoImage.ImageUrl = string.Empty;
        }

        /// <summary>
        /// Verifica o email informado se está bloqueado ou se é válido
        /// </summary>
        private void VerificaCodigoResposta()
        {
            try
            {
                if (!new AnonimailEnviado().VerificaCodigoAnonimail(CodigoTextBox.Text))
                {
                    CodigoInvalidoImage.ImageUrl = "~/Imagens/error.png";
                    CodigoInvalidoImage.AlternateText =
                        CodigoInvalidoImage.ToolTip = "O valor informado para código não é válido.";
                }
                else
                {
                    CodigoInvalidoImage.ImageUrl = "~/Imagens/tick.png";
                    CodigoInvalidoImage.AlternateText =
                        CodigoInvalidoImage.ToolTip = "O código de resposta " + CodigoTextBox.Text + " está ok!";
                }
            }
            catch (Exception)
            {
                CodigoInvalidoImage.ImageUrl = "~/Imagens/warning.png";
                CodigoInvalidoImage.AlternateText =
                    CodigoInvalidoImage.ToolTip = "Não foi possível validar o código " + CodigoTextBox.Text;
            }

        }

        ///// <summary>
        ///// Valida o captcha
        ///// </summary>
        ///// <returns>false se inválido; true se válido.</returns>
        //private bool ValidaCaptcha()
        //{
        //    Captcha1.ValidateCaptcha(txtCaptcha.Text.Trim());
        //    if (Captcha1.UserValidated)
        //    {
        //        txtCaptcha.Text = string.Empty;
        //        codVerificadorPanel.BackColor = System.Drawing.Color.FromName("#87ae12");
        //        CodInvalidoLabel.Text = string.Empty;
        //        return true;
        //    }
        //    else
        //    {
        //        txtCaptcha.Text = string.Empty;
        //        codVerificadorPanel.BackColor = System.Drawing.Color.Red;
        //        CodInvalidoLabel.Text = "- Inválido!";
        //        return false;
        //    }
        //}
    }
}
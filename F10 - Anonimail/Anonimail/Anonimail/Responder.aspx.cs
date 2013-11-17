using System;
using System.Collections.Generic;
using System.Configuration;
using Anonimail.Banco;
using Anonimail.Utilitarios;

namespace Anonimail
{
    public partial class WebForm2 : PageBase
    {
        public string emailResposta = string.Empty;
        public string emailDestinatario = string.Empty;

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
                    VerificaCodigoResposta();
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
                    emailDestinatario,
                    DateTime.Now,
                    TextoTextBox.Content.ToString(),
                    TituloTextBox.Text,
                    CodigoTextBox.Text, emailResposta);

                new Email().EnviaEmail(
                   ConfigurationManager.AppSettings["emailRemetente"].ToString(),
                   emailDestinatario,
                   "[ANONIMAIL] Resposta: " + TituloTextBox.Text,
                   new Email().TratarConteudoEmail(TextoTextBox.Content.ToString(), CodigoTextBox.Text, string.Empty));
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
            CodigoInvalidoImage.ImageUrl =
            teste.Content = string.Empty;
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
                    teste.Content = string.Empty;
                }
                else
                {
                    CodigoInvalidoImage.ImageUrl = "~/Imagens/tick.png";
                    CodigoInvalidoImage.AlternateText =
                        CodigoInvalidoImage.ToolTip = "O código de resposta " + CodigoTextBox.Text + " está ok!";
                    teste.Content = MontarResposta();
                }
            }
            catch (Exception)
            {
                CodigoInvalidoImage.ImageUrl = "~/Imagens/warning.png";
                CodigoInvalidoImage.AlternateText =
                    CodigoInvalidoImage.ToolTip = "Não foi possível validar o código " + CodigoTextBox.Text;
                teste.Content = string.Empty;
            }

        }

        private string MontarResposta()
        {
            List<AnonimailDTO> conversa = new AnonimailEnviado().ObterConversa(CodigoTextBox.Text);
            string retorno = string.Empty;
            emailDestinatario = conversa[0].EmailResposta;
            emailResposta = conversa[0].EmailDestinatario;
            if (TituloTextBox.Text.Equals(string.Empty))
            {
                TituloTextBox.Text = conversa[0].Titulo;
            }

            foreach (var item in conversa)
            {
                retorno += "<span style='font-weight: bold; font-size: 12pt; color: Black;'>" + item.Titulo +
                    "</span><br />\"" + item.Texto + "\"<br /><span style='font-weight: bold; font-size: 7pt; color: Gray;'>-- "
                    + item.dataEnvio.ToString() + "</span><br /><br /><br />";
            }

            return retorno;
        }
    }
}
using System;
using Anonimail.Banco;
using Anonimail.Utilitarios;
using System.Configuration;

namespace Anonimail
{
    public partial class WebForm2 : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //TODO: ajustar erro ao carregar a tela
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
        }

        protected void LimparTudoButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Responder.aspx");
        }

        protected void EnviarButton_Click(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// Salva o anonimailResposta no banco e envia para o destinatário
        /// </summary>
        private void EnviaAnonimailResposta()
        {
            new AnonimailEnviado().Incluir(
                DateTime.Now,
                TextoTextBox.Content.ToString(),
                TituloTextBox.Text,
                CodigoTextBox.Text);

            //new Email().EnviaEmail(
            //    ConfigurationManager.AppSettings["emailRemetente"].ToString(),
            //    EmailTextBox.Text,
            //    TituloTextBox.Text,
            //    new Email().TratarConteudoEmail(TextoTextBox.Content.ToString(), CodigoTextBox.Text));
        }

        private void LimparCampos()
        {
            TextoTextBox.Content =
                TituloTextBox.Text =
                CodigoTextBox.Text = string.Empty;
        }
    }
}
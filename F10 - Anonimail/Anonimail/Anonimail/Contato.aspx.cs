using System;
using System.Configuration;
using Anonimail.Banco;
using Anonimail.Utilitarios;

namespace Anonimail
{
    public partial class WebForm3 : PageBase
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
                    "Contato",
                    Context.Request.Browser.Type);
                }
                catch (Exception)
                {
                    //Não é necessário tratar esta exceção
                }
            }
        }

        protected void LimparTudoButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contato.aspx");
        }

        protected void EnviarButton_Click(object sender, EventArgs e)
        {
            try
            {
                EnviaContato();
                LimparCampos();
                ExibeMensagemPopUp("Contato enviado com sucesso!");
            }
            catch (Exception ex)
            {
                ExibeMensagemPopUp("Mensagem não enviada! Tente novamente mais tarde... \n\r Detalhes: " + ex.Message);
            }
        }

        /// <summary>
        /// Salva o anonimail no banco e envia para o destinatário
        /// </summary>
        private void EnviaContato()
        {
            new Email().EnviaEmail(EmailContatoTextBox.Text,
                ConfigurationManager.AppSettings["emailContato"].ToString(),
                AssuntoContatoTextBox.Text,
                NomeContatoTextBox.Text + " - " + TextoTextBox.Content.ToString());

        }

        /// <summary>
        /// Limpa todos os campos da tela.
        /// </summary>
        private void LimparCampos()
        {
            TextoTextBox.Content =
                NomeContatoTextBox.Text =
                EmailContatoTextBox.Text =
                AssuntoContatoTextBox.Text = string.Empty;                
        }
    }
}
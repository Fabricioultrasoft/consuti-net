using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;
using testePMK.com.br.Adm.Usuario;

namespace testePMK.com.br
{
    public partial class Contato : System.Web.UI.Page
    {
        //private string emailTO = "mesapmk@gmail.com";
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Teste PMK - Contato";
        }

        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contato.aspx");
        }

        /// <summary>
        /// Envia email de contato 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            Ferramentas enviaEmailContato = new Ferramentas();
            string msg = "Contato realizado por: " + txbNome.Text +
                "<br />Email do contato: " + txbEmail.Text +
                "<br />Telefone do contato: " + txbTelefone.Text +
                "<br />Data: " + DateTime.Now +
                "<br />Mensagem: " + txbMensagem.Text +
                "<br /><br /><br />Portal de vendas do Testepmk.com.br" +
                "<br /><br /><br />Desenvolvido por ConsuTI.net";
            try
            {
                enviaEmailContato.EnviaEmail(
                    "correio@testepmk.com.br",
                    "mesapmk@gmail.com",
                    "TestePMK.com.br - Contato - " + txbNome.Text, 
                    msg,
                    txbNome.Text + "<" + txbEmail.Text + ">");
                LimpaCampos();
                ExibeMensagemPopUp("Contato enviado com sucesso! \n A equipe testepmk.com.br agradeçe!");
            }
            catch (Exception ex)
            {
                ExibeMensagemPopUp("ERRO! Mensagem não enviada. Verifique os dados e tente novamente mais tarde.");
            }
        }

        /// <summary>
        /// Limpa os campos da tela
        /// </summary>
        private void LimpaCampos()
        {
            txbEmail.Text = "";
            txbMensagem.Text = "";
            txbNome.Text = "";
            txbTelefone.Text = "";
        }

        /// <summary>
        /// Exibe mensgem resultado
        /// </summary>
        /// <param name="mensagem">mensagem a ser exibida</param>
        private void ExibeMensagemPopUp(string mensagem)
        {
            ClientScript.RegisterStartupScript(
                            this.GetType(),
                            "arquivo",
                            "alert('" + mensagem + "');",
                            true);
        }

        ///// <summary>
        ///// envia o email
        ///// </summary>
        //private void enviaEmail()
        //{
        //    SmtpClient clienteSmtp = new SmtpClient("localhost");
        //    MailMessage email = new MailMessage(txbEmail.Text, emailTO);
        //    email.IsBodyHtml = true;
        //    email.Subject = "TestePMK.com.br - Contato - ";
        //    email.Body = "Contato realizado por: " + txbNome.Text +
        //        "<br />Email do contato: " + txbEmail.Text +
        //        "<br />Telefone do contato: " + txbTelefone.Text +
        //        "<br />Data: " + DateTime.Now +
        //        "<br />Mensagem: " + txbMensagem.Text +
        //        "<br /><br /><br />Portal de vendas do Testepmk.com.br" +
        //        "<br /><br /><br />Desenvolvido por ConsuTI.net";
        //    clienteSmtp.Send(email);
        //}
    }
}
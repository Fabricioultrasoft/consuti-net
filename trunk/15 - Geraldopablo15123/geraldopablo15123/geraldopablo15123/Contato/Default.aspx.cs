using System;

namespace geraldopablo15123.Contato
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnContatoEnviar_Click(object sender, EventArgs e)
        {
            //variaveis utilizadas para envio do email
            Email emailContato = new Email();
            bool resultEnvio;
            string mensagem = "Contato realizado em: " + DateTime.Now +
                    "<br />Nome do contato: " + txbContatoNome.Text +
                    "<br />Email: " + txbContatoEmail.Text +
                    "<br />Telefone: " + txbContatoTelefone.Text +
                    "<br /><br />Mensagem: " + txbContatoDescricao.Text +
                    "<br /><br />Esta mensagem foi enviada pelo site geraldopablo15123.com.br. <br /><br />ConsuTi.net";
            try
            {
                //envia o email de contato para gpablo
                resultEnvio = emailContato.EnviaEmail(
                txbContatoNome.Text,
                txbContatoEmail.Text,
                "gpablo15123vereador@ig.com.br",
                "cristian@consuti.net",
                "Contato realizado pelo site - " + txbAssuntoEmail.Text + " - " + txbContatoNome.Text,
                mensagem);
            }
            catch (Exception)
            {
                resultEnvio = false;
            }            
            //retorna mensagem para o usuário
            if (resultEnvio.Equals(true))
            {
                limparCampos();
                ExibeMensagem("Obrigado pelo contato! Sua mensagem foi enviada ao candidato Geraldo Pablo 15123 com sucesso! Em breve retornaremos.");
            }
            else if (resultEnvio.Equals(false))
            {
                ExibeMensagem("Ocorreu um erro interno no servidor! Tente novamente mais tarde ou entre em contato pelo email" +
                    " gpablo15123vereador@ig.com.br. Desculpe o transtorno.");
            }                 
        }

        protected void BtnContatoLimpar_Click(object sender, EventArgs e)
        {
            limparCampos();
        }

        protected void limparCampos()
        {
            txbContatoDescricao.Text = "";
            txbContatoEmail.Text = "";
            txbContatoNome.Text = "";
            txbContatoTelefone.Text = "";
            txbAssuntoEmail.Text = "";
        }

        //Exibe mensgem resultado
        private void ExibeMensagem(string mensagem)
        {
            ClientScript.RegisterStartupScript(
                            this.GetType(),
                            "arquivo",
                            "alert('" + mensagem + "');",
                            true);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using leptonbrasil.Banco;

namespace leptonbrasil.Contato
{
    public partial class Default : System.Web.UI.Page
    {
        /// <summary>
        /// Variáveis de controle de email
        /// </summary>
        public string EmailCopiaOcultaContato = "correio@consuti.net";

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Page.Title = ".:Lepton - Contato:.";

            Session["tituloPagina"] = "Lepton - Contato";
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            bool emailEnviado = EnviaEmail();
            if (emailEnviado.Equals(true))
            {
                ExibeMensagem("Enviado com sucesso! Obrigado.");
                LimparCampos();
            }
            else if (emailEnviado.Equals(false))
            {
                ExibeMensagem("Erro! Mensagem não enviada. Tente novamente ou contate pelo Email contato.radioprotecao@leptonbrasil.com.br.");
            }
        }

        //Exibe mensgem ao usuário
        private void ExibeMensagem(string mensagem)
        {
            this.Page.ClientScript.RegisterStartupScript(
                            this.GetType(),
                            "arquivo",
                            "alert('" + mensagem + "');",
                            true);
        }

        //limpa os campos da tela
        private void LimparCampos()
        {
            txbAssunto.Text = "";
            txbEmail.Text = "";
            txbMensagem.Text = "";
            txbNome.Text = "";
        }

        /// <summary>
        /// Envia email 
        /// </summary>
        /// <returns>true se sucesso no envio; false otherwise</returns>
        private bool EnviaEmail()
        {
            MyBdParametros emailContato = new MyBdParametros();
            Ferramentas.Correio enviaEmail = new Ferramentas.Correio();
            bool retorno = false;
            try
            {
                retorno = enviaEmail.EnviaEmail(txbNome.Text,
                    txbEmail.Text,
                    emailContato.GetEmailContato(),
                    EmailCopiaOcultaContato,
                    txbAssunto.Text,
                    txbMensagem.Text);
            }
            catch (Exception)
            {
                //nada
            }
            return retorno;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Contato/");
        }
    }
}
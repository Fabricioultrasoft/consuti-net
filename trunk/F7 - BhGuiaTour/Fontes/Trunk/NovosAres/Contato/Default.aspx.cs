using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NovosAres.Extras;

namespace NovosAres
{
    public partial class Contato : System.Web.UI.Page
    {
        private string _emailDestinoContato = "danilo@novosares.com.br";
        private string _emailCopiaOculta = "correio@consuti.net";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Controle de exibição dos componentes da tela
                Session["exibeTwitter"] = "false";
                Session["exibeFaceBook"] = "false";
                Session["exibeDepoimetos"] = "false";

                Page.Title = ".: Novos Ares - Contato:.";
            }
        }

        protected void BtnContatoEnviar_Click(object sender, EventArgs e)
        {
            bool emailEnviado = EnviaEmail();
            if (emailEnviado.Equals("true"))
            {
                ExibeMensagem("Enviado com sucesso! Em breve retornaremos. Obrigado!");
            }
            else
            {
                ExibeMensagem("Erro interno do servidor. Verifique os dados e tente novamente mais tarde. Caso o erro persista procure o Adminsitrador.");
            }

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

        /// <summary>
        /// envia o email de contado para a Novos Ares
        /// </summary>
        /// <returns>true se email foi envia do com sucesso; false otherwise</returns>
        private bool EnviaEmail()
        {
            InfraSite emailContato = new InfraSite();
            bool resultEnvio = false;
            string mensagem = "Contato realizado do pelo site em: " + DateTime.Now +
                "<br />Nome do contato: " + txbContatoNome.Text +
                "<br />Email: " + txbContatoEmail.Text +
                "<br />Telefone: (" + txbDDD.Text + ") " + txbContatoTelefone.Text +
                "<br />Mensagem do usuário: " + txbContatoDescricao.Text +
                "<br /><br /><br /> Esta mensagem foi enviada pelo site da Novos Ares. " +
                "<br /><br />ConsuTi.net";
            try
            {
                resultEnvio = emailContato.EnviaEmail(
                    txbContatoNome.Text,
                    txbContatoEmail.Text,
                    _emailDestinoContato,
                    _emailCopiaOculta,
                    txbContatoAssunto.Text,
                    mensagem);
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                LimparCampos();
            }
            return resultEnvio;
        }

        protected void BtnContatoLimpar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Contato/");
        }

        /// <summary>
        /// Limpa os campos da tela
        /// </summary>
        private void LimparCampos()
        {
            txbContatoAssunto.Text = "";
            txbContatoDescricao.Text = "";
            txbContatoEmail.Text = "";
            txbContatoNome.Text = "";
            txbContatoTelefone.Text = "";
            txbDDD.Text = "";
        }
    }
}
using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Net.Mail;
using pousadaZ;

namespace pousadaZ
{
    public partial class WebForm22 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = ".:Zumbzeira - Pré-Reserva:.";
            if (!IsPostBack)
            {

            }
        }

        protected void BtnContatoLimpar_Click(object sender, EventArgs e)
        {
            limparCampos();
        }

        protected void BtnContatoEnviar_Click(object sender, EventArgs e)
        {
            //variaveis utilizadas para envio do email
            Extras emailContato = new Extras();
            Extras emailRetornoAuto = new Extras();
            bool resultEnvio;
            string mensagem = "Contato realizado em: " + DateTime.Now +
                    "<br />Nome do contato: " + TxbNomeCompleto.Text +
                    "<br />Email: " + txbContatoEmail.Text +
                    "<br />Rua: " + TxbRua.Text +
                    "<br />Número: " + TxbNumero.Text +
                    "<br />Complemento: " + txbComplemento.Text +
                    "<br />Bairro: " + TxbBairro.Text +
                    "<br />Cidade: " + TxbCidade.Text +
                    "<br />Estado: " + TxbEstado.Text +
                    "<br />CEP: " + TxbCEP.Text +
                    "<br />Telefone Fixo: " + TxbTelFixo.Text +
                    "<br />Telefone Celular: " + TxbTelCelular.Text +
                    "<br />Data Nascimento: " + txbDataNasc.Text +
                    "<br />Empresa: " + TxbEmpresa.Text +
                    "<br />Data Entrada: " + txbDataEntrada.Text +
                    "<br />Data Saída: " + txbDataSaida.Text +
                    "<br />Número do Depósito em Conta ou Número Cupom Promocional: " + TxbNumero.Text +
                    "<br /><br />Mensagem: " + txbContatoDescricao.Text +
                    "<br /><br />Esta mensagem foi enviada pelo site pousadazumbzeira.com.br. <br /><br />ConsuTi.net";
            try
            {
                //envia o email de contato para pousada
                resultEnvio = emailContato.EnviaEmail(
                TxbNomeCompleto.Text,
                txbContatoEmail.Text,
                "pousadazumbzeira@pousadazumbzeira.com.br",                
                "correio@consuti.net",
                "Pré-Reserva OnLine - " + txbDataEntrada.Text + " a " + txbDataSaida.Text + " - " + TxbNomeCompleto.Text,
                mensagem);
            }
            catch (Exception)
            {
                resultEnvio = false;
            }
            finally
            {
                emailContato.Dispose();

                //envia resposta automática
                emailRetornoAuto.EnviaRespostaAutomatica(txbContatoEmail.Text,  Server.MapPath("AnexosEmail/folder2013.pdf"));
                emailRetornoAuto.Dispose();
                limparCampos();
            } 

            //retorna mensagem para o usuário
            if (resultEnvio.Equals(true))
            {
                ExibeMensagem("Obrigado pelo contato! Sua mensagem foi enviada a Pousada Zumbzeira com sucesso! Em breve retornaremos. " +
                    "Aproveite para adquirir seu cartão Fidelidade da Pousada Zumbzeira! Acesse o menu Cartão Fidelidade.");
            }
            else if (resultEnvio.Equals(false))
            {
                ExibeMensagem("Ocorreu um erro interno no servidor! Tente novamente mais tarde ou entre em contato pelo telefone" +
                    " (31)3581-8906 ou (31)8841-8888. Desculpe o transtorno.");
            }            
        }

        protected void limparCampos()
        {
            txbContatoDescricao.Text = "";
            txbContatoEmail.Text = "";
            TxbNomeCompleto.Text = "";
            TxbTelCelular.Text = "";
            TxbBairro.Text = "";
            TxbCEP.Text = "";
            TxbCidade.Text = "";
            txbComplemento.Text = "";
            txbDataEntrada.Text = "";
            txbDataNasc.Text = "";
            txbDataSaida.Text = "";
            TxbEmpresa.Text = "";
            TxbEstado.Text = "";
            txbNumDeposito.Text = "";
            TxbNumero.Text = "";
            TxbRua.Text = "";
            TxbTelFixo.Text = "";
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
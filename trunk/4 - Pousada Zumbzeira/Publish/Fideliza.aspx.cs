using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace pousadaZ
{
    public partial class WebForm11 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = ".:Zumbzeira - Programa de Fidelização de Clientes:.";
            if (!IsPostBack)
            {
                ListItem pagamento = new ListItem("<Selecione Pagamento>", "");
                DdlTipoPagamento.Items.Insert(0, pagamento);
            }
        }

        protected void BtnEnviar_Click(object sender, EventArgs e)
        {
            if (!CienteCheckBox.Checked.Equals(true))
            {
                ExibeMensagem("Para concluir é necessário aceitar o termo de ciência.");
            }
            else
            {

                try
                {
                    //gera os dados para validação
                    string tipoCartao = "serieamigos";
                    string codCartao = trataCodigoCartao(geraCodigoCartao());
                    string linkGeraCartao = "http://www.pousadazumbzeira.com.br/CartaoFidelidade.aspx?nome=" +
                        TxbNomeCompleto.Text + "&tipoCartao=" +
                        tipoCartao + "&numCartao=" + codCartao;

                    //envia o email com o formulário de fidelização preenchido
                    EnviaEmailFidelizacao(tipoCartao, codCartao);

                    //envia email informando a geração do cartão
                    enviaEmailSolicCartao(tipoCartao, codCartao, linkGeraCartao);

                    limparCampos();

                    ExibeMensagem("Solicitação realizada com sucesso! Aguarde email de retorno com o link para geração do seu Cartão.");
                }
                catch (Exception)
                {
                    ExibeMensagem("Ocorreu um erro interno no servidor! Verifique se não ha dados inválidos e tente novamente mais tarde. Contato: " +
                        " (31)3581-8906 ou (31)8841-8888.");
                }
            }
        }

        /// <summary>
        /// envia o email de castro do usuário
        /// </summary>
        private void EnviaEmailFidelizacao(string tipoCartao, string codCartao)
        {
            Extras emailCadastro = new Extras();
            emailCadastro.EnviaEmail(
                   TxbNomeCompleto.Text,
                   TxbEmail.Text,
                   "pousadazumbzeira@pousadazumbzeira.com.br",
                   "correio@consuti.net",
                   "Aquisição de Cartão Fidelidade - " + TxbNomeCompleto.Text + " - " + tipoCartao,
                   "     <b> CARTÃO FIDELIDADE - " + tipoCartao + " - Codigo: " + codCartao + "</b> " +
                       "<br /><br /><br />Contato realizado em: " + DateTime.Now +
               "<br /><strong>Número do Comprovante de Depósito:</strong> " + TxbComprovante.Text +
               "<br />Nome Completo: " + TxbNomeCompleto.Text +
               "<br />Rua: " + TxbRua.Text +
               "<br />Numero: " + TxbNumero.Text +
               "<br />Complemento: " + txbComplemento.Text +
               "<br />Bairro: " + TxbBairro.Text +
               "<br />Estado: " + TxbEstado.Text +
               "<br />CEP: " + TxbCEP.Text +
               "<br />Telefone Fixo: " + TxbTelFixo.Text +
               "<br />Telefone Celular: " + TxbTelCelular.Text +
               "<br />CPF: " + TxbCPF.Text +
               "<br />Identidade: " + TxbRG.Text +
               "<br />Data de Nascimento: " + TxbDataNascimento.Text +
               "<br />Empresa: " + TxbEmpresa.Text +
               "<br />Cargo: " + TxbCargo.Text +
               "<br />Email: " + TxbEmail.Text +
               "<br /><br />Nome Amigo 1: " + TxbNomeAmigo1.Text +
               "<br />Telefone: " + TxbTelefoneAmigo1.Text +
               "<br />Nome Amigo 2: " + TxbNomeAmigo2.Text +
               "<br />Telefone: " + TxbTelefoneAmigo2.Text +
               "<br /><br />Forma de pagamento caso venha a se hospedar: " + DdlTipoPagamento.SelectedItem.Text +
               "<br /><br /><br /><br /><br /><br />                                              Consuti.net");
        }

        /// <summary>
        /// limpa os campos da tela
        /// </summary>
        protected void limparCampos()
        {
            TxbBairro.Text = "";
            TxbCargo.Text = "";
            TxbCEP.Text = "";
            TxbCidade.Text = "";
            txbComplemento.Text = "";
            TxbCPF.Text = "";
            TxbDataNascimento.Text = "";
            TxbEmail.Text = "";
            TxbEmpresa.Text = "";
            TxbNomeAmigo1.Text = "";
            TxbNomeAmigo2.Text = "";
            TxbNomeCompleto.Text = "";
            TxbNumero.Text = "";
            TxbRG.Text = "";
            TxbRua.Text = "";
            TxbTelCelular.Text = "";
            TxbTelefoneAmigo1.Text = "";
            TxbTelefoneAmigo2.Text = "";
            TxbTelFixo.Text = "";
            TxbEstado.Text = "";
            TxbComprovante.Text = "";
            DdlTipoPagamento.SelectedIndex = 0;
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

        protected void BtnLimpar_Click(object sender, EventArgs e)
        {
            limparCampos();
        }

        /// <summary>
        /// gera popUp com cartão na tela
        /// </summary>
        /// <param name="tipoCartao">tipo do cartão a ser gerado </param>
        /// <param name="codCartao">código do cartão</param>
        private void ChamaPopUp(string tipoCartao, string codCartao)
        {
            //popup 
            string jscript = "";
            jscript += "<script language='JavaScript'>";
            jscript += "window.open('CartaoFidelidade.aspx?nome=" +
                    TxbNomeCompleto.Text + "&tipoCartao=" +
                    tipoCartao + "&numCartao=" + codCartao
                    + "','','resizable=no, menubar=no, scrollbars=no, statusbar=yes, left=20, top=20, width=480, height=410')";
            jscript += "</script>";
            ClientScript.RegisterClientScriptBlock(GetType(), "cliente", jscript);
        }

        /// <summary>
        /// Gera o codigo do cartão do cliente
        /// </summary>
        /// <returns>string com o código</returns>
        private string geraCodigoCartao()
        {
            string codRetorno = "";
            //dia e mes com 1 algarismo
            if (DateTime.Today.Month < 10 && DateTime.Today.Day < 10)
            {
                codRetorno = "0" + DateTime.Now.Day.ToString() + Convert.ToString(
                    TxbTelFixo.Text + "0" + DateTime.Now.Month) + "01";
            }
            else
                //só dia com 1 algarismo
                if (DateTime.Today.Month >= 10 && DateTime.Today.Day < 10)
                {
                    codRetorno = "0" + DateTime.Now.Day.ToString() + Convert.ToString(
                        TxbTelFixo.Text + DateTime.Now.Month) + "01";
                }
                //só mes com 1 algarismo
                else if (DateTime.Today.Month < 10 && DateTime.Today.Day >= 10)
                {
                    codRetorno = DateTime.Now.Day.ToString() + Convert.ToString(
                        TxbTelFixo.Text + "0" + DateTime.Now.Month) + "01";
                }
                //se mes e dia tem dois algarísmos
                else
                {
                    codRetorno = DateTime.Now.Day.ToString() + Convert.ToString(
                        TxbTelFixo.Text + DateTime.Now.Month) + "01";
                }
            return codRetorno;
        }

        /// <summary>
        /// Gera o código do cartão com os espaços para validação
        /// </summary>
        /// <param name="codGerado">codigo gerado a partir do telefone + numero randomico e 0.</param>
        /// <returns>código do cartão tratado</returns>
        private string trataCodigoCartao(string codGerado)
        {
            Array vet = codGerado.ToCharArray();
            string retorno = "";
            for (int j = 0; j < vet.Length; j = j + 4)
            {
                for (int i = j; i < j + 4; i++)
                {
                    retorno += vet.GetValue(i).ToString();
                }
                retorno += " ";
            }
            return retorno;
        }

        /// <summary>
        /// Envia o email de liberação para impressão de um cartão foi gerado
        /// </summary>
        private void enviaEmailSolicCartao(string tipoCartao, string codCartao, string LinkCartão)
        {
            Extras email = new Extras();
            try
            {
                email.EnviaEmail(
                    TxbNomeCompleto.Text,
                    TxbEmail.Text,
                    "pousadazumbzeira@pousadazumbzeira.com.br",
                    "correio@consuti.net",
                    "Aquisição de Cartão Fidelidade - " + TxbNomeCompleto.Text,
                    "     <b> CARTÃO FIDELIDADE - " + tipoCartao + " - Codigo: " + codCartao + "</b> " +
                        "<br /><br /><br />Solicitação de cartão realizada em: " + DateTime.Now +
                        "<br /><strong>Número do Comprovante de Depósito:</strong> " + TxbComprovante.Text +
                        "<br /><br />Nome Completo: " + TxbNomeCompleto.Text +
                        "<br /><br />Status do Cartão: APROVADO!" +
                        "<br /><br />Para Imprimir o seu cartão, clique no link abaixo. " +
                        "A validade deste link para imprimir o Cartão é de 2 Dias." +
                        "<br /><br />Link: <a href='" + LinkCartão + "'>" + LinkCartão + "</a>" +
                        "<br /><br /><br /><br />                                              Consuti.net");

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                email.Dispose();
            }
        }
    }
}

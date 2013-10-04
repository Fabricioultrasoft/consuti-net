using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using testePMK.com.br.Banco;
using System.Data;

namespace testePMK.com.br
{
    public partial class DetalhesPedido : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CarregaGdvItensPedido(Request.QueryString["IdTransacao"].ToString());
                carregaGridsTransacao(
                    Request.QueryString["IdTransacao"].ToString(),
                    Request.QueryString["cliEmail"].ToString());
                liDataEmissao.Text = DateTime.Now.ToString();
            }            
        }

        /// <summary>
        /// carrega o gridview de detalhes de pedido
        /// </summary>
        /// <param name="transacaoID"></param>
        public void CarregaGdvItensPedido(string transacaoID)
        {
            BdRetorno carregaItens = new BdRetorno();
            try
            {
                gdvItensPedido.DataSource = carregaItens.carregaDetalhesRetornoItens(transacaoID);
                gdvItensPedido.DataBind();
            }
            catch (Exception ex)
            {
                //do nothing
            }
            finally
            {
                carregaItens.Dispose();
            }
        }

        /// <summary>
        /// carrega os datais views da tela
        /// </summary>
        /// <param name="transacaoID">id da transação</param>
        public void carregaGridsTransacao(string transacaoID, string email)
        {
            BdRetorno carregaTransacao = new BdRetorno();
            DataSet dadosTransact = carregaTransacao.carregaDetalhesRetornoTransact(transacaoID, email);
            try
            {
                dvNome.DataSource = dadosTransact;
                dvNome.DataBind();

                dvDadosPessoais.DataSource = dadosTransact;
                dvDadosPessoais.DataBind();

                dvDadosPessoais2.DataSource = dadosTransact;
                dvDadosPessoais2.DataBind();
            }
            catch (Exception ex)
            {
                // nada
            }
            finally
            {
                carregaTransacao.Dispose();
            }
        }
    }
}
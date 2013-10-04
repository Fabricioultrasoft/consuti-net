using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using testePMK.com.br.Banco;
using System.Data;

namespace testePMK.com.br.Adm.Relatorios
{
    public partial class DetalhesEstoque : System.Web.UI.Page
    {
        private int idProduto = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    idProduto = Convert.ToInt32(Request.QueryString["idProduto"].ToString());
                    CarregaCampos(idProduto);
                }
                catch (Exception)
                {
                    ExibeMensagemPopUp("Erro interno! não foi possível carregar os dados do relatório. Tente novamente mais tarde ou procure o Administrador.");
                }
            }

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

        /// <summary>
        /// carrega os dados do produto no relatório
        /// </summary>
        /// <param name="idCliente">id do produto a ser gerado o relatório</param>
        private void CarregaCampos(int idProd)
        {
            DataSet dadosProduto = new BdProduto().GetDetalhesProduto(idProd);
            dvNome.DataSource = dadosProduto;
            dvNome.DataBind();
            dvDadosProduto.DataSource = dadosProduto;
            dvDadosProduto.DataBind();

            //carrega a data da geração do relatório na tela
            liDataEmissao.Text = DateTime.Now.ToString();
        }
    }
}
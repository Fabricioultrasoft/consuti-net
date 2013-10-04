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
    public partial class DetalhesCliente : System.Web.UI.Page
    {
        private int idCliente = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    idCliente = Convert.ToInt32(Request.QueryString["idCliente"].ToString());
                    CarregaCampos(idCliente);
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
        /// carrega os dados do cliente no relatório
        /// </summary>
        /// <param name="idCliente">id do cliente a ser gerado o relatório</param>
        private void CarregaCampos(int idCliente)
        {
            DataSet dadosCliente = new BdUsuarioSite().GetDetalhesUsuario(idCliente);
            dvNome.DataSource = dadosCliente;
            dvNome.DataBind();
            dvDadosPessoais.DataSource = dadosCliente;
            dvDadosPessoais.DataBind();
            dvDadosPessoais2.DataSource = dadosCliente;
            dvDadosPessoais2.DataBind();
            dvEndereco1.DataSource = dadosCliente;
            dvEndereco1.DataBind();
            dvEndereco2.DataSource = dadosCliente;
            dvEndereco2.DataBind();

            //carrega a data da geração do relatório na tela
            liDataEmissao.Text = DateTime.Now.ToString();
        }
    }
}
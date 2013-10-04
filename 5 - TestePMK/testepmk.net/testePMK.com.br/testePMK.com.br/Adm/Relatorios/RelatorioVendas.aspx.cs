using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using testePMK.com.br.Banco;

namespace testePMK.com.br.Adm.Relatorios
{
    public partial class RelatorioVendas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Context.User.Identity.Name == "")
            {//se não houver usuário autenticado volta ao login                
                Session["msgLogin"] = "Efetue Login para acessar o sistema";
                Response.Redirect("~/LoginAdm.aspx");
            }
            if (Request.QueryString["de"] != null
                && Request.QueryString["ate"] != null)
            {
                CarregaGdvRelVendas(
                    Convert.ToDateTime(Request.QueryString["de"].ToString()),
                    Convert.ToDateTime(Request.QueryString["ate"].ToString()));
            }

        }

        /// <summary>
        /// Carrega o gridVIew de vendas
        /// </summary>
        /// <param name="de">período de início da query</param>
        /// <param name="ate">período de final da query</param>
        private void CarregaGdvRelVendas(DateTime de, DateTime ate)
        {
            gdvVendas.DataSource = new BdRetorno().GetDadosVendas(de, ate);
            gdvVendas.DataBind();
        }

        protected void btnPesquisar_Click(object sender, EventArgs e)
        {
            Response.Redirect("RelatorioVendas.aspx?de=" + txbDe.Text + "&ate=" + txbAte.Text);
        }
    }
}
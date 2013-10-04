using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using testePMK.com.br.Banco;

namespace testePMK.com.br.Adm.Usuario
{
    public partial class PedidosUserExt : System.Web.UI.Page
    {
        protected string emailCliente;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Context.User.Identity.Name == "")
            {
                Session["msgLogin"] = "Efetue Login para acessar a sua área.";
                Response.Redirect("LoginUserExt.aspx");
            }
            if (!IsPostBack)
            {
                CarregaGridPedidos(Convert.ToInt32(ddlOrdem.SelectedValue));
            }
            else if (IsPostBack && Session["ordemPedidos"].ToString() != ddlOrdem.SelectedValue.ToString())
            {
                CarregaGridPedidos(Convert.ToInt32(ddlOrdem.SelectedValue));
            }
            Session["ordemPedidos"] = ddlOrdem.SelectedValue.ToString();
        }

        /// <summary>
        /// carrega o gridwiew de pedidos do cliente a partir da ordem que ele solicitou
        /// </summary>
        /// <param name="ordem">ordem selecionada para os itens</param>
        private void CarregaGridPedidos(int ordem)
        {
            try
            {
                string emailCliente = Session["emailCliente"].ToString();

                //carrega o datasource do gridView
                gdvPedidos.DataSource = new BdRetorno().GetPedidosCliente(
                    emailCliente, ordem);
                gdvPedidos.DataBind();
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void gdvPedidos_Click(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "verDetalhes")
                {
                    //popup com as imagens
                    string jscript = "";
                    jscript += "<script language='JavaScript'>";
                    jscript += "window.open('DetalhesPedido.aspx?IdTransacao=" + Convert.ToString(e.CommandArgument) + "&cliEmail=" + Session["emailCliente"].ToString() +
                                            "','','resizable=yes, menubar=no, scrollbars=yes, statusbar=yes, width=900, height=600, top=150, left=150')";
                    jscript += "</script>";
                    ClientScript.RegisterClientScriptBlock(GetType(), "cliente", jscript);
                }
            }
            catch (Exception)
            {

            }
        }
    }
}
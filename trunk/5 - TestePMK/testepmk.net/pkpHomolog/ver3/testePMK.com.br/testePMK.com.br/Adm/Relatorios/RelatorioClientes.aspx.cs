using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using testePMK.com.br.Banco;

namespace testePMK.com.br.Adm.Relatorios
{
    public partial class RelatorioClientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Context.User.Identity.Name == "")
            {//se não houver usuário autenticado volta ao login                
                Session["msgLogin"] = "Efetue Login para acessar o sistema";
                Response.Redirect("~/LoginAdm.aspx");
            }
            if (!IsPostBack)
            {
                CarregaGrigViewRelUsuario(Convert.ToInt32(ddlOrdem.SelectedValue));
            }
            else if (IsPostBack &&
                Session["OrdemRelCliente"].ToString() != ddlOrdem.SelectedValue.ToString() &&
               Request.QueryString["filtroRelCliente"] == null || Request.QueryString["filtroRelCliente"] == "")
            {
                CarregaGrigViewRelUsuario(Convert.ToInt32(ddlOrdem.SelectedValue));
            }

            Session["OrdemRelCliente"] = ddlOrdem.SelectedValue.ToString();
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (Request.QueryString["filtroRelCliente"] != null && Request.QueryString["filtroRelCliente"] != "")
            {
                txbPesquisa.Text = Request.QueryString["filtroRelCliente"].ToString();
                CarregaGrigViewRelUsuario(
                            Convert.ToInt32(ddlOrdem.SelectedValue),
                            Request.QueryString["filtroRelCliente"].ToString());
            }
        }
        /// <summary>
        /// carregar o gridwiew de classificação Geral ordenado
        /// </summary>
        /// <param name="ordem">id da ordem a ser empregada</param>
        private void CarregaGrigViewRelUsuario(int ordem)
        {
            gdvClientes.DataSource = new BdUsuarioSite().Listar(ordem);
            gdvClientes.DataBind();
        }

        /// <summary>
        /// carregar o gridwiew de classificação Geral ordenado e filtrado
        /// </summary>
        /// <param name="ordem">id da ordem que será realiza</param>
        /// <param name="filtro">elemento utilizado para filtrar os resultados</param>
        private void CarregaGrigViewRelUsuario(int ordem, string filtro)
        {
            gdvClientes.DataSource = new BdUsuarioSite().Listar(ordem, filtro);
            gdvClientes.DataBind();
        }

        protected void btnPesquisar_Click(object sender, EventArgs e)
        {
            Response.Redirect("RelatorioClientes.aspx?filtroRelCliente=" + txbPesquisa.Text);
        }

        /// <summary>
        /// evento de ver detalhes do gridView
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gdvClientes_Click(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "verDetalhes")
                {
                    //popup com as imagens
                    string jscript = "";
                    jscript += "<script language='JavaScript'>";
                    jscript += "window.open('DetalhesCliente.aspx?idCliente=" + Convert.ToString(e.CommandArgument) +
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
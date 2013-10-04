using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using testePMK.com.br.Banco;

namespace testePMK.com.br.Adm.Relatorios
{
    public partial class RelatorioEstoque : System.Web.UI.Page
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
                CarregaGrigViewRelEstoque(Convert.ToInt32(ddlOrdem.SelectedValue));
            }
            else if (IsPostBack &&
               Session["OrdemRelEstoque"].ToString() != ddlOrdem.SelectedValue.ToString() &&
               Request.QueryString["filtro"] == null || Request.QueryString["filtro"] == "")
            {
                CarregaGrigViewRelEstoque(Convert.ToInt32(ddlOrdem.SelectedValue));
            }

            Session["OrdemRelEstoque"] = ddlOrdem.SelectedValue.ToString();
        }


        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (Request.QueryString["filtro"] != null && Request.QueryString["filtro"] != "")
            {
                txbPesquisa.Text = Request.QueryString["filtro"].ToString();
                CarregaGrigViewRelEstoque(
                           Convert.ToInt32(ddlOrdem.SelectedValue),
                           Request.QueryString["filtro"].ToString());
            }
        }
        /// <summary>
        /// carregar o gridwiew de Estoque ordenado
        /// </summary>
        /// <param name="ordem">id da ordem a ser empregada</param>
        private void CarregaGrigViewRelEstoque(int ordem)
        {
            gdvProdutos.DataSource = new BdProduto().ListarTodos(ordem);
            gdvProdutos.DataBind();
        }

        /// <summary>
        ///  carregar o gridwiew de Estoque ordenado e filtrado
        /// </summary>
        /// <param name="ordem">id da ordem que será realiza</param>
        /// <param name="filtro">elemento utilizado para filtrar os resultados</param>
        private void CarregaGrigViewRelEstoque(int ordem, string filtro)
        {
            gdvProdutos.DataSource = new BdProduto().ListarTodos(ordem, filtro);
            gdvProdutos.DataBind();
        }

        protected void btnPesquisar_Click(object sender, EventArgs e)
        {
            Response.Redirect("RelatorioEstoque.aspx?filtro=" + txbPesquisa.Text);
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
                    jscript += "window.open('DetalhesEstoque.aspx?idProduto=" + Convert.ToString(e.CommandArgument) +
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
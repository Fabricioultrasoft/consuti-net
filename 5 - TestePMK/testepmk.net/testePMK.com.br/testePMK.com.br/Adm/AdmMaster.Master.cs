using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace testePMK.com.br.Adm
{
    public partial class AdmMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            imgBtnVoltar.Attributes.Add("onClick", "javascript:history.go(-1);return false;");
            LbtnVoltar.Attributes.Add("onClick", "javascript:history.go(-1);return false;");
        }

        protected void ImgBtnSair_Click(object sender, ImageClickEventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Default.aspx");
        }

        protected void LinkButtonAtualizarBanner_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Adm/Banners/Default.aspx");
        }

        protected void LinkButtonStatusPedidos_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Adm/Pedidos/StatusPedidos.aspx");
        }

        protected void LinkButtonEditarProdutos_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Adm/Produtos/EditProdutos.aspx");
        }

        protected void LinkButtonCadastrarProdutos_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Adm/Produtos/CadastraProduto.aspx");
        }

        protected void LinkButtonEstoque_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Adm/Produtos/EstoqueProds.aspx");
        }

        protected void LinkButtonRelClientes_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Adm/Relatorios/RelatorioClientes.aspx");
        }

        protected void LinkButtonRelVendas_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Adm/Relatorios/RelatorioVendas.aspx");
        }

        protected void LinkButtonAcompanharVendas_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Adm/Vendas/AcompanharVenda.aspx");
        }

        protected void ImgbtnHome_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Adm/Default.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Default.aspx");
        }

        protected void LbtnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Adm/Default.aspx");
        }

        protected void LinkButtonRelEstoque_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Adm/Relatorios/RelatorioEstoque.aspx");
        }       

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Adm/Usuario/ConfigUser.aspx");
        }

        protected void LinkButtonCatProds_click(object sender, EventArgs e)
        {
            Response.Redirect("~/Adm/CategoriasProds/AddCategoria.aspx");
        }

        protected void LinkButtonAlterCatProd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Adm/CategoriasProds/AlterCatProd.aspx");
        }


    }
}
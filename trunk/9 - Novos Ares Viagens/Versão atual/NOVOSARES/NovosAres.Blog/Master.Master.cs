using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NovosAres.Blog.Banco;
using System.Data;

namespace NovosAres.Blog
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CarregaMenuCategorias();
            }
        }

        /// <summary>
        /// Método tosco para recuperar do banco as categorias
        /// </summary>
        private void CarregaMenuCategorias()
        {
            MyBDCategoria recuperaItensMenuCategorias = new MyBDCategoria();
            DataSet dsItensMenuCategorias = recuperaItensMenuCategorias.GetCategorias();            

            hlCategoria1.Text = dsItensMenuCategorias.Tables[0].Rows[0]["Nome"].ToString();
            hlCategoria2.Text = dsItensMenuCategorias.Tables[0].Rows[1]["Nome"].ToString();
            hlCategoria3.Text = dsItensMenuCategorias.Tables[0].Rows[2]["Nome"].ToString();
            hlCategoria4.Text = dsItensMenuCategorias.Tables[0].Rows[3]["Nome"].ToString();
            hlCategoria5.Text = dsItensMenuCategorias.Tables[0].Rows[4]["Nome"].ToString();
            hlCategoria6.Text = dsItensMenuCategorias.Tables[0].Rows[5]["Nome"].ToString();

            recuperaItensMenuCategorias.Dispose();
        }

        protected void imgBtnBuscaBlog_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Default.aspx?busca=" + txbBusca.Text);
        }

        protected void lbtnVoltarSite_Click(object sender, EventArgs e)
        {
            Response.Redirect("http://www.novosares.com.br");
        }

        protected void imgBtnVoltarSite_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("http://www.novosares.com.br");
        }

        protected void hlCategoria1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx?IDcategoria=1");
        }

        protected void hlCategoria2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx?IDcategoria=2");
        }       

        protected void hlCategoria3_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx?IDcategoria=3");
        }

        protected void hlCategoria4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx?IDcategoria=4");
        }

        protected void hlCategoria5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx?IDcategoria=5");
        }

        protected void hlCategoria6_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx?IDcategoria=6");
        }

        protected void imgBtnLinkBlog_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void imgFollowTwttr_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("http://twitter.com/#!/novos_ares");
        }
    }
}
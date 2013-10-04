using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace leptonbrasil.LeptonAdm.Painel
{
    public partial class AdmMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //carrega o título das paginas
                if (Session["tituloPaginaAdm"] != null)
                {
                    lblTituloPagina.Text = Session["tituloPaginaAdm"].ToString();
                    liUsuarioLogado.Text = this.Context.User.Identity.Name.ToString();
                }
            }

        }

        protected void ImgBtnNome_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("http://www.consuti.net");
        }

        protected void imgBtnSair_Click(object sender, ImageClickEventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Default.aspx");
        }
    }
}
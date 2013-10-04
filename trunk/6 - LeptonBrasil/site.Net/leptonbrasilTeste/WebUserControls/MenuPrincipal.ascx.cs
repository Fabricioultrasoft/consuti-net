using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace leptonbrasil.WebUserControls
{
    public partial class MenuPrincipal : System.Web.UI.UserControl
    {
        protected void ImgBtnHome_Click(object sender, ImageClickEventArgs e)
        {
            Session["tituloPagina"] = "Lepton Consultoria e Assessoria";
            Response.Redirect("~/Default.aspx");            
        }

        protected void HlHome_Click(object sender, EventArgs e)
        {
            Session["tituloPagina"] = "Lepton Consultoria e Assessoria";
            Response.Redirect("~/Default.aspx");
        }

        protected void HlContato_Click(object sender, EventArgs e)
        {
            Session["tituloPagina"] = "Contato";
            Response.Redirect("~/Contato");
        }

        protected void imgBtnContato_Click(object sender, ImageClickEventArgs e)
        {
            Session["tituloPagina"] = "Contato";
            Response.Redirect("~/Contato");
        }

        protected void ImgBtnServicos_Click(object sender, ImageClickEventArgs e)
        {
            Session["tituloPagina"] = "Serviços";
            Response.Redirect("~/Servicos");
        }

        protected void hlServicos_Click(object sender, EventArgs e)
        {
            Session["tituloPagina"] = "Serviços";
            Response.Redirect("~/Servicos");
        }

        protected void HlLocalizacao_Click(object sender, EventArgs e)
        {
            Session["tituloPagina"] = "Localização";
        }

        protected void ImgBtnLocalizacao_Click(object sender, ImageClickEventArgs e)
        {
            Session["tituloPagina"] = "Localização";
        }

        protected void HlInstitucional_Click(object sender, EventArgs e)
        {
            Session["tituloPagina"] = "Institucional";
            Response.Redirect("~/Institucional");
        }

        protected void imgBtnInstitucional_Click(object sender, ImageClickEventArgs e)
        {
            Session["tituloPagina"] = "Institucional";
            Response.Redirect("~/Institucional");
        }

        protected void imgBtnNoticias_Click(object sender, ImageClickEventArgs e)
        {
            Session["tituloPagina"] = "Notícias";
            Response.Redirect("~/Noticias");
        }

        protected void HlNoticias_Click(object sender, EventArgs e)
        {
            Session["tituloPagina"] = "Notícias";
            Response.Redirect("~/Noticias");
        }
    }
}
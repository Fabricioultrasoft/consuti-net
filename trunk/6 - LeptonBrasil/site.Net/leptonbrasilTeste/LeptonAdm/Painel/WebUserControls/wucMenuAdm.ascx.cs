using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace leptonbrasil.LeptonAdm.Painel.WebUserControls
{
    public partial class wucMenuAdm : System.Web.UI.UserControl
    {       
        protected void ImgBtnServicos_Click(object sender, ImageClickEventArgs e)
        {
            Session["tituloPaginaAdmAdm"] = "Administração de Serviços";
            Response.Redirect("~/LeptonAdm/Painel/AdmServicos");
        }

        protected void hlServicos_Click(object sender, EventArgs e)
        {
            Session["tituloPaginaAdm"] = "Administração de Serviços";
            Response.Redirect("~/LeptonAdm/Painel/AdmServicos");
        }       

        protected void HlInstitucional_Click(object sender, EventArgs e)
        {
            Session["tituloPaginaAdm"] = "Administração de Institucional";
            Response.Redirect("~/LeptonAdm/Painel/AdmInstitucional");
        }

        protected void imgBtnInstitucional_Click(object sender, ImageClickEventArgs e)
        {
            Session["tituloPaginaAdm"] = "Administração de Institucional";
            Response.Redirect("~/LeptonAdm/Painel/AdmInstitucional");
        }

        protected void imgBtnNoticias_Click(object sender, ImageClickEventArgs e)
        {
            Session["tituloPaginaAdm"] = "Administração de Notícias";
            Response.Redirect("~/LeptonAdm/Painel/AdmNoticias");
        }

        protected void HlNoticias_Click(object sender, EventArgs e)
        {
            Session["tituloPaginaAdm"] = "Administração de Notícias";
            Response.Redirect("~/LeptonAdm/Painel/AdmNoticias");
        }

        protected void ParametrosImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Session["tituloPaginaAdm"] = "Administração de Parâmetros do Site";
            Response.Redirect("~/LeptonAdm/Painel/AdmParametros");
        }

        protected void ParametrosLinkButton_Click(object sender, EventArgs e)
        {
            Session["tituloPaginaAdm"] = "Administração de Parâmetros do Site";
            Response.Redirect("~/LeptonAdm/Painel/AdmParametros");
        }
    }
}
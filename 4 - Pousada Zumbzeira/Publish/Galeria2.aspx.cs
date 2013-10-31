using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pousadaZ
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = ".:Zumbzeira - Galeria de Fotos 2:.";
            ImgBtnVoltar.Attributes.Add("onClick", "javascript:history.go(-1);return false;");
        }

        protected void ImgBtnVoltar_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void ImgBtnMasterHome_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void ImgBtnMasterAvanc_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Galeria3.aspx");
        }
    }
}

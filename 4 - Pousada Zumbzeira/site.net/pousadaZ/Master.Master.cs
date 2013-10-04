using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace pousadaZ
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    Extras contador = new Extras();
                    contador.ContPlusPlus();
                    lblCont.Text = contador.GetContador();
                    contador.Dispose();
                }
                catch (Exception)
                {
                    lblCont.Text = "1000017";
                }
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("http://www.consuti.net");
        }

        protected void ImgBtnMasterBannerSuper_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/");
        }
    }
}

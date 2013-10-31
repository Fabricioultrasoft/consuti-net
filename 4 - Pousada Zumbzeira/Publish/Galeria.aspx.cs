using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.IO;

namespace pousadaZ
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = ".:Zumbzeira - Galeria de Fotos:.";
            ImgBtnVoltar.Attributes.Add("onClick", "javascript:history.go(-1);return false;");
        }

        /*
        //criando o metodo que alimenta o slide show do ajax
        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public static AjaxControlToolkit.Slide[] GetSlides()
        {
            //quantidade de fotos no total
            int j = 35;

            AjaxControlToolkit.Slide[] slides = new AjaxControlToolkit.Slide[j];

            //carrega as fotos da pasta
            for (int i = 1; i < j+1; i++)
            {               
                string caminho = "../Graficos/Fotos/" + i + ".jpg";
                slides[i-1] = new AjaxControlToolkit.Slide(caminho, "Foto " + i, "");
            }            
            return (slides);
        }*/

        protected void ImgBtnVoltar_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void ImgBtnMasterHome_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void ImgBtnMasterAvanc_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Galeria2.aspx");
        }
    }
}

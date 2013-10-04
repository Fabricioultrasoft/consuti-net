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

namespace pousadaZ
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = ".:Zumbzeira - Acomodações:.";
        }

        //varanda privativa
        //criando o metodo que alimenta o slide show do ajax
        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public static AjaxControlToolkit.Slide[] GetSlidesVaranda()
        {
            //quantidade de fotos no total
            int j = 8;

            AjaxControlToolkit.Slide[] slides = new AjaxControlToolkit.Slide[j];

            //carrega as fotos da pasta
            for (int i = 1; i < j + 1; i++)
            {
                string caminho = "../Graficos/Fotos/Acomodacoes/" + i + ".jpg";                
                slides[i - 1] = new AjaxControlToolkit.Slide(caminho, "Foto " + i, "");
            }
            return (slides);
        }

        //chalé
        //criando o metodo que alimenta o slide show do ajax
        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public static AjaxControlToolkit.Slide[] GetSlidesChale()
        {
            //quantidade de fotos no total
            int j = 16;

            AjaxControlToolkit.Slide[] slides = new AjaxControlToolkit.Slide[j];

            //carrega as fotos da pasta
            for (int i = 1; i < j + 1; i++)
            {
                string caminho = "../Graficos/Fotos/Acomodacoes/" + (i + 14) + ".jpg";
                slides[i - 1] = new AjaxControlToolkit.Slide(caminho, "Foto " + i, "");
            }
            return (slides);
        }

        //kingsize
        //criando o metodo que alimenta o slide show do ajax
        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public static AjaxControlToolkit.Slide[] GetSlidesKing()
        {
            //quantidade de fotos no total
            int j = 6;

            AjaxControlToolkit.Slide[] slides = new AjaxControlToolkit.Slide[j];

            //carrega as fotos da pasta
            for (int i = 1; i < j + 1; i++)
            {
                string caminho = "../Graficos/Fotos/Acomodacoes/" + (i + 8) + ".jpg";
                slides[i - 1] = new AjaxControlToolkit.Slide(caminho, "Foto " + i, "");
            }
            return (slides);
        }
    }
}

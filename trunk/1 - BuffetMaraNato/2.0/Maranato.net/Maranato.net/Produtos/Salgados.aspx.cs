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

namespace Maranato.net.Produtos
{
    public partial class Salgados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Maranato.net.Classes.Configs NomeEmpresa = new Maranato.net.Classes.Configs();
            Page.Title = ".:" + NomeEmpresa.NomeEmpresa() + " - Salgados:.";
        }

        //criando o metodo que alimenta o slide show do ajax
        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public static AjaxControlToolkit.Slide[] GetSlides()
        {
            AjaxControlToolkit.Slide[] slides = new AjaxControlToolkit.Slide[15];

            //carrega as fotos da pasta
            for (int i = 1; i < 16; i++)
            {
                string caminho = "../Graficos/Fotos/Salgados/" + i + ".jpg";
                slides[i - 1] = new AjaxControlToolkit.Slide(caminho, "", "");
            }

            return (slides);
        }
    }
}

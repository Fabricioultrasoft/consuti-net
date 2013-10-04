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

namespace Maranato.net.Encomende
{
    public partial class Encomende : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Maranato.net.Classes.Configs NomeEmpresa = new Maranato.net.Classes.Configs();
            Page.Title = ".:" + NomeEmpresa.NomeEmpresa() + " - Faça sua Encomenda:.";
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NovosAres
{
    public partial class Informacoes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["exibeTwitter"] = "false";
            Session["exibeFaceBook"] = "false";
            Session["exibeDepoimetos"] = "false";
        }
    }
}
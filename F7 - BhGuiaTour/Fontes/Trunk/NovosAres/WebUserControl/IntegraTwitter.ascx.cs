using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NovosAres.WebUserControl
{
    public partial class IntegraTwitter : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Logica de exibição do controle
            if (Session["exibeTwitter"] != null &&
                Session["exibeTwitter"].ToString().Equals("false"))
            {
                pnlIntegraTwitter.Visible = false;
            }
            else if (Session["exibeTwitter"] == null ||
                Session["exibeTwitter"].ToString().Equals("true"))
            {
                pnlIntegraTwitter.Visible = true;
            }
        }
    }
}
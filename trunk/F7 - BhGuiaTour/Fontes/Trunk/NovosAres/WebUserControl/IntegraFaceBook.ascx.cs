using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NovosAres.WebUserControl
{
    public partial class IntegraFaceBook : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Logica de exibição do controle
            if (Session["exibeFaceBook"] != null &&
                Session["exibeFaceBook"].ToString().Equals("false"))
            {
                pnlIntegraFace.Visible = false;
            }
            else if (Session["exibeFaceBook"] == null ||
                Session["exibeFaceBook"].ToString().Equals("true"))
            {
                pnlIntegraFace.Visible = true;
            }
        }
    }
}
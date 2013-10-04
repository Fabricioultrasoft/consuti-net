using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NovosAres.WebUserControl
{
    public partial class Depoimentos : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Logica de exibição do controle
            if (Session["exibeDepoimetos"] != null &&
                Session["exibeDepoimetos"].ToString().Equals("false"))
            {
                pnlDepoimentos.Visible = false;
            }
            else if (Session["exibeDepoimetos"] == null ||
                Session["exibeDepoimetos"].ToString().Equals("true"))
            {
                pnlDepoimentos.Visible = true;
            }
        }

        protected void imgBtnLeft_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void imgBtnRight_Click(object sender, ImageClickEventArgs e)
        {

        }
    }
}
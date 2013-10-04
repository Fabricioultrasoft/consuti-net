using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace testePMK.com.br
{
    public partial class Sedex : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void imgBtnSedex_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("http://www.correios.com.br/encomendas/prazo/default.cfm");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sistema_Life_Planner_Agenda.SITPLAN
{
    public partial class ExecutarSITPLAN : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void salvarButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("RelatorioTAs.aspx");
        }

        protected void cancelarButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("PesquisarSITPLAN.aspx");
        }
    }
}
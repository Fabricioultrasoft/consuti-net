using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sistema_Life_Planner_Agenda.Classes;

namespace Sistema_Life_Planner_Agenda.SITPLAN
{
    public partial class CadastrarSITPLAN : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void pesquisarButton_Click(object sender, EventArgs e)
        {

        }

        protected void limparButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("CadastrarSITPLAN.aspx");
        }

        protected void SalvarButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("ExecutarSITPLAN.aspx");
        }
    }
}
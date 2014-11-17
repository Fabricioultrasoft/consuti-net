using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sistema_Life_Planner_Agenda.Classes;
using Sistema_Life_Planner_Agenda.BD;

namespace Sistema_Life_Planner_Agenda.SITPLAN
{
    public partial class ExecutarSITPLAN : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ValidaUserLogado();
            }
        }

        protected void salvarButton_Click(object sender, EventArgs e)
        {
            new SitPlanBD().AtualizarStatus(
                "Concluído",
                Convert.ToInt32(Request.QueryString["idSitPlan"]),
                Convert.ToInt32(new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString()))); 
            Response.Redirect("RelatorioTAs.aspx");
        }

        protected void cancelarButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("PesquisarSITPLAN.aspx");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sistema_Life_Planner_Agenda.Classes;

namespace Sistema_Life_Planner_Agenda.Site
{
    public partial class WebForm1 : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void NovoContatoImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Contato/CadastrarContato.aspx");
        }

        protected void NovoContatoLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contato/CadastrarContato.aspx");
        }

        protected void CadastrarContatoLoteImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Contato/CadastrarLote.aspx");
        }

        protected void CadastrarContatoLoteLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contato/CadastrarLote.aspx");
        }

        protected void CadastrarAgendaImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Agenda/CadastrarAgenda.aspx");
        }

        protected void CadastrarAgendaLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Agenda/CadastrarAgenda.aspx");
        }

        protected void CadastrarSITPLANImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("SITPLAN/CadastrarSITPLAN.aspx");
        }

        protected void CadastrarSITPLANLinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("SITPLAN/CadastrarSITPLAN.aspx");
        }
    }
}
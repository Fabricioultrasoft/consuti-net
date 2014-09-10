using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sistema_Life_Planner_Agenda.Site
{
    public partial class Interna : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //TODO: CONTROLAR A EXIBIÇÃO DO CONTROLE "ADMIN" APENAS PARA USUÁRIOS QUE PODEM MANTER A LISTA DE EMAILS DE ACESSO
        }

        protected void UsuarioLinkButton_Click(object sender, EventArgs e)
        {   
            Response.Redirect("~/Usuario/AtualizarUsuario.aspx");
        }

        protected void SairLinkButton_Click(object sender, EventArgs e)
        {
            AuthenticateEventArgs a = new AuthenticateEventArgs();
            a.Authenticated = false;
            Response.Redirect("~/Login.aspx");
        }

        protected void AdminLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Usuario/AutorizarUsuarios.aspx");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NovosAres
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //controle de exibição dos componentes da tela
                Session["exibeTwitter"] = "true";
                Session["exibeFaceBook"] = "true";
                Session["exibeDepoimetos"] = "true";

                Page.Title = ".:Novos Ares - Bem Vindo:.";
            }
        }
    }
}
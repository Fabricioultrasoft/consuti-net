using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace testePMK.com.br.Adm.Usuario
{
    public partial class PedidosUserExt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Context.User.Identity.Name == "")
            {
                Session["msgLogin"] = "Efetue Login para acessar a sua área.";
                Response.Redirect("LoginUserExt.aspx");
            }
        }
    }
}
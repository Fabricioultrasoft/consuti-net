using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Sistema_Life_Planner_Agenda
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            if ((Login1.UserName == "admin") && (Login1.Password == "123"))
            {
                e.Authenticated = true;
                FormsAuthentication.RedirectFromLoginPage(Login1.UserName, false);
            }
            else
            {
                e.Authenticated = false;
            }

        }
    }
}
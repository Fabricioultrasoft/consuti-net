using System;
using Anonimail.Banco;

namespace Anonimail.DesbloquearEmail
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    string email = new EmailBloqueado().ObterEmailBloqueado(Request.QueryString["codDesbloqueio"].ToString());
                    new EmailBloqueado().DesbloquearEmail(email);

                    if (email != string.Empty)
                    {
                        EmailLabel.Text = email;
                    }
                    else
                    {
                        Response.Redirect("../Default.aspx");
                    }
                }
                catch (Exception)
                {
                    Response.Redirect("../Default.aspx");
                }
                
            }
        }
    }
}
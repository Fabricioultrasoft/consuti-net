using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NovosAres.Adm
{
    /// <summary>
    /// Classe da tela de Email Marketing.
    /// </summary>
    public partial class EmailMarketingAdm : System.Web.UI.Page
    {
        /// <summary>
        /// Responsável por efetuar o carregamento da página.
        /// </summary>
        /// <param name="sender">Objeto gerador do eventos.</param>
        /// <param name="e">Contém os parâmetros do evento gerado.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(this.Context.User.Identity.Name))
            {
                Response.Redirect("~/Adm/UserAdm.aspx");
            }
        }
    }
}
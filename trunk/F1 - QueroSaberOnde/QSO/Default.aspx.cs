using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace QSO
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue.Equals("Academias"))
            {
                Response.Redirect("Academias.aspx");
            }
            if (DropDownList1.SelectedValue.Equals("Bancos"))
            {
                Response.Redirect("Bancos.aspx");
            }
            if (DropDownList1.SelectedValue.Equals("Dentistas/Odontologia"))
            {
                Response.Redirect("Dentistas.aspx");
            }
            if (DropDownList1.SelectedValue.Equals("Floriculturas"))
            {
                Response.Redirect("Floriculturas.aspx");
            }
            if (DropDownList1.SelectedValue.Equals("Hotéis"))
            {
                Response.Redirect("Hotéis.aspx");
            }
            if (DropDownList1.SelectedValue.Equals("Motéis"))
            {
                Response.Redirect("Motéis.aspx");
            }
            if (DropDownList1.SelectedValue.Equals("Restaurantes"))
            {
                Response.Redirect("Restaurantes.aspx");
            }
            if (DropDownList1.SelectedValue.Equals("Veículos - Concessionárias"))
            {
                Response.Redirect("VeículosConcessionárias.aspx");
            }
            else
            {
                Response.Redirect("SemResultado.aspx");
            }
        }
    }
}

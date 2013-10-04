using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace NovosAres
{
    public partial class Empresa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //controle de exibição dos componentes da tela
                Session["exibeTwitter"] = "false";
                Session["exibeFaceBook"] = "false";
                Session["exibeDepoimetos"] = "false";

                //atribui o voltar do browser ao botão voltar
                btnVoltar.Attributes.Add("onClick", "javascript:history.go(-1);return false;");
            }
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            //do nothing
        }
    }
}
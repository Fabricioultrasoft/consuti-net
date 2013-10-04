using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace testePMK.com.br
{
    public partial class Links : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbtnSedex_Click(object sender, EventArgs e)
        {
            ChamarPopUp("http://websro.correios.com.br/sro_bin/txect01$.startup?P_LINGUA=001&P_TIPO=001");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            ChamarPopUp("http://www.denatran.gov.br/download/resolucoes/resolucao_contran_267.pdf");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            ChamarPopUp("http://www.abrati.com.br/index.php?a=mostra_contran.php&ID_MATERIA=1494");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            ChamarPopUp("http://www.casasoft.inf.br/Produtos/SistemasparaCFC/DetransdetodoBrasil/tabid/612/Default.aspx");

        }

        private void ChamarPopUp(string link)
        {
            string jscript = "";
            jscript += "<script language='JavaScript'>";
            jscript += "window.open('"+ link +"','','resizable=yes, menubar=no, scrollbars=yes, statusbar=yes, width=900, height=300, top=150, left=150')";
            jscript += "</script>";
            this.Page.ClientScript.RegisterClientScriptBlock(GetType(), "cliente", jscript);
        }
    }
}
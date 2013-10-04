using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using leptonbrasil.Banco;
using System.Data;

namespace leptonbrasil
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Page.Title = ".:Lepton - Home:.";
            if (!IsPostBack)
            {
                Session["tituloPagina"] = "Lepton - Home";

                //zera o contadador da proteção caso retorne a pagina inicial
                Session["protecao"] = null;

                AjustaControles();
            }
        }

        protected void imgBtnSer_Click(object sender, ImageClickEventArgs e)
        {
            Session["tituloPagina"] = "Serviços";
            Response.Redirect("~/Servicos");
        }

        protected void imgBtnCont_Click(object sender, ImageClickEventArgs e)
        {
            Session["tituloPagina"] = "Contato";
            Response.Redirect("~/Contato");
        }

        protected void ImgBtnNot_Click(object sender, ImageClickEventArgs e)
        {
            Session["tituloPagina"] = "Notícias";
            Response.Redirect("~/Noticias");
        }

        protected void ImgBtnInstit_Click(object sender, ImageClickEventArgs e)
        {
            Session["tituloPagina"] = "Institucional";
            Response.Redirect("~/Institucional");
        }

        private void AjustaControles()
        {
            MyBdParametros parametros = new MyBdParametros();
            try
            {
                DataSet dadosParametros = parametros.RecuperaParametros();
                DataRow dr = dadosParametros.Tables[0].Rows[0];

                TextoMenuContatoLabel.Text = dr["TextoMenuContato"].ToString();
                TextoMenuInstitucionalLabel.Text = dr["TextoMenuInstitucional"].ToString();
                TextoMenuNoticiasLabel.Text = dr["TextoMenuNoticias"].ToString();
                TextoMenuServicosLabel.Text = dr["TextoMenuServicos"].ToString();

            }
            catch (Exception ex)
            {
                //nada por enquanto
            }
            finally
            {
                parametros.Dispose();
            }
        }
    }
}
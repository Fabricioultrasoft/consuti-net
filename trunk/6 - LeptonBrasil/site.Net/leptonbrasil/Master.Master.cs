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
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //carrega o título das paginas
            if (Session["tituloPagina"] != null)
            {
                lblTituloPagina.Text = Session["tituloPagina"].ToString();
            }
            if (!IsPostBack)
            {
                AjustaControles();
            }
        }

        protected void ImgBtnNome_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("http://www.consuti.net");
        }

        private void AjustaControles()
        {
            MyBdParametros parametros = new MyBdParametros();
            try
            {
                DataSet dadosParametros = parametros.RecuperaParametros();
                DataRow dr = dadosParametros.Tables[0].Rows[0];

                conteudoPanel.BackColor = System.Drawing.Color.FromName(("#" + dr["CorFundoSite"].ToString()));
                Telefone1Label.Text = dr["TelefoneContato1"].ToString();
                Telefone2Label.Text = dr["TelefoneContato2"].ToString();
                emailContatoLinkButton.Text = dr["EmailContato"].ToString();               
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
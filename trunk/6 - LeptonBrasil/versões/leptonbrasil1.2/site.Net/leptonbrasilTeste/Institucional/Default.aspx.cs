using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using leptonbrasil.Banco;
using System.Data;

namespace leptonbrasil.Institucional
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Page.Title = ".:Lepton - Institucional:.";

            if (!IsPostBack)
            {
                Session["tituloPagina"] = "Lepton - Institucional";
                CarregaDadosTela();
            }
        }

        //carrega os dados do banco na tela
        private void CarregaDadosTela()
        {
            MyBdInstitucional obtemDadosServicos = new MyBdInstitucional();
            try
            {
                DataSet ds = obtemDadosServicos.obtemDados();
                DataRow dr = ds.Tables[0].Rows[0];

                lblTitulo.Text = dr["titulo"].ToString();
                fvTexto.DataSource = ds;
                fvTexto.DataBind();
            }
            catch (Exception ex)
            {
                //nada
            }
        }

    }
}
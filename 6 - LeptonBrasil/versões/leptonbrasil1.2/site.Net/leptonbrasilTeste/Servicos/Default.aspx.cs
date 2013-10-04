using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using leptonbrasil.Banco;
using System.Data;

namespace leptonbrasil.Servicos
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Page.Title = ".:Lepton - Serviços:.";

            if (!IsPostBack)
            {
                Session["tituloPagina"] = "Lepton - Serviços";
                CarregaDadosTela();
            }
        }

        //carrega os dados do banco na tela
        private void CarregaDadosTela()
        {
            MyBdAdmServicos obtemDadosServicos = new MyBdAdmServicos();
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
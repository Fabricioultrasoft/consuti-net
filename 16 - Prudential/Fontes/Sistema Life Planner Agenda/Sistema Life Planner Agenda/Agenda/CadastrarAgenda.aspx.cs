using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sistema_Life_Planner_Agenda.Classes;
using System.Data;
using Sistema_Life_Planner_Agenda.BD;

namespace Sistema_Life_Planner_Agenda.Agenda
{
    public partial class CadastrarAgenda : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ValidaUserLogado();
                if (!string.IsNullOrEmpty(Request.QueryString["idContato"]))
                {
                    CarregaCampos(Convert.ToInt32(Request.QueryString["idContato"].ToString()));
                }
            }
        }

        protected void cancelarButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("CadastrarAgenda.aspx");
        }

        protected void salvarButton_Click(object sender, EventArgs e)
        {

        }

        private void CarregaCampos(int idContato)
        {
            DataRow contato = new ContatoBD().Obter(idContato, Convert.ToInt32(new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString()))).Tables[0].Rows[0];
            ContatoDropDownList.Items.Add(new ListItem(contato["Nome"].ToString(), ""));
            ContatoDropDownList.Enabled = false;
            RecomendanteTextBox.Text = contato["Nome_Recomendante"].ToString();

            DDDTelefonePrincipalTextBox.Text = contato["Telefone_Principal"].ToString().Substring(0, 2);
            TelefonePrincipalTextBox.Text = contato["Telefone_Principal"].ToString().Substring(2);

            if (!string.IsNullOrEmpty(contato["Telefone_Alternativo_1"].ToString()))
            {
                DDDtelefoneAlternativo1TextBox.Text = contato["Telefone_Alternativo_1"].ToString().Substring(0, 2);
                telefoneAlternativo1TextBox.Text = contato["Telefone_Alternativo_1"].ToString().Substring(2);
            }
            if (!string.IsNullOrEmpty(contato["Telefone_Alternativo_2"].ToString()))
            {
                DDDtelefoneAlternativo2TextBox.Text = contato["Telefone_Alternativo_2"].ToString().Substring(0, 2);
                telefoneAlternativo2TextBox.Text = contato["Telefone_Alternativo_2"].ToString().Substring(2);
            }



        }
    }
}
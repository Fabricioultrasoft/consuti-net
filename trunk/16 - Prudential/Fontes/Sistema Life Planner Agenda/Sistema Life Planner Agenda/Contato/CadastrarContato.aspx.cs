using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sistema_Life_Planner_Agenda.Classes;

namespace Sistema_Life_Planner_Agenda.Contato
{
    public partial class CadastrarContato : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataCadastroLabel.Text = DateTime.Now.ToString();
            //TODO: Verificar se existe histórico. se sim, ocultar o label
        }

        protected void incluirHistoricoContato_Click(object sender, EventArgs e)
        {

        }

        protected void salvarButton_Click(object sender, EventArgs e)
        {
            try
            {
                //TODO: Salvar contato
                ExibeMensagemPopUp("Contatos Salvos com Sucesso!");
                Response.Redirect("CadastrarContato.aspx");
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void cancelarButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("PesquisarContato.aspx");
        }
    }
}
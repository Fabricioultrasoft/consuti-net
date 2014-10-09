using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sistema_Life_Planner_Agenda.Classes;
using Sistema_Life_Planner_Agenda.BD;
using System.Web.Security;

namespace Sistema_Life_Planner_Agenda.Contato
{
    public partial class CadastrarContato : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                try
                {
                    CarregarRecomendantes();
                    CarregarStatus();
                    CarregarTipos();

                    DataCadastroLabel.Text = DateTime.Now.ToString();
                    
                }
                catch (Exception)
                {
                    FormsAuthentication.SignOut();
                    Response.Redirect("~/Login.aspx");
                }
               
            }
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

        private void CarregarRecomendantes()
        {
            RecomendanteDropDownList.DataSource = new ContatoBD().Listar();
            RecomendanteDropDownList.DataTextField = "Nome";
            RecomendanteDropDownList.DataValueField = "Id";
            RecomendanteDropDownList.DataBind();

            ListItem selecione = new ListItem("<Selecione>", "");
            RecomendanteDropDownList.Items.Insert(0, selecione);

            ListItem usuarioLogado = new ListItem(Session["nomeUsuarioLogado"].ToString().ToUpper(), "1");
            RecomendanteDropDownList.Items.Insert(1, usuarioLogado);
        }

        private void CarregarStatus()
        {
            StatusDropDownList.DataSource = new StatusContatoBD().Listar();
            StatusDropDownList.DataTextField = "Status";
            StatusDropDownList.DataValueField = "Id";
            StatusDropDownList.DataBind();

            ListItem selecione = new ListItem("<Selecione>", "");
            StatusDropDownList.Items.Insert(0, selecione);
        }

        private void CarregarTipos()
        {
            TipoDropDownList.DataSource = new TipoContatoBD().Listar();
            TipoDropDownList.DataTextField = "Tipo";
            TipoDropDownList.DataValueField = "Id";
            TipoDropDownList.DataBind();

            ListItem selecione = new ListItem("<Selecione>", "");
            TipoDropDownList.Items.Insert(0, selecione);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sistema_Life_Planner_Agenda.Classes;
using Sistema_Life_Planner_Agenda.BD;
using System.Data;

namespace Sistema_Life_Planner_Agenda.SITPLAN
{
    public partial class ExecutarSITPLAN : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ValidaUserLogado();
                CarregarContatos(Convert.ToInt32(Request.QueryString["idSitPlan"]));
            }
        }

        protected void salvarButton_Click(object sender, EventArgs e)
        {
            new SitPlanBD().AtualizarStatus(
                "Concluído",
                Convert.ToInt32(Request.QueryString["idSitPlan"]),
                Convert.ToInt32(new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString())));
            Response.Redirect("RelatorioTAs.aspx?idSitPlan=" + Request.QueryString["idSitPlan"]);
        }

        protected void cancelarButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("PesquisarSITPLAN.aspx");
        }

        protected void listaTasRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("DetalhesContato"))
            {
                Response.Redirect("~/Contato/CadastrarContato.aspx?idContato=" + Convert.ToString(e.CommandArgument) + "&Mode=View&IdSitPlan=" + Request.QueryString["idSitPlan"], false);
            }
            if (e.CommandName.Equals("AgendamentoContato"))
            {
                Response.Redirect("~/Agenda/CadastrarAgenda.aspx?idContato=" + Convert.ToString(e.CommandArgument));
            }
        }

        private void CarregarContatos(int idSitPlan)
        {
            DataSet dsContatos = new SitPlanBD().ContatosSITPLAN(idSitPlan);

            listaTasRepeater.DataSource = dsContatos;
            listaTasRepeater.DataBind();

            List<string> listaIds = new List<string>();
            foreach (DataRow item in dsContatos.Tables[0].Rows)
            {
                listaIds.Add(item["ID"].ToString());
            }

            CarregaDDLStatusContato(listaTasRepeater.Items.Count, listaIds);
        }

        /// <summary>
        /// carrega todos os ddls de status para atualizar o status do contato
        /// </summary>
        /// <param name="qtdContatos"></param>
        private void CarregaDDLStatusContato(int qtdContatos, List<string> idsContatos)
        {
            DataSet dtsStatusContatos = new StatusContatoBD().Listar();
            for (int i = 0; i < qtdContatos; i++)
            {
                DropDownList ddlStatus = (DropDownList)FindControl("ctl00$ContentPlaceHolder1$listaTasRepeater$ctl0" + i + "$StatusDropDownList");//TODO: bug: se passar de 9 não vai encontrar o controle
                ddlStatus.DataSource = dtsStatusContatos;
                ddlStatus.DataTextField = "Status";
                ddlStatus.DataValueField = "Id";
                ddlStatus.DataBind();
                ddlStatus.Attributes.Add("IDContato", idsContatos[i].ToString());

                ListItem selecione = new ListItem("< Selecione >", "");
                ddlStatus.Items.Insert(0, selecione);
            }
        }

        protected void StatusDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlTst = (DropDownList)sender;

            //pega o id do contato que está sendo atualizado
            int IdDoContato = Convert.ToInt32(ddlTst.Attributes["IDContato"].ToString());

            //pega o ID do novo status
            int novoStatus = Convert.ToInt32(ddlTst.SelectedIndex.ToString());

            //Atualiza o status do contato
            new ContatoBD().Atualizar(IdDoContato, novoStatus);

            //Atualiza o pré-status
            new ContatosSitPlanBD().Atualizar(IdDoContato, novoStatus, Convert.ToInt32(Request.QueryString["idSitPlan"]));

            CarregarContatos(Convert.ToInt32(Request.QueryString["idSitPlan"]));
        }
    }
}
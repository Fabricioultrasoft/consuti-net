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
                if (!string.IsNullOrEmpty(Request.QueryString["idSitPlan"]))
                {
                    try
                    {
                        CarregarContatos(Convert.ToInt32(Request.QueryString["idSitPlan"]));
                    }
                    catch (Exception ex)
                    {
                        ExibeMensagemPopUp("Não foi possível carregar os dados. Parâmetros inválidos para o seu perfil. Detalhes: " + ex.Message);
                    }
                }
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
                Response.Redirect("~/Contato/CadastrarContato.aspx?idContato=" + Convert.ToString(e.CommandArgument) + "&Mode=View&Return=ExecSitPlan&IdSitPlan=" + Request.QueryString["idSitPlan"], false);
            }
            else if (e.CommandName.Equals("AgendamentoContato"))
            {
                Response.Redirect("~/Agenda/CadastrarAgenda.aspx?idContato=" + Convert.ToString(e.CommandArgument) + "&ReturnSitPlanId=" + Request.QueryString["idSitPlan"].ToString());
            }
        }

        private void CarregarContatos(int idSitPlan)
        {
            DataSet dsContatos = new SitPlanBD().ContatosSITPLAN(idSitPlan, Convert.ToInt32(new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString())));

            listaTasRepeater.DataSource = dsContatos;
            listaTasRepeater.DataBind();

            NomeSITPLANLabel.Text = dsContatos.Tables[0].Rows[0]["NomeSITPLAN"].ToString();

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
                DropDownList ddlStatus = (DropDownList)FindControl("ctl00$ContentPlaceHolder1$listaTasRepeater$ctl" + i.ToString("D2") + "$StatusDropDownList");
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
            //new ContatosSitPlanBD().Atualizar(IdDoContato, novoStatus, Convert.ToInt32(Request.QueryString["idSitPlan"]));

            CarregarContatos(Convert.ToInt32(Request.QueryString["idSitPlan"]));
        }
    }
}
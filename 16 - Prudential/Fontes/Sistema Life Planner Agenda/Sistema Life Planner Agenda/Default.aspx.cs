using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sistema_Life_Planner_Agenda.Classes;
using Sistema_Life_Planner_Agenda.BD;

namespace Sistema_Life_Planner_Agenda.Site
{
    public partial class WebForm1 : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ValidaUserLogado();
                CarregarGridView();
            }
        }

        protected void NovoContatoImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Contato/CadastrarContato.aspx");
        }

        protected void NovoContatoLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contato/CadastrarContato.aspx");
        }

        protected void CadastrarContatoLoteImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Contato/CadastrarLote.aspx");
        }

        protected void CadastrarContatoLoteLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contato/CadastrarLote.aspx");
        }

        protected void CadastrarAgendaImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Agenda/CadastrarAgenda.aspx");
        }

        protected void CadastrarAgendaLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Agenda/CadastrarAgenda.aspx");
        }

        protected void CadastrarSITPLANImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("SITPLAN/CadastrarSITPLAN.aspx");
        }

        protected void CadastrarSITPLANLinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("SITPLAN/CadastrarSITPLAN.aspx");
        }

        private void CarregarGridView()
        {
            string idContato = string.Empty;

            DateTime dataDe = DateTime.Now;
            DateTime dataAte = DateTime.Now.AddDays(7);

            AgendaGridView.DataSource = new AgendaBD().Listar(
                idContato,
                Convert.ToDateTime(dataDe),
                Convert.ToDateTime(dataAte),
                Convert.ToInt32(new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString())));
            AgendaGridView.DataBind();
        }

        #region Eventos do GridView

        /// <summary>
        /// Exclui ou altera um registro no grid
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void AgendaGridView_Click(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Excluir")
                {
                    new AgendaBD().Excluir(Convert.ToInt32(e.CommandArgument));
                    ExibeMensagemPopUp("Compromisso removido com sucesso!");
                    CarregarGridView();
                }
                else if (e.CommandName == "Alterar")
                {
                    // o ",false" é para suprimir a chamada interna para "Response.End"
                    Response.Redirect("~/Agenda/CadastrarAgenda.aspx?idAgenda=" + Convert.ToString(e.CommandArgument), false);
                }
            }
            catch (Exception ex)
            {
                ExibeMensagemPopUp("Erro interno. Tente novamente mais tarde. Detalhes: " + ex.Message);
            }
        }

        #endregion
    }
}
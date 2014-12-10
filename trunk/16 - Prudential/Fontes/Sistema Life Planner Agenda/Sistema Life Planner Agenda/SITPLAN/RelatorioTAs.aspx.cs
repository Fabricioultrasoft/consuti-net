using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sistema_Life_Planner_Agenda.Classes;
using System.Data;
using Sistema_Life_Planner_Agenda.BD;

namespace Sistema_Life_Planner_Agenda.SITPLAN
{
    public partial class RelatorioTAs : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidaUserLogado();
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["idSitPlan"]))
                {
                    CarregarDados(Convert.ToInt32(Request.QueryString["idSitPlan"]));
                }
            }
        }

        private void CarregarDados(int idSitPlan)
        {
            try
            {
                PreencheCampos(new SitPlanBD().RelatorioTA(idSitPlan).Tables[0].Rows[0]);

            }
            catch (Exception ex)
            {
                ExibeMensagemPopUp("Não foi possível gerar o relatório do TA. Procure o administrador do sistema. Detalhes: " + ex.Message);
                throw;
            }

        }

        private void PreencheCampos(DataRow dados)
        {
            NomeSITPLANLabel.Text = dados["NomeSITPLAN"].ToString();
            NomeLPLabel.Text = Session["nomeUsuarioLogado"].ToString();
            DataHoraInicioLabel.Text = dados["Inicio"].ToString();
            DataHoraTerminoLabel.Text = DateTime.Now.ToString();
            LigacoesRealizadasLabel.Text = dados["total_ligacoes"].ToString();
            ContatosAtualizadosLabel.Text = dados["total_atualizado"].ToString();
            NaoAtendeuLabel.Text = dados["total_nao_atendeu"].ToString();
            JaEhClienteLabel.Text = dados["total_ja_e_cliente"].ToString();
            NaoQuerLabel.Text = dados["total_nao_quer"].ToString();
            AgendouOiLabel.Text = dados["total_agendou_oi"].ToString();
            AgendouCLabel.Text = dados["total_agendou_c"].ToString();
            LigacaoFuturaLabel.Text = dados["total_ligacao_futura"].ToString();
            NenhumLabel.Text = dados["total_nenhum"].ToString();
            MeuClienteLabel.Text = dados["meu_cliente"].ToString();
        }
    }
}
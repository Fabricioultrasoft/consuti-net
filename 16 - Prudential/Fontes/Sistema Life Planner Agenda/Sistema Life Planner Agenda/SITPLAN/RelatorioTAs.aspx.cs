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
            TaNaoAtendeuLabel.Text = dados["TA_NAO_ATENDEU"].ToString();
            TaNaoQuerLabel.Text = dados["TA_NAO_QUER"].ToString();
            TaLigacaoFuturaLabel.Text = dados["TA_LIGACAO_FUTURA"].ToString();
            TaJaEhClientLabel.Text = dados["TA_JA_E_CLIENTE"].ToString();
            TaOiAgendadoLabel.Text = dados["TA_OI_AGENDADO"].ToString();
            OiDelayLabel.Text = dados["OI_DELAY"].ToString();
            OiRealizadoLabel.Text = dados["OI_REALIZADO"].ToString();
            PcLigacaoFuturaLabel.Text = dados["PC_LIGACAO_FUTURA"].ToString();
            PcDelayLabel.Text = dados["PC_DELAY"].ToString();
            PcNLabel.Text = dados["PC_N"].ToString();
            PcC2Label.Text = dados["PC_C2"].ToString();
            MeuClienteLabel.Text = dados["MEU_CLIENTE"].ToString();
            NenhumLabel.Text = dados["NENHUM"].ToString();
        }
    }
}
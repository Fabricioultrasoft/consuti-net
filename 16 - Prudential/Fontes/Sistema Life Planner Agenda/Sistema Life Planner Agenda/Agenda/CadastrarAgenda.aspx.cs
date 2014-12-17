using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sistema_Life_Planner_Agenda.Classes;
using System.Data;
using Sistema_Life_Planner_Agenda.BD;
using System.Configuration;

namespace Sistema_Life_Planner_Agenda.Agenda
{
    public partial class CadastrarAgenda : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ValidaUserLogado();
                if (!string.IsNullOrEmpty(Request.QueryString["ReturnSitPlanId"]))
                {
                    VoltarButton.Visible = true;
                    cancelarButton.Visible = false;
                }
                if (!string.IsNullOrEmpty(Request.QueryString["idContato"]))
                {
                    CarregaCamposContato(Convert.ToInt32(Request.QueryString["idContato"].ToString()), false);
                }
                if (!string.IsNullOrEmpty(Request.QueryString["idAgenda"]))
                {
                    CarregaCamposEdicao(Request.QueryString["idAgenda"].ToString());
                }
                else
                {
                    CarregarContatos();
                }
            }
        }

        private void PreencheContatoPreferencial(string preferencias)
        {
            if (preferencias.Contains("TP"))
            {
                TelefonePrincipalCheckBox.Checked = true;
            } if (preferencias.Contains("TA1"))
            {
                TelefoneAlternativo1CheckBox.Checked = true;
            } if (preferencias.Contains("TA2"))
            {
                TelefoneAlternativo2CheckBox.Checked = true;
            } if (preferencias.Contains("EM"))
            {
                emailCheckBox.Checked = true;
            }
        }

        private void CarregaCamposEdicao(string idAgenda)
        {
            try
            {
                DataRow dr = new AgendaBD().Obter(idAgenda, new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString())).Tables[0].Rows[0];

                DiaCompromissoCalendar.SelectedDate = Convert.ToDateTime(dr["Data"].ToString());
                HoraTextBox.Text = dr["Hora"].ToString();
                MinutosTextBox.Text = dr["Minutos"].ToString();
                MaisInformaciesTextBox.Text = dr["Mais_Informacoes"].ToString();
                CriarAgendaGoogleCheckBox.Checked = Convert.ToBoolean(dr["Criar_Google_Agenda"].ToString());

                CarregarContatos();
                CarregaCamposContato(Convert.ToInt32(dr["ID_Contato"].ToString()), true);

                if (!string.IsNullOrEmpty(dr["Periodo"].ToString()))
                {
                    PeriodoRadioButtonList.Items.FindByText(dr["Periodo"].ToString()).Selected = true;
                }

                PreencheContatoPreferencial(dr["Preferencia_Contato"].ToString());
            }
            catch (Exception ex)
            {
                ExibeMensagemPopUp("Não foi possível carregar os dados. Parâmetros inválidos para o seu perfil. Detalhes: " + ex.Message);
            }
        }

        protected void CarregaContato_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ContatoDropDownList.SelectedItem.Value))
            {
                CarregaCamposContato(Convert.ToInt32(ContatoDropDownList.SelectedItem.Value), true);
            }
            else
            {
                SelecaoVazia();
            }
        }

        protected void cancelarButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("CadastrarAgenda.aspx");
        }

        protected void salvarButton_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["idAgenda"]))
            {
                try
                {
                    new AgendaBD().Alterar(
                       Convert.ToInt32(Request.QueryString["idAgenda"].ToString()),
                       Convert.ToInt32(ContatoDropDownList.SelectedItem.Value),
                       Convert.ToInt32(new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString())),
                       CriarAgendaGoogleCheckBox.Checked,
                       DiaCompromissoCalendar.SelectedDate,
                       Convert.ToInt32(HoraTextBox.Text),
                       Convert.ToInt32(MinutosTextBox.Text),
                       MaisInformaciesTextBox.Text,
                       PreferenciaContato(),
                       PeriodoCompromisso());
                    if (CriarAgendaGoogleCheckBox.Checked)
                    {
                        //CriarCalendario();
                    }
                    ExibeMensagemPopUp("Compromisso salvo com sucesso!");
                }
                catch (Exception ex)
                {
                    ExibeMensagemPopUp("Não foi possível atualizar o compromisso na agenda. Detalhes do erro: " + ex.Message);
                }

            }
            else
            {
                try
                {
                    if (!ValidaDataSelecionada())
                    {
                        ExibeMensagemPopUp("Selecione uma data para o compromisso no calendário.");
                    }
                    else if (!ValidaHora(Convert.ToInt32(HoraTextBox.Text), Convert.ToInt32(MinutosTextBox.Text)))
                    {
                        ExibeMensagemPopUp("Hora e/ou Minutos inválidos! Verifique os dados e tente novamente.");
                    }
                    else
                    {
                        new AgendaBD().Incluir(
                            Convert.ToInt32(ContatoDropDownList.SelectedValue),
                            Convert.ToInt32(new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString())),
                            CriarAgendaGoogleCheckBox.Checked,
                            DiaCompromissoCalendar.SelectedDate,
                            Convert.ToInt32(HoraTextBox.Text.ToString()),
                            Convert.ToInt32(MinutosTextBox.Text),
                            MaisInformaciesTextBox.Text,
                            PreferenciaContato(),
                            PeriodoCompromisso());

                        if (CriarAgendaGoogleCheckBox.Checked)
                        {
                            //CriarCalendario();
                        }

                        LimparCampos();
                        ExibeMensagemPopUp("Compromisso salvo com sucesso!");
                    }
                }
                catch (Exception ex)
                {
                    ExibeMensagemPopUp("Não foi possível criar o compromisso na agenda. Detalhes do erro: " + ex.Message);
                }
            }
        }

        /// <summary>
        /// Se houver uma data selecionada retorna true
        /// </summary>
        /// <returns></returns>
        private bool ValidaDataSelecionada()
        {
            if (DiaCompromissoCalendar.SelectedDate.ToString() == "01/01/0001 00:00:00")
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        /// <summary>
        /// Obtem e retorna o período de um compromisso
        /// </summary>
        /// <returns></returns>
        private string PeriodoCompromisso()
        {
            string periodo = string.Empty;
            try
            {
                periodo = PeriodoRadioButtonList.SelectedItem.Text;
            }
            catch (Exception) { }
            return periodo;
        }


        /// <summary>
        /// Combina as marcações de contato preferencial do contato para o compromisso
        /// </summary>
        /// <returns></returns>
        private string PreferenciaContato()
        {
            string pref = string.Empty;
            if (TelefonePrincipalCheckBox.Checked)
            {
                pref += "TP,";
            }
            if (TelefoneAlternativo1CheckBox.Checked)
            {
                pref += "TA1,";
            }
            if (TelefoneAlternativo2CheckBox.Checked)
            {
                pref += "TA2,";
            }
            if (emailCheckBox.Checked)
            {
                pref += "EM,";
            }

            return pref;
        }

        private void CarregaCamposContato(int idContato, bool carregaContatos)
        {
            DataRow contato = new ContatoBD().Obter(idContato, Convert.ToInt32(new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString()))).Tables[0].Rows[0];
            if (carregaContatos)
            {
                ContatoDropDownList.SelectedValue = idContato.ToString();
            }
            else
            {
                ContatoDropDownList.Items.Add(new ListItem(contato["Nome"].ToString(), contato["ID_Contato"].ToString()));
                ContatoDropDownList.Enabled = false;
            }
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

        /// <summary>
        /// Carrega o combo de contatos
        /// </summary>
        private void CarregarContatos()
        {
            try
            {
                ContatoDropDownList.Items.Clear();
                ContatoDropDownList.DataSource = new ContatoBD().Listar(Convert.ToInt32(new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString())));
                ContatoDropDownList.DataTextField = "Nome";
                ContatoDropDownList.DataValueField = "Id";
                ContatoDropDownList.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ContatoDropDownList.Items.Insert(0, new ListItem("< Selecione >", ""));

                //se quiser mostrar o próprio usuário
                //ListItem usuarioLogado = new ListItem(Session["nomeUsuarioLogado"].ToString() + " (EU)", new ContatoBD().ObterID(Session["nomeUsuarioLogado"].ToString(), Session["emailUsuarioLogado"].ToString()).ToString());
                //ContatoDropDownList.Items.Insert(1, usuarioLogado);
            }
        }

        /// <summary>
        /// Limpa os campos da tela
        /// </summary>
        private void LimparCampos()
        {
            ContatoDropDownList.SelectedIndex = 0;

            RecomendanteTextBox.Text =
                DDDtelefoneAlternativo1TextBox.Text =
                DDDtelefoneAlternativo2TextBox.Text =
                DDDTelefonePrincipalTextBox.Text =
                telefoneAlternativo1TextBox.Text =
                telefoneAlternativo2TextBox.Text =
                TelefonePrincipalTextBox.Text =
                emailTextBox.Text =
                MinutosTextBox.Text =
                MaisInformaciesTextBox.Text =
                HoraTextBox.Text = string.Empty;

            TelefonePrincipalCheckBox.Checked =
                TelefoneAlternativo2CheckBox.Checked =
                TelefoneAlternativo1CheckBox.Checked = false;

            CriarAgendaGoogleCheckBox.Checked = true;

            PeriodoRadioButtonList.SelectedIndex = 0;

        }

        /// <summary>
        /// Reseta apenas os campos relacionados ao contato
        /// </summary>
        private void SelecaoVazia()
        {
            RecomendanteTextBox.Text =
                DDDtelefoneAlternativo1TextBox.Text =
                DDDtelefoneAlternativo2TextBox.Text =
                DDDTelefonePrincipalTextBox.Text =
                telefoneAlternativo1TextBox.Text =
                telefoneAlternativo2TextBox.Text =
                TelefonePrincipalTextBox.Text =
                emailTextBox.Text = string.Empty;

            TelefonePrincipalCheckBox.Checked =
                TelefoneAlternativo2CheckBox.Checked =
                TelefoneAlternativo1CheckBox.Checked = false;
        }

        protected void VoltarButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SITPLAN/ExecutarSITPLAN.aspx?idSitPlan=" + Request.QueryString["ReturnSitPlanId"].ToString());
        }

        private void CriarCalendario()
        {
            //INITIALIZING MEETING DETAILS
            string caminhoAnexo = Server.MapPath("SISLPACompromisso_" + DateTime.Now.ToString("yyyyMMddHHmmss") + "_" + Convert.ToInt32(new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString())) + ".ics");
            string schLocation = "SISLPA";
            string schSubject = "Realizar contato com - " + ContatoDropDownList.SelectedItem.Text;
            string schDescription = MaisInformaciesTextBox.Text;
            DateTime schBeginDate = DiaCompromissoCalendar.SelectedDate.AddHours(Convert.ToInt32(HoraTextBox.Text)).AddMinutes(Convert.ToInt32(MinutosTextBox.Text));
            DateTime schEndDate = DiaCompromissoCalendar.SelectedDate;

            //PUTTING THE MEETING DETAILS INTO AN ARRAY OF STRING

            String[] contents = { "BEGIN:VCALENDAR",
                              "PRODID:-//Flo Inc.//FloSoft//EN",
                              "BEGIN:VEVENT",
                              "DTSTART:" + schBeginDate.ToUniversalTime().ToString("yyyyMMdd\\THHmmss\\Z"), 
                              "DTEND:" + schEndDate.ToUniversalTime().ToString("yyyyMMdd\\THHmmss\\Z"), 
                              "LOCATION:" + schLocation, 
	                     "DESCRIPTION;ENCODING=QUOTED-PRINTABLE:" + schDescription,
                              "SUMMARY:" + schSubject, "PRIORITY:3", 
	                     "END:VEVENT", "END:VCALENDAR" };

            /*THE METHOD 'WriteAllLines' CREATES A FILE IN THE SPECIFIED PATH WITH 
           THE SPECIFIED NAME,WRITES THE ARRAY OF CONTENTS INTO THE FILE AND CLOSES THE
            FILE.SUPPOSE THE FILE ALREADY EXISTS IN THE SPECIFIED LOCATION,THE CONTENTS 
           IN THE FILE ARE OVERWRITTEN*/

            System.IO.File.WriteAllLines(caminhoAnexo, contents);

            //METHOD TO SEND EMAIL IS CALLED
            EnviaEmail(
                "Compromisso SISLPA",
                ConfigurationManager.AppSettings["emailDestinatarioRecuperarSenha"].ToString(),
                Session["emailUsuarioLogado"].ToString(),
                schSubject,
                "Evento criado a partir do Sistema Life Planner Agenda - SISLPA",
                caminhoAnexo);
        }
    }
}
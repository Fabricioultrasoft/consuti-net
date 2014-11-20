using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sistema_Life_Planner_Agenda.Classes;
using Sistema_Life_Planner_Agenda.BD;
using System.Web.Security;
using System.Data;
using MySql.Data.Types;

namespace Sistema_Life_Planner_Agenda.Contato
{
    public partial class CadastrarContato : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                ValidaUserLogado();
                if (!string.IsNullOrEmpty(Request.QueryString["idContato"]))
                {
                    CarregaDadosCadastrais(Convert.ToInt32(Request.QueryString["idContato"]));
                }
                else
                {
                    try
                    {
                        CarregarRecomendantes();
                        CarregarStatus();
                        CarregarTipos();
                        CarregarMunicipios();

                        DataCadastroLabel.Text = DateTime.Now.ToString();

                    }
                    catch (Exception)
                    {
                        FormsAuthentication.SignOut();
                        Response.Redirect("~/Login.aspx");
                    }
                }

            }

            //TODO: Verificar se existe histórico. se sim, ocultar o label
        }

        protected void incluirHistoricoContato_Click(object sender, EventArgs e)
        {

        }

        protected void salvarButton_Click(object sender, EventArgs e)
        {
            Contato dadosContato = new Contato();
            dadosContato = MontaDados();

            if (!string.IsNullOrEmpty(Request.QueryString["idContato"]))
            {
                if (ValidarAtualizacaoRecomendanteContato(Request.QueryString["idContato"].ToString(), dadosContato.ID_Contato_Recomendante.ToString()))
                {
                    try
                    {
                        new ContatoBD().Atualizar(
                            Convert.ToInt32(Request.QueryString["idContato"]),
                            dadosContato.ID_Status_Contato,
                            dadosContato.ID_Tipo_Contato,
                            dadosContato.Cidade,
                            dadosContato.Email,
                            dadosContato.Estado_Civil,
                            dadosContato.Filhos,
                            dadosContato.Idade,
                            dadosContato.Nome,
                            dadosContato.Outras_Informacoes,
                            dadosContato.Profissao,
                            dadosContato.Sexo,
                            dadosContato.Telefone_Alternativo_1,
                            dadosContato.Telefone_Alternativo_2,
                            dadosContato.Telefone_Principal,
                            dadosContato.UF);

                        new RecomendanteContatoBD().Atualizar(Convert.ToInt32(Session["ID_Contato_RecomendanteAtual"].ToString()),
                            dadosContato.ID_Contato_Recomendante,
                            Convert.ToInt32(Request.QueryString["idContato"]));

                        ExibeMensagemPopUp("Contato salvo com sucesso!");
                    }
                    catch (Exception ex)
                    {
                        ExibeMensagemPopUp("Falha ao tentar atualizar o contato. Tente novamente. Detalhes: " + ex.Message);
                    }
                }
                else
                {
                    ExibeMensagemPopUp("Não é possível alterar o recomendante para o próprio contato. Selecione outro recomendante e tente novamente.");
                }
            }
            else
            {
                try
                {
                    //cadastra um contato e associa o mesmo ao usuário logado
                    int novoContatoID = new ContatoBD().Incluir(
                        dadosContato.ID_Status_Contato,
                        dadosContato.ID_Tipo_Contato,
                        dadosContato.Cidade,
                        dadosContato.Email,
                        dadosContato.Estado_Civil,
                        dadosContato.Filhos,
                        dadosContato.Idade,
                        dadosContato.Nome,
                        dadosContato.Outras_Informacoes,
                        dadosContato.Profissao,
                        dadosContato.Sexo,
                        dadosContato.Telefone_Alternativo_1,
                        dadosContato.Telefone_Alternativo_2,
                        dadosContato.Telefone_Principal,
                        dadosContato.UF);

                    new ContatosUsuarioBD().Incluir(
                        novoContatoID,
                        Convert.ToInt32(new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString())),
                        DateTime.Now);

                    new RecomendanteContatoBD().Incluir(
                        novoContatoID,
                        dadosContato.ID_Contato_Recomendante);

                    ExibeMensagemPopUp("Contato salvo com sucesso!");
                    LimparCampos();

                }
                catch (Exception ex)
                {
                    ExibeMensagemPopUp("Falha ao tentar salvar o contato. Tente novamente. Detalhes: " + ex.Message);
                }
            }
            pesquisarButton.Visible = true;
            cancelarButton.Visible = false;
        }

        protected void cancelarButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("PesquisarContato.aspx");
        }

        private void CarregarRecomendantes()
        {
            try
            {
                RecomendanteDropDownList.DataSource = new ContatoBD().Listar(Convert.ToInt32(new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString())));
                RecomendanteDropDownList.DataTextField = "Nome";
                RecomendanteDropDownList.DataValueField = "Id";
                RecomendanteDropDownList.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                RecomendanteDropDownList.Items.Insert(0, new ListItem("< Selecione >", ""));

                ListItem usuarioLogado = new ListItem(Session["nomeUsuarioLogado"].ToString() + " (EU)", new ContatoBD().ObterID(Session["nomeUsuarioLogado"].ToString(), Session["emailUsuarioLogado"].ToString()).ToString());
                RecomendanteDropDownList.Items.Insert(1, usuarioLogado);
            }
        }

        private void CarregarStatus()
        {
            StatusDropDownList.DataSource = new StatusContatoBD().Listar();
            StatusDropDownList.DataTextField = "Status";
            StatusDropDownList.DataValueField = "Id";
            StatusDropDownList.DataBind();

            ListItem selecione = new ListItem("< Selecione >", "");
            StatusDropDownList.Items.Insert(0, selecione);
        }

        private void CarregarMunicipios()
        {
            if (string.IsNullOrEmpty(UFDropDownList.SelectedItem.Value))
            {
                ListItem selecione = new ListItem("< Selecione >", "");
                CidadesDropDownList.Items.Insert(0, selecione);
            }
            else
            {

                CidadesDropDownList.DataSource = new CidadesBD().Listar(UFDropDownList.SelectedItem.Value);
                CidadesDropDownList.DataTextField = "Nome";
                CidadesDropDownList.DataValueField = "id_cidade";
                CidadesDropDownList.DataBind();

                ListItem selecione = new ListItem("< Selecione >", "");
                CidadesDropDownList.Items.Insert(0, selecione);
            }
        }

        private void CarregarTipos()
        {
            TipoDropDownList.DataSource = new TipoContatoBD().Listar();
            TipoDropDownList.DataTextField = "Tipo";
            TipoDropDownList.DataValueField = "Id";
            TipoDropDownList.DataBind();

            ListItem selecione = new ListItem("< Selecione >", "");
            TipoDropDownList.Items.Insert(0, selecione);
        }

        private void CarregaDadosCadastrais(int idContato)
        {
            try
            {
                //carrega os dados dos combos
                CarregarRecomendantes();
                CarregarStatus();
                CarregarTipos();

                //preenche os campos
                DataSet contatoCadastrado = new ContatoBD().Obter(idContato, Convert.ToInt32(new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString())));

                DataRow DrContato = contatoCadastrado.Tables[0].Rows[0];
                DataCadastroLabel.Text = DrContato["Data_Cadastro"].ToString();
                RecomendanteDropDownList.SelectedValue = DrContato["ID_Contato_Recomendante"].ToString();
                nomeCompletoTextBox.Text = DrContato["Nome"].ToString();
                StatusDropDownList.SelectedValue = DrContato["ID_Status_Contato"].ToString();
                DDDTelefoneTextBox.Text = DrContato["Telefone_Principal"].ToString().Substring(0, 2);
                TelefoneTextBox.Text = DrContato["Telefone_Principal"].ToString().Substring(2);
                SexoRadioButtonList.SelectedValue = DrContato["Sexo"].ToString();
                outrasInformacoesTextBox.Text = DrContato["Outras_Informacoes"].ToString();
                idadeTextBox.Text = DrContato["Idade"].ToString();
                profissaoTextBox.Text = DrContato["Profissao"].ToString();
                EstadoCivilDropDownList.SelectedValue = DrContato["Estado_Civil"].ToString();
                filhosTextBox.Text = DrContato["Filhos"].ToString();
                TipoDropDownList.SelectedValue = DrContato["ID_Tipo_Contato"].ToString();
                UFDropDownList.SelectedValue = DrContato["UF"].ToString();
                CarregarMunicipios();
                CidadesDropDownList.SelectedItem.Text = DrContato["Cidade"].ToString();
                emailTextBox.Text = DrContato["Email"].ToString();
                if (!string.IsNullOrEmpty(DrContato["Telefone_Alternativo_1"].ToString()))
                {
                    DDDtelefoneAlternativo1TextBox.Text = DrContato["Telefone_Alternativo_1"].ToString().Substring(0, 2);
                    telefoneAlternativo1TextBox.Text = DrContato["Telefone_Alternativo_1"].ToString().Substring(2);
                }
                if (!string.IsNullOrEmpty(DrContato["Telefone_Alternativo_2"].ToString()))
                {
                    DDDtelefoneAlternativo2TextBox.Text = DrContato["Telefone_Alternativo_2"].ToString().Substring(0, 2);
                    telefoneAlternativo2TextBox.Text = DrContato["Telefone_Alternativo_2"].ToString().Substring(2);
                }

                Session["ID_Contato_RecomendanteAtual"] = DrContato["ID_Contato_Recomendante"].ToString();

            }
            catch (Exception ex)
            {
                ExibeMensagemPopUp("Erro interno ao carregar os dados de contato. Detalhes: " + ex.Message);
            }
        }

        /// <summary>
        /// Preenche a classe Contato
        /// </summary>
        /// <returns></returns>
        private Contato MontaDados()
        {
            Contato dados = new Contato();

            //Campos obrigatórios
            dados.ID_Contato_Recomendante = Convert.ToInt32(RecomendanteDropDownList.SelectedItem.Value);
            dados.Nome = nomeCompletoTextBox.Text;
            dados.Sexo = Convert.ToChar(SexoRadioButtonList.SelectedItem.Value);
            dados.Telefone_Principal = DDDTelefoneTextBox.Text + TelefoneTextBox.Text;

            if (!string.IsNullOrEmpty(TipoDropDownList.SelectedItem.Value))
                dados.ID_Tipo_Contato = Convert.ToInt32(TipoDropDownList.SelectedItem.Value);
            else
                dados.ID_Tipo_Contato = 4; // 4 - Nenhum

            if (!string.IsNullOrEmpty(StatusDropDownList.SelectedItem.Value))
                dados.ID_Status_Contato = Convert.ToInt32(StatusDropDownList.SelectedItem.Value);
            else
                dados.ID_Status_Contato = 7; // 7 - Nenhum

            if (!string.IsNullOrEmpty(CidadesDropDownList.SelectedItem.Text))
                dados.Cidade = CidadesDropDownList.SelectedItem.Text;
            else
                dados.Cidade = string.Empty;

            if (!string.IsNullOrEmpty(emailTextBox.Text))
                dados.Email = emailTextBox.Text;
            else
                dados.Email = string.Empty;

            if (!string.IsNullOrEmpty(EstadoCivilDropDownList.SelectedItem.Value))
                dados.Estado_Civil = EstadoCivilDropDownList.SelectedItem.Text;
            else
                dados.Estado_Civil = string.Empty;

            if (!string.IsNullOrEmpty(filhosTextBox.Text))
                dados.Filhos = Convert.ToInt32(filhosTextBox.Text);

            if (!string.IsNullOrEmpty(idadeTextBox.Text))
                dados.Idade = Convert.ToInt32(idadeTextBox.Text);

            if (!string.IsNullOrEmpty(outrasInformacoesTextBox.Text))
                dados.Outras_Informacoes = outrasInformacoesTextBox.Text;
            else
                dados.Outras_Informacoes = string.Empty;

            if (!string.IsNullOrEmpty(profissaoTextBox.Text))
                dados.Profissao = profissaoTextBox.Text;
            else
                dados.Profissao = string.Empty;

            if (!string.IsNullOrEmpty(DDDtelefoneAlternativo1TextBox.Text))
                dados.Telefone_Alternativo_1 = DDDtelefoneAlternativo1TextBox.Text + telefoneAlternativo1TextBox.Text;
            else
                dados.Telefone_Alternativo_1 = string.Empty;

            if (!string.IsNullOrEmpty(DDDtelefoneAlternativo2TextBox.Text))
                dados.Telefone_Alternativo_2 = DDDtelefoneAlternativo2TextBox.Text + telefoneAlternativo2TextBox.Text;
            else
                dados.Telefone_Alternativo_2 = string.Empty;

            if (!string.IsNullOrEmpty(UFDropDownList.SelectedItem.Value))
                dados.UF = UFDropDownList.SelectedItem.Value;
            else
                dados.UF = string.Empty;

            return dados;
        }

        /// <summary>
        /// Limpa os campos da tela
        /// </summary>
        private void LimparCampos()
        {
            DataCadastroLabel.Text =
                nomeCompletoTextBox.Text =

                emailTextBox.Text =
                DDDtelefoneAlternativo1TextBox.Text =
                telefoneAlternativo1TextBox.Text =
                DDDtelefoneAlternativo2TextBox.Text =
                telefoneAlternativo2TextBox.Text =
                filhosTextBox.Text =
                DDDTelefoneTextBox.Text =
                TelefoneTextBox.Text =
                outrasInformacoesTextBox.Text =
                idadeTextBox.Text =
                profissaoTextBox.Text = string.Empty;

            SexoRadioButtonList.SelectedValue = "M";

            RecomendanteDropDownList.SelectedItem.Value = "";
            StatusDropDownList.SelectedIndex =
            EstadoCivilDropDownList.SelectedIndex =
            TipoDropDownList.SelectedIndex =
            UFDropDownList.SelectedIndex =
            CidadesDropDownList.SelectedIndex = 0;

            CarregarRecomendantes();
        }

        protected void pesquisarButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("PesquisarContato.aspx");
        }

        private bool ValidarAtualizacaoRecomendanteContato(string idContato, string idNovoRecomendante)
        {
            if (idContato.Equals(idNovoRecomendante))
                return false;
            return true;
        }

        protected void UFDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            CarregarMunicipios();
        }
    }
}
//TODO: CRIAR SCRIPT DE CARGA ANTES DE IMPLANTAR
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
                        //TODO: autocomplete de cidades

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
                try
                {
                    new ContatoBD().Atualizar(
                        Convert.ToInt32(Request.QueryString["idContato"].ToString()),
                        dadosContato.ID_Contato_Recomendante,
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
                }
                catch (Exception ex)
                {
                    ExibeMensagemPopUp("Falha ao tentar atualizar o contato. Tente novamente. Detalhes: " + ex.Message);
                }
            }
            else
            {
                try
                {
                    //cadastra um contato e associa o mesmo ao usuário logado
                    new UsuarioContatoBD().Incluir(
                        new ContatoBD().Incluir(
                        dadosContato.ID_Contato_Recomendante,
                        dadosContato.ID_Status_Contato,
                        dadosContato.ID_Tipo_Contato,
                        dadosContato.Cidade,
                        dadosContato.Email,
                        dadosContato.Estado_Civil,
                        DateTime.Now,
                        dadosContato.Filhos,
                        dadosContato.Idade,
                        dadosContato.Nome,
                        dadosContato.Outras_Informacoes,
                        dadosContato.Profissao,
                        dadosContato.Sexo,
                        dadosContato.Telefone_Alternativo_1,
                        dadosContato.Telefone_Alternativo_2,
                        dadosContato.Telefone_Principal,
                        dadosContato.UF),
                        Convert.ToInt32(new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString())),
                        DateTime.Now);

                    ExibeMensagemPopUp("Contato salvo com sucesso!");
                    LimparCampos();
                }
                catch (Exception ex)
                {
                    ExibeMensagemPopUp("Falha ao tentar salvar o contato. Tente novamente. Detalhes: " + ex.Message);
                }
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

        private void CarregaDadosCadastrais(int idContato)
        {
            try
            {
                //carrega os dados dos combos
                CarregarRecomendantes();
                CarregarStatus();
                CarregarTipos();

                //preenche os campos
                DataSet contatoCadastrado = new ContatoBD().Obter(idContato);

                DataRow DrContato = contatoCadastrado.Tables[0].Rows[0];
                DataCadastroLabel.Text = DrContato["Data_Cadastro"].ToString();
                RecomendanteDropDownList.SelectedValue = DrContato["ID_Contato_Recomendante"].ToString();
                nomeCompletoTextBox.Text = DrContato["Nome"].ToString();
                StatusDropDownList.SelectedValue = DrContato["ID_Status_Contato"].ToString();
                DDDTelefoneTextBox.Text = DrContato["Telefone_Principal"].ToString().Substring(1, 2);
                TelefoneTextBox.Text = DrContato["Telefone_Principal"].ToString().Substring(4);
                SexoRadioButtonList.SelectedValue = DrContato["Sexo"].ToString();
                outrasInformacoesTextBox.Text = DrContato["Outras_Informacoes"].ToString();
                idadeTextBox.Text = DrContato["Idade"].ToString();
                profissaoTextBox.Text = DrContato["Profissao"].ToString();
                EstadoCivilDropDownList.SelectedValue = DrContato["Estado_Civil"].ToString();
                filhosTextBox.Text = DrContato["Filhos"].ToString();
                TipoDropDownList.SelectedValue = DrContato["ID_Tipo_Contato"].ToString();
                UFDropDownList.SelectedValue = DrContato["UF"].ToString();
                cidadeTextBox.Text = DrContato["Cidade"].ToString();
                emailTextBox.Text = DrContato["Email"].ToString();
                DDDtelefoneAlternativo1TextBox.Text = DrContato["Telefone_Alternativo_1"].ToString().Substring(1, 2);
                telefoneAlternativo1TextBox.Text = DrContato["Telefone_Alternativo_1"].ToString().Substring(4);
                DDDtelefoneAlternativo2TextBox.Text = DrContato["Telefone_Alternativo_2"].ToString().Substring(1, 2);
                telefoneAlternativo2TextBox.Text = DrContato["Telefone_Alternativo_2"].ToString().Substring(4);

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

            dados.ID_Contato_Recomendante = Convert.ToInt32(RecomendanteDropDownList.SelectedItem.Value);
            dados.ID_Status_Contato = Convert.ToInt32(StatusDropDownList.SelectedItem.Value);
            dados.Nome = nomeCompletoTextBox.Text;
            dados.Sexo = Convert.ToChar(SexoRadioButtonList.SelectedItem.Value);

            if (!string.IsNullOrEmpty(TipoDropDownList.SelectedItem.Value))
                dados.ID_Tipo_Contato = Convert.ToInt32(TipoDropDownList.SelectedItem.Value);
            dados.ID_Tipo_Contato = 1;

            if (!string.IsNullOrEmpty(cidadeTextBox.Text))
                dados.Cidade = cidadeTextBox.Text;
            dados.Cidade = string.Empty;

            if (!string.IsNullOrEmpty(emailTextBox.Text))
                dados.Email = emailTextBox.Text;
            dados.Email = string.Empty;

            if (!string.IsNullOrEmpty(EstadoCivilDropDownList.SelectedItem.Text))
                dados.Estado_Civil = EstadoCivilDropDownList.SelectedItem.Text;
            dados.Estado_Civil = string.Empty;

            if (!string.IsNullOrEmpty(filhosTextBox.Text))
                dados.Filhos = Convert.ToInt32(filhosTextBox.Text);

            if (!string.IsNullOrEmpty(idadeTextBox.Text))
                dados.Idade = Convert.ToInt32(idadeTextBox.Text);

            if (!string.IsNullOrEmpty(outrasInformacoesTextBox.Text))
                dados.Outras_Informacoes = outrasInformacoesTextBox.Text;
            dados.Outras_Informacoes = string.Empty;

            if (!string.IsNullOrEmpty(profissaoTextBox.Text))
                dados.Profissao = profissaoTextBox.Text;
            dados.Profissao = string.Empty;

            if (!string.IsNullOrEmpty(DDDtelefoneAlternativo1TextBox.Text))
                dados.Telefone_Alternativo_1 = "(" + DDDtelefoneAlternativo1TextBox.Text + ") " + telefoneAlternativo1TextBox.Text;
            dados.Telefone_Alternativo_1 = string.Empty;

            if (!string.IsNullOrEmpty(DDDtelefoneAlternativo2TextBox.Text))
                dados.Telefone_Alternativo_2 = "(" + DDDtelefoneAlternativo2TextBox.Text + ") " + telefoneAlternativo2TextBox.Text;
            dados.Telefone_Alternativo_2 = string.Empty;

            if (!string.IsNullOrEmpty(DDDTelefoneTextBox.Text))
                dados.Telefone_Principal = "(" + DDDTelefoneTextBox.Text + ") " + TelefoneTextBox.Text;
            dados.Telefone_Principal = string.Empty;

            if (!string.IsNullOrEmpty(UFDropDownList.SelectedItem.Value))
                dados.UF = UFDropDownList.SelectedItem.Value;
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
                cidadeTextBox.Text =
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
                profissaoTextBox.Text =
                RecomendanteDropDownList.SelectedValue =
                StatusDropDownList.SelectedValue =
                EstadoCivilDropDownList.SelectedValue =
                TipoDropDownList.SelectedValue =
                UFDropDownList.SelectedValue = string.Empty;
            SexoRadioButtonList.SelectedValue = "M";
        }
    }
}
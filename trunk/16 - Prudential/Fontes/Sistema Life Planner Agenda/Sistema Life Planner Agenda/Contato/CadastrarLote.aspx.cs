using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI.WebControls;
using Sistema_Life_Planner_Agenda.BD;
using Sistema_Life_Planner_Agenda.Classes;

namespace Sistema_Life_Planner_Agenda.Contato
{
    public partial class CadastrarLote : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ValidaUserLogado();
                CarregarRecomendantes();
            }
        }

        protected void cancelarButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("PesquisarContato.aspx");

        }

        protected void salvarButton_Click(object sender, EventArgs e)
        {
            List<string> contatosDuplicados = new List<string>();
            try
            {
                foreach (var item in PreparaListaContatos())
                {
                    string idUsuario = new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString());
                    DataSet NomeContatoExistente = new ContatoBD().PesquisaContatoPeloTelefone(idUsuario, item.Telefone_Principal);

                    if (NomeContatoExistente.Tables[0].Rows.Count > 0)
                    {
                        contatosDuplicados.Add("Novo Contato: " + item.Nome.ToUpper() + " - Contato Existente: " + NomeContatoExistente.Tables[0].Rows[0]["Nome"].ToString().ToUpper());
                    }

                    int novoContatoID = new ContatoBD().IncluirLote(
                       item.Nome,
                       item.Outras_Informacoes,
                       item.Sexo,
                       item.Telefone_Principal);

                    new ContatosUsuarioBD().Incluir(
                        novoContatoID,
                        Convert.ToInt32(new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString())),
                        DateTime.Now);

                    new RecomendanteContatoBD().Incluir(
                        novoContatoID,
                        item.ID_Contato_Recomendante);
                }

                if (contatosDuplicados.Count.Equals(0))
                {
                    ExibeMensagemPopUp("Contatos Salvos com Sucesso!");
                }
                else
                {
                    ExibeMensagemPopUp("Contatos Salvos com Sucesso! " +
                        "\\nAtenção! O(s) contato(s) a seguir foi(ram) salvo(s) com o(s) telefone(s) duplicado(s) por algum(ns) de seus contatos já cadastrados: \\n " +
                        ListaNomesString(contatosDuplicados));
                }
                LimparCampos();
            }
            catch (Exception ex)
            {
                ExibeMensagemPopUp("Erro interno ao tentar cadastrar o lote de contatos. Verifique os dados e tente novamente mais tarde. Detalhes: " + ex.Message);
            }

        }

        /// <summary>
        /// transforma uma lista de nomes em string separados por ponto e vírgula
        /// </summary>
        /// <param name="nomes"></param>
        /// <returns></returns>
        private string ListaNomesString(List<string> nomes)
        {
            string nomesRetorno = string.Empty;
            foreach (var nome in nomes)
            {
                nomesRetorno += nome + "; \\n ";
            }
            return nomesRetorno;
        }

        /// <summary>
        /// Carrega o dropdown de recomendantes
        /// </summary>
        private void CarregarRecomendantes()
        {
            RecomendanteDropDownList.DataSource = new ContatoBD().Listar(Convert.ToInt32(new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString())));
            RecomendanteDropDownList.DataTextField = "Nome";
            RecomendanteDropDownList.DataValueField = "Id";
            RecomendanteDropDownList.DataBind();

            ListItem selecione = new ListItem("< Selecione >", "");
            RecomendanteDropDownList.Items.Insert(0, selecione);

            //A CARGA INICIAL DO SISTEMA DEVE TER O CONTATO DE ID 1 QUE É UMA REFERENCIA AO PRÓPRIO USUÁRIO LOGADO
            ListItem usuarioLogado = new ListItem(Session["nomeUsuarioLogado"].ToString() + " (EU)", new ContatoBD().ObterID(Session["nomeUsuarioLogado"].ToString(), Session["emailUsuarioLogado"].ToString()).ToString());
            RecomendanteDropDownList.Items.Insert(1, usuarioLogado);
        }

        /// <summary>
        /// Prepara a lista de contatos preenchidos
        /// </summary>
        /// <returns></returns>
        private List<Contato> PreparaListaContatos()
        {
            List<Contato> loteContatos = new List<Contato>();
            for (int i = 1; i < 11; i++)
            {
                TextBox txt = (TextBox)FindControl("ctl00$ContentPlaceHolder1$NomeTextBox" + i);
                if (!string.IsNullOrEmpty(txt.Text))
                {
                    //cria os controles
                    TextBox txtOutInfo = (TextBox)FindControl("ctl00$ContentPlaceHolder1$OutrasInfoTextBox" + i);
                    TextBox txtDDD = (TextBox)FindControl("ctl00$ContentPlaceHolder1$DDDTelefoneTextBox" + i);
                    TextBox txtTel = (TextBox)FindControl("ctl00$ContentPlaceHolder1$TelefoneTextBox" + i);
                    RadioButtonList rdlSexo = (RadioButtonList)FindControl("ctl00$ContentPlaceHolder1$SexoRadioButtonList" + i);

                    Contato cnt = new Contato();
                    cnt.Data_Cadastro = DateTime.Now;
                    cnt.Nome = txt.Text;
                    cnt.ID_Contato_Recomendante = Convert.ToInt32(RecomendanteDropDownList.SelectedItem.Value);
                    cnt.Outras_Informacoes = txtOutInfo.Text;
                    cnt.Sexo = Convert.ToChar(rdlSexo.SelectedItem.Value);
                    cnt.Telefone_Principal = txtDDD.Text + txtTel.Text;

                    loteContatos.Add(cnt);
                }
            }

            return loteContatos;
        }

        private void LimparCampos()
        {
            RecomendanteDropDownList.SelectedItem.Value = "";
            for (int i = 1; i < 11; i++)
            {
                TextBox txt = (TextBox)FindControl("ctl00$ContentPlaceHolder1$NomeTextBox" + i);
                TextBox txtOutInfo = (TextBox)FindControl("ctl00$ContentPlaceHolder1$OutrasInfoTextBox" + i);
                TextBox txtDDD = (TextBox)FindControl("ctl00$ContentPlaceHolder1$DDDTelefoneTextBox" + i);
                TextBox txtTel = (TextBox)FindControl("ctl00$ContentPlaceHolder1$TelefoneTextBox" + i);
                RadioButtonList rdlSexo = (RadioButtonList)FindControl("ctl00$ContentPlaceHolder1$SexoRadioButtonList" + i);
                txt.Text = string.Empty;
                txtOutInfo.Text = string.Empty;
                rdlSexo.SelectedIndex = 0;
                txtDDD.Text = txtTel.Text = string.Empty;
            }

            CarregarRecomendantes();
        }
    }
}
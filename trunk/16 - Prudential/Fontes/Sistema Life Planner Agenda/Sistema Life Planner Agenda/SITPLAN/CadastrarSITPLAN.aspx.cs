using System;
using System.Web.UI.WebControls;
using Sistema_Life_Planner_Agenda.BD;
using Sistema_Life_Planner_Agenda.Classes;
using System.Data;
using System.Collections.Generic;

namespace Sistema_Life_Planner_Agenda.SITPLAN
{
    public partial class CadastrarSITPLAN : PageBase
    {
        private SortDirection gridSortDirection
        {
            get
            {
                // Initial state is Ascending
                if (ViewState["GridSortDirection"] == null)
                {
                    ViewState["GridSortDirection"] = SortDirection.Ascending;
                }
                // Return the state
                return (SortDirection)ViewState["GridSortDirection"];
            }
            set
            {
                ViewState["GridSortDirection"] = value;
            }
        }
        private string gridSortExpression
        {
            get
            {
                //Ordenação padrão inicial
                if (ViewState["GridSortExpression"] == null)
                {
                    ViewState["GridSortExpression"] = "Nome";
                }
                // Return the sort expression
                return (string)ViewState["GridSortExpression"];
            }
            set
            {
                ViewState["GridSortExpression"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidaUserLogado();
            if (!IsPostBack)
            {
                CarregarRecomendantes();
                CarregarStatus();
            }
        }

        protected void pesquisarButton_Click(object sender, EventArgs e)
        {
            if (ValidarIntervaloDatas(PeriodoDeTextBox.Text, PeriodoAteTextBox.Text))
            {
                CarregarGridView();
            }
            else
            {
                ExibeMensagemPopUp("Data DE deve ser menor que a data ATÉ. Verifique os dados e tente novamente.");
            }
        }

        protected void limparButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("CadastrarSITPLAN.aspx");
        }

        protected void SalvarButton_Click(object sender, EventArgs e)
        {
            if (ValidaItensChecados())
            {
                try
                {
                    int idSitPlan = SalvarSITPLAN();
                    Response.Redirect("ExecutarSITPLAN.aspx?idSitPlan=" + idSitPlan);
                }
                catch (Exception ex)
                {
                    ExibeMensagemPopUp("Erro ao salvar e executar o SITPLAN. Verifique os dados e tente novamente. Detalhes: " + ex.Message);
                }
            }
            else
            {
                ExibeMensagemPopUp("Selecione pelo menos um contato para salvar e iniciar o SITPLAN");
            }
        }

        /// <summary>
        /// Carrega os status de contato
        /// </summary>
        private void CarregarStatus()
        {
            StatusDropDownList.DataSource = new StatusContatoBD().Listar();
            StatusDropDownList.DataTextField = "Status";
            StatusDropDownList.DataValueField = "Id";
            StatusDropDownList.DataBind();

            ListItem selecione = new ListItem("< Todos >", "");
            StatusDropDownList.Items.Insert(0, selecione);
        }

        /// <summary>
        /// Carrega a lista de recomendantes
        /// </summary>
        private void CarregarRecomendantes()
        {
            try
            {
                RecomendanteDropDownList.DataSource = new ContatoBD().Listar(Convert.ToInt32(new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString())));
                RecomendanteDropDownList.DataTextField = "Nome";
                RecomendanteDropDownList.DataValueField = "Id";
                RecomendanteDropDownList.DataBind();

                ListItem selecione = new ListItem("< Todos >", "");
                RecomendanteDropDownList.Items.Insert(0, selecione);

                ListItem usuarioLogado = new ListItem(Session["nomeUsuarioLogado"].ToString() + " (EU)", new ContatoBD().ObterID(Session["nomeUsuarioLogado"].ToString(), Session["emailUsuarioLogado"].ToString()).ToString());
                RecomendanteDropDownList.Items.Insert(1, usuarioLogado);
            }
            catch (Exception)
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        /// <summary>
        /// Carrega o grid de pesquisa a partir dos filtros selecionados
        /// </summary>
        private void CarregarGridView()
        {
            string idRecomendante = string.Empty, idStatus = string.Empty, sexo = string.Empty, dataDe = string.Empty, dataAte = string.Empty;


            if (!string.IsNullOrEmpty(RecomendanteDropDownList.SelectedItem.Value))
            {
                idRecomendante = RecomendanteDropDownList.SelectedItem.Value.ToString();
            }
            if (!string.IsNullOrEmpty(StatusDropDownList.SelectedItem.Value))
            {
                idStatus = StatusDropDownList.SelectedItem.Value.ToString();
            }
            if (!string.IsNullOrEmpty(SexoDropDownList.SelectedItem.Value))
            {
                sexo = SexoDropDownList.SelectedItem.Value.ToString();
            }
            if (!string.IsNullOrEmpty(PeriodoDeTextBox.Text))
            {
                dataDe = PeriodoDeTextBox.Text;
            }
            else
            {
                dataDe = "01/01/1900";
            }
            if (!string.IsNullOrEmpty(PeriodoAteTextBox.Text))
            {
                dataAte = PeriodoAteTextBox.Text;
            }
            else
            {
                dataAte = "01/01/2100";
            }

            ContatosGridView.DataSource = ViewState["ContatosSITPLANDataSet"] = new ContatoBD().Listar(
                idRecomendante,
                idStatus,
                Convert.ToDateTime(dataDe),
                Convert.ToDateTime(dataAte),
                sexo,
                Convert.ToInt32(new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString())));
            ContatosGridView.DataBind();
        }

        #region Eventos do GridView

        /// <summary>
        /// Exclui ou altera um registro no grid
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ContatosGridView_Click(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Visualizar")
                {
                    // o ",false" é para suprimir a chamada interna para "Response.End"
                    Response.Redirect("CadastrarContato.aspx?idContato=" + Convert.ToString(e.CommandArgument) + "?Modo=read", false);//TODO: modo leitura do cadastro de contato
                }
            }
            catch (Exception ex)
            {
                ExibeMensagemPopUp("Erro interno. Tente novamente mais tarde. Detalhes: " + ex.Message);
            }
        }

        /// <summary>
        /// Paginação do GridView
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ContatosGridView_PageIndexChanging(Object sender, GridViewPageEventArgs e)
        {
            ContatosGridView.PageIndex = e.NewPageIndex;
            ContatosGridView.DataSource = (DataSet)ViewState["ContatosSITPLANDataSet"];
            ContatosGridView.DataBind();
        }

        protected void ContatosGridView_Sorting(object sender, GridViewSortEventArgs e)
        {
            // Retrieve the name of the clicked column (sort expression)
            string sortExpression = e.SortExpression;
            // Decide and save the new sort direction
            if (sortExpression == gridSortExpression)
            {
                if (gridSortDirection == SortDirection.Ascending)
                {
                    gridSortDirection = SortDirection.Descending;
                }
                else
                {
                    gridSortDirection = SortDirection.Ascending;
                }
            }
            else
            {
                gridSortDirection = SortDirection.Ascending;
            }
            // Save the new sort expression
            gridSortExpression = sortExpression;
            // Rebind the grid to its data source
            BindGrid();
        }

        /// <summary>
        /// Rebinda o grid ordenado.
        /// </summary>
        private void BindGrid()
        {
            // Define data objects
            DataSet dataSet = new DataSet();

            if (ViewState["ContatosSITPLANDataSet"] == null)
            {
                dataSet = new ContatoBD().Listar(Convert.ToInt32(new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString())));
                // Store the DataSet in view state
                ViewState["ContatosSITPLANDataSet"] = dataSet;
            }
            else
            {
                dataSet = (DataSet)ViewState["ContatosSITPLANDataSet"];
            }
            // Prepare the sort expression using the gridSortDirection and
            // gridSortExpression properties
            string sortExpression;
            if (gridSortDirection == SortDirection.Ascending)
            {
                sortExpression = gridSortExpression + " ASC";
            }
            else
            {
                sortExpression = gridSortExpression + " DESC";
            }
            // Sort the data
            dataSet.Tables[0].DefaultView.Sort = sortExpression;
            // Bind the grid to the DataSet
            ContatosGridView.DataSource =
            dataSet.Tables[0].DefaultView;
            ContatosGridView.DataBind();
        }

        #endregion

        private int SalvarSITPLAN()
        {
            DateTime dataInicio = DateTime.Now;
            Guid chave = Guid.NewGuid();
            new SitPlanBD().Incluir(
                new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString()),
                dataInicio,
                "Iniciado", 
                chave.ToString(), 
                NomeSitPlanTextBox.Text);

            int idSITPLAN = new SitPlanBD().ObterID(new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString()),
                "Iniciado", 
                chave.ToString());


            List<string> listaContatos = new List<string>();
            DataSet ds = (DataSet)ViewState["ContatosSITPLANDataSet"];
            for (int i = 0; i < ContatosGridView.Rows.Count; i++)
            {
                CheckBox cb = (CheckBox)ContatosGridView.Rows[i].FindControl("IncluirContatoCheckBox");
                if (cb.Checked)
                {
                    listaContatos.Add(ds.Tables[0].Rows[i]["ID"].ToString());                    
                }
            }

            AssociarContatosSITPLAN(listaContatos, idSITPLAN);
            return idSITPLAN;
        }

        /// <summary>
        /// Verifica se pelo menos um contato foi selecionado
        /// </summary>
        /// <returns></returns>
        private bool ValidaItensChecados()
        {
            bool retorno = false;
            for (int i = 0; i < ContatosGridView.Rows.Count; i++)
            {
                CheckBox cb = (CheckBox)ContatosGridView.Rows[i].FindControl("IncluirContatoCheckBox");
                if (cb.Checked)
                {
                    i = ContatosGridView.Rows.Count;
                    retorno = true;
                }
            }
            return retorno;
        }

        private void AssociarContatosSITPLAN(List<string> idsContatos, int idSITPLAN)
        {
            foreach (var contato in idsContatos)
            {
                new ContatosSitPlanBD().Incluir(
                    Convert.ToInt32(contato),
                    idSITPLAN, new ContatoBD().ObtemIDStatus(Convert.ToInt32(contato)));               
            }
        }
    }
}
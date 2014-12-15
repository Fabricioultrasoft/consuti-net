using System;
using System.Data;
using System.Web.UI.WebControls;
using Sistema_Life_Planner_Agenda.BD;
using Sistema_Life_Planner_Agenda.Classes;

namespace Sistema_Life_Planner_Agenda.Agenda
{
    public partial class PesquisarAgenda : PageBase
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
                    ViewState["GridSortExpression"] = "Data";
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
            if (!IsPostBack)
            {
                ValidaUserLogado();
                CarregarContatos();
                PeriodoDeTextBox.Text = DateTime.Now.Date.ToShortDateString();
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
            Response.Redirect("PesquisarAgenda.aspx");
        }

        protected void novoButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("CadastrarAgenda.aspx");
        }

        /// <summary>
        /// Carrega a lista de recomendantes
        /// </summary>
        private void CarregarContatos()
        {
            try
            {
                ContatoDropDownList.DataSource = new ContatoBD().Listar(Convert.ToInt32(new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString())));
                ContatoDropDownList.DataTextField = "Nome";
                ContatoDropDownList.DataValueField = "Id";
                ContatoDropDownList.DataBind();

                ListItem selecione = new ListItem("< Todos >", "");
                ContatoDropDownList.Items.Insert(0, selecione);

                //Se tiver a opção do próprio usuário
                //ListItem usuarioLogado = new ListItem(Session["nomeUsuarioLogado"].ToString() + " (EU)", new ContatoBD().ObterID(Session["nomeUsuarioLogado"].ToString(), Session["emailUsuarioLogado"].ToString()).ToString());
                //ContatoDropDownList.Items.Insert(1, usuarioLogado);
            }
            catch (Exception)
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        /// <summary>
        /// Carrega os dados da pesquisa
        /// </summary>
        private void CarregarGridView()
        {
            string idContato = string.Empty;
            if (!string.IsNullOrEmpty(ContatoDropDownList.SelectedItem.Value))
            {
                idContato = ContatoDropDownList.SelectedItem.Value.ToString();
            }

            string dataDe = string.Empty, dataAte = string.Empty;

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

            AgendaGridView.DataSource = ViewState["AgendaDataSet"] = new AgendaBD().Listar(
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
                    Response.Redirect("CadastrarAgenda.aspx?idAgenda=" + Convert.ToString(e.CommandArgument), false);
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
        protected void AgendaGridView_PageIndexChanging(Object sender, GridViewPageEventArgs e)
        {
            AgendaGridView.PageIndex = e.NewPageIndex;
            AgendaGridView.DataSource = (DataSet)ViewState["AgendaDataSet"];
            AgendaGridView.DataBind();
        }

        protected void AgendaGridView_Sorting(object sender, GridViewSortEventArgs e)
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

            if (ViewState["AgendaDataSet"] == null)
            {
                string idContato = string.Empty;
                if (!string.IsNullOrEmpty(ContatoDropDownList.SelectedItem.Value))
                {
                    idContato = ContatoDropDownList.SelectedItem.Value.ToString();
                }

                string dataDe = string.Empty, dataAte = string.Empty;

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

                dataSet = new AgendaBD().Listar(
                    idContato,
                    Convert.ToDateTime(dataDe),
                    Convert.ToDateTime(dataAte),
                    Convert.ToInt32(new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString())));
                // Store the DataSet in view state
                ViewState["AgendaDataSet"] = dataSet;
            }
            else
            {
                dataSet = (DataSet)ViewState["AgendaDataSet"];
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
            AgendaGridView.DataSource =
            dataSet.Tables[0].DefaultView;
            AgendaGridView.DataBind();
        }

        #endregion
    }
}
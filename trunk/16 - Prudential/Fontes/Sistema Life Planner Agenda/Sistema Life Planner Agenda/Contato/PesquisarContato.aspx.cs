using System;
using System.Data;
using System.Web.UI.WebControls;
using Sistema_Life_Planner_Agenda.BD;
using Sistema_Life_Planner_Agenda.Classes;

namespace Sistema_Life_Planner_Agenda.Contato
{
    public partial class PesquisarContato : PageBase
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
                // Initial sort expression is DepartmentID
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
            if (!IsPostBack)
            {
                ValidaUserLogado();
                CarregarRecomendantes();
            }
        }

        protected void pesquisarButton_Click(object sender, EventArgs e)
        {
            PesquisarContatos();
        }

        protected void limparButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("PesquisarContato.aspx");
        }

        protected void novoButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("CadastrarContato.aspx");
        }

        protected void loteButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("CadastrarLote.aspx");
        }

        private void PesquisarContatos()
        {
            string idRecomendante = string.Empty;

            if (!string.IsNullOrEmpty(RecomendanteDropDownList.SelectedItem.Value))
            {
                idRecomendante = RecomendanteDropDownList.SelectedItem.Value.ToString();
            }

            ContatosGridView.DataSource = new ContatoBD().Listar(
                nomeTextBox.Text,
                idRecomendante,
                TelefoneTextBox.Text,
                Convert.ToInt32(new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString())));
            ContatosGridView.DataBind();
        }

        private void CarregarRecomendantes()
        {
            try
            {
                RecomendanteDropDownList.DataSource = new ContatoBD().Listar(Convert.ToInt32(new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString())));
                RecomendanteDropDownList.DataTextField = "Nome";
                RecomendanteDropDownList.DataValueField = "Id";
                RecomendanteDropDownList.DataBind();

                ListItem selecione = new ListItem("<Selecione>", "");
                RecomendanteDropDownList.Items.Insert(0, selecione);

                ListItem usuarioLogado = new ListItem(Session["nomeUsuarioLogado"].ToString() + " (EU)", "1");
                RecomendanteDropDownList.Items.Insert(1, usuarioLogado);
            }
            catch (Exception)
            {
                Response.Redirect("~/Login.aspx");
            }
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
                if (e.CommandName == "Excluir")
                {
                    ContatoBD contato = new ContatoBD();
                    contato.Excluir(Convert.ToInt32(e.CommandArgument));
                    ExibeMensagemPopUp("Contato removido com sucesso!");
                    CarregarGridView();
                }
                else if (e.CommandName == "Alterar")
                {
                    // o ",false" é para suprimir a chamada interna para "Response.End"
                    Response.Redirect("CadastrarContato.aspx?id=" + Convert.ToString(e.CommandArgument), false);
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
            ContatosGridView.DataSource = (DataSet)ViewState["ContatosDataSet"];
            ContatosGridView.DataBind();

        }

        /// <summary>
        /// Carregar o grid com os contatos cadastrados
        /// </summary>
        private void CarregarGridView()
        {
            ContatoBD contatos = new ContatoBD();
            ContatosGridView.DataSource = ViewState["ContatosDataSet"] = contatos.Listar(Convert.ToInt32(new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString())));
            ContatosGridView.DataBind();
            contatos.Dispose();
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

            if (ViewState["ContatosDataSet"] == null)
            {
                dataSet = new ContatoBD().Listar(Convert.ToInt32(new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString())));
                // Store the DataSet in view state
                ViewState["ContatosDataSet"] = dataSet;
            }
            else
            {
                dataSet = (DataSet)ViewState["ContatosDataSet"];
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

    }
}
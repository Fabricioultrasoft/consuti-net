using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sistema_Life_Planner_Agenda.Classes;
using Sistema_Life_Planner_Agenda.BD;
using System.Data;

namespace Sistema_Life_Planner_Agenda.SITPLAN
{
    public partial class PesquisarSITPLAN : PageBase
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
            ValidaUserLogado();
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
            Response.Redirect("PesquisarSITPLAN.aspx");
        }

        protected void novoButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("CadastrarSITPLAN.aspx");
        }

        /// <summary>
        /// Carrega o grid de pesquisa a partir dos filtros selecionados
        /// </summary>
        private void CarregarGridView()
        {
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

            DataSet ds = new SitPlanBD().Listar(
                Convert.ToDateTime(dataDe),
                Convert.ToDateTime(dataAte),
                Convert.ToInt32(new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString())),
                NomeSitPlanTextBox.Text);

            if (ds.Tables[0].Rows.Count > 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                if (dr["TotalContatos"].ToString().Equals("0"))
                {
                    ds.Tables[0].Rows[0].Delete();
                }
            }

            SITPLANGridView.DataSource = ViewState["SITPLANDataSet"] = ds;
            SITPLANGridView.DataBind();
        }

        #region Eventos do GridView

        /// <summary>
        /// Exclui ou altera um registro no grid
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SITPLANGridView_Click(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Reiniciar")
                {
                    new SitPlanBD().AtualizarStatus(
                        "Reiniciado",
                        Convert.ToInt32(e.CommandArgument),
                        Convert.ToInt32(new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString())));

                    // o ",false" é para suprimir a chamada interna para "Response.End"
                    Response.Redirect("ExecutarSITPLAN.aspx?idSitPlan=" + Convert.ToString(e.CommandArgument));
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
        protected void SITPLANGridView_PageIndexChanging(Object sender, GridViewPageEventArgs e)
        {
            SITPLANGridView.PageIndex = e.NewPageIndex;
            SITPLANGridView.DataSource = (DataSet)ViewState["SITPLANDataSet"];
            SITPLANGridView.DataBind();
        }

        protected void SITPLANGridView_Sorting(object sender, GridViewSortEventArgs e)
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

            if (ViewState["SITPLANDataSet"] == null)
            {
                dataSet = new ContatoBD().Listar(Convert.ToInt32(new UsuarioBD().ObterID(Session["emailUsuarioLogado"].ToString())));
                // Store the DataSet in view state
                ViewState["SITPLANDataSet"] = dataSet;
            }
            else
            {
                dataSet = (DataSet)ViewState["SITPLANDataSet"];
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
            SITPLANGridView.DataSource =
            dataSet.Tables[0].DefaultView;
            SITPLANGridView.DataBind();
        }

        #endregion
    }
}
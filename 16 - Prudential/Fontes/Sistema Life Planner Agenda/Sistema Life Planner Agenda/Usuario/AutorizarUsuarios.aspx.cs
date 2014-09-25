using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sistema_Life_Planner_Agenda.BD;
using Sistema_Life_Planner_Agenda.Classes;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Sistema_Life_Planner_Agenda.Usuario
{
    public partial class AutorizarUsuarios : PageBase
    {
        /// <summary>
        /// Carrega a página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["email"]))
                {
                    DataRow user = new UsuariosAutorizadosBD().ObterUsuario(Request.QueryString["email"]);
                    emailTextBox.Text = user["Email"].ToString();
                    AdminCheckBox.Checked = Convert.ToBoolean(user["Admin"]);
                    emailTextBox.Enabled = false;
                }
                CarregarGridView();
            }
        }

        /// <summary>
        /// Inclui ou altera um registro
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void IncluirButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request.QueryString["email"]))
                {
                    new UsuariosAutorizadosBD().Atualizar(Convert.ToInt32(AdminCheckBox.Checked),
                        Request.QueryString["email"].ToString());
                    CarregarGridView();
                    ExibeMensagemPopUp("E-mail " + emailTextBox.Text + " atualizado com sucesso!");
                }
                else
                {
                    new UsuariosAutorizadosBD().Incluir(Convert.ToInt32(AdminCheckBox.Checked), emailTextBox.Text);
                    CarregarGridView();
                    ExibeMensagemPopUp("E-mail " + emailTextBox.Text + " autorizado com sucesso!");
                }

            }
            catch (MySql.Data.MySqlClient.MySqlException ex)
            {
                if (ex.Message.Contains("Duplicate"))
                {
                    ExibeMensagemPopUp("E-mail " + emailTextBox.Text + " já foi autorizado no sistema.");
                }
            }
            catch (Exception ex)
            {
                ExibeMensagemPopUp("Não foi possível concluir a operação. Detalhes do erro: " + ex.Message);
            }
            finally
            {
                LimparCampos();
            }
        }

        /// <summary>
        /// Limpa os campos da tela
        /// </summary>
        private void LimparCampos()
        {
            emailTextBox.Text = string.Empty;
            AdminCheckBox.Checked = false;
        }

        #region Eventos do GridView

        /// <summary>
        /// Exclui ou altera um registro no grid
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void UsuariosAutorizadosGridView_Click(object sender, GridViewCommandEventArgs e)
        {
            UsuariosAutorizadosBD usuario = new UsuariosAutorizadosBD();
            try
            {
                if (e.CommandName == "Excluir")
                {
                    usuario.Excluir(Convert.ToString(e.CommandArgument));
                    ExibeMensagemPopUp("E-mail removido com sucesso!");
                    CarregarGridView();
                }
                else if (e.CommandName == "Alterar")
                {
                    // o ",false" é para suprimir a chamada interna para "Response.End"
                    Response.Redirect("AutorizarUsuarios.aspx?email=" + Convert.ToString(e.CommandArgument), false);
                }
            }
            catch (Exception)
            {
                ExibeMensagemPopUp("Erro CODIGO 03!" +
                              " Verifique se o Sistema não possui nenhuma Demanda cadastrada e" +
                              " tente novamente mais tarde.");
            }
        }

        /// <summary>
        /// Paginação do GridView
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void UsuariosAutorizadosGridView_PageIndexChanging(Object sender, GridViewPageEventArgs e)
        {
            UsuariosAutorizadosGridView.PageIndex = e.NewPageIndex;
            UsuariosAutorizadosGridView.DataBind();

        }

        /// <summary>
        /// Carregar o grid com os sistemas cadastrados
        /// </summary>
        private void CarregarGridView()
        {
            UsuariosAutorizadosBD usuarios = new UsuariosAutorizadosBD();
            UsuariosAutorizadosGridView.DataSource = usuarios.Listar();
            UsuariosAutorizadosGridView.DataBind();
            usuarios.Dispose();
        }


        protected void UsuariosAutorizadosGridView_Sorting(object sender, GridViewSortEventArgs e)
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
                    ViewState["GridSortExpression"] = "Email";
                }
                // Return the sort expression
                return (string)ViewState["GridSortExpression"];
            }
            set
            {
                ViewState["GridSortExpression"] = value;
            }
        }

        /// <summary>
        /// Rebinda o grid ordenado.
        /// </summary>
        private void BindGrid()
        {
            // Define data objects
            DataSet dataSet = new DataSet();
            
            if (ViewState["UsuariosAutorizadosDataSet"] == null)
            {
                dataSet = new UsuariosAutorizadosBD().Listar();
                // Store the DataSet in view state
                ViewState["UsuariosAutorizadosDataSet"] = dataSet;
            }
            else
            {
                dataSet = (DataSet)ViewState["UsuariosAutorizadosDataSet"];
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
            UsuariosAutorizadosGridView.DataSource =
            dataSet.Tables[0].DefaultView;
            UsuariosAutorizadosGridView.DataBind();
        }

        //TODO: TRATAR BUG DE PERDER A PAGINAÇÃO APÓS ORDENAÇÃO
        #endregion
    }
}
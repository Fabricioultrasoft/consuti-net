using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sistema_Life_Planner_Agenda.BD;
using Sistema_Life_Planner_Agenda.Classes;
using System.Data;

namespace Sistema_Life_Planner_Agenda.Usuario
{
    public partial class AutorizarUsuarios : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CarregarGridView();
        }

        protected void IncluirButton_Click(object sender, EventArgs e)
        {
            try
            {
                new UsuariosAutorizadosBD().Incluir(Convert.ToInt32(AdminCheckBox.Checked), emailTextBox.Text);
                CarregarGridView();
                ExibeMensagemPopUp("E-mail " + emailTextBox.Text + " autorizado com sucesso!");

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

        protected void UsuariosAutorizadosGridView_Click(object sender, GridViewCommandEventArgs e)
        {
            UsuariosAutorizadosBD usuario = new UsuariosAutorizadosBD();
            try
            {
                if (e.CommandName == "Excluir")
                {
                    usuario.Excluir(Convert.ToString(e.CommandArgument));
                    ExibeMensagemPopUp("E-mail removido com sucesso!");
                    //CarregarGridView();
                }
                else if (e.CommandName == "Alterar")
                {
                    // o ",false" é para suprimir a chamada interna para "Response.End"
                    Response.Redirect("CadSistema.aspx?idSist=" + Convert.ToString(e.CommandArgument), false);
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

        #region Eventos do GridView

        protected void UsuariosAutorizadosGridView_Sorting(object sender, GridViewSortEventArgs e)
        {

            //TODO: CONCLUIR A ORDENAÇÃO POR COLUNA

        }

        private string GetSortDirection(string column)
        {

            // By default, set the sort direction to ascending.
            string sortDirection = "ASC";

            // Retrieve the last column that was sorted.
            string sortExpression = ViewState["SortExpression"] as string;

            if (sortExpression != null)
            {
                // Check if the same column is being sorted.
                // Otherwise, the default value can be returned.
                if (sortExpression == column)
                {
                    string lastDirection = ViewState["SortDirection"] as string;
                    if ((lastDirection != null) && (lastDirection == "ASC"))
                    {
                        sortDirection = "DESC";
                    }
                }
            }

            // Save new values in ViewState.
            ViewState["SortDirection"] = sortDirection;
            ViewState["SortExpression"] = column;

            return sortDirection;
        }

       

        #endregion

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

        /// <summary>
        /// Limpa os campos da tela
        /// </summary>
        private void LimparCampos()
        {
            emailTextBox.Text = string.Empty;
            AdminCheckBox.Checked = false;
        }
    }
}
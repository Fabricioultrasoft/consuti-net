using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sistema_Life_Planner_Agenda.BD;
using Sistema_Life_Planner_Agenda.Classes;

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
                ExibeMensagemPopUp("E-mail " + emailTextBox.Text + " autorizado com sucesso!");

            }
            catch (Exception ex)
            {
                ExibeMensagemPopUp("Não foi possível concluir a operação. Detalhes do erro: " + ex.Message);
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
            //ManipSistema.Dispose();
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
    }
}
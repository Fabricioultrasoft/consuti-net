using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using testePMK.com.br.Banco;
using System.Data;

namespace testePMK.com.br.Adm.CategoriasProds
{
    public partial class AlterCatProd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Context.User.Identity.Name == "")
            {//se não houver usuário autenticado volta ao login                
                Session["msgLogin"] = "Efetue Login para acessar o sistema";
                Response.Redirect("~/LoginAdm.aspx");
            }

            if (!IsPostBack)
            {
                CarregaDdlCategorias();
            }
            if (ddlCategorias.SelectedValue == "")
            {
                pnlSelecione.Visible = true;
                pnlCont.Visible = false;
                Session["carregado"] = "false";

            }
            else if (ddlCategorias.SelectedValue != "")
            {
                pnlCont.Visible = true;
                pnlSelecione.Visible = false;
                if (Session["carregado"].ToString() == "false")
                {
                    carregaCampos(Convert.ToInt32(ddlCategorias.SelectedItem.Value));
                    Session["carregado"] = "true";
                }
            }

        }

        private void CarregaDdlCategorias()
        {
            bdCategoria carregaDdl = new bdCategoria();
            ddlCategorias.DataSource = carregaDdl.Listar();
            ddlCategorias.DataTextField = "NOME";
            ddlCategorias.DataValueField = "ID";
            ddlCategorias.DataBind();
            ListItem categoria = new ListItem("<Selecione uma Categoria>", "");
            ddlCategorias.Items.Insert(0, categoria);
            carregaDdl.Dispose();
        }


        /// <summary>
        /// altera os dados da categoria
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            bdCategoria atualizaCat = new bdCategoria();
            try
            {
                if (atualizaCat.ValidaExistencia(txbNomeCat.Text, Convert.ToInt32(ddlCategorias.SelectedItem.Value)) == true)
                {
                    atualizaCat.Alterar(
                        txbNomeCat.Text,
                        txbDescricao.Text,
                        Convert.ToInt32(ddlCategorias.SelectedItem.Value));
                    ExibeMensagemPopUp("Categoria alterada com sucesso!");
                    LimpaCampos();
                }
                else
                {
                    ExibeMensagemPopUp("Nome da categoria " + txbNomeCat.Text + " já existe. Altere o nome e tente novamente.");
                }
            }
            catch (Exception)
            {
                ExibeMensagemPopUp("Erro interno! Categoria não alterada. Verifique os dados e tente novamente. Caso o erro persista, procure o Administrador");
            }
            finally
            {
                atualizaCat.Dispose();
            }
        }

        protected void btnZerabann_Click(object sender, EventArgs e)
        {
            Response.Redirect("AlterCatProd.aspx");
        }

        /// <summary>
        /// exclui a categoria 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnExcluir_Click(object sender, EventArgs e)
        {
            bdCategoria excluiCat = new bdCategoria();
            try
            {
                excluiCat.Excluir(Convert.ToInt32(ddlCategorias.SelectedItem.Value));
                ExibeMensagemPopUp("Categoria excluída com sucesso!");

                LimpaCampos();
            }
            catch (Exception)
            {
                ExibeMensagemPopUp("Erro! Categoria não excluída. Verifique se existe algum produto que esta inserido nesta categoria, " +
                    "remova-o ou altere sua categoria e tent novamente.");
            }
            finally
            {
                excluiCat.Dispose();
            }
        }

        /// <summary>
        /// Exibe mensgem resultado
        /// </summary>
        /// <param name="mensagem">mensagem a ser exibida</param>
        private void ExibeMensagemPopUp(string mensagem)
        {
            ClientScript.RegisterStartupScript(
                            this.GetType(),
                            "arquivo",
                            "alert('" + mensagem + "');",
                            true);
        }

        /// <summary>
        /// carrega os dados da categoria selecionada
        /// </summary>
        /// <param name="idCategoria">id da categoria a ser carregada</param>
        private void carregaCampos(int idCategoria)
        {
            bdCategoria dadosCampos = new bdCategoria();

            DataSet carregaCampos = dadosCampos.Listar(idCategoria);
            DataRow dr = carregaCampos.Tables[0].Rows[0];

            txbDescricao.Text = dr["DESCRICAO"].ToString();
            txbNomeCat.Text = dr["NOME"].ToString();

            dadosCampos.Dispose();
        }

        /// <summary>
        /// Limpa os campos
        /// </summary>
        private void LimpaCampos()
        {
            CarregaDdlCategorias();
            ddlCategorias.SelectedValue = "";
            txbDescricao.Text = "";
            txbNomeCat.Text = "";
            pnlSelecione.Visible = true;
            pnlCont.Visible = false;
            Session["carregado"] = "false";
        }

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using testePMK.com.br.Banco;

namespace testePMK.com.br.Adm.CategoriasProds
{
    public partial class AddCategoria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Context.User.Identity.Name == "")
            {//se não houver usuário autenticado volta ao login                
                Session["msgLogin"] = "Efetue Login para acessar o sistema";
                Response.Redirect("~/LoginAdm.aspx");
            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            bdCategoria cadCategoria = new bdCategoria();
            try
            {
                if (cadCategoria.ValidaExistencia(txbNomeCat.Text, -1) == true)
                {
                    cadCategoria.Inserir(
                        txbNomeCat.Text,
                        txbDescricao.Text);
                    ExibeMensagemPopUp("Cadastro realizado com sucesso!");
                    LimpaCampos();
                }
                else
                {
                    ExibeMensagemPopUp("Nome da categoria " + txbNomeCat.Text + " já existe. Altere o nome e tente novamente.");
                }
            }
            catch (Exception)
            {
                ExibeMensagemPopUp("Erro interno! Cadastro não realizado. Tente novamente e se o erro persistir, contate o administrador");
            }
            finally
            {
                cadCategoria.Dispose();
            }
        }

        protected void btnZerabann_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddCategoria.aspx");
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

        private void LimpaCampos(){
            txbDescricao.Text = "";
            txbNomeCat.Text = "";
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using testePMK.com.br.Banco;
using System.Data;

namespace testePMK.com.br.Adm.Produtos
{
    public partial class EstoqueProds : System.Web.UI.Page
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
                CarregaDDL();
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (ddlProdutos.Items.Count > 1 && ddlProdutos.SelectedValue != "")
            {
                pnlSeleciona.Visible = false;
                pnlAltProd.Visible = true;

                //carrega dados do produto selecionado
                CarregaDadosProd(Convert.ToInt32(ddlProdutos.SelectedItem.Value));
            }

        }

        /// <summary>
        /// carrega o dropDown com os produtos do banco
        /// </summary>
        private void CarregaDDL()
        {
            BdProduto prods = new BdProduto();
            ddlProdutos.DataSource = prods.ListarTodos();
            ddlProdutos.DataTextField = "NOME";
            ddlProdutos.DataValueField = "ID";
            ddlProdutos.DataBind();
            prods.Dispose();
            ListItem SelectPrdo = new ListItem("<Selecione um Produto>", "");
            ddlProdutos.Items.Insert(0, SelectPrdo);
        }

        /// <summary>
        /// retorna ao inicio do fluxo de alteração de produto
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            LimparCampos();
            Response.Redirect("EstoqueProds.aspx");
        }

        /// <summary>
        /// Salva as alterações do estoque
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            BdProduto cadProduto = new BdProduto();

            try
            {
                cadProduto.AtualizarEstoque(Convert.ToInt32(txbQtdEstoque.Text), Convert.ToInt32(ddlProdutos.SelectedValue));
                ExibeMensagemPopUp("Estoque alterado com sucesso!");
            }
            catch (Exception)
            {
                ExibeMensagemPopUp("ERRO! Estoque não alterado. Verifique os dados e tente novamente mais tarde. " +
                    "Caso o problema persista, contate o Administrador.");
            }
            finally
            {
                cadProduto.Dispose();
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
        /// carrega a listagem de categorias disponível
        /// </summary>
        private void CarregaDdlCategorias()
        {
            bdCategoria carregaDdl = new bdCategoria();
            ddlCategoria.DataSource = carregaDdl.Listar();
            ddlCategoria.DataTextField = "NOME";
            ddlCategoria.DataValueField = "ID";
            ddlCategoria.DataBind();            
            carregaDdl.Dispose();
        }

        /// <summary>
        /// carrega os dados do banco para os campos na tela
        /// </summary>
        /// <param name="idProduto">id do produto a ser carregado</param>
        private void CarregaDadosProd(int idProduto)
        {
            BdProduto recDadosProd = new BdProduto();            
            try
            {
                //trazendo os dados
                DataSet dsProd = recDadosProd.ListarProduto(idProduto);
                DataRow drProd = dsProd.Tables[0].Rows[0];

                CarregaDdlCategorias();

                //inicializando os campos
                txbNomeProd.Text = drProd["NOME"].ToString();
                txbCodProd.Text = drProd["ID"].ToString();
                txbDescricao.Text = drProd["DESCRICAO"].ToString();
                TxbPreco.Text = drProd["PRECO_UNIDADE"].ToString();
                txbQtdEstoque.Text = drProd["QTD_ESTOQUE"].ToString();
                ddlCategoria.SelectedValue = drProd["ID_CATEGORIA"].ToString();
                txbPeso.Text = drProd["PESO"].ToString();
                txbDescricaoCompleta.Text = drProd["DESCRICAO_COMPLETA"].ToString();                
            }
            catch (Exception)
            {
                ExibeMensagemPopUp("Erro ao carregar dados do produto. Tente novamente e se o erro persistir contate o Administrador.");
            }
            finally
            {
                recDadosProd.Dispose();
            }
        }

        /// <summary>
        /// limpa os campos da tela
        /// </summary>
        private void LimparCampos()
        {
            CarregaDDL();
            pnlSeleciona.Visible = true;
            pnlAltProd.Visible = false;
        }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using testePMK.com.br.Banco;
using System.Data;

namespace testePMK.com.br
{
    public partial class listagemProdutos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CarregaProdutos(Convert.ToInt32(ddlOrdem.SelectedValue));
                Session["OrdemListagemProd"] = Convert.ToInt32(ddlOrdem.SelectedValue);
            }
            else if (Session["OrdemListagemProd"] != null && Convert.ToInt32(ddlOrdem.SelectedValue).ToString() != Session["OrdemListagemProd"])
            {
                CarregaProdutos(Convert.ToInt32(ddlOrdem.SelectedValue));
                Session["OrdemListagemProd"] = Convert.ToInt32(ddlOrdem.SelectedValue);
            }
        }

        private void CarregaProdutos(int idOrdem)
        {
            BdProduto carregaProds = new BdProduto();

            try
            {
                drProdutos.DataSource = carregaProds.ListarTodos(idOrdem);
                drProdutos.DataBind();
            }
            catch (Exception)
            {
                //nada
            }
            finally
            {
                carregaProds.Dispose();
            }
        }

        /// <summary>
        /// abre popUp com as imagens do produto
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void popUpImgs(string idProd)
        {
            //popup com as imagens
            string jscript = "";
            jscript += "<script language='JavaScript'>";
            jscript += "window.open('Adm/Produtos/ImagensProduto.aspx?idProd=" + idProd +
                                    "','','resizable=yes, menubar=no, scrollbars=yes, statusbar=yes, width=950, height=650, top=150, left=150')";
            jscript += "</script>";
            ClientScript.RegisterClientScriptBlock(GetType(), "cliente", jscript);
        }

        /// <summary>
        /// Abre popUp com o texto explicativo do sedex
        /// </summary>
        private void popUpSedex()
        {
            //popup com o texto explicativo de sedex
            string jscript = "";
            jscript += "<script language='JavaScript'>";
            jscript += "window.open('Sedex.aspx','','resizable=yes, menubar=no, scrollbars=yes, statusbar=yes, width=1050, height=650, top=50, left=150')";
            jscript += "</script>";
            ClientScript.RegisterClientScriptBlock(GetType(), "cliente", jscript);
        }

        /// <summary>
        /// abre popUp com o vídeos do produto
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void popUpVideo(string idProd)
        {
            //popup com o vídeo
            string jscript = "";
            jscript += "<script language='JavaScript'>";
            jscript += "window.open('Adm/Produtos/videoProduto.aspx?idProd=" + idProd +
                                    "','','resizable=no, menubar=no, scrollbars=no, statusbar=yes,  width=500, height=400, top=150, left=150')";
            jscript += "</script>";
            ClientScript.RegisterClientScriptBlock(GetType(), "cliente", jscript);
        }

        /// <summary>
        /// resolve os comandos do repeater
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        protected void drProdutos_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("verImgs"))
            {
                popUpImgs(Convert.ToString(e.CommandArgument));
            }
            else if (e.CommandName.Equals("verVideo"))
            {
                popUpVideo(Convert.ToString(e.CommandArgument));
            }
            else if (e.CommandName.Equals("Sedex"))
            {
                popUpSedex();
            }
        }
    }
}
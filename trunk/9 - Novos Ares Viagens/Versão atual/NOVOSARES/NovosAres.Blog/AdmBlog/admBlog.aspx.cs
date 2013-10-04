using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NovosAres.Blog.Banco;

namespace NovosAres.Blog.AdmBlog
{
    public partial class admBlog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //se não estiver autenticado, redireciona para login
            if (Session["logado"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    lblData.Text = DateTime.Now.ToShortDateString();
                    CarregaCategorias();
                    configFCKEditor();
                }
            }

        }

        /// <summary>
        /// carrega o drop down list d ecategorias de post's
        /// </summary>
        private void CarregaCategorias()
        {
            MyBDCategoria categorias = new MyBDCategoria();
            ddlCategorias.DataSource = categorias.GetCategorias();
            ddlCategorias.DataTextField = "Nome";
            ddlCategorias.DataValueField = "ID";
            ddlCategorias.DataBind();
            ListItem categoria = new ListItem("<Selecione uma Categoria>", "");
            ddlCategorias.Items.Insert(0, categoria);
        }

        protected void btnLimparTudo_Click(object sender, EventArgs e)
        {
            Response.Redirect("admBlog.aspx");

        }

        protected void BtnSalvar_Click(object sender, EventArgs e)
        {
            //salva o post no banco
            MyBDPosts cadPost = new MyBDPosts();
            bool cadastrado = false;
            try
            {
                cadastrado = cadPost.CadastrarPost(
                    Convert.ToInt32(ddlCategorias.SelectedValue),
                    TxbLocal.Text,
                    txbTitulo.Text,
                    fckEditor.Text,
                    DateTime.Now);
                LimpaCampos();
                ExibeMensagemPopUp("Post gerado com sucesso!");
            }
            catch (Exception ex)
            {
                cadastrado = false;
            }
            if (cadastrado == false)
            {
                ExibeMensagemPopUp("Erro! post não cadastrado. Verifique os dados cadatrados e tente novamente. Caso o erro persista procure o administrador.");
            }
        }

        /// <summary>
        /// Exibe mensagem popup.
        /// </summary>
        /// <param name="mensagem">Mensagem a ser exibida no popup.</param>
        private void ExibeMensagemPopUp(string mensagem)
        {
            ClientScript.RegisterStartupScript(
                            this.GetType(),
                            "arquivo",
                            "alert('" + mensagem + "');",
                            true);
        }

        /// <summary>
        /// Limpa os campos da tela
        /// </summary>
        private void LimpaCampos()
        {
            txbTitulo.Text = "";
            TxbLocal.Text = "";
            fckEditor.Text = "";
            ddlCategorias.SelectedValue = "";
        }

        private void configFCKEditor()
        {
            fckEditor.DefaultLanguage = "pt-br";
            //configurar o caminho de salvamento de imagens
        }


    }
}
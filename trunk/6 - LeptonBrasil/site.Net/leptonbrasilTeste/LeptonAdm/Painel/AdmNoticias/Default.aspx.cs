using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using leptonbrasil.Banco;
using System.Data;

namespace leptonbrasil.LeptonAdm.Painel.AdmNoticias
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Page.Title = ".:Lepton - ADM Notícias:.";

            if (this.Context.User.Identity.Name == "")
            {//se não houver usuário autenticado volta ao login                                
                Response.Redirect("~/LeptonAdm");
            }
            if (!IsPostBack)
            {
                Session["tituloPaginaAdm"] = "Lepton - ADM Notícias";
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {//se for alteração
                    PreencheCampos(Convert.ToInt32(Request.QueryString["id"]));
                }

                SetaGridView();
                PreencheGridView();
            }
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {//se for alteração, exiba o form
                pnlFormCadastro.Visible = true;
                pnlListaPosts.Visible = false;
                pnlSelectNoticia.Visible = false;
            }
            else
            {//sender não exiba a listagem
                pnlFormCadastro.Visible = false;
                pnlListaPosts.Visible = true;
                pnlSelectNoticia.Visible = true;
            }
        }

        /// <summary>
        /// define as configurações do grid view
        /// </summary>
        private void SetaGridView()
        {
            //configurações para paginação
            gvNoticias.AllowPaging = true;
            gvNoticias.PageSize = 9;
        }

        /// <summary>
        /// carrega o grid view com os dados do banco de dados
        /// </summary>
        private void PreencheGridView()
        {
            MyBdNoticias getNoticias = new MyBdNoticias();
            try
            {
                gvNoticias.DataSource = getNoticias.RecuperaTodosPosts();
                gvNoticias.DataBind();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        // GridView.RowDataBound Event
        protected void gvNoticias_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Make sure the current GridViewRow is a data row.
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Make sure the current GridViewRow is either 
                // in the normal state or an alternate row.
                if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
                {
                    // Add client-side confirmation when deleting.
                    ((ImageButton)e.Row.Cells[5].Controls[0]).Attributes["onclick"] = "if(!confirm('Tem certeza que deseja excluir?')) return false;";
                }
            }
        }

        // GridView.PageIndexChanging Event
        protected void gvNoticias_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            // Set the index of the new display page. 
            gvNoticias.PageIndex = e.NewPageIndex;

            // Rebind the GridView control to 
            // show data in the new page.
            PreencheGridView();
        }

        /// <summary>
        /// Alteração solicitada no GridView
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gvNoticias_Click(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Alterar")
            {
                // o ",false" é para suprimir a chamada interna para "Response.End"
                Response.Redirect("Default.aspx?id=" + Convert.ToString(e.CommandArgument), false);
            }
        }

        // GridView.RowDeleting Event
        protected void gvNoticias_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ApagarPost(Convert.ToInt32(gvNoticias.Rows[e.RowIndex].Cells[3].Text));
            PreencheGridView();
        }

        /// <summary>
        /// Apaga um post do banco a partir do ID
        /// </summary>
        /// <param name="id">id do post a ser apagado</param>
        private void ApagarPost(int id)
        {
            MyBdNoticias deletaPost = new MyBdNoticias();
            try
            {
                deletaPost.ExcluirPost(id);
            }
            catch (Exception)
            {
                throw;
            }
        }

        /// <summary>
        /// Carrega os campos do Form ao solicitar uma alteração
        /// </summary>
        /// <param name="id">id da notícia a ser alterada</param>
        private void PreencheCampos(int id)
        {
            //criação dos objetos e obtenção dos dados do banco
            MyBdNoticias getDados = new MyBdNoticias();
            try
            {
                DataSet dadosServico = getDados.RecuperaPost(id);
                DataRow dr = dadosServico.Tables[0].Rows[0];

                //preenchendo os dados na tela
                lblDataHora.Text = dr["data"].ToString();
                txbTituloTela.Text = dr["titulo"].ToString();
                editTextoTela.Content = dr["texto"].ToString();
                lblAutor.Text = dr["autor"].ToString();
            }
            catch (Exception ex)
            {
                //faz nada
            }
        }

        /// <summary>
        /// Evento de click do botão salvar em notícias
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            if (editTextoTela.Content.Length > 20000)
            {//se o texto for grande demais...
                ExibeMensagemPopUp("O Texto excede o tamanho máximo que é de 20.000 caracteres (convertidos em HTML). Por favor, reduza o texto em " +
                    (editTextoTela.Content.Length - 20000) + " caracteres aproximadamente.");
                pnlFormCadastro.Visible = true;
                pnlListaPosts.Visible = false;
                pnlSelectNoticia.Visible = false;
            }
            else if (editTextoTela.Content.Length < 1)
            {//se não houver texto
                ExibeMensagemPopUp("Campo TEXTO é obrigatório.");
                pnlFormCadastro.Visible = true;
                pnlListaPosts.Visible = false;
                pnlSelectNoticia.Visible = false;
            }
            else
            {//se não, se todos os campos orbigatórios estiverem preenchidos
                bool retorno = false;
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {//se for alteração
                    retorno = AtualizaPost(
                        Convert.ToInt32(Request.QueryString["id"]),
                        this.Context.User.Identity.Name.ToString(),
                        editTextoTela.Content.ToString(),
                        txbTituloTela.Text);
                }
                else
                {//se for cadastro
                    retorno = CadastraPost(
                        this.Context.User.Identity.Name.ToString(),
                        editTextoTela.Content.ToString(),
                        txbTituloTela.Text,
                        DateTime.Now);
                }
                if (retorno.Equals(true))
                {//se salvou com sucesso
                    ExibeMensagemPopUp("Salvo com sucesso!");
                    LimpaCampos();
                    pnlFormCadastro.Visible = false;
                    pnlListaPosts.Visible = true;
                    pnlSelectNoticia.Visible = true;
                }
                else
                {//se houve erro no cadastro do banco
                    ExibeMensagemPopUp("Erro! Cadastro não foi salvo. Verifique os dados e tente novamente mais tarde.");
                }
                PreencheGridView();
            }
        }

        /// <summary>
        /// atualiza um post no banco
        /// </summary>
        /// <param name="id"></param>
        /// <param name="autor"></param>
        /// <param name="texto"></param>
        /// <param name="titulo"></param>
        /// <returns>true se atualizado com sucesso</returns>
        private bool AtualizaPost(
            int id,
            string autor,
            string texto,
            string titulo)
        {
            bool retorno = false;
            MyBdNoticias atualizaNoticia = new MyBdNoticias();

            try
            {
                retorno = atualizaNoticia.AlterarPost(
                    autor, texto, titulo, id);
            }
            catch (Exception)
            {
                throw;
            }
            return retorno;
        }

        /// <summary>
        /// cadastra uma noticia no banco
        /// </summary>
        /// <param name="autor"></param>
        /// <param name="texto"></param>
        /// <param name="titulo"></param>
        /// <param name="data"></param>
        /// <returns>true se cadastrado com sucesso</returns>
        private bool CadastraPost(
            string autor,
            string texto,
            string titulo,
            DateTime data)
        {
            bool retorno = false;
            MyBdNoticias cadastraNoticia = new MyBdNoticias();

            try
            {
                retorno = cadastraNoticia.CadastraPost(
                    autor, data, texto, titulo);
            }
            catch (Exception)
            {
                throw;
            }
            return retorno;
        }

        /// <summary>
        /// Limpa os campos da tela
        /// </summary>
        private void LimpaCampos()
        {
            txbTituloTela.Text = "";
            lblAutor.Text = this.Context.User.Identity.Name.ToString();
            lblDataHora.Text = DateTime.Now.ToString();
            editTextoTela.Content = "";
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
        /// Evento de cancelamento do formulário
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void tbnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        /// <summary>
        /// Solicitação de cadastro de nova notícia
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgBtnNovaNoticia_Click(object sender, ImageClickEventArgs e)
        {
            pnlFormCadastro.Visible = true;
            pnlListaPosts.Visible = false;
            pnlSelectNoticia.Visible = false;
            liDataUltMod.Visible = false;
        }

        /// <summary>
        /// solicitação de cadastro de nova notícia
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lbNovaNoticia_Click(object sender, EventArgs e)
        {
            pnlFormCadastro.Visible = true;
            pnlListaPosts.Visible = false;
            pnlSelectNoticia.Visible = false;
            liDataUltMod.Visible = false;
        }
    }
}
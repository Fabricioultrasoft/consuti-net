using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NovosAres.Blog.Banco;

namespace NovosAres.Blog
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["AlonePost"] != null)
                {
                    //carrega só o post do id
                    try
                    {
                        CarregaPostAlone(Request.QueryString["AlonePost"].ToString());
                    }
                    catch (Exception ex)
                    {//caso não encontre o post solicitado carrega todos
                        CarregaUltimosXPosts(3);
                    }
                }
                else if (Request.QueryString["busca"] != null)
                {
                    PesquisaTitulos(Request.QueryString["busca"].ToString());
                }
                else if (Request.QueryString["IDcategoria"] != null) //TRATAR NAVEGAÇÃO ENTRE CATEGORIAS
                {
                    bool carregouPosts = CarregaDeCategoria(Request.QueryString["IDcategoria"].ToString());
                    try
                    {
                        if (carregouPosts == false)
                        {
                            CarregaUltimosXPosts(3);
                        }
                    }
                    catch (Exception ex)
                    {//caso não encontre o post solicitado carrega todos
                        CarregaUltimosXPosts(3);
                    }
                }
                else
                {
                    CarregaUltimosXPosts(3);
                }
            }

        }

        /// <summary>
        /// carrega os posts a partir de uma categoria
        /// </summary>
        /// <param name="idCategoria">id da categoria</param>
        private bool CarregaDeCategoria(string idCategoria)
        {
            bool contemRegistro = false;
            MyBDPosts postsCategoria = new MyBDPosts();
            rptrPosts.DataSource = postsCategoria.RecuperaPostsBuscaCategoria(idCategoria);
            rptrPosts.DataBind();
            if (rptrPosts.Items.Count > 0)
            {
                contemRegistro = true;
            }
            return contemRegistro;
        }

        /// <summary>
        /// realiza pesquisa por um post
        /// </summary>
        /// <param name="idPost">id do post a ser pesquisado</param>
        private void CarregaPostAlone(string idPost)
        {
            MyBDPosts postAlone = new MyBDPosts();
            rptrPosts.DataSource = postAlone.RecuperaPost(idPost);
            rptrPosts.DataBind();
        }

        /// <summary>
        /// realiza busca por titulos
        /// </summary>
        /// <param name="palavraBusca">elemento a ser utilizado como filtro</param>
        private void PesquisaTitulos(string palavraBusca)
        {
            MyBDPosts buscaTitulos = new MyBDPosts();
            try
            {
                rptrPosts.DataSource = buscaTitulos.RecuperaPostsBusca(palavraBusca);
                rptrPosts.DataBind();
            }
            catch (Exception ex)
            {
                throw;
            }

        }

        /// <summary>
        /// Carrega uma determinada quantidade de posts
        /// </summary>
        /// <param name="qtdPosts">quantidade de posts a carregar</param>
        private void CarregaUltimosXPosts(int qtdPosts)
        {
            MyBDPosts posts = new MyBDPosts();
            try
            {
                rptrPosts.DataSource = posts.RecuperaPosts(qtdPosts);
                rptrPosts.DataBind();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        /// <summary>
        /// resolve os comandos do repeater
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        protected void rptrPosts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("exibePost"))
            {
                Response.Redirect("Default.aspx?AlonePost=" + Convert.ToString(e.CommandArgument));
            }
        }
    }
}
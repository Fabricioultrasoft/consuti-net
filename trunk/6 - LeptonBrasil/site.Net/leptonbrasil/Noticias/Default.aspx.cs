using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using leptonbrasil.Banco;

namespace leptonbrasil.Noticias
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Page.Title = ".:Lepton - Notícias:.";
            if (!IsPostBack)
            {
                Session["tituloPagina"] = "Lepton - Notícias";
                bool repeaterCarregado = CarregaNoticias();
                if (repeaterCarregado.Equals(false))
                {//se não conseguir carregar nenhum post, oculta o repeater
                    rptrPosts.Visible = false;
                }
                else
                {
                    rptrPosts.Visible = true;
                }
            }
        }

        /// <summary>
        /// Carrega todos os posts de noticias na tela
        /// </summary>
        /// <returns>true se conseguiu carregar, false caso contrário</returns>
        private bool CarregaNoticias()
        {
            bool existePosts = true;
            MyBdNoticias posts = new MyBdNoticias();

            try
            {
                rptrPosts.DataSource = posts.RecuperaTodosPostsTela();
                rptrPosts.DataBind();
                if (rptrPosts.Items.Count == 0)
                {//se o dataset estiver vazio...
                    existePosts = false;
                }
            }
            catch (Exception ex)
            {//ou ocorrer erro no carregamento
                existePosts = false;
            }
            
            return existePosts;            
        }
    }
}
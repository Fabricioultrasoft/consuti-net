using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NovosAres
{
    public partial class MasterExterna : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //obtem a imagem para o fundo do site
                Extras.InfraSite UrlImagemBackGround = new Extras.InfraSite();
                pnlConteudoPagina.BackImageUrl = UrlImagemBackGround.ObtemUrlImagemFundo();

                //obtem a imagem para logo da home
                Extras.InfraSite UrlImagemLogo = new Extras.InfraSite();
                imgBtnLogo.ImageUrl = UrlImagemLogo.ObtemUrlImagemLogoHome();
            }

        }

        protected void imgBtnLogo_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}
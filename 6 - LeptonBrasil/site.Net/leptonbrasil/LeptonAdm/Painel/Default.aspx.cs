using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace leptonbrasil.LeptonAdm.Painel
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Page.Title = ".:Lepton - Painel ADM:.";
            if (this.Context.User.Identity.Name == "")
            {//se não houver usuário autenticado volta ao login                                
                Response.Redirect("~/LeptonAdm");
            }
            if (!IsPostBack)
            {
                Session["tituloPaginaAdm"] = "Lepton - Painel ADM";

                //zera o contadador da proteção caso acesse o site com sucesso
                Session["protecao"] = null;
            }
        }

        protected void ImgBtnInstit_Click(object sender, ImageClickEventArgs e)
        {
            Session["tituloPaginaAdm"] = "Administração de Institucional";
            Response.Redirect("~/LeptonAdm/Painel/AdmInstitucional");
        }

        protected void ImgBtnNot_Click(object sender, ImageClickEventArgs e)
        {
            Session["tituloPaginaAdm"] = "Administração de Notícias";
            Response.Redirect("~/LeptonAdm/Painel/AdmNoticias");
        }

        protected void imgBtnSer_Click(object sender, ImageClickEventArgs e)
        {
            Session["tituloPaginaAdm"] = "Administração de Serviços";
            Response.Redirect("~/LeptonAdm/Painel/AdmServicos");
        }

        protected void ConfigParamsImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Session["tituloPaginaAdm"] = "Administração de Parâmetros do Site";
            Response.Redirect("~/LeptonAdm/Painel/AdmParametros");
        }
    }
}
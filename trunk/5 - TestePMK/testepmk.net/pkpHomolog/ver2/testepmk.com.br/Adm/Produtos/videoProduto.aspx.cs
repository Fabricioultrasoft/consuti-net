using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using testePMK.com.br.Banco;

namespace testePMK.com.br.Adm.Produtos
{
    public partial class videoProduto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
            response.Buffer = true;
            response.ClearContent();
            response.ClearHeaders();
            response.ContentType = "text/html";
            response.AddHeader("Cache-Control", "no-cache");
            response.Write(GeraPlayer());
            response.End();
        }

        /// <summary>
        /// Obtem o link dinamicamente e monta o codigo fonte da pagina de exibição do vídeo
        /// </summary>
        /// <returns>codigo fonte da página</returns>
        private string GeraPlayer()
        {
            BdProduto caminhoVideo = new BdProduto();
            string linkVideo = caminhoVideo.retornaLinkVideo(Convert.ToInt32(Request.QueryString["idProd"].ToString()));
            caminhoVideo.Dispose();
            string retorno = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">" +
                    "<html xmlns=\"http://www.w3.org/1999/xhtml\"><head runat=\"server\"><title></title></head><body " +
                    "style=\"margin: 10 auto auto auto; background-color:Black;\"><form id=\"form1\" runat=\"server\"><div>" +
                    "<iframe title=\"YouTube video player\" width=\"480\" height=\"390\" src=\"" + linkVideo + "\" frameborder=\"0\" allowfullscreen></iframe>" +
            "</div></form></body></html>";
            return retorno;            
        }
    }
}
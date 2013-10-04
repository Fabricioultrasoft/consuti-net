using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using testePMK.com.br.Banco;

namespace testePMK.com.br.Adm.Produtos
{
    public partial class ImagensProduto : System.Web.UI.Page
    {

        private int idProd = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            BdProduto getNome = new BdProduto();
            try
            {
                idProd = Convert.ToInt32(Request.QueryString["idProd"].ToString());

                //get o nome do produto para a session
                Session["nomeProduto"] = getNome.retornaNomeProduto(idProd);

                //get a descricão para o form
                descricaoCompletaProduto.Text = getNome.retornaDescrCompleta(idProd);
            }
            catch (Exception)
            {
                //do nothing
            }
            finally
            {
                getNome.Dispose();
            }
        }

        public string getCaminho()
        {
            return "../Adm/Produtos/ImgsProdutos/" + getNomeProd();
        }

        public string getNomeProd()
        {
            return Session["nomeProduto"].ToString();
        }

        public bool testaExistencia(string caminho)
        {
            if (File.Exists(caminho))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        //criando o metodo que alimenta o slide show do ajax
        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public static AjaxControlToolkit.Slide[] GetSlides()
        {
            //quantidade de fotos no total
            int j = 20;
            HttpServerUtility auxCaminho = HttpContext.Current.Server;
            ImagensProduto slid = new ImagensProduto();

            AjaxControlToolkit.Slide[] slides = new AjaxControlToolkit.Slide[j];

            //carrega as fotos da pasta
            for (int i = 1; i < j + 1; i++)
            {
                slides[i - 1] = new AjaxControlToolkit.Slide("../" + slid.getCaminho() + "_" + i + ".jpg", slid.getNomeProd() + "_" + i, "");
            }

            //testa toda as posições do vetor de imagens e, caso não exista nenhuma imagem, exibe a imagem informativa da não existencia de imagem
            for (int i = 1; i < j + 1; i++)
            {
                string caminho = auxCaminho.MapPath("~\\Adm\\Produtos\\ImgsProdutos\\" + slid.getNomeProd() + "_" + i + ".jpg");
                if (System.IO.File.Exists(caminho))
                {
                    i = j + 1;
                }
                else if (i == j)
                {
                    slides[0].ImagePath = "../../Graficos/ImagemNaoDisponivel.jpg";
                }
            }

            return (slides);
        }
    }
}
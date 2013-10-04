using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using testePMK.com.br.Banco;
using System.Data;
using System.IO;

namespace testePMK.com.br.Adm.Banners
{
    public partial class AtualizaBanners : System.Web.UI.Page
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
                carregaCampos();
            }
        }

        /// <summary>
        /// atualiza os dados do banner de promoções
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            BdBanner SalvaBann = new BdBanner();

            try
            {
                string resultValidacao = validaAssinc(afuPromoc, Convert.ToString(SalvaBann.retornaUltimoID() + 1));
                if (resultValidacao == "")
                {
                    SalvaBann.Inserir(
                        txbTituloBan.Text,
                        DateTime.Now,
                        txbDescricao.Text);
                    carregaCampos();
                    ExibeMensagemPopUp("Atualização realizada com sucesso!");
                }
                else
                {
                    ExibeMensagemPopUp(resultValidacao);
                }
            }
            catch (Exception)
            {
                ExibeMensagemPopUp("ERRO! Procedimento não concluído. Tente novamente ou contate Administrador.");
            }
            finally
            {
                SalvaBann.Dispose();
            }
        }

        /// <summary>
        /// Limpa a tela
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        /// <summary>
        /// Carrega os campos com os dados do banco
        /// </summary>
        private void carregaCampos()
        {
            BdBanner carregaDados = new BdBanner();
            try
            {
                DataSet ds = carregaDados.Listar();
                DataRow dr = ds.Tables[0].Rows[0];

                txbTituloBan.Text = dr["TITULO"].ToString();
                txbDescricao.Text = dr["DESCRICAO"].ToString();
                lblUltAtualizacao.Text = dr["DATA"].ToString();

                //verifica se existe a imagem para ser exibida
                if (File.Exists(Server.MapPath(@"~\Adm\Banners\") + dr["ID"].ToString() + ".jpg"))
                {
                    imgBannPromoc.ImageUrl = @"~\Adm\Banners\" + dr["ID"].ToString() + ".jpg";
                }
                else
                {
                    imgBannPromoc.ImageUrl = @"~\Graficos\" + "ImagemNaoDisponivel.jpg";
                }
            }
            catch (Exception)
            {
                ExibeMensagemPopUp("Erro ao carregar a ultima atualização. Cadastre novo ou Contate o administrador.");
            }
            finally
            {
                carregaDados.Dispose();
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

        protected void btnZerabann_Click(object sender, EventArgs e)
        {
            BdBanner SalvaBann = new BdBanner();
            try
            {
                SalvaBann.Inserir(
                    "",
                    DateTime.Now,
                    "");
                carregaCampos();
                ExibeMensagemPopUp("Atualização realizada com sucesso!");
            }
            catch (Exception)
            {
                ExibeMensagemPopUp("ERRO! Procedimento não concluído. Tente novamente ou contate Administrador.");
            }
            finally
            {
                SalvaBann.Dispose();
            }
        }

        /// <summary>
        /// realiza as validações de imagem 
        /// </summary>
        /// <param name="asyncImg">conteudo a ser validado</param>
        /// <param name="nomeProd">nome do produto a ser asociado como nome da imagem</param>
        /// <returns>mensagem resultado da validação</returns>
        private string validaAssinc(AjaxControlToolkit.AsyncFileUpload asyncImg, string nomeArq)
        {
            string mensagem = "";
            //verifica se foi inserida imagem
            if (asyncImg.HasFile)
            {
                //valida tamanho do arquivo (máximo 500kb)
                if (asyncImg.PostedFile.ContentLength < 500000)
                {
                    string Arquivo = asyncImg.FileName;
                    string extensao = Arquivo.Substring(Arquivo.Length - 4).ToLower();

                    //valida extensão do arquivo (somente .jpg)
                    if (extensao == ".jpg")
                    {
                        string NomeImg = nomeArq + extensao;
                        string Caminho = Server.MapPath(@"~\Adm\Banners\");

                        //valida existencia do arquivo no servidor 
                        if (!File.Exists(Caminho + NomeImg))
                        {
                            asyncImg.SaveAs(Caminho + NomeImg);
                        }

                        //subistitui aquivo existente
                        else
                        {
                            File.Delete(Caminho + NomeImg);
                            asyncImg.SaveAs(Caminho + NomeImg);
                        }
                    }
                    else
                    {
                        mensagem = "Formato do Arquivo Inválido! Selecione um arquivo no formato JPG.";
                    }
                }
                else
                {
                    mensagem = "Tamanho do arquivo ultrapassa o permitido, por favor envie um" +
                    " arquivo com no máximo 500 kB";
                }
            }
            else
            {
                mensagem = "Campo obrigatório para adicionar imagem.";
            }

            return mensagem;
        }

    }
}
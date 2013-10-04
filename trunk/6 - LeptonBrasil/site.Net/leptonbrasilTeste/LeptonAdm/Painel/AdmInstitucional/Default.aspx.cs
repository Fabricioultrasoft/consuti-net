using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using leptonbrasil.Banco;
using System.Data;
using System.IO;

namespace leptonbrasil.LeptonAdm.Painel.AdmInstitucional
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Page.Title = ".:Lepton - ADM Institucional:.";

            if (this.Context.User.Identity.Name == "")
            {//se não houver usuário autenticado volta ao login                                
                Response.Redirect("~/LeptonAdm");
            }
            if (!IsPostBack)
            {
                Session["tituloPaginaAdm"] = "Lepton - ADM Institucional";
                PreencheTela();
            }
        }

        private void PreencheTela()
        {
            //criação dos objetos e obtenção dos dados do banco
            MyBdInstitucional getDados = new MyBdInstitucional();
            try
            {
                DataSet dadosServico = getDados.obtemDados();
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
        /// cancelamento das modificações
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void tbnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        /// <summary>
        /// salva os dados da solicitação de atualização vindas do usuário
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSalvar_Click(object sender, EventArgs e)
        {
             string msgSalvaImagem = string.Empty;

             if (ImagemRodapeInstitucionalFileUpload.HasFile)
            {
                msgSalvaImagem = SalvaImagemRodapeInstitucional();
            }
            if (string.IsNullOrEmpty(msgSalvaImagem))
            {
                if (editTextoTela.Content.Length > 20000)
                {//se o texto for grande demais...
                    ExibeMensagemPopUp("O Texto excede o tamanho máximo que é de 20.000 caracteres (convertidos em HTML). Por favor, reduza o texto em " +
                        (editTextoTela.Content.Length - 20000) + " caracteres aproximadamente.");
                }
                else
                {
                    MyBdInstitucional atualizaDados = new MyBdInstitucional();
                    bool sucesso = false;

                    try
                    {
                        sucesso = atualizaDados.atualizaDadosTela(
                            this.Context.User.Identity.Name.ToString(),
                            DateTime.Now,
                            txbTituloTela.Text,
                            editTextoTela.Content.ToString());
                    }
                    catch (Exception ex)
                    {
                        sucesso = false;
                    }
                    if (!sucesso.Equals(false))
                    {
                        //exibe mensagem sucesso
                        ExibeMensagemPopUp("Alterações realizadas com sucesso!");
                    }
                    else
                    {
                        // exibe mensagem de insucesso
                        ExibeMensagemPopUp("Erro! As alterações não foram realizadas. Tente novamente mais tarde e caso o erro persista procure o administrador.");
                    }
                }
            }
            else
            {
                ExibeMensagemPopUp(msgSalvaImagem);
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

        /// <summary>
        /// salva a imagem de logo do rodape
        /// </summary>
        /// <returns></returns>
        private string SalvaImagemRodapeInstitucional()
        {
            string mensagem = "";

            //verifica se foi inserida imagem
            if (ImagemRodapeInstitucionalFileUpload.HasFile)
            {
                //valida tamanho do arquivo (máximo 250kb)
                if (ImagemRodapeInstitucionalFileUpload.PostedFile.ContentLength < 260000)
                {
                    string Arquivo = ImagemRodapeInstitucionalFileUpload.FileName;
                    string extensao = Arquivo.Substring(Arquivo.Length - 4).ToLower();

                    //valida extensão do arquivo (somente .png)
                    if (extensao == ".png")
                    {
                        string NomeImg = "BannInfInstit.png";
                        string Caminho = Server.MapPath("~\\Graficos\\");

                        //valida existencia do arquivo no servidor 
                        if (!File.Exists(Caminho + NomeImg))
                        {
                            ImagemRodapeInstitucionalFileUpload.SaveAs(Caminho + NomeImg);
                        }

                        //subistitui aquivo existente
                        else
                        {
                            File.Delete(Caminho + NomeImg);
                            ImagemRodapeInstitucionalFileUpload.SaveAs(Caminho + NomeImg);
                        }
                    }
                    else
                    {
                        mensagem = "Formato do Arquivo Inválido para imagem de topo da home! Selecione um arquivo no formato JPG.";
                    }
                }
                else
                {
                    mensagem = "Tamanho do arquivo ultrapassa o permitido para a imagem de topo da home, por favor envie um" +
                    " arquivo com no máximo 260 kB. O arquivo enviado possui " + ImagemRodapeInstitucionalFileUpload.PostedFile.ContentLength.ToString()
                    + " bytes.";
                }
            }
            return mensagem;
        }
    }
}
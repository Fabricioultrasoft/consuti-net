using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using leptonbrasil.Banco;
using System.Data;

namespace leptonbrasil.LeptonAdm.Painel.AdmParametros
{
    public partial class Default : System.Web.UI.Page
    {
        /// <summary>
        /// carregaPágina
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Context.User.Identity.Name == "")
            {//se não houver usuário autenticado volta ao login                                
                Response.Redirect("~/LeptonAdm");
            }
            if (!IsPostBack)
            {
                Session["tituloPaginaAdm"] = "Lepton - ADM Parâmetros do Site";
                PreencheTela();
            }
        }

        /// <summary>
        /// Botão cancelar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void tbnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        /// <summary>
        /// salva a imagem de logo do topo do site
        /// </summary>
        /// <returns></returns>
        private string SalvaImagemLogo()
        {
            string mensagem = "";

            //verifica se foi inserida imagem
            if (LogoSiteFileUpload.HasFile)
            {
                //valida tamanho do arquivo (máximo 50kb)
                if (LogoSiteFileUpload.PostedFile.ContentLength < 50000)
                {
                    string Arquivo = LogoSiteFileUpload.FileName;
                    string extensao = Arquivo.Substring(Arquivo.Length - 4).ToLower();

                    //valida extensão do arquivo (somente .jpg)
                    if (extensao == ".jpg")
                    {
                        string NomeImg = "NomeLepton.jpg";
                        string Caminho = Server.MapPath("~\\Graficos\\");

                        //valida existencia do arquivo no servidor 
                        if (!File.Exists(Caminho + NomeImg))
                        {
                            LogoSiteFileUpload.SaveAs(Caminho + NomeImg);
                        }

                        //subistitui aquivo existente
                        else
                        {
                            File.Delete(Caminho + NomeImg);
                            LogoSiteFileUpload.SaveAs(Caminho + NomeImg);
                        }
                    }
                    else
                    {
                        mensagem = "Formato do Arquivo Inválido para imagem da Logo! Selecione um arquivo no formato JPG.";
                    }
                }
                else
                {
                    mensagem = "Tamanho do arquivo de imagem da Logo ultrapassa o permitido, por favor envie um" +
                    " arquivo com no máximo 50 kB";
                }
            }
            return mensagem;
        }

        /// <summary>
        /// salva a imagem de logo do fundo do site
        /// </summary>
        /// <returns></returns>
        private string SalvaImagemFundoSite()
        {
            string mensagem = "";

            //verifica se foi inserida imagem
            if (FundoSiteFileUpload.HasFile)
            {
                //valida tamanho do arquivo (máximo 100kb)
                if (FundoSiteFileUpload.PostedFile.ContentLength < 100000)
                {
                    string Arquivo = FundoSiteFileUpload.FileName;
                    string extensao = Arquivo.Substring(Arquivo.Length - 4).ToLower();

                    //valida extensão do arquivo (somente .jpg)
                    if (extensao == ".jpg")
                    {
                        string NomeImg = "FundoSite.jpg";
                        string Caminho = Server.MapPath("~\\Graficos\\");

                        //valida existencia do arquivo no servidor 
                        if (!File.Exists(Caminho + NomeImg))
                        {
                            FundoSiteFileUpload.SaveAs(Caminho + NomeImg);
                        }

                        //subistitui aquivo existente
                        else
                        {
                            File.Delete(Caminho + NomeImg);
                            FundoSiteFileUpload.SaveAs(Caminho + NomeImg);
                        }
                    }
                    else
                    {
                        mensagem = "Formato do Arquivo Inválido para imagem de fundo do site! Selecione um arquivo no formato JPG.";
                    }
                }
                else
                {
                    mensagem = "Tamanho do arquivo ultrapassa o permitido para a imagem de fundo do site, por favor envie um" +
                    " arquivo com no máximo 100 kB";
                }
            }
            return mensagem;
        }

        /// <summary>
        /// salva a imagem de logo do topo da home
        /// </summary>
        /// <returns></returns>
        private string SalvaImagemHomeTopo()
        {
            string mensagem = "";

            //verifica se foi inserida imagem
            if (imgTopoHomeFileUpload.HasFile)
            {
                //valida tamanho do arquivo (máximo 50kb)
                if (imgTopoHomeFileUpload.PostedFile.ContentLength < 50000)
                {
                    string Arquivo = imgTopoHomeFileUpload.FileName;
                    string extensao = Arquivo.Substring(Arquivo.Length - 4).ToLower();

                    //valida extensão do arquivo (somente .jpg)
                    if (extensao == ".jpg")
                    {
                        string NomeImg = "Pagina_Inicial_do_web_site.jpg";
                        string Caminho = Server.MapPath("~\\Graficos\\");

                        //valida existencia do arquivo no servidor 
                        if (!File.Exists(Caminho + NomeImg))
                        {
                            imgTopoHomeFileUpload.SaveAs(Caminho + NomeImg);
                        }

                        //subistitui aquivo existente
                        else
                        {
                            File.Delete(Caminho + NomeImg);
                            imgTopoHomeFileUpload.SaveAs(Caminho + NomeImg);
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
                    " arquivo com no máximo 50 kB";
                }
            }
            return mensagem;
        }

        /// <summary>
        /// Botão salvar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            if (TextoMenuContatoTextBox.Text.Length > 250 ||
                TextoMenuInstitucionalTextBox.Text.Length > 250 ||
                TextoMenuNoticiasTextBox.Text.Length > 250 ||
                TextoMenuServicosTextBox.Text.Length > 250)
            {//se o texto for grande demais...
                ExibeMensagemPopUp("O Texto em um dos campos de Menu excede o tamanho máximo que é de 250 caracteres. Por favor, reduza o texto " +
                    "e tente novamente.");
            }
            else
            {
                string salvaImagem = string.Empty;
                if (FundoSiteFileUpload.HasFile)
                    salvaImagem = SalvaImagemFundoSite();

                if (imgTopoHomeFileUpload.HasFile)
                    salvaImagem = SalvaImagemHomeTopo();

                if (LogoSiteFileUpload.HasFile)
                    salvaImagem = SalvaImagemLogo();
                if (salvaImagem.Equals(string.Empty))
                {

                    MyBdParametros atualizaDados = new MyBdParametros();
                    bool sucesso = false;

                    try
                    {
                        sucesso = atualizaDados.atualizaDadosTela(
                            emailTextBox.Text,
                            telefone1TextBox.Text,
                            telefone2TextBox.Text,
                            CorFundoSiteTextBox.Text,
                            TextoMenuServicosTextBox.Text,
                            TextoMenuContatoTextBox.Text,
                            TextoMenuNoticiasTextBox.Text,
                            TextoMenuInstitucionalTextBox.Text);

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
                else
                {
                    ExibeMensagemPopUp(salvaImagem);
                }
            }
        }

        /// <summary>
        /// preenche a tela com dados do banco de dados
        /// </summary>
        private void PreencheTela()
        {
            //criação dos objetos e obtenção dos dados do banco
            MyBdParametros getDados = new MyBdParametros();
            try
            {
                DataSet dadosServico = getDados.RecuperaParametros();
                DataRow dr = dadosServico.Tables[0].Rows[0];

                //preenchendo os dados na tela
                CorFundoSiteTextBox.Text = dr["CorFundoSite"].ToString();
                telefone1TextBox.Text = dr["TelefoneContato1"].ToString();
                telefone2TextBox.Text = dr["TelefoneContato2"].ToString();
                emailTextBox.Text = dr["EmailContato"].ToString();
                TextoMenuServicosTextBox.Text = dr["TextoMenuServicos"].ToString();
                TextoMenuContatoTextBox.Text = dr["TextoMenuContato"].ToString();
                TextoMenuNoticiasTextBox.Text = dr["TextoMenuNoticias"].ToString();
                TextoMenuInstitucionalTextBox.Text = dr["TextoMenuInstitucional"].ToString();
            }
            catch (Exception ex)
            {
                ExibeMensagemPopUp("Erro ao carregar os dados. Tente novamente ou procure o administrador caso o erro persista.");
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
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using testePMK.com.br.Banco;
using System.IO;

namespace testePMK.com.br.Adm.Produtos
{
    public partial class CadastraProduto : System.Web.UI.Page
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
                CarregaDdlCategorias();
            }
            if (IsPostBack)
            {
                BdProduto validaProdName = new BdProduto();
                try
                {
                    //procedimentos que validam a existencia de um produto com o mesmo nome já cadastrado para que não haja problemas com imagens
                    if (validaProdName.validaProduto(txbNomeProd.Text) != true)
                    {
                        btnAddImg.Enabled = false;
                        imgOK.Visible = false;
                        imgFail.Visible = true;
                        ExibeMensagemPopUp("Já existe um produto cadastrado com o nome [" + txbNomeProd.Text +
                        "], favor cadastrar com outro nome.");
                        txbNomeProd.Text = "";
                    }
                    else
                    {
                        btnAddImg.Enabled = true;
                        imgFail.Visible = false;
                        imgOK.Visible = true;
                    }
                }
                catch (Exception)
                {
                    //nada
                }
                finally
                {
                    validaProdName.Dispose();
                }
            }

        }

        /// <summary>
        /// carrega a listagem de categorias disponível
        /// </summary>
        private void CarregaDdlCategorias()
        {
            bdCategoria carregaDdl = new bdCategoria();
            ddlCategoria.DataSource = carregaDdl.Listar();
            ddlCategoria.DataTextField = "NOME";
            ddlCategoria.DataValueField = "ID";
            ddlCategoria.DataBind();
            ListItem categoria = new ListItem("<Selecione uma Categoria>", "");
            ddlCategoria.Items.Insert(0, categoria);
            carregaDdl.Dispose();
        }

        /// <summary>
        /// salva um novo produto no banco
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            if (txbNomeProd.Text != "")
            {
                BdProduto cadProduto = new BdProduto();
                //valida se foi inserida pelo menos uma imagem, caso contrario insere imagem de aviso
                string caminhoMiniatura = "";
                if (lbImgs.Items.Count > 0)
                {
                    caminhoMiniatura = "~\\Adm\\Produtos\\ImgsProdutos\\" + lbImgs.Items[0].ToString();
                }
                else
                {
                    caminhoMiniatura = "~\\Graficos\\ImagemNaoDisponivel.jpg";
                }

                //se o campo centavos não foi preenchido..
                if (txbPrecoCentavos.Text == "")
                {
                    txbPrecoCentavos.Text = "00";
                }
                try
                {
                    cadProduto.Incluir(
                        txbNomeProd.Text,
                        Convert.ToInt32(TxbPrecoReal.Text + txbPrecoCentavos.Text),
                        Convert.ToInt32(txbQtdEstoque.Text),
                        txbDescricao.Text,
                        Convert.ToInt32(ddlCategoria.SelectedItem.Value),
                        Convert.ToInt32(txbPeso.Text),
                        txbDescricaoCompleta.Text,
                        caminhoMiniatura,
                        txbLinkVideo.Text);
                    limpaCampos();
                    ExibeMensagemPopUp("Produto cadastrado com sucesso!");

                }
                catch (Exception)
                {
                    ExibeMensagemPopUp("Erro! Produto não cadastrado. Verifique os dados e tente novamente mais tarde. " +
                        "Caso o problema persista, contate Administrador");
                }
                finally
                {
                    cadProduto.Dispose();
                }
            }

        }

        /// <summary>
        /// Limpa os campos da tela
        /// </summary>
        private void limpaCampos()
        {
            txbDescricao.Text = "";
            txbNomeProd.Text = "";
            TxbPrecoReal.Text = "";
            txbPrecoCentavos.Text = "";
            txbQtdEstoque.Text = "";
            lbImgs.Items.Clear();
            ddlCategoria.SelectedValue = "";
            txbPeso.Text = "";
        }


        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            Response.Redirect("CadastraProduto.aspx");
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

        protected void btnAddImg_Click(object sender, EventArgs e)
        {
            if (lbImgs.Items.Count > 20)
            {
                ExibeMensagemPopUp("Limite de imagens excedido. Máximo 20!");
            }
            else
            {
                string resultValidacao = validaAssinc(afuImg, txbNomeProd.Text + "_" + (lbImgs.Items.Count + 1));
                if (resultValidacao == "")
                {
                    lbImgs.Items.Add(txbNomeProd.Text + "_" + (lbImgs.Items.Count + 1) + " - " + afuImg.FileName.ToString());
                }
                else
                {
                    ExibeMensagemPopUp(resultValidacao);
                }
            }
        }

        /// <summary>
        /// realiza as validações de imagem 
        /// </summary>
        /// <param name="asyncImg">conteudo a ser validado</param>
        /// <param name="nomeProd">nome do produto a ser asociado como nome da imagem</param>
        /// <returns>mensagem resultado da validação</returns>
        private string validaAssinc(AjaxControlToolkit.AsyncFileUpload asyncImg, string nomeProd)
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
                        string NomeImg = nomeProd + extensao;
                        string Caminho = Server.MapPath("~\\Adm\\Produtos\\ImgsProdutos\\");

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
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using testePMK.com.br.Banco;
using System.Data;
using System.IO;

namespace testePMK.com.br.Adm.Produtos
{
    public partial class EditProdutos : System.Web.UI.Page
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
                CarregaDDL();
            }

            if (ValidaAddImgs(lbImgs) == true)
            {
                imgBtnAdd.Enabled = true;
                ImgBtnExcluir.Enabled = true;
            }
            else
            {
                imgBtnAdd.Enabled = false;
                ImgBtnExcluir.Enabled = false;
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


        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (ddlProdutos.Items.Count > 1 && ddlProdutos.SelectedValue != "")
            {
                pnlSeleciona.Visible = false;
                pnlAltProd.Visible = true;

                //carrega dados do produto selecionado
                CarregaDadosProd(Convert.ToInt32(ddlProdutos.SelectedItem.Value));
            }

        }

        /// <summary>
        /// carrega o dropDown com os produtos do banco
        /// </summary>
        private void CarregaDDL()
        {
            BdProduto prods = new BdProduto();
            ddlProdutos.DataSource = prods.ListarTodos();
            ddlProdutos.DataTextField = "NOME";
            ddlProdutos.DataValueField = "ID";
            ddlProdutos.DataBind();
            prods.Dispose();
            ListItem SelectPrdo = new ListItem("<Selecione um Produto>", "");
            ddlProdutos.Items.Insert(0, SelectPrdo);
        }

        /// <summary>
        /// retorna ao inicio do fluxo de alteração de produto
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditProdutos.aspx");
        }

        /// <summary>
        /// Salva as alterações do produto
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            if (txbNomeProd.Text != "")
            {
                BdProduto cadProduto = new BdProduto();
                bool nomeValido = true;
                bool novoNome = false;

                //valida se o produto foi alterado mas manteve o nome
                if (cadProduto.validaProduto(txbNomeProd.Text, Convert.ToInt32(ddlProdutos.SelectedItem.Value)) == true)
                {//se não manteve o nome
                    novoNome = true;
                    if (cadProduto.validaProduto(txbNomeProd.Text) == false)
                    {//se o novo nome não estiver OK
                        nomeValido = false;
                    }
                }
                cadProduto = new BdProduto();

                //valida se foi inserida pelo menos uma imagem
                string caminhoMiniatura = "";
                if (lbImgs.Items.Count > 0)
                {
                    caminhoMiniatura = "~\\Adm\\Produtos\\ImgsProdutos\\" + lbImgs.Items[0].ToString();
                }
                else
                {
                    caminhoMiniatura = "~\\Graficos\\ImagemNaoDisponivel.jpg";
                }
                // se nãpo preencher os centavos...
                if (txbPrecoCentavos.Text == "")
                {
                    txbPrecoCentavos.Text = "00";
                }

                if (nomeValido == true)
                {
                    try
                    {
                        cadProduto.Alterar(
                            txbNomeProd.Text,
                            Convert.ToDouble(TxbPrecoReal.Text + "," + txbPrecoCentavos.Text),
                            Convert.ToInt32(txbQtdEstoque.Text),
                            txbDescricao.Text,
                            Convert.ToInt32(ddlProdutos.SelectedValue),
                            Convert.ToInt32(ddlCategoria.SelectedItem.Value),
                            Convert.ToInt32(txbPeso.Text),
                            txbDescricaoCompleta.Text,
                            caminhoMiniatura,
                            txbLinkVideo.Text);
                        if (novoNome == true && lbImgs.Items.Count > 0)
                        {
                            //renomeia os arquivos de imagem
                            for (int i = 0; i < lbImgs.Items.Count; i++)
                            {
                                if (File.Exists(Server.MapPath("~\\Adm\\Produtos\\ImgsProdutos\\") + lbImgs.Items[i].ToString()))
                                {
                                    File.Copy(Server.MapPath("~\\Adm\\Produtos\\ImgsProdutos\\") + lbImgs.Items[i].ToString(),
                                        Server.MapPath("~\\Adm\\Produtos\\ImgsProdutos\\") + txbNomeProd.Text + "_" + (i + 1) + ".jpg", true);
                                    File.Delete(Server.MapPath("~\\Adm\\Produtos\\ImgsProdutos\\") + lbImgs.Items[i].ToString());
                                }
                                else
                                {
                                    i = 20;
                                }
                            }
                        }

                        ExibeMensagemPopUp("Produto alterado com sucesso!");
                    }
                    catch (Exception)
                    {
                        ExibeMensagemPopUp("ERRO! Produto não alterado. Verifique os dados e tente novamente mais tarde. " +
                            "Caso o problema persista, contate Administrador");
                    }
                    finally
                    {
                        cadProduto.Dispose();
                    }
                }
                else
                {
                    imgFail.Visible = true;
                    ExibeMensagemPopUp("ERRO! Nome do produto ja cadastrado.");
                }
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
        /// carrega os dados do banco para os campos na tela
        /// </summary>
        /// <param name="idProduto">id do produto a ser carregado</param>
        private void CarregaDadosProd(int idProduto)
        {
            BdProduto recDadosProd = new BdProduto();
            string caminho = Server.MapPath("~\\Adm\\Produtos\\ImgsProdutos\\");
            char[] preco;
            try
            {
                //trazendo os dados
                DataSet dsProd = recDadosProd.ListarProduto(idProduto);
                DataRow drProd = dsProd.Tables[0].Rows[0];
                string auxPreco;
                CarregaDdlCategorias();

                //inicializando os campos
                txbNomeProd.Text = drProd["NOME"].ToString();
                txbCodProd.Text = drProd["ID"].ToString();
                txbDescricao.Text = drProd["DESCRICAO"].ToString();
                auxPreco = drProd["PRECO_UNIDADE"].ToString();
                txbQtdEstoque.Text = drProd["QTD_ESTOQUE"].ToString();
                ddlCategoria.SelectedValue = drProd["ID_CATEGORIA"].ToString();
                txbPeso.Text = drProd["PESO"].ToString();
                txbDescricaoCompleta.Text = drProd["DESCRICAO_COMPLETA"].ToString();                
                
                //divide o preço para carregar nos txbs
                txbPrecoCentavos.Text = ""; TxbPrecoReal.Text = "";
                auxPreco = auxPreco.Replace(",", "");

                //se não houver o preço correto, corrige os campos
                if (auxPreco.Length < 3)
                {
                    for (int i = auxPreco.Length; auxPreco.Length < 3; i++)
                    {
                        auxPreco = "0" + auxPreco;
                    }                    
                }

                //depois de ajustar o preco, procede com o carregamento
                preco = auxPreco.ToCharArray();

                for (int i = 0; i < preco.Length - 2; i++)
                {
                    TxbPrecoReal.Text += preco[i];
                }

                for (int i = preco.Length - 2; i < preco.Length; i++)
                {
                    txbPrecoCentavos.Text += preco[i];
                }

                txbCodProd.ReadOnly = true;

                carregaImgs(lbImgs, caminho, drProd["NOME"].ToString());
            }
            catch (Exception)
            {
                ExibeMensagemPopUp("Erro ao carregar dados do produto. Tente novamente e se o erro persistir contate o Administrador.");
            }
            finally
            {
                recDadosProd.Dispose();
            }
        }

        /// <summary>
        /// valida se ainda podem ser inseridos mais imagens
        /// </summary>
        /// <param name="listB">listbox a ser validado</param>
        /// <returns>true se for possível inseir mais imagens</returns>
        private bool ValidaAddImgs(ListBox listB)
        {
            bool retorno = false;
            if (listB.Items.Count < 20)
            {
                retorno = true;
            }
            return retorno;
        }

        /// <summary>
        /// carreda listBox com as imagens inseridas
        /// </summary>
        /// <param name="listB">listBox a ser carregado</param>
        /// <param name="caminhoOrigem">origem das imagens</param>
        /// <param name="nomeProd">nome do produto</param>
        private void carregaImgs(ListBox listB, string caminhoOrigem, string nomeProd)
        {
            lbImgs.Items.Clear();

            for (int i = 1; i < 21; i++)
            {
                if (File.Exists(caminhoOrigem + nomeProd + "_" + i + ".jpg"))
                {
                    listB.Items.Add(nomeProd + "_" + i + ".jpg");
                }
            }
        }

        /// <summary>
        /// Exclui o produto 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnExcluir_Click(object sender, EventArgs e)
        {
            BdProduto excluiProd = new BdProduto();

            try
            {
                excluiProd.Excluir(
                    Convert.ToInt32(ddlProdutos.SelectedItem.Value));
                ExibeMensagemPopUp("Produto " + txbNomeProd.Text + " excluído com sucesso!");

                LimparCampos();
            }
            catch (Exception)
            {
                ExibeMensagemPopUp("Erro! Operação não realizada. Verifique os dados e tente novamente. " +
                    "Se o erro persistir, contate o administrador.");
            }
            finally
            {
                excluiProd.Dispose();
            }
        }

        /// <summary>
        /// limpa os campos da tela
        /// </summary>
        private void LimparCampos()
        {
            CarregaDDL();
            lbImgs.Items.Clear();
            pnlSeleciona.Visible = true;
            pnlAltProd.Visible = false;
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
                        string NomeImg = nomeProd;
                        string Caminho = Server.MapPath("~\\Adm\\Produtos\\ImgsProdutos\\");

                        //valida existencia do arquivo no servidor 
                        for (int i = 1; i < 21; i++)
                        {
                            NomeImg = NomeImg + "_" + i + extensao;

                            if (!File.Exists(Caminho + NomeImg))
                            {
                                asyncImg.SaveAs(Caminho + NomeImg);
                                i = 21;
                            }
                            ////subistitui aquivo existente
                            //else
                            //{
                            //    File.Delete(Caminho + NomeImg);
                            //    asyncImg.SaveAs(Caminho + NomeImg);
                            //}
                            NomeImg = nomeProd;
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

        /// <summary>
        /// Exclui a imagen selecionada
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ImgBtnExcluir_Click(object sender, ImageClickEventArgs e)
        {
            if (lbImgs.SelectedItem != null)
            {
                try
                {
                    File.Delete(Server.MapPath("~\\Adm\\Produtos\\ImgsProdutos\\") + lbImgs.SelectedItem.Text);
                    ExibeMensagemPopUp("Imagem excluída com sucesso!");
                }
                catch (Exception)
                {
                    ExibeMensagemPopUp("ERRO! Imagem não excluída. Tente novamente ou procure o Administrador.");
                }
            }
            else
            {
                ExibeMensagemPopUp("Selecione um item na lista!");
            }
        }

        /// <summary>
        /// adiciona imagens ao listBox
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgBtnAdd_Click(object sender, ImageClickEventArgs e)
        {
            if (lbImgs.Items.Count > 20)
            {//definição do limite
                ExibeMensagemPopUp("Limite de imagens excedido. Máximo 20!");
            }
            else
            {
                string resultValidacao = validaAssinc(afuImg, txbNomeProd.Text);
                if (resultValidacao == "")
                {
                    lbImgs.Items.Add(txbNomeProd.Text + "_" + (lbImgs.Items.Count) + ".jpg");
                }
                else
                {
                    ExibeMensagemPopUp(resultValidacao);
                }
            }
        }

        /// <summary>
        /// Abre popup com as imagens inseridas para o produto
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgBtnVer_Click(object sender, ImageClickEventArgs e)
        {
            //popup com as imagens
            string jscript = "";
            jscript += "<script language='JavaScript'>";
            jscript += "window.open('ImagensProduto.aspx?idProd=" + ddlProdutos.SelectedValue.ToString() +
                                    "','','resizable=yes, menubar=no, scrollbars=yes, statusbar=yes, width=900, height=600, top=150, left=150')";
            jscript += "</script>";
            ClientScript.RegisterClientScriptBlock(GetType(), "cliente", jscript);
        }

    }
}
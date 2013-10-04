using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using testePMK.com.br.Banco;

namespace testePMK.com.br
{
    public partial class RetornoCompra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Valor somente para testes
            //this.RetornoPagSeguro1.UrlNPI = "http://localhost:9090/pagseguro-ws/checkout/NPI.jhtml";
            this.RetornoPagSeguro1.Token = "667D7FBD53F64E73836E592D189635B1";
        }

        protected void RetornoPagSeguro1_VendaEfetuada(UOL.PagSeguro.RetornoVenda retornoVenda)
        {
            //Atualizando na base de dados o status do pedido e as outras informações
            var atualizaVenda = new BdRetorno();
            var atualizaItensVenda = new BdRetorno();
            
            try
            {
                if (retornoVenda.Produtos.Count > 0)
                {
                    for (int i = 0; i < retornoVenda.Produtos.Count; i++)
                    {
                        atualizaItensVenda.IncluirProdutos(
                            retornoVenda.CodigoTransacao,
                            retornoVenda.Produtos[i].Codigo,
                            retornoVenda.Produtos[i].Descricao,
                            float.Parse(retornoVenda.Produtos[i].Frete.ToString()),
                            retornoVenda.Produtos[i].Peso,
                            retornoVenda.Produtos[i].Quantidade,
                            float.Parse(retornoVenda.Produtos[i].Valor.ToString()),
                            float.Parse(retornoVenda.Produtos[i].ValorExtra.ToString()));
                    }
                }

                atualizaVenda.Incluir(
                        retornoVenda.EmailVendedor.ToString(),
                        retornoVenda.CodigoTransacao.ToString(),
                        retornoVenda.CodigoReferencia.ToString(),
                        retornoVenda.TipoFrete.ToString(),
                        retornoVenda.Anotacao.ToString(),
                        retornoVenda.TipoPagamento.ToString(),
                        retornoVenda.StatusTransacao.ToString(),
                        retornoVenda.Cliente.Nome.ToString(),
                        retornoVenda.Cliente.Email.ToString(),
                        retornoVenda.Cliente.Endereco.ToString(),
                        retornoVenda.Cliente.Numero.ToString(),
                        retornoVenda.Cliente.ComplementoEndereco.ToString(),
                        retornoVenda.Cliente.Bairro.ToString(),
                        retornoVenda.Cliente.Cidade.ToString(),
                        retornoVenda.Cliente.Uf.ToString(),
                        retornoVenda.Cliente.Cep.ToString(),
                        retornoVenda.Cliente.Telefone.ToString(),                       
                        float.Parse(retornoVenda.ValorFrete.ToString()),                        
                        Convert.ToDateTime(retornoVenda.Data.ToString()),
                        DateTime.Now);               
            }
            catch (Exception ex)
            {

            }
        }

        protected void RetornoPagSeguro1_VendaNaoAutenticada(object sender, UOL.PagSeguro.VendaNaoAutenticadaEventArgs e)
        {
            //Aqui dispara quando o PagSeguro retorna algo diferente de verificado
        }

        protected void RetornoPagSeguro1_FalhaProcessarRetorno(object sender, UOL.PagSeguro.FalhaProcessarRetornoEventArgs e)
        {
            //Aqui dispara quando dá algum problema de parse nos dados
        }
        protected void imgBtnVoltar_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}
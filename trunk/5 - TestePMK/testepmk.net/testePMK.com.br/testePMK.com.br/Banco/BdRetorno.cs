using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

namespace testePMK.com.br.Banco
{
    public class BdRetorno
    {
        //variáveis de conexão e comandos para o banco
        private MySqlConnection conexao = null;
        private MySqlCommand comando = null;

        /// <summary>
        /// cria conexão com banco
        /// </summary>
        public BdRetorno()
        {
            //tenta conectar por 5 vezes  
            bool conectado = false;
            int cont = 0;

            while (conectado.Equals(false) &&
                cont < 5)
            {
                try
                {
                    cont++;
                    conexao = new MySqlConnection(ConfigurationManager.AppSettings["constr"]);
                    conexao.Open();

                    comando = new MySqlCommand();
                    comando = conexao.CreateCommand();
                    conectado = true;
                }
                catch (Exception)
                {
                    conectado = false;
                }
            }
        }

        //liberar recursos
        public void Dispose()
        {
            comando.Dispose();
            conexao.Dispose();
        }


        public void Incluir2(
            string VendedorEmail,
            string TransacaoID,
            string Referencia,
            string TipoFrete,
            string Anotacao,
            string TipoPagamento,
            string StatusTransacao,
            string CliNome,
            string CliEmail,
            string CliEndereco,
            string CliNumero,
            string CliComplemento,
            string CliBairro,
            string CliCidade,
            string CliEstado,
            string CliCEP,
            string CliTelefone,
            string ProdID_x,
            string ProdDescricao_x,
            int ProdQuantidade_x,
            int NumItens,
            int Parcelas,
            float Extras,
            float ValorFrete,
            float ProdValor_x,
            float ProdFrete_x,
            DateTime DataTransacao)
        {
            // criar um comando para executar a alteração / executar comando
            comando.CommandText = "INSERT INTO retorno " +
                "(VendedorEmail, TransacaoID, Referencia, TipoFrete, Anotacao, TipoPagamento, StatusTransacao, CliNome, " +
                "CliEmail, CliEndereco, CliNumero, CliComplemento, CliBairro, CliCidade, CliEstado, CliCEP, CliTelefone, " +
                "ProdID_x, ProdDescricao_x, ProdQuantidade_x, NumItens, Parcelas, Extras, ValorFrete, ProdValor_x, ProdFrete_x, DataTransacao) " +
                "VALUES (@VendedorEmail, @TransacaoID, @Referencia, @TipoFrete, Anotacao, @TipoPagamento, @StatusTransacao, @CliNome, " +
                "@CliEmail, @CliEndereco, @CliNumero, @CliComplemento, @CliBairro, @CliCidade, @CliEstado, @CliCEP, @CliTelefone, " +
                "@ProdID_x, @ProdDescricao_x, @ProdQuantidade_x, @NumItens, @Parcelas, @Extras, @ValorFrete, @ProdValor_x, @ProdFrete_x, @DataTransacao);";
            comando.Parameters.AddWithValue("@VendedorEmail", VendedorEmail);
            comando.Parameters.AddWithValue("@TransacaoID", TransacaoID);
            comando.Parameters.AddWithValue("@Referencia", Referencia);
            comando.Parameters.AddWithValue("@TipoFrete", TipoFrete);
            comando.Parameters.AddWithValue("@Anotacao", Anotacao);
            comando.Parameters.AddWithValue("@TipoPagamento", TipoPagamento);
            comando.Parameters.AddWithValue("@StatusTransacao", StatusTransacao);
            comando.Parameters.AddWithValue("@CliNome", CliNome);
            comando.Parameters.AddWithValue("@CliEmail", CliEmail);
            comando.Parameters.AddWithValue("@CliEndereco", CliEndereco);
            comando.Parameters.AddWithValue("@CliNumero", CliNumero);
            comando.Parameters.AddWithValue("@CliComplemento", CliComplemento);
            comando.Parameters.AddWithValue("@CliBairro", CliBairro);
            comando.Parameters.AddWithValue("@CliCidade", CliCidade);
            comando.Parameters.AddWithValue("@CliEstado", CliEstado);
            comando.Parameters.AddWithValue("@CliCEP", CliCEP);
            comando.Parameters.AddWithValue("@CliTelefone", CliTelefone);
            comando.Parameters.AddWithValue("@ProdID_x", ProdID_x);
            comando.Parameters.AddWithValue("@ProdDescricao_x", ProdDescricao_x);
            comando.Parameters.AddWithValue("@ProdQuantidade_x", ProdQuantidade_x);
            comando.Parameters.AddWithValue("@NumItens", NumItens);
            comando.Parameters.AddWithValue("@Parcelas", Parcelas);
            comando.Parameters.AddWithValue("@Extras", Extras);
            comando.Parameters.AddWithValue("@ValorFrete", ValorFrete);
            comando.Parameters.AddWithValue("@ProdValor_x", ProdValor_x);
            comando.Parameters.AddWithValue("@ProdFrete_x", ProdFrete_x);
            comando.Parameters.AddWithValue("@DataTransacao", DataTransacao);


            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();
        }

        /// <summary>
        /// carrega todos os pedidos de um determinado cliente
        /// </summary>
        /// <param name="email">email do cliente a ser consultado</param>
        /// <param name="ordem">ordem que será exibido os resultados</param>
        /// <returns></returns>
        public DataSet GetPedidosCliente2(string email, int ordem)
        {
            string orderBy = "";
            if (ordem == 2)
            {
                orderBy = " ORDER BY TransacaoID ASC";
            }
            else if (ordem == 3)
            {
                orderBy = " ORDER BY StatusTransacao ASC";
            }
            else if (ordem == 1)
            {
                orderBy = " ORDER BY DataTransacao DESC";
            }
            comando.CommandText = "SELECT id, VendedorEmail, TransacaoID, StatusTransacao, CliNome, CliEmail, ProdID_x, ProdDescricao_x, " +
                "ProdQuantidade_x, NumItens AS TOTAL_ITENS, ProdValor_x, ProdFrete_x, DataTransacao, TipoFrete " +
                "FROM retorno WHERE CliEmail = @CliEmail " + orderBy + ";";
            comando.Parameters.AddWithValue("@CliEmail", email);
            comando.CommandType = CommandType.Text;
            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;
        }

        public DataSet GetDadosVendas(DateTime de, DateTime ate)
        {
            comando.CommandText = "SELECT TransacaoID AS ID_VENDA, " +
                "DataTransacao AS DATA,  CliNome AS NOME_CLIENTE, ProdDescricao_x AS NOME_PRODUTO, " +
                "(ProdValor_x * ProdQuantidade_x) AS TOTAL_VENDA " +
                "FROM retorno " +
                "WHERE DataTransacao > @de AND DataTransacao < @ate;";
            comando.Parameters.AddWithValue("@de", de);
            comando.Parameters.AddWithValue("@ate", ate);

            comando.CommandType = CommandType.Text;

            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;

        }

        /// <summary>
        /// Inclui um produto
        /// </summary>
        /// <param name="TransacaoID"></param>
        /// <param name="ProdID_x"></param>
        /// <param name="ProdDescricao_x"></param>
        /// <param name="ProdFrete_x"></param>
        /// <param name="ProdPeso_x"></param>
        /// <param name="ProdQuantidade_x"></param>
        /// <param name="ProdValor_x"></param>
        /// <param name="ProdValorExtras"></param>
        public void IncluirProdutos(
            string TransacaoID,
            string ProdID_x,
            string ProdDescricao_x,
             float ProdFrete_x,
            int ProdPeso_x,
            int ProdQuantidade_x,
            float ProdValor_x,
           float ProdValorExtras)
        {
            comando.CommandText = "INSERT INTO itens_retorno " +
                "(TransacaoID, Codigo, Descricao, Frete, Peso, Quantidade, Valor, ValorExtra) " +
                "VALUES (@TransacaoID, @Codigo, @Descricao, @Frete, @Peso, @Quantidade, @Valor, @ValorExtra);";            
            comando.Parameters.AddWithValue("@TransacaoID", TransacaoID);
            comando.Parameters.AddWithValue("@Codigo", ProdID_x);
            comando.Parameters.AddWithValue("@Descricao", ProdDescricao_x);
            comando.Parameters.AddWithValue("@Frete", ProdFrete_x);
            comando.Parameters.AddWithValue("@Peso", ProdPeso_x);
            comando.Parameters.AddWithValue("@Quantidade", ProdQuantidade_x);
            comando.Parameters.AddWithValue("@Valor", ProdValor_x);
            comando.Parameters.AddWithValue("@ValorExtra", ProdValorExtras);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();
        }

        public void Incluir(
            string VendedorEmail,
            string TransacaoID,
            string Referencia,
            string TipoFrete,
            string Anotacao,
            string TipoPagamento,
            string StatusTransacao,
            string CliNome,
            string CliEmail,
            string CliEndereco,
            string CliNumero,
            string CliComplemento,
            string CliBairro,
            string CliCidade,
            string CliEstado,
            string CliCEP,
            string CliTelefone,                       
            float ValorFrete,            
            DateTime DataTransacao,
            DateTime DataUltimaAtualizacao)
        {
            // criar um comando para executar a alteração / executar comando
            comando.CommandText = "INSERT INTO retorno " +
                "(VendedorEmail, TransacaoID, Referencia, TipoFrete, Anotacao, TipoPagamento, StatusTransacao, CliNome, " +
                "CliEmail, CliEndereco, CliNumero, CliComplemento, CliBairro, CliCidade, CliEstado, CliCEP, CliTelefone, " +
                "ValorFrete, DataTransacao, DataUltimaAtualizacao) " +
                "VALUES (@VendedorEmail, @TransacaoID, @Referencia, @TipoFrete, Anotacao, @TipoPagamento, @StatusTransacao, @CliNome, " +
                "@CliEmail, @CliEndereco, @CliNumero, @CliComplemento, @CliBairro, @CliCidade, @CliEstado, @CliCEP, @CliTelefone, " +
                "@ValorFrete, @DataTransacao, @DataUltimaAtualizacao);";
            comando.Parameters.AddWithValue("@VendedorEmail", VendedorEmail);
            comando.Parameters.AddWithValue("@TransacaoID", TransacaoID);
            comando.Parameters.AddWithValue("@Referencia", Referencia);
            comando.Parameters.AddWithValue("@TipoFrete", TipoFrete);
            comando.Parameters.AddWithValue("@Anotacao", Anotacao);
            comando.Parameters.AddWithValue("@TipoPagamento", TipoPagamento);
            comando.Parameters.AddWithValue("@StatusTransacao", StatusTransacao);
            comando.Parameters.AddWithValue("@CliNome", CliNome);
            comando.Parameters.AddWithValue("@CliEmail", CliEmail);
            comando.Parameters.AddWithValue("@CliEndereco", CliEndereco);
            comando.Parameters.AddWithValue("@CliNumero", CliNumero);
            comando.Parameters.AddWithValue("@CliComplemento", CliComplemento);
            comando.Parameters.AddWithValue("@CliBairro", CliBairro);
            comando.Parameters.AddWithValue("@CliCidade", CliCidade);
            comando.Parameters.AddWithValue("@CliEstado", CliEstado);
            comando.Parameters.AddWithValue("@CliCEP", CliCEP);
            comando.Parameters.AddWithValue("@CliTelefone", CliTelefone);                        
            comando.Parameters.AddWithValue("@ValorFrete", ValorFrete);
            comando.Parameters.AddWithValue("@DataTransacao", DataTransacao);
            comando.Parameters.AddWithValue("@DataUltimaAtualizacao", DataUltimaAtualizacao);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();
        }

        /// <summary>
        /// carrega todos os pedidos de um determinado cliente
        /// </summary>
        /// <param name="email">email do cliente a ser consultado</param>
        /// <param name="ordem">ordem que será exibido os resultados</param>
        /// <returns></returns>
        public DataSet GetPedidosCliente(string email, int ordem)
        {
            string orderBy = "";
            if (ordem == 2)
            {
                orderBy = " ORDER BY TipoPagamento ASC";
            }
            else if (ordem == 3)
            {
                orderBy = " ORDER BY StatusTransacao ASC";
            }
            else if (ordem == 1)
            {
                orderBy = " ORDER BY DataTransacao DESC";
            }
            comando.CommandText = "SELECT transacaoID, DataTransacao, StatusTransacao, TipoPagamento " +
                "FROM retorno " +
                "WHERE CliEmail = @CliEmail " +
                "AND dataUltimaAtualizacao IN (SELECT MAX(dataUltimaAtualizacao) " +
                "FROM retorno " +
                "WHERE CliEmail = @CliEmail " +
                "GROUP BY TransacaoID) " +
                "GROUP BY TransacaoID " + orderBy + ";";
            comando.Parameters.AddWithValue("@CliEmail", email);
            comando.CommandType = CommandType.Text;
            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;
        }

        /// <summary>
        /// Itens de um pedido em especifico
        /// </summary>
        /// <param name="TransacaoID">id da transação que contem os itens a serem retornados</param>
        /// <returns>dataset com os itens do pedido</returns>
        public DataSet carregaDetalhesRetornoItens(string TransacaoID)
        {
            comando.CommandText = "SELECT Descricao, Codigo, Quantidade, Valor " +
                "FROM itens_retorno " +
                "WHERE TransacaoID = @TransacaoID;";
            comando.Parameters.AddWithValue("@TransacaoID", TransacaoID);
            comando.CommandType = CommandType.Text;

            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;
        }

        /// <summary>
        /// Detalhes da transação 
        /// </summary>
        /// <param name="TransacaoID">id da transação</param>
        /// <returns>dataSet com os detalhes da transação</returns>
        public DataSet carregaDetalhesRetornoTransact(string TransacaoID, string emailCLi)
        {
            comando.CommandText = "SELECT CliCEP, CliNome, DataTransacao, DataUltimaAtualizacao, StatusTransacao, TipoPagamento, TransacaoID, CliTelefone " +
                "FROM retorno " +
                "WHERE CliEmail = @CliEmail " +
                "AND dataUltimaAtualizacao IN (SELECT MAX(dataUltimaAtualizacao) " +
                "FROM retorno " +
                "WHERE CliEmail = @CliEmail " +
                "GROUP BY TransacaoID) " +
                "GROUP BY TransacaoID ";
            comando.Parameters.AddWithValue("@TransacaoID", TransacaoID);
            comando.Parameters.AddWithValue("@CliEmail", emailCLi);
            comando.CommandType = CommandType.Text;

            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;
        }
    }
}
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
            //abrir conexão com banco  
            conexao = new MySqlConnection(ConfigurationSettings.AppSettings["constr"]);
            conexao.Open();

            //executar a inclusão
            comando = new MySqlCommand();
            comando = conexao.CreateCommand();
        }

        //liberar recursos
        public void Dispose()
        {
            comando.Dispose();
            conexao.Dispose();
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
                "VALUES ('@VendedorEmail', '@TransacaoID', '@Referencia', '@TipoFrete', '@Anotacao', '@TipoPagamento', '@StatusTransacao', '@CliNome', " +
                "'@CliEmail', '@CliEndereco', '@CliNumero', '@CliComplemento', '@CliBairro', '@CliCidade', '@CliEstado', '@CliCEP', '@CliTelefone', " +
                "'@ProdID_x', '@ProdDescricao_x', @ProdQuantidade_x, @NumItens, @Parcelas, @Extras, @ValorFrete, @ProdValor_x, @ProdFrete_x, '@DataTransacao');";
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
    }
}
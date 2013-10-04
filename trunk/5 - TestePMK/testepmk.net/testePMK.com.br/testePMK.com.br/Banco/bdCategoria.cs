using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

namespace testePMK.com.br.Banco
{
    public class bdCategoria
    {
        //variáveis de conexão e comandos para o banco
        private MySqlConnection conexao = null;
        private MySqlCommand comando = null;

        /// <summary>
        /// cria conexão com banco
        /// </summary>
        public bdCategoria()
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

        /// <summary>
        /// lista todas as categorias
        /// </summary>
        /// <returns>dataSet com os dados das categorias cadastradas</returns>
        public DataSet Listar()
        {
            comando.CommandText = "SELECT ID, NOME, DESCRICAO FROM categoria;";
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;
        }

        /// <summary>
        /// lista todas as categorias
        /// </summary>
        /// <returns>dataSet com os dados das categorias cadastradas</returns>
        public DataSet Listar(int idCategoria)
        {
            comando.CommandText = "SELECT ID, NOME, DESCRICAO FROM categoria WHERE ID = @idCategoria;";
            comando.Parameters.AddWithValue("@idCategoria", idCategoria);
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;
        }

        /// <summary>
        /// atualiza uma categoria  
        /// </summary>
        /// <param name="nome"></param>
        /// <param name="descricao"></param>
        /// <param name="id"></param>
        public void Alterar(
           string nome,
           string descricao,
            int id)
        {
            // criar um comando para executar a alteração / executar comando
            comando.CommandText = "UPDATE categoria SET NOME = @nome, DESCRICAO = @descricao " +
                "WHERE ID = @id";

            comando.Parameters.AddWithValue("@nome", nome);
            comando.Parameters.AddWithValue("@descricao", descricao);
            comando.Parameters.AddWithValue("@id", id);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();
        }

        /// <summary>
        /// cadastra uma categoria
        /// </summary>
        /// <param name="nome"></param>
        /// <param name="descricao"></param>
        public void Inserir(
          string nome,
          string descricao)
        {
            // criar um comando para executar a alteração / executar comando
            comando.CommandText = "INSERT INTO categoria (NOME, DESCRICAO) " +
                "VALUES (@nome, @descricao);";

            comando.Parameters.AddWithValue("@nome", nome);
            comando.Parameters.AddWithValue("@descricao", descricao);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();
        }

        /// <summary>
        /// exclui uma categoria 
        /// </summary>
        /// <param name="id"></param>
        public void Excluir(int id)
        {
            // criar um comando para executar a alteração / executar comando
            comando.CommandText = "DELETE FROM categoria " +
                "WHERE ID = @id";
            comando.Parameters.AddWithValue("@id", id);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();
        }

        /// <summary>
        /// VALIDA SE JÁ EXISTE CATEGORIA COM ESSE NOME
        /// </summary>
        /// <param name="nomeCategoria"></param>
        /// <returns>true se não existir o nome, false se existir</returns>
        public bool ValidaExistencia(string nomeCategoria, int codCategoria)
        {
            int idCat;
            bool categoriaOK = true;
            comando.CommandText = "SELECT NOME, ID FROM categoria WHERE NOME = @nomeCategoria;";
            comando.Parameters.Add(new MySqlParameter("@nomeCategoria", nomeCategoria));

            object resultadoBusca = comando.ExecuteScalar();
            if (resultadoBusca != null)
            {
                // Classe que auxilia no preenchimento de um dataset
                MySqlDataAdapter adap = new MySqlDataAdapter(comando);

                DataSet retorno = new DataSet();
                adap.Fill(retorno);

                // Cria uma instância da classe DataRow para receber uma linha do DataSet.
                DataRow dr = retorno.Tables[0].Rows[0];

                //Inicializa os campos da tela com os valores do DataRow.
                idCat = Convert.ToInt32(dr["ID"].ToString());

                if (idCat != codCategoria || codCategoria == -1)
                {
                    categoriaOK = false;
                }
            }
            return categoriaOK;

        }

    }
}
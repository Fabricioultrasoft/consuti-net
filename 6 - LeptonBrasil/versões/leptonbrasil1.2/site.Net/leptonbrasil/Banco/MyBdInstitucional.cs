using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;

namespace leptonbrasil.Banco
{
    public class MyBdInstitucional
    {
        /// <summary>
        /// Variável de conexão com o banco de dados.
        /// </summary>
        private MySqlConnection conexao = null;

        /// <summary>
        ///Variável para realizar comandos no banco de dados.
        /// </summary>
        private MySqlCommand comando = null;

        /// <summary>
        /// Cria conexão com o bando de dados.
        /// </summary>
        public MyBdInstitucional()
        {//tenta conectar por 5 vezes  
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

        /// <summary>
        /// Responsável por liberar os recursos.
        /// </summary>
        public void Dispose()
        {
            comando.Dispose();
            conexao.Dispose();
        }

        /// <summary>
        /// Atualiza os valores para a tela de Serviços
        /// </summary>
        /// <param name="user">email/login do usuário que atualizou os dados</param>
        /// <param name="dataAtualiza">Data da atualização dos dados</param>
        /// <param name="titulo">titulo novo</param>
        /// <param name="textoHTML">texto novo</param>
        /// <returns>true se atualziado com sucesso, false otherwise</returns>
        public bool atualizaDadosTela(
            string autor,
            DateTime dataAtualiza,
            string titulo,
            string textoHTML)
        {
            bool retorno = true;
            // criar um comando para executar a alteração / executar comando
            comando.CommandText = "UPDATE institucional " +
                "SET data = @dataAtualiza, titulo = @titulo, texto = @textoHTML, autor = @autor " +
                "WHERE id = 1;";

            comando.Parameters.AddWithValue("@dataAtualiza", dataAtualiza);
            comando.Parameters.AddWithValue("@titulo", titulo);
            comando.Parameters.AddWithValue("@textoHTML", textoHTML);
            comando.Parameters.AddWithValue("@autor", autor);

            comando.CommandType = System.Data.CommandType.Text;
            try
            {
                comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                retorno = false;
            }
            return retorno;
        }

        /// <summary>
        /// Obtem e retorna os dados cadastrados no banco para a tela
        /// </summary>
        /// <returns>data set que contém os dados </returns>
        public DataSet obtemDados()
        {
            comando.CommandText = "SELECT id, data, titulo, texto, autor " +
                "FROM institucional WHERE id= 1;";
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;

        }

    }
}
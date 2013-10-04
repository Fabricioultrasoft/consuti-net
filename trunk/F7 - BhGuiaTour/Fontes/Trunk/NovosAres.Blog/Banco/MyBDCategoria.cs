namespace NovosAres.Blog.Banco
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using MySql.Data.MySqlClient;
    using System.Configuration;
    using System.Data;

    public class MyBDCategoria
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
        public MyBDCategoria()
        {
            conexao = new MySqlConnection(ConfigurationManager.AppSettings["constr"]);
            conexao.Open();

            comando = new MySqlCommand();
            comando = conexao.CreateCommand();
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
        /// Recupera as categorias do banco
        /// </summary>
        /// <returns>dataset com as categorias</returns>
        public DataSet GetCategorias()
        {
            comando.CommandText = "SELECT ID, Nome FROM categoriapost;";
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;
        }
    }
}
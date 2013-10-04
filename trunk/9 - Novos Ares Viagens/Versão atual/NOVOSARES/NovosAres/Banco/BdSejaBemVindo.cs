namespace NovosAres.Blog
{
    using System;
    using System.Collections.Generic;
    using System.Configuration;
    using System.Data;
    using System.Data.SqlClient;
    using System.Linq;
    using System.Web;
    using MySql.Data.MySqlClient;

    public class BdSejaBemVindo
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
        public BdSejaBemVindo()
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
        /// Realiza o cadastro do conteúdo da tela "Seja Bem Vindo."
        /// </summary>
        /// <param name="titulo">Título da página.</param>
        /// <param name="descricao">Conteúdo da página.</param>        
        public void CadastrarMensagemSejaBemVindo(string titulo, string descricao)
        {
            comando.CommandText = "INSERT INTO SEJABEMVINDO (Titulo, Descricao) VALUES (@TITULO, @DESCRICAO)";
            comando.Parameters.AddWithValue("@TITULO", titulo);
            comando.Parameters.Add(new MySqlParameter("@DESCRICAO", descricao));
            comando.CommandType = CommandType.Text;
            comando.ExecuteNonQuery();
        }

        /// <summary>
        /// Método responsável por realizar a atualização da tela Seja Bem Vindo.
        /// </summary>
        /// <param name="novaDescricao">Texto que será exibido na tela.</param>
        /// <param name="novoTitulo">Novo título da tela.</param>        
        public void AtualizarSejaBemVindo(string novoTitulo,
            string novaDescricao)
        {
            comando.CommandText = "UPDATE sejabemvindo SET " +
                "Titulo = @novoTitulo, Descricao = @novaDescricao";
            comando.Parameters.AddWithValue("@novoTitulo", novoTitulo);
            comando.Parameters.AddWithValue("@novaDescricao", novaDescricao);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();
        }

        /// <summary>
        /// Recupera as informações cadastradas para a página "Antes de Viajar".
        /// </summary>        
        /// <returns>DataSet com as informações do pais.</returns>
        public DataSet RecuperaDadosSejaBemVindo()
        {
            comando.CommandText = "SELECT ID, Descricao, Titulo FROM sejabemvindo";
            comando.CommandType = CommandType.Text;

            MySqlDataAdapter mySqlAdapter = new MySqlDataAdapter(comando);

            DataSet sejaBemVindo = new DataSet();
            mySqlAdapter.Fill(sejaBemVindo);

            return sejaBemVindo;
        }
    }
}
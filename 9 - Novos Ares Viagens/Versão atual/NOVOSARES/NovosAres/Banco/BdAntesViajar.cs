namespace NovosAres.Blog
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using MySql.Data.MySqlClient;
    using System.Configuration;
    using System.Data;

    public class BdAntesViajar
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
        public BdAntesViajar()
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
        /// <param name="caminhoArquivo">Caminho onde o manual será salvo.</param>
        public void CadastrarAntesDeViajar(string titulo, string descricao, string caminhoArquivo)
        {
            comando.CommandText = "INSERT INTO ANTESDEVIAJAR (Titulo, Descricao, CaminhoArquivo) VALUES (@TITULO, @DESCRICAO, @CAMINHOARQUIVO)";
            comando.Parameters.AddWithValue("@TITULO", titulo);
            comando.Parameters.AddWithValue("@CAMINHOARQUIVO", caminhoArquivo);
            comando.Parameters.Add(new MySqlParameter("@DESCRICAO", descricao));
            comando.CommandType = CommandType.Text;
            comando.ExecuteNonQuery();
        }

        /// <summary>
        /// Método responsável por realizar a atualização da tela Antes de Viajar.
        /// </summary>
        /// <param name="novaDescricao">Texto que será exibido na tela Antes de Viajar.</param>
        /// <param name="novoTitulo">Novo título da tela Antes de Viajar.</param>        
        public void AtualizarAntesDeViajar(string novoTitulo,
            string novaDescricao)
        {
            comando.CommandText = "UPDATE ANTESDEVIAJAR SET " +
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
        public DataSet RecuperaDadosAntesDeViajar()
        {
            comando.CommandText = "SELECT ID, Descricao, CaminhoArquivo, Titulo FROM ANTESDEVIAJAR";
            comando.CommandType = CommandType.Text;

            MySqlDataAdapter mySqlAdapter = new MySqlDataAdapter(comando);

            DataSet antesDeViajar = new DataSet();
            mySqlAdapter.Fill(antesDeViajar);

            return antesDeViajar;
        }
    }
}
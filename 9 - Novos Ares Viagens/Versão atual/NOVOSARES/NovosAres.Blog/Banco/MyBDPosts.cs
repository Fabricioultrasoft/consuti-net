using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;

namespace NovosAres.Blog.Banco
{
    public class MyBDPosts
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
        public MyBDPosts()
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
        /// recupera do banco a quantidade de posts de acordo com o parâmetro enviado
        /// </summary>
        /// <param name="qtdPosts">quantidade de post a ser retornada</param>
        /// <returns>dataset com os registros recuperados de post</returns>
        public DataSet RecuperaPosts(int qtdPosts)
        {
            comando.CommandText = "SELECT ID, IdCategoriaPost, TituloPost, TextoPost, DATE_FORMAT(DataPost, '%d.%m.%Y') AS DataPost, LocalPost " +
                "FROM blog ORDER BY DataPost DESC LIMIT @qtdPosts;";
            comando.Parameters.Add(new MySqlParameter("@qtdPosts", qtdPosts));
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;
        }

        /// <summary>
        /// Método que retorna um post a partir do id
        /// </summary>
        /// <param name="id">id do post pesquisado</param>
        /// <returns>dataset com os dados do post</returns>
        public DataSet RecuperaPost(string id)
        {
            comando.CommandText = "SELECT ID, IdCategoriaPost, TituloPost, TextoPost, DATE_FORMAT(DataPost, '%d.%m.%Y') AS DataPost, LocalPost " +
                "FROM blog WHERE ID = @id";
            comando.Parameters.Add(new MySqlParameter("@id", id));
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;
        }

        /// <summary>
        /// busca os posts com a palavra solicitada na busca
        /// </summary>
        /// <param name="palavraBusca">palavra buscada</param>
        /// <returns>dataSet com os itens resultado da busca</returns>
        public DataSet RecuperaPostsBusca(string palavraBusca)
        {
            comando.CommandText = "SELECT ID, IdCategoriaPost, TituloPost, TextoPost, DATE_FORMAT(DataPost, '%d.%m.%Y') AS DataPost, LocalPost " +
                "FROM blog WHERE TituloPost LIKE @palavraBusca ORDER BY DataPost DESC";
            comando.Parameters.Add(new MySqlParameter("@palavraBusca", "%" + palavraBusca + "%"));
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;
        }

        /// <summary>
        /// Retorna os posts que estão dentro da categoria solicitada
        /// </summary>
        /// <param name="idCategoria">id da categoria</param>
        /// <returns>dados dos posts da categoria solicitada</returns>
        public DataSet RecuperaPostsBuscaCategoria(string idCategoria)
        {
            comando.CommandText = "SELECT b.ID, b.IdCategoriaPost, b.TituloPost, b.TextoPost, DATE_FORMAT(b.DataPost, '%d.%m.%Y') AS DataPost, b.LocalPost " +
                "FROM blog b JOIN categoriapost c ON b.IdCategoriaPost = c.ID WHERE c.ID = @categoria;";
            comando.Parameters.Add(new MySqlParameter("@categoria", idCategoria));
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;
        }

        /// <summary>
        /// cadastra o post no banco
        /// </summary>
        /// <param name="IdCategoriaPost"></param>
        /// <param name="LocalPost"></param>
        /// <param name="TituloPost"></param>
        /// <param name="TextoPost"></param>
        /// <param name="DataPost"></param>
        /// <returns>true se cadastrou corretamente, false otherwise</returns>
        public bool CadastrarPost(
            int IdCategoriaPost,
            string LocalPost,
            string TituloPost,
            string TextoPost,
            DateTime DataPost)
        {
            bool retorno = false;
            comando.CommandText = "INSERT INTO blog (IdCategoriaPost, TituloPost, TextoPost, DataPost, LocalPost) " +
                "VALUES (@IdCategoriaPost, @TituloPost, @TextoPost, @DataPost, @LocalPost);";
            comando.Parameters.AddWithValue("@IdCategoriaPost", IdCategoriaPost);
            comando.Parameters.AddWithValue("@LocalPost", LocalPost);
            comando.Parameters.AddWithValue("@TituloPost", TituloPost);
            comando.Parameters.AddWithValue("@TextoPost", TextoPost);
            comando.Parameters.AddWithValue("@DataPost", DataPost);

            try
            {
                comando.CommandType = CommandType.Text;
                comando.ExecuteNonQuery();
                retorno = true;
            }
            catch (Exception ex)
            {
                throw;
            }
            return retorno;
        }

    }
}
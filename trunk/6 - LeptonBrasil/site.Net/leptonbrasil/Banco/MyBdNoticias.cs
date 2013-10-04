using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;


namespace leptonbrasil.Banco
{
    public class MyBdNoticias
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
        public MyBdNoticias()
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

        /// <summary>
        /// Responsável por liberar os recursos.
        /// </summary>
        public void Dispose()
        {
            comando.Dispose();
            conexao.Dispose();
        }

        /// <summary>
        /// recupera todos os post de noticias do banco
        /// </summary>
        /// <returns>dataSet com os posts</returns>
        public DataSet RecuperaTodosPostsTela()
        {
            comando.CommandText = "SELECT id, DATE_FORMAT(data, '%d.%m.%Y') AS data, titulo, texto, autor " +
                "FROM noticias ORDER BY data DESC;";
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;
        }

        /// <summary>
        /// recupera todos os post de noticias do banco
        /// </summary>
        /// <returns>dataSet com os posts</returns>
        public DataSet RecuperaTodosPosts()
        {
            comando.CommandText = "SELECT id, data, titulo, texto, autor " +
                "FROM noticias ORDER BY data DESC;";
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;
        }

        /// <summary>
        /// recupera um determinado post
        /// </summary>
        /// <param name="id">id do post a ser recuperado</param>
        /// <returns>data set contendo o post</returns>
        public DataSet RecuperaPost(int id)
        {
            comando.CommandText = "SELECT id, data, titulo, texto, autor " +
                "FROM noticias WHERE id=@id;";
            comando.Parameters.Add(new MySqlParameter("@id", id));
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;
        }

        /// <summary>
        /// cadastra um post de notícia no banco
        /// </summary>
        /// <param name="autor">autor do post</param>
        /// <param name="data">data do post</param>
        /// <param name="texto">texto do post</param>
        /// <param name="titulo">titulo do post</param>
        /// <returns>true se cadastrado com sucesso, false caso contrário</returns>
        public bool CadastraPost(string autor,
            DateTime data,
            string texto,
            string titulo)
        {
            bool retorno = false;
            comando.CommandText = "INSERT INTO noticias " +
                "(data, titulo, texto, autor) " +
                "VALUES (@data, @titulo, @texto, @autor);";
            comando.Parameters.AddWithValue("@data", data);
            comando.Parameters.AddWithValue("@titulo", titulo);
            comando.Parameters.AddWithValue("@texto", texto);
            comando.Parameters.AddWithValue("@autor", autor);

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

        /// <summary>
        /// Exclui um post do banco
        /// </summary>
        /// <param name="id">id do post a ser excluido</param>
        /// <returns>true se excluido com sucesso, false caso não consiga excluir</returns>
        public bool ExcluirPost(int id)
        {
            bool retorno = true;
            try
            {
                comando.CommandText = "DELETE FROM noticias " +
                    "WHERE id = @id;";
                comando.Parameters.AddWithValue("@id", id);
                comando.CommandType = System.Data.CommandType.Text;
                comando.ExecuteNonQuery();
            }
            catch (Exception)
            {
                retorno = false;
            }
            return retorno;
        }

        /// <summary>
        /// altera um post no banco
        /// </summary>
        /// <param name="autor">novo autor</param>        
        /// <param name="texto">novo texto</param>
        /// <param name="titulo">novo titulo</param>
        /// <param name="id">id do post que será alterado</param>
        /// <returns>true se alterado com sucesso, false caso contrário</returns>
        public bool AlterarPost(string autor,
            string texto,
            string titulo,
            int id)
        {
            bool retorno = false;
            comando.CommandText = "UPDATE noticias " +
                "SET titulo = @titulo, texto = @texto, autor = @autor " +
                "WHERE id = @id;";
            comando.Parameters.AddWithValue("@titulo", titulo);
            comando.Parameters.AddWithValue("@texto", texto);
            comando.Parameters.AddWithValue("@autor", autor);
            comando.Parameters.AddWithValue("@id", id);

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
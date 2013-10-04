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
    using System.Collections;

    public class BdDestinos
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
        public BdDestinos()
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
        /// Recupera todos os continentes cadastrados na base de dados.
        /// </summary>
        /// <returns>Lista com os continentes.</returns>
        public DataSet RuperarContinentes()
        {
            comando.CommandText = "SELECT ID, NOME FROM CONTINENTE";
            comando.CommandType = CommandType.Text;
            MySqlDataAdapter mySql = new MySqlDataAdapter(comando);
            DataSet ds = new DataSet();
            mySql.Fill(ds);
            return ds;
        }

        /// <summary>
        /// Recupera todos os paises cadastrados na base que fazem parte de um determinado continente.
        /// </summary>
        /// <param name="idContinente">Id do continente selecionado.</param>
        /// <returns>DataSet de países.</returns>
        public DataSet RecuperarPaisesPeloIdDoContinente(int idContinente)
        {
            comando.CommandText = "SELECT ID, NOME FROM PAIS WHERE IDCONTINENTE = @idContinente";
            comando.Parameters.Add(new MySqlParameter("@idContinente", idContinente));
            MySqlDataAdapter mySql = new MySqlDataAdapter(comando);
            DataSet ds = new DataSet();
            mySql.Fill(ds);
            return ds;
        }

        /// <summary>
        /// Recupera todos as cidades cadastradas na base que fazem parte de um determinado país.
        /// </summary>
        /// <param name="idPais">Id do país selecionado.</param>
        /// <returns>DataSet de cidades.</returns>
        public DataSet RecuperarCidadesPeloIdDoPais(int idPais)
        {
            comando.CommandText = "SELECT ID, NOME FROM CIDADE WHERE IDPAIS = @idPais";
            comando.Parameters.Add(new MySqlParameter("@idPais", idPais));
            MySqlDataAdapter mySql = new MySqlDataAdapter(comando);
            DataSet ds = new DataSet();
            mySql.Fill(ds);
            return ds;
        }

        /// <summary>
        /// Método responsável por realizar o cadastro dos destinos.
        /// </summary>
        /// <param name="descridoDoDestino">Descrição do destino.</param>
        /// <param name="idCidade">ID da cidade de destino.</param>
        /// <param name="idContinente">ID do continente de destino.</param>
        /// <param name="idPais">ID do país de destino.</param>
        /// <param name="linkGoogleMapsDestino">Link gerado pelo google maps da cidade de destino.</param>
        /// <param name="linkPostBlogDestino">Link para post no blog sobre a cidade de destino.</param>
        /// <param name="nomeDestino">Nome do destino.</param>
        /// <returns>ID do destino cadastrado.</returns>
        public int CadastrarDestino(string nomeDestino,
            int idCidade,
            int idContinente,
            int idPais,
            string descridoDoDestino,
            string linkPostBlogDestino,
            string linkGoogleMapsDestino)
        {
            comando.CommandText = "INSERT INTO DESTINOS " +
                "(IDCIDADE, IDCONTINENTE, IDPAIS, NOME, DESCRICAO, LINKPOSTBLOG, LINKGOOGLEMAPS) " +
                "VALUES (@idCidade, @idContinente, @idPais, @nomeDestino, @descricaoDestino, @linkPostBlogDestino, @linkGoogleMapsDestino)";
            comando.Parameters.AddWithValue("@nomeDestino", nomeDestino);
            comando.Parameters.AddWithValue("@idCidade", idCidade);
            comando.Parameters.AddWithValue("@idContinente", idContinente);
            comando.Parameters.AddWithValue("@idPais", idPais);
            comando.Parameters.AddWithValue("@descricaoDestino", descridoDoDestino);
            comando.Parameters.AddWithValue("@linkPostBlogDestino", linkPostBlogDestino);
            comando.Parameters.AddWithValue("@linkGoogleMapsDestino", linkGoogleMapsDestino);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();

            comando.CommandText = "SELECT LAST_INSERT_ID()";
            int idDestino = int.Parse(comando.ExecuteScalar().ToString());

            return idDestino;
        }

        /// <summary>
        /// Método responsável por realizar o cadastro das imagens.
        /// </summary>
        /// <param name="nomeDasImagens">ArrayList das imagens.</param>
        public void CadastrarImagens(ArrayList nomeDasImagens,
            int idDestino)
        {
            string nomeImagem = string.Empty;

            for (int i = 0; i < nomeDasImagens.Count; i++)
            {
                nomeImagem = nomeDasImagens[i].ToString();

                comando.CommandText = "INSERT INTO imagensdestinos (NomeImagem, IdDestino) VALUES (@nomeImagem" + i + ", @idDestino" + i + ")";

                comando.Parameters.AddWithValue("@nomeImagem" + i, nomeImagem);
                comando.Parameters.AddWithValue("@idDestino" + i, idDestino);

                comando.CommandType = System.Data.CommandType.Text;
                comando.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// Método responsável por realizar o atualizar o nome das imagens.
        /// </summary>
        /// <param name="idDestino">ID do destino.</param>
        public void DeletaImagens(int idDestino)
        {
            comando.CommandText = "DELETE FROM imagensdestinos WHERE IdDestino = @idDestinoImagens";

            comando.Parameters.AddWithValue("@idDestinoImagens", idDestino);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();

        }

        /// <summary>
        /// Recupera todos os destinos cadastrados.
        /// </summary>
        /// <returns>DataSet com todos os destinos cadastrados.</returns>
        public DataSet RecuperaTodosDestinosCadastrados()
        {
            comando.CommandText = "SELECT ID, IdCidade, Nome, Descricao, LinkPostBlog, LinkGoogleMaps " +
                "FROM destinos " +
                "ORDER BY Nome ASC";
            comando.CommandType = CommandType.Text;

            MySqlDataAdapter mySqlAdapter = new MySqlDataAdapter(comando);

            DataSet destinosCadastrados = new DataSet();
            mySqlAdapter.Fill(destinosCadastrados);

            return destinosCadastrados;
        }

        /// <summary>
        /// Recupera destino pelo ID.
        /// </summary>
        /// <param name="idDestino">ID do destino a ser recuperado.</param>
        /// <returns>DataSet com os dados do destino.</returns>
        public DataSet RecuperaDestinoPeloID(int idDestino)
        {
            comando.CommandText = "SELECT ID, IdContinente, IdPais, IdCidade, Nome, Descricao, LinkPostBlog, LinkGoogleMaps " +
                "FROM destinos " +
                "WHERE ID = @idDestino";
            comando.Parameters.AddWithValue("@idDestino", idDestino);
            comando.CommandType = CommandType.Text;

            MySqlDataAdapter mySqlAdapter = new MySqlDataAdapter(comando);

            DataSet destinos = new DataSet();
            mySqlAdapter.Fill(destinos);

            return destinos;
        }

        /// <summary>
        /// Recupera as informações de uma cidade de acordo com o ID informado.
        /// </summary>
        /// <param name="idCidade">ID da cidade.</param>
        /// <returns>DataSet com as informações da cidade.</returns>
        public DataSet RecuperaCidadePeloId(int idCidade)
        {
            comando.CommandText = "SELECT ID, Nome, IdPais FROM cidade WHERE ID = @idCidade";
            comando.Parameters.AddWithValue("@idCidade", idCidade);
            comando.CommandType = CommandType.Text;

            MySqlDataAdapter mySqlAdapter = new MySqlDataAdapter(comando);

            DataSet cidade = new DataSet();
            mySqlAdapter.Fill(cidade);

            return cidade;
        }

        /// <summary>
        /// Recupera as informações de um pais de acordo com o ID informado.
        /// </summary>
        /// <param name="idPais">ID do país.</param>
        /// <returns>DataSet com as informações do pais.</returns>
        public DataSet RecuperaPaisPeloId(int idPais)
        {
            comando.CommandText = "SELECT ID, Nome, IdContinente FROM pais WHERE ID = @idPais";
            comando.Parameters.AddWithValue("@idPais", idPais);
            comando.CommandType = CommandType.Text;

            MySqlDataAdapter mySqlAdapter = new MySqlDataAdapter(comando);

            DataSet pais = new DataSet();
            mySqlAdapter.Fill(pais);

            return pais;
        }

        /// <summary>
        /// Recupera as informações de um continente de acordo com o ID informado.
        /// </summary>
        /// <param name="idContinente">ID do continente.</param>
        /// <returns>DataSet com as informações do continente.</returns>
        public DataSet RecuperaContinentePeloId(int idContinente)
        {
            comando.CommandText = "SELECT ID, Nome FROM continente WHERE ID = @idContinente";
            comando.Parameters.AddWithValue("@idContinente", idContinente);
            comando.CommandType = CommandType.Text;

            MySqlDataAdapter mySqlAdapter = new MySqlDataAdapter(comando);

            DataSet continente = new DataSet();
            mySqlAdapter.Fill(continente);

            return continente;
        }

        /// <summary>
        /// Método responsável por realizar a atualização do destino.
        /// </summary>
        /// <param name="descridoDoDestino">Descrição do destino.</param>
        /// <param name="idCidade">ID da cidade de destino.</param>
        /// <param name="idPais">ID do país de destino.</param>
        /// <param name="idContinente">ID do continente de destino.</param>
        /// <param name="linkGoogleMapsDestino">Link gerado pelo google maps da cidade de destino.</param>
        /// <param name="linkPostBlogDestino">Link para post no blog sobre a cidade de destino.</param>
        /// <param name="nomeDestino">Nome do destino.</param>
        /// <param name="idDestino">ID do destino a ser atualizado.</param>
        public void AtualizarDestino(string nomeDestino,
            int idCidade,
            int idPais,
            int idContinente,
            string descridoDoDestino,
            string linkPostBlogDestino,
            string linkGoogleMapsDestino,
            int idDestino)
        {
            comando.CommandText = "UPDATE destinos SET " +
                "IdCidade = @idCidade, IdContinente = @idContinente, IdPais = @idPais, Nome = @novoNomeDestino, Descricao = @descricaoDestino, LinkPostBlog = @linkPostBlogDestino, LinkGoogleMaps = @linkGoogleMapsDestino " +
                "WHERE ID = @idDestinoASerAlterado";
            comando.Parameters.AddWithValue("@novoNomeDestino", nomeDestino);
            comando.Parameters.AddWithValue("@idCidade", idCidade);
            comando.Parameters.AddWithValue("@idPais", idPais);
            comando.Parameters.AddWithValue("@idContinente", idContinente);
            comando.Parameters.AddWithValue("@descricaoDestino", descridoDoDestino);
            comando.Parameters.AddWithValue("@linkPostBlogDestino", linkPostBlogDestino);
            comando.Parameters.AddWithValue("@linkGoogleMapsDestino", linkGoogleMapsDestino);
            comando.Parameters.AddWithValue("@idDestinoASerAlterado", idDestino);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();
        }

        /// <summary>
        /// Realiza a exclusão de um destino.
        /// </summary>
        /// <param name="idDestino">ID do destino a ser excluído.</param>
        public void ExcluirDestino(int idDestino)
        {
            comando.CommandText = "DELETE FROM destinos WHERE ID = @idDestino";
            comando.Parameters.AddWithValue("@idDestino", idDestino);
            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();

            comando.CommandText = "DELETE FROM imagensdestinos WHERE ID = @idDestinoImagem";
            comando.Parameters.AddWithValue("@idDestinoImagem", idDestino);
            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();
        }

        /// <summary>
        /// Valida se já existe um destino cadastrado com o nome informado.
        /// </summary>
        /// <param name="nomeDestino">Nome do destino a ser verificado.</param>
        /// <param name="idDestino">ID do destino a ser verificado.</param>
        /// <returns><b>TRUE</b>caso não exista um produto com o mesmo nome, caso contrário,<b>FALSE</b></returns>
        public bool ValidaSeODestinoJaEstaCadastrado(string nomeDestino, int idDestino)
        {
            bool naoExisteDestinoComEsteNome = false;

            comando.CommandText = "SELECT Nome FROM destinos WHERE ID = @idDestino AND Nome = @nomeDestino";
            comando.Parameters.Add(new MySqlParameter("@nomeDestino", nomeDestino));
            comando.Parameters.Add(new MySqlParameter("@idDestino", idDestino));

            object resultado = comando.ExecuteScalar();

            if (resultado == null)
            {
                naoExisteDestinoComEsteNome = true;
            }

            return naoExisteDestinoComEsteNome;
        }

        /// <summary>
        /// Valida se já existe um destino cadastrado com o nome informado.
        /// </summary>
        /// <param name="nomeDestino">Nome do destino a ser verificado.</param>
        /// <returns><b>TRUE</b>caso não exista um produto com o mesmo nome, caso contrário,<b>FALSE</b></returns>
        public bool ValidaSeODestinoJaEstaCadastrado(string nomeDestino)
        {
            bool naoExisteDestinoComEsteNome = false;

            comando.CommandText = "SELECT Nome FROM destinos WHERE Nome = @nomeDestinoInformado";
            comando.Parameters.Add(new MySqlParameter("@nomeDestinoInformado", nomeDestino));

            object resultado = comando.ExecuteScalar();

            if (resultado == null)
            {
                naoExisteDestinoComEsteNome = true;
            }

            return naoExisteDestinoComEsteNome;
        }
    }
}
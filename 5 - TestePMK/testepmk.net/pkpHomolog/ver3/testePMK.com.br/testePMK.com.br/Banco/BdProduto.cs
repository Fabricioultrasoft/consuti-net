using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

namespace testePMK.com.br.Banco
{
    public class BdProduto
    {
        //variáveis de conexão e comandos para o banco
        private MySqlConnection conexao = null;
        private MySqlCommand comando = null;

        /// <summary>
        /// cria conexão com banco
        /// </summary>
        public BdProduto()
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
        /// Adiciona os produtos no banco 
        /// </summary>
        /// <param name="nomeProd">nome do produto</param>
        /// <param name="preco">preço do produto</param>
        /// <param name="qtdEstoque">quantidade em estoque</param>
        /// <param name="descricaoProd">descrição do produto</param>
        public void Incluir(
            string nomeProd,
            double preco,
            int qtdEstoque,
            string descricaoProd,
            int idCategoria,
            int peso,
            string descricaoProdCompleta,
            string caminhoMiniatura,
            string linkVideo, 
            int precoInt)
        {
            // criar um comando para executar a alteração / executar comando
            comando.CommandText = "INSERT INTO produto " +
                "(NOME, PRECO_UNIDADE, DESCRICAO, QTD_ESTOQUE, ID_CATEGORIA, PESO, DESCRICAO_COMPLETA, CAMINHO_MINIATURA, LINK_VIDEO, PRECO_INT) " +
                "VALUES (@nomeProd, @preco, @descricaoProd, @qtdEstoque, @idCategoria, @peso, @descricaoProdCompleta, @caminhoMiniatura, @linkVideo, @precoInt);";
            comando.Parameters.AddWithValue("@nomeProd", nomeProd);
            comando.Parameters.AddWithValue("@preco", preco);
            comando.Parameters.AddWithValue("@qtdEstoque", qtdEstoque);
            comando.Parameters.AddWithValue("@descricaoProd", descricaoProd);
            comando.Parameters.AddWithValue("@idCategoria", idCategoria);
            comando.Parameters.AddWithValue("@peso", peso);
            comando.Parameters.AddWithValue("@descricaoProdCompleta", descricaoProdCompleta);
            comando.Parameters.AddWithValue("@caminhoMiniatura", caminhoMiniatura);
            comando.Parameters.AddWithValue("@linkVideo", linkVideo);
            comando.Parameters.AddWithValue("@precoInt", precoInt);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();
        }

        /// <summary>
        /// comando que atualiza produtos em estoque
        /// </summary>
        /// <param name="qtdAdic">nova quantidade</param>
        /// <param name="idProd">id do produto a ser alterado sua quantidade em estoque</param>
        public bool AtualizarEstoque(int qtdNova, int idProd)
        {
            try
            {
                comando.CommandText = "UPDATE produto " +
                   "SET QTD_ESTOQUE = @qtdNova " +
                   "WHERE ID = @idProd;";
                comando.Parameters.AddWithValue("@qtdNova", qtdNova);
                comando.Parameters.AddWithValue("@idProd", idProd);
                comando.CommandType = System.Data.CommandType.Text;
                comando.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        /// <summary>
        /// comando que adiciona produtos ao estoque
        /// </summary>
        /// <param name="qtdAdic">quantidade que será adicionada</param>
        /// <param name="idProd">id do produto a ser alterado sua quantodade em estoque</param>
        public bool AdicionarEstoque(int qtdAdic, int idProd)
        {
            try
            {
                comando.CommandText = "UPDATE produto " +
                   "SET QTD_ESTOQUE = QTD_ESTOQUE + @qtdAdic " +
                   "WHERE ID = @idProd;";
                comando.Parameters.AddWithValue("@qtdAdic", qtdAdic);
                comando.Parameters.AddWithValue("@idProd", idProd);
                comando.CommandType = System.Data.CommandType.Text;
                comando.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        /// <summary>
        /// comando que remove produtos ao estoque
        /// </summary>
        /// <param name="qtdAdic">quantidade que será removida</param>
        /// <param name="idProd">id do produto a ser alterado sua quantodade em estoque</param>
        public bool RemoverEstoque(int qtdRem, int idProd)
        {
            try
            {
                comando.CommandText = "UPDATE produto " +
                   "SET QTD_ESTOQUE = QTD_ESTOQUE - @qtdRem " +
                   "WHERE ID = @idProd;";
                comando.Parameters.AddWithValue("@qtdRem", qtdRem);
                comando.Parameters.AddWithValue("@idProd", idProd);
                comando.CommandType = System.Data.CommandType.Text;
                comando.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        /// <summary>
        /// Altera dados de um produto já cadastrado
        /// </summary>
        /// <param name="nomeProd">nome do produto</param>
        /// <param name="preco">preço do produto</param>
        /// <param name="qtdEstoque">quantidade em estoque</param>
        /// <param name="descricaoProd">descrição do produto</param>
        /// <param name="idProd">id do produto a ser alterado</param>
        public void Alterar(
            string nomeProd,
            double preco,
            int qtdEstoque,
            string descricaoProd,
            int idProd,
            int idCategoria,
            int peso,
            string descricaoProdCompleta,
            string caminhoMiniatura,
            string linkVideo,
            int precoInt)
        {
            // criar um comando para executar a alteração / executar comando
            comando.CommandText = "UPDATE produto " +
                "SET NOME = @nomeProd1, PRECO_UNIDADE = @preco, DESCRICAO = @descricaoProd, CAMINHO_MINIATURA = @caminhoMiniatura, " +
                "QTD_ESTOQUE = @qtdEstoque, ID_CATEGORIA = @idCategoria, PESO = @peso, DESCRICAO_COMPLETA = @descricaoProdCompleta, " +
                "LINK_VIDEO = @linkVideo, PRECO_INT = @precoInt " +
                "WHERE ID = @idProd;";
            comando.Parameters.AddWithValue("@nomeProd1", nomeProd);
            comando.Parameters.AddWithValue("@preco", preco);
            comando.Parameters.AddWithValue("@qtdEstoque", qtdEstoque);
            comando.Parameters.AddWithValue("@descricaoProd", descricaoProd);
            comando.Parameters.AddWithValue("@idProd", idProd);
            comando.Parameters.AddWithValue("@idCategoria", idCategoria);
            comando.Parameters.AddWithValue("@peso", peso);
            comando.Parameters.AddWithValue("@descricaoProdCompleta", descricaoProdCompleta);
            comando.Parameters.AddWithValue("@caminhoMiniatura", caminhoMiniatura);
            comando.Parameters.AddWithValue("@linkVideo", linkVideo);
            comando.Parameters.AddWithValue("@precoInt", precoInt);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();
        }

        /// <summary>
        /// Exclui o produto pelo codigo
        /// </summary>
        /// <param name="idProd">id do produto a ser excluido</param>
        public void Excluir(int idProd)
        {
            comando.CommandText = "DELETE FROM produto WHERE ID = @idProd;";
            comando.Parameters.AddWithValue("@idProd", idProd);
            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();
        }

        /// <summary>
        /// valida se já existe o produto cadastrado com o mesmo nome
        /// </summary>
        /// <param name="nomeProd">nome do produto a ser validado</param>
        /// <returns>true se o produto não existir com este nome</returns>
        public bool validaProduto(string nomeProd)
        {
            bool produtoOK = false;

            comando.CommandText = "SELECT NOME FROM produto WHERE NOME = @nomeProd1;";
            comando.Parameters.Add(new MySqlParameter("@nomeProd1", nomeProd));
            object resultadoBusca = comando.ExecuteScalar();
            if (resultadoBusca == null)
            {
                produtoOK = true;
            }
            return produtoOK;
        }

        /// <summary>
        /// valida se já existe o produto cadastrado com o mesmo nome
        /// </summary>
        /// <param name="nomeProd">nome do produto a ser validado</param>
        /// <returns>true se o produto não existir com este nome</returns>
        public bool validaProduto(string nomeProd, int codProd)
        {
            bool produtoOK = false;

            comando.CommandText = "SELECT NOME FROM produto " +
                "WHERE NOME = @nomeProd AND ID = @codProd;";
            comando.Parameters.Add(new MySqlParameter("@nomeProd", nomeProd));
            comando.Parameters.Add(new MySqlParameter("@codProd", codProd));
            object resultadoBusca = comando.ExecuteScalar();
            if (resultadoBusca == null)
            {
                produtoOK = true;
            }
            return produtoOK;
        }

        /// <summary>
        /// Listagem de todos os produtos cadastrados
        /// </summary>
        /// <returns>dataset com todos os produtos cadastrados no banco</returns>
        public DataSet ListarTodos()
        {
            comando.CommandText = "SELECT ID, NOME, PRECO_UNIDADE, DESCRICAO, " +
                "QTD_ESTOQUE, ID_CATEGORIA, PESO, DESCRICAO_COMPLETA, CAMINHO_MINIATURA, LINK_VIDEO, PRECO_INT " +
                "FROM produto ORDER BY NOME ASC;";
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;
        }

        /// <summary>
        /// Lista os produtos com filtro e ordem conforme solicitado pelo usuário
        /// </summary>
        /// <param name="ordem">item a ser utilizado para ordenar</param>
        /// <param name="filtro">item utilizado como filtro</param>
        /// <returns>listagem em dataSet prdenado e filtrado conforme solicitado pelo usuário</returns>
        public DataSet ListarTodos(int ordem, string filtro)
        {
            string orderBy = "";
            if (ordem == 1)
            {
                orderBy = " ORDER BY CATEGORIA ASC";
            }
            else if (ordem == 4)
            {
                orderBy = " ORDER BY NOME ASC";
            }
            else if (ordem == 3)
            {
                orderBy = " ORDER BY PRECO_UNIDADE ASC";
            }
            else if (ordem == 2)
            {
                orderBy = " ORDER BY PRECO_UNIDADE DESC";
            }

            comando.CommandText = "SELECT P.ID, P.NOME, P.PRECO_UNIDADE, P.CAMINHO_MINIATURA, " +
                "P.DESCRICAO, P.QTD_ESTOQUE, C.NOME AS CATEGORIA, P.PESO, P.DESCRICAO_COMPLETA, P.LINK_VIDEO, P.PRECO_INT " +
                "FROM produto P " +
                "JOIN categoria C ON P.ID_CATEGORIA = C.ID " +
                "WHERE P.NOME LIKE '%" + filtro + "%'" + orderBy + ";";
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;
        }

        /// <summary>
        /// Listagem dos produtos ordenada
        /// </summary>
        /// <param name="ordem">nome usado para ordenar os produtos</param>
        /// <returns>listagem em dataSet pordenado</returns>
        public DataSet ListarTodos(int ordem)
        {
            string orderBy = "";
            if (ordem == 1)
            {
                orderBy = " ORDER BY CATEGORIA ASC";
            }
            else if (ordem == 4)
            {
                orderBy = " ORDER BY NOME";
            }
            else if (ordem == 3)
            {
                orderBy = " ORDER BY PRECO_UNIDADE ASC";
            }
            else if (ordem == 2)
            {
                orderBy = " ORDER BY PRECO_UNIDADE DESC";
            }


            comando.CommandText = "SELECT P.ID, P.NOME, P.PRECO_UNIDADE, P.CAMINHO_MINIATURA, " +
                "P.DESCRICAO, P.QTD_ESTOQUE, C.NOME AS CATEGORIA, P.PESO, P.DESCRICAO_COMPLETA, P.LINK_VIDEO, P.PRECO_INT " +
                "FROM produto P " +
                "JOIN categoria C ON P.ID_CATEGORIA = C.ID" + orderBy + ";";
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;
        }

        /// <summary>
        /// Recupera os dados de um produto em específico
        /// </summary>        
        /// <param name="idProd">Id do produto a ser recuperado</param>
        /// <returns>dataset com todos os dados do produto</returns>
        public DataSet ListarProduto(int idProd)
        {
            comando.CommandText = "SELECT ID, NOME, PRECO_UNIDADE, CAMINHO_MINIATURA, " +
                "DESCRICAO, QTD_ESTOQUE, ID_CATEGORIA, PESO, DESCRICAO_COMPLETA, LINK_VIDEO, PRECO_INT " +
                "FROM produto WHERE ID = @idProd;";
            comando.Parameters.AddWithValue("@idProd", idProd);
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;
        }

        /// <summary>
        /// Recupera os dados de um produto em específico com categoria em JOIN
        /// </summary>        
        /// <param name="idProd">Id do produto a ser recuperado</param>
        /// <returns>dataset com todos os dados do produto</returns>
        public DataSet GetDetalhesProduto(int idProd)
        {
            comando.CommandText = "SELECT P.ID, P.NOME, P.PRECO_UNIDADE, P.DESCRICAO, P.CAMINHO_MINIATURA" +
                "P.QTD_ESTOQUE, C.NOME AS CATEGORIA, P.PESO, P.DESCRICAO_COMPLETA, P.LINK_VIDEO, P.PRECO_INT " +
               "FROM produto P " +
               "JOIN categoria C ON P.ID_CATEGORIA = C.ID " +
               "WHERE P.ID = @idProd;";
            comando.Parameters.AddWithValue("@idProd", idProd);
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;
        }
        /// <summary>
        /// retorna o nome do produto
        /// </summary>
        /// <returns></returns>
        public string retornaNomeProduto(int idProd)
        {
            string demanda;
            comando.CommandText = "SELECT NOME FROM produto WHERE ID = @idProd;";
            comando.Parameters.AddWithValue("@idProd", idProd);
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            // Cria uma instância da classe DataRow para receber uma linha do DataSet.
            DataRow dr = retorno.Tables[0].Rows[0];

            //Inicializa os campos da tela com os valores do DataRow.
            demanda = dr["NOME"].ToString();

            return demanda;

        }

        /// <summary>
        /// retorna a descrição completa do produto
        /// </summary>
        /// <returns></returns>
        public string retornaDescrCompleta(int idProd)
        {
            string demanda;
            comando.CommandText = "SELECT DESCRICAO_COMPLETA FROM produto WHERE ID = @idProd2;";
            comando.Parameters.AddWithValue("@idProd2", idProd);
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            // Cria uma instância da classe DataRow para receber uma linha do DataSet.
            DataRow dr = retorno.Tables[0].Rows[0];

            //Inicializa os campos da tela com os valores do DataRow.
            demanda = dr["DESCRICAO_COMPLETA"].ToString();

            return demanda;
        }


        /// <summary>
        /// retorna o caminho do video do produto
        /// </summary>
        /// <returns>string com o caminho do vídeo</returns>
        public string retornaLinkVideo(int idProd)
        {            
            comando.CommandText = "SELECT LINK_VIDEO FROM produto WHERE ID = @idProd2;";
            comando.Parameters.AddWithValue("@idProd2", idProd);
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            // Cria uma instância da classe DataRow para receber uma linha do DataSet.
            DataRow dr = retorno.Tables[0].Rows[0];

            //Inicializa os campos da tela com os valores do DataRow.
            return dr["LINK_VIDEO"].ToString();

        }
    }
}


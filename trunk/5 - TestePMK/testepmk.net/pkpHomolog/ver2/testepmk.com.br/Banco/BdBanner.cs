using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;
namespace testePMK.com.br.Banco
{
    public class BdBanner
    {
        //variáveis de conexão e comandos para o banco
        private MySqlConnection conexao = null;
        private MySqlCommand comando = null;

        /// <summary>
        /// cria conexão com banco
        /// </summary>
        public BdBanner()
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

        /// <summary>
        /// Ultimo banner cadastrado no sistema
        /// </summary>
        /// <returns>dataSet com os dados do ultimo banner cadastrado</returns>
        public DataSet Listar()
        {
            comando.CommandText = "SELECT ID, DESCRICAO, DATA, TITULO " +
                "FROM banner WHERE DATA = (SELECT MAX(DATA) FROM banner);";
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;
        }

        /// <summary>
        /// Atualiza os dados do banner
        /// </summary>
        /// <param name="titulo"></param>
        /// <param name="dataAtual"></param>
        /// <param name="textoBanner"></param>
        public void Alterar(
           string titulo,
           DateTime dataAtual,
           string textoBanner)
        {
            // criar um comando para executar a alteração / executar comando
            comando.CommandText = "UPDATE banner " +
                "SET DESCRICAO = @textoBanner, DATA = @dataAtual, TITULO = @titulo " +
                "WHERE DATA = (SELECT MAX(DATA) FROM banner);";

            comando.Parameters.AddWithValue("@titulo", titulo);
            comando.Parameters.AddWithValue("@dataAtual", dataAtual);
            comando.Parameters.AddWithValue("@textoBanner", textoBanner);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();
        }

        public void Inserir(
          string titulo,
          DateTime dataAtual,
          string textoBanner)
        {
            // criar um comando para executar a alteração / executar comando
            comando.CommandText = "INSERT INTO banner "+
                "(DESCRICAO, DATA, TITULO) " +
                "VALUES (@textoBanner, @dataAtual, @titulo);";

            comando.Parameters.AddWithValue("@titulo", titulo);
            comando.Parameters.AddWithValue("@dataAtual", dataAtual);
            comando.Parameters.AddWithValue("@textoBanner", textoBanner);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();
        }

        /// <summary>
        /// retorna o ultimo id armazenado
        /// </summary>
        /// <returns></returns>
        public int retornaUltimoID()
        {
            string demanda;
            comando.CommandText = "SELECT MAX(ID) AS ID FROM banner;";
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            // Cria uma instância da classe DataRow para receber uma linha do DataSet.
            DataRow dr = retorno.Tables[0].Rows[0];

            //Inicializa os campos da tela com os valores do DataRow.
            demanda = dr["ID"].ToString();

            return  Convert.ToInt32(demanda);

        }
    }
}
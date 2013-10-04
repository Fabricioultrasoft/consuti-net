using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;

namespace leptonbrasil.Banco
{
    public class MyBdParametros
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
        public MyBdParametros()
        {
            //tenta conectar por 5 vezes 
            bool conectado = false;
            int cont = 0;

            while (conectado.Equals(false) &&
                cont < 5)
            {
                cont++;
                conexao = new MySqlConnection(ConfigurationManager.AppSettings["constr"]);
                conexao.Open();

                comando = new MySqlCommand();
                comando = conexao.CreateCommand();
                conectado = true;
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
        /// Recupera do banco todos os parâmetros do sistema.
        /// </summary>
        /// <returns>dataset com os paramentros do sistema</returns>
        public DataSet RecuperaParametros()
        {
            comando.CommandText = "SELECT EmailContato, TelefoneContato1, " +
                "TelefoneContato2, CorFundoSite, TextoMenuServicos, " +
                "TextoMenuContato, TextoMenuNoticias, TextoMenuInstitucional " +
                "FROM parametros;";
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;
        }

        /// <summary>
        /// Atualiza a tabela paramentros
        /// </summary>
        /// <param name="ImagemFundoSite"></param>
        /// <param name="LogoSite"></param>
        /// <param name="EmailContato"></param>
        /// <param name="TelefoneContato1"></param>
        /// <param name="TelefoneContato2"></param>
        /// <param name="CorFundoSite"></param>
        /// <param name="ImagemTopoHome"></param>
        /// <param name="TextoMenuServicos"></param>
        /// <param name="TextoMenuContato"></param>
        /// <param name="TextoMenuNoticias"></param>
        /// <param name="TextoMenuInstitucional"></param>
        /// <param name="ImagemRodaPeInstitucional"></param>
        /// <param name="ImagemRodaPeServicos"></param>
        /// <returns></returns>
        public bool atualizaDadosTela(
            string EmailContato,
           string TelefoneContato1,
            string TelefoneContato2,
            string CorFundoSite,
           string TextoMenuServicos,
            string TextoMenuContato,
           string TextoMenuNoticias,
            string TextoMenuInstitucional)
        {
            bool retorno = true;
            // criar um comando para executar a alteração / executar comando
            comando.CommandText = "UPDATE parametros " +
                "SET EmailContato = @EmailContato, " +
                "TelefoneContato1 = @TelefoneContato1, TelefoneContato2 = @TelefoneContato2, " +
                "CorFundoSite = @CorFundoSite, " +
                "TextoMenuServicos = @TextoMenuServicos, TextoMenuContato = @TextoMenuContato, TextoMenuNoticias = @TextoMenuNoticias, " +
                "TextoMenuInstitucional = @TextoMenuInstitucional WHERE Id = 1;";

            comando.Parameters.AddWithValue("@EmailContato", EmailContato);
            comando.Parameters.AddWithValue("@TelefoneContato1", TelefoneContato1);
            comando.Parameters.AddWithValue("@TelefoneContato2", TelefoneContato2);
            comando.Parameters.AddWithValue("@CorFundoSite", CorFundoSite);
            comando.Parameters.AddWithValue("@TextoMenuServicos", TextoMenuServicos);
            comando.Parameters.AddWithValue("@TextoMenuContato", TextoMenuContato);
            comando.Parameters.AddWithValue("@TextoMenuNoticias", TextoMenuNoticias);
            comando.Parameters.AddWithValue("@TextoMenuInstitucional", TextoMenuInstitucional);

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
        /// obtem e retorna o email de contato configurado no sistema
        /// </summary>
        /// <returns></returns>
        public string GetEmailContato()
        {
            comando.CommandText = "SELECT EmailContato " +
                    "FROM parametros " +
                    "WHERE Id = 1;";            
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            // Cria uma instância da classe DataRow para receber uma linha do DataSet.
            DataRow dr = retorno.Tables[0].Rows[0];

            //Inicializa os campos da tela com os valores do DataRow.
            return dr["EmailContato"].ToString();
        }
    }
}
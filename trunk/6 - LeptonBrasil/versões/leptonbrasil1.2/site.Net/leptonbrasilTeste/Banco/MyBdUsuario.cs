using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;

namespace leptonbrasil.Banco
{
    public class MyBdUsuario
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
        public MyBdUsuario()
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
        /// Valida se o usuário possui as credenciais de administrador do site.
        /// </summary>
        /// <param name="loginUsuario">Login informado pelo usuário.</param>
        /// <param name="senhaUsuario">Senha informada pelo usuário.</param>
        /// <returns><b>TRUE</b>caso as credenciais do usuário sejam válidas, caso contrário <b>FALSE</b>.</returns>
        public bool VerificaUsuarioAdmin(string loginUsuario, string senhaUsuario)
        {
            comando.CommandText = "SELECT ID FROM usuario " +
                "WHERE Senha=@SENHA AND Email=@LOGIN ;";
            comando.Parameters.Add(new MySqlParameter("@LOGIN", loginUsuario));
            comando.Parameters.Add(new MySqlParameter("@SENHA", senhaUsuario));
            object resultadoQuery = comando.ExecuteScalar();

            if (resultadoQuery != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        public string GetSenha(string email)
        {
            comando.CommandText = "SELECT senha " +
                    "FROM usuario " +
                    "WHERE email = @email;";
            comando.Parameters.Add(new MySqlParameter("@email", email));
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            // Cria uma instância da classe DataRow para receber uma linha do DataSet.
            DataRow dr = retorno.Tables[0].Rows[0];

            //Inicializa os campos da tela com os valores do DataRow.
            return dr["senha"].ToString();
        }
    }
}
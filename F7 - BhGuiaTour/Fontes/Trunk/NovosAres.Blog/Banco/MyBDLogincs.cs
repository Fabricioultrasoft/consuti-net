namespace NovosAres.Blog.Banco
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using MySql.Data.MySqlClient;
    using System.Configuration;

    public class MyBDLogin
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
        public MyBDLogin()
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
        /// Valida se o usuário possui as credenciais de administrador do site.
        /// </summary>
        /// <param name="loginUsuario">Login informado pelo usuário.</param>
        /// <param name="senhaUsuario">Senha informada pelo usuário.</param>
        /// <returns><b>TRUE</b>caso as credenciais do usuário sejam válidas, caso contrário <b>FALSE</b>.</returns>
        public bool VerificaUsuarioAdmin(string loginUsuario, string senhaUsuario)
        {
            comando.CommandText = "SELECT ID FROM usuarios " +
                "WHERE GerenciaBlog = 's' AND Senha=@SENHA AND Login=@LOGIN ;";
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
    }
}
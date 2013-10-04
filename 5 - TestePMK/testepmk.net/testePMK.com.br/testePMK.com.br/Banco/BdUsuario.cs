using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

namespace testePMK.com.br.Banco
{
    public class BdUsuario
    {
        //variáveis de conexão e comandos para o banco
        private MySqlConnection conexao = null;
        private MySqlCommand comando = null;

        /// <summary>
        /// cria conexão com banco
        /// </summary>
        public BdUsuario()
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
        /// valida o usuário administrador do sistema
        /// </summary>
        /// <param name="login">login a validar</param>
        /// <param name="senha">senha a validar</param>
        /// <returns></returns>
        public bool validaAdmin(
            string login, string senha)
        {

            bool AdminOk = false;
            comando.CommandText = "SELECT * FROM adm WHERE Login = @login AND Senha = @senha";
            comando.Parameters.Add(new MySqlParameter("@login", login));
            comando.Parameters.Add(new MySqlParameter("@senha", senha));
            object resultadoBusca = comando.ExecuteScalar();
            if (resultadoBusca != null)
            {
                AdminOk = true;
            }
            return AdminOk;
        }

        public DataSet AdmDadosAcesso()
        {
            comando.CommandText = "SELECT ID, Login, Senha " +
                "FROM testepmk.adm " +
                "where ID = 1";
            comando.CommandType = CommandType.Text;
            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);
            DataSet retorno = new DataSet();
            adap.Fill(retorno);
            return retorno;
        }

        /// <summary>
        /// Altera o cadastro do usuário administrador do sistema
        /// </summary>
        /// <param name="login">novo login</param>
        /// <param name="senha">nova senha</param>
        public void AlterarAdm(
            string login,
            string senha)
        {
            // criar um comando para executar a alteração / executar comando
            comando.CommandText = "UPDATE adm " +
                "SET Login = @login, Senha = @senha " +
                "WHERE ID = 1 ";
            comando.Parameters.AddWithValue("@login", login);
            comando.Parameters.AddWithValue("@senha", senha);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();
        }
    }
}



using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace Sistema_Life_Planner_Agenda.BD
{
    public class BancoBase
    {
        //variáveis de conexão e comandos para o banco
        public MySqlConnection conexao = null;
        public MySqlCommand comando = null;

        /// <summary>
        /// cria conexão com banco
        /// </summary>
        public BancoBase()
        {   
            int cont = 0;

            try
            {
                cont++;
                conexao = new MySqlConnection(ConfigurationManager.AppSettings["constr"]);
                conexao.Open();

                comando = new MySqlCommand();
                comando = conexao.CreateCommand();
                
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        //liberar recursos
        public void Dispose()
        {
            comando.Dispose();
            conexao.Dispose();
        }
    }
}

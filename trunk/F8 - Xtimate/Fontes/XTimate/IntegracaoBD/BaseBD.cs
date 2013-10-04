using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace IntegracaoBD
{
    public class BaseBD
    {
          //variáveis de conexão e comandos para o banco
        public MySqlConnection conexao = null;
        public MySqlCommand comando = null;

        /// <summary>
        /// cria conexão com banco
        /// </summary>
        public BaseBD()
        {
            //abrir conexão com banco  
            conexao = new MySqlConnection(ConfigurationSettings.AppSettings["connectionString"]);
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
    }
}

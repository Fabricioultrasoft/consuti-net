using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;

namespace Sistema_Life_Planner_Agenda.BD
{
    public class ContatoBD : BancoBase
    {
        /// <summary>
        /// Lista os contatos cadastrados e seus ID's
        /// </summary>
        /// <returns></returns>
        public DataSet Listar()
        {   
            comando.CommandText = @"SELECT ID, Nome
                                    FROM contato" +
                                  " ORDER BY Nome ASC";
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;
        }
    }
}
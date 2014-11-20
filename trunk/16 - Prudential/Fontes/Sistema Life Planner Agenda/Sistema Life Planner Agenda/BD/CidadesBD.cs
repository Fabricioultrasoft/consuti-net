using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;

namespace Sistema_Life_Planner_Agenda.BD
{
    public class CidadesBD : BancoBase
    {
        /// <summary>
        /// Lista todos os municípios de uma UF
        /// </summary>
        /// <param name="UF"></param>
        /// <returns></returns>
        public DataSet Listar(string UF)
        {
            comando.CommandText = @"SELECT id_cidade, nome, estado 
                                    FROM cidade
                                    WHERE estado = @UF
                                    ORDER BY nome ASC";
            comando.Parameters.AddWithValue("@UF", UF);
            comando.CommandType = CommandType.Text;

            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            this.Dispose();

            return retorno;
        }
    }
}
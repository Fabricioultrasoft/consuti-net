using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;

namespace Sistema_Life_Planner_Agenda.BD
{
    public class HistoricoContatoBD : BancoBase
    {
        /// <summary>
        /// Inclui um histórico de contato
        /// </summary>
        /// <param name="ID_Contato"></param>
        /// <param name="Data"></param>
        /// <param name="Historico"></param>
        public void Incluir(
            int ID_Contato,
            DateTime Data,
            string Historico)
        {
            comando.CommandText = @"INSERT INTO historico_contato
                                        (ID_Contato, Data, Historico) 
                                    VALUES (@ID_Contato, @Data, @Historico);";
            comando.Parameters.AddWithValue("@ID_Contato", ID_Contato);
            comando.Parameters.AddWithValue("@Data", Data);
            comando.Parameters.AddWithValue("@Historico", Historico);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();

            this.Dispose();
        }

        /// <summary>
        /// Lista todas as ocorrencias de histórico para um usuário
        /// </summary>
        /// <param name="ID_Contato"></param>
        /// <returns></returns>
        public DataSet Listar(int ID_Contato)
        {
            comando.CommandText = @"SELECT ID, ID_Contato, Data, Historico 
                                    FROM historico_contato
                                    WHERE ID_Contato = @ID_Contato
                                    ORDER BY Data DESC;";
            comando.Parameters.AddWithValue("@ID_Contato", ID_Contato);
            comando.CommandType = CommandType.Text;

            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            this.Dispose();

            return retorno;
        }
    }
}
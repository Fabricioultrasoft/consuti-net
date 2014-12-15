using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sistema_Life_Planner_Agenda.BD
{
    public class AgendaBD : BancoBase
    {
        /// <summary>
        /// Cadastra um compromisso na agenda
        /// </summary>
        /// <param name="ID_Contato"></param>
        /// <param name="ID_Usuario"></param>
        /// <param name="Criar_Google_Agenda"></param>
        /// <param name="Data"></param>
        /// <param name="Hora"></param>
        /// <param name="Minutos"></param>
        /// <param name="Mais_Informacoes"></param>
        /// <param name="Preferencia_Contato"></param>
        public void Incluir(
            int ID_Contato, 
            int ID_Usuario,
            bool Criar_Google_Agenda,
            DateTime Data,
            int Hora,
            int Minutos,
            string Mais_Informacoes,
            string Preferencia_Contato,
            string Periodo)
        {
            comando.CommandText = @"INSERT INTO agenda
                                           (ID_Contato, ID_Usuario, Criar_Google_Agenda, Data, Hora, Minutos, Mais_Informacoes, Preferencia_Contato, Periodo) 
                                    VALUES (@ID_Contato, @ID_Usuario, @Criar_Google_Agenda, @Data, @Hora, @Minutos, @Mais_Informacoes, @Preferencia_Contato, @Periodo);";
            comando.Parameters.AddWithValue("@ID_Contato", ID_Contato);
            comando.Parameters.AddWithValue("@ID_Usuario", ID_Usuario);
            comando.Parameters.AddWithValue("@Criar_Google_Agenda", Criar_Google_Agenda);
            comando.Parameters.AddWithValue("@Data", Data);
            comando.Parameters.AddWithValue("@Hora", Hora);
            comando.Parameters.AddWithValue("@Minutos", Minutos);
            comando.Parameters.AddWithValue("@Mais_Informacoes", Mais_Informacoes);
            comando.Parameters.AddWithValue("@Preferencia_Contato", Preferencia_Contato);
            comando.Parameters.AddWithValue("@Periodo", Periodo);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();

            this.Dispose();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sistema_Life_Planner_Agenda.BD
{
    public class ContatosSitPlanBD : BancoBase
    {
        /// <summary>
        /// Associa o contato ao sitplan
        /// </summary>
        /// <param name="ID_Contato"></param>
        /// <param name="ID_SIT_PLAN"></param>
        /// <param name="ID_Status_Pre_TA"></param>
        public void Incluir(
            int ID_Contato,
            int ID_SIT_PLAN,
            int ID_Status_Pre_TA)
        {
            comando.CommandText = @"INSERT INTO contatos_sit_plan
                                    (ID_Contato, ID_SIT_PLAN, ID_Status_Pre_TA) 
                                    VALUES (@ID_Contato, @ID_SIT_PLAN, @ID_Status_Pre_TA);";
            comando.Parameters.AddWithValue("@ID_Contato", ID_Contato);
            comando.Parameters.AddWithValue("@ID_SIT_PLAN", ID_SIT_PLAN);
            comando.Parameters.AddWithValue("@ID_Status_Pre_TA", ID_Status_Pre_TA);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();

            this.Dispose();
        }
    }
}
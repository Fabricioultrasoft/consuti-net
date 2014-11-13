using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sistema_Life_Planner_Agenda.BD
{
    public class RecomendanteContatoBD: BancoBase
    {
        /// <summary>
        /// Associa um contato a um recomendante
        /// </summary>
        /// <param name="ID_Contato"></param>
        /// <param name="ID_Recomendante"></param>
        /// <param name="Data_Cadastro"></param>
        public void Incluir(
            int ID_Contato,
            int ID_Recomendante)
        {
            comando.CommandText = @"INSERT INTO recomendantes_contato
                                        (ID_Contato, ID_Recomendante) 
                                    VALUES (@ID_Contato, @ID_Recomendante);";
            comando.Parameters.AddWithValue("@ID_Contato", ID_Contato);
            comando.Parameters.AddWithValue("@ID_Recomendante", ID_Recomendante);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();

            this.Dispose();
        }
    }
}
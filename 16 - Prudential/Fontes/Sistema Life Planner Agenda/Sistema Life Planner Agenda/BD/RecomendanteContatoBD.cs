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

        /// <summary>
        /// Atualiza apenas o recomendante do contato
        /// </summary>
        /// <param name="ID"></param>
        /// <param name="IDContatoRecomendanteNovo"></param>
        public void Atualizar(
            int IDContatoRecomendanteAtual,
            int IDContatoRecomendanteNovo,
            int ID_Contato)
        {
            comando.CommandText = @"UPDATE recomendantes_contato 
                                    SET ID_Recomendante = @IDContatoRecomendanteNovo
                                    WHERE ID_Recomendante = @IDContatoRecomendanteAtual
                                    AND ID_Contato = @ID_Contato;";

            comando.Parameters.AddWithValue("@IDContatoRecomendanteAtual", IDContatoRecomendanteAtual);
            comando.Parameters.AddWithValue("@IDContatoRecomendanteNovo", IDContatoRecomendanteNovo);
            comando.Parameters.AddWithValue("@ID_Contato", ID_Contato);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();

            this.Dispose();
        }
    }
}
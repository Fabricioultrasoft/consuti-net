﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;

namespace Sistema_Life_Planner_Agenda.BD
{
    public class SitPlanBD : BancoBase
    {
        /// <summary>
        /// Lista todos os SITPLAN
        /// </summary>
        /// <param name="dataInicioDe"></param>
        /// <param name="dataInicioAte"></param>
        /// <param name="idUsuario"></param>
        /// <returns></returns>
        public DataSet Listar(
           DateTime dataInicioDe,
           DateTime dataInicioAte,
           int idUsuario)
        {
            comando.CommandText = @"SELECT s.ID, s.ID_Usuario, s.Inicio, s.Status, 
                                        (SELECT COUNT(ID) 
                                            FROM contatos_sit_plan
                                            WHERE contatos_sit_plan.ID_SIT_PLAN = s.ID) as TotalContatos 
                                    FROM sit_plan s
                                    JOIN contatos_sit_plan c ON c.ID_SIT_PLAN = s.ID
                                    WHERE s.ID_Usuario = @idUsuario
                                    AND s.Inicio >= @dataCadastroDe
                                    AND s.Inicio <= @dataCadastroAte 
                                    GROUP BY c.ID_SIT_PLAN
                                    ORDER BY s.Inicio DESC";
            comando.Parameters.AddWithValue("@idUsuario", idUsuario);
            comando.Parameters.AddWithValue("@dataCadastroDe", dataInicioDe);
            comando.Parameters.AddWithValue("@dataCadastroAte", dataInicioAte.AddHours(23).AddMinutes(59).AddSeconds(59));
            comando.CommandType = CommandType.Text;

            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            this.Dispose();

            return retorno;
        }

        /// <summary>
        /// Cadastra o SITPLAN
        /// </summary>
        /// <param name="ID_Usuario"></param>
        /// <param name="Inicio"></param>
        /// <param name="Status"></param>
        public void Incluir(
            string ID_Usuario,
            DateTime Inicio,
            string Status, 
            string Chave)
        {
            comando.CommandText = @"INSERT INTO sit_plan
                                    (ID_Usuario, Inicio, Status, Chave) 
                                    VALUES (@ID_Usuario, @Inicio, @Status, @Chave);";
            comando.Parameters.AddWithValue("@ID_Usuario", ID_Usuario);
            comando.Parameters.AddWithValue("@Inicio", Inicio);
            comando.Parameters.AddWithValue("@Status", Status);
            comando.Parameters.AddWithValue("@Chave", Chave);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();

            this.Dispose();
        }

        /// <summary>
        /// Obtem o ID de um SITPLAN
        /// </summary>
        /// <param name="ID_Usuario"></param>
        /// <param name="Inicio"></param>
        /// <param name="Status"></param>
        /// <returns></returns>
        public int ObterID(
            string ID_Usuario,
            string Status,
            string Chave)
        {
            comando.CommandText = @"SELECT ID 
                                    FROM sit_plan
                                    WHERE ID_Usuario = @ID_Usuario                                     
                                    AND Chave = @Chave
                                    AND Status = @Status";
            comando.Parameters.Add(new MySqlParameter("@ID_Usuario", ID_Usuario));
            comando.Parameters.Add(new MySqlParameter("@Chave", Chave));
            comando.Parameters.Add(new MySqlParameter("@Status", Status));

            object resultadoBusca = comando.ExecuteScalar();

            this.Dispose();

            try
            {
                return Convert.ToInt32(resultadoBusca.ToString());
            }
            catch (Exception ex)
            {
                return 0;
            }
        }

        /// <summary>
        /// Atualiza o status do sitplan do usuário
        /// </summary>
        /// <param name="novoStatus"></param>
        /// <param name="idSitPlan"></param>
        /// <param name="idUsuario"></param>
        public void AtualizarStatus(
            string novoStatus,
            int idSitPlan,
            int idUsuario)
        {
            comando.CommandText = @"UPDATE sit_plan 
                                    SET Status = @Status 
                                    WHERE ID_Usuario = @idUsuario
                                    AND ID = @Id;";
            comando.Parameters.AddWithValue("@Status", novoStatus);
            comando.Parameters.AddWithValue("@idUsuario", idUsuario);
            comando.Parameters.AddWithValue("@Id", idSitPlan);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();

            this.Dispose();
        }
    }
}
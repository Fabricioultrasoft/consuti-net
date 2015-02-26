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
           int idUsuario,
            string Nome)
        {
            string filtrarNome = string.Empty; ;
            if (!string.IsNullOrEmpty(Nome))
            {
                filtrarNome = "AND s.Nome LIKE '%" + Nome + "%' ";
            }
            
            comando.CommandText = @"SELECT s.ID, s.ID_Usuario, s.Inicio, s.Status, s.Nome, 
                                        (SELECT COUNT(ID) 
                                            FROM contatos_sit_plan
                                            WHERE contatos_sit_plan.ID_SIT_PLAN = s.ID) as TotalContatos 
                                    FROM sit_plan s
                                    JOIN contatos_sit_plan c ON c.ID_SIT_PLAN = s.ID
                                    WHERE s.ID_Usuario = @idUsuario
                                    AND s.Inicio >= @dataCadastroDe
                                    AND s.Inicio <= @dataCadastroAte " +
                                    filtrarNome +
                                    @"GROUP BY c.ID_SIT_PLAN
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
            string Chave,
            string Nome)
        {
            comando.CommandText = @"INSERT INTO sit_plan
                                    (ID_Usuario, Inicio, Status, Chave, Nome) 
                                    VALUES (@ID_Usuario, @Inicio, @Status, @Chave, @Nome);";
            comando.Parameters.AddWithValue("@ID_Usuario", ID_Usuario);
            comando.Parameters.AddWithValue("@Inicio", Inicio);
            comando.Parameters.AddWithValue("@Status", Status);
            comando.Parameters.AddWithValue("@Chave", Chave);
            comando.Parameters.AddWithValue("@Nome", Nome);

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

        /// <summary>
        /// Obtem os contatos do SITPLAN
        /// </summary>
        /// <param name="idSitPlan"></param>
        /// <returns></returns>
        public DataSet ContatosSITPLAN(int idSitPlan, int idUsuario)
        {
            comando.CommandText = @"select c.Nome, c.ID, SUBSTRING(Telefone_Principal, 1,2) as DDD_TELEFONE_CONTATO, sp.Nome as NomeSITPLAN, 
                                    SUBSTRING(Telefone_Principal, 3,10) as TELEFONE_CONTATO, sc.status as STATUS_PRE_TA
                                    from contato c
                                    join contatos_sit_plan cs on cs.ID_Contato = c.ID 
                                    join sit_plan sp ON cs.ID_SIT_PLAN = sp.ID
                                    join status_contato sc ON c.ID_Status_Contato = sc.ID  
                                    where sp.ID = @idSitPlan
                                    AND sp.ID_Usuario = @idUsuario 
                                    order by c.Nome;";
            comando.Parameters.AddWithValue("@idSitPlan", idSitPlan);
            comando.Parameters.AddWithValue("@idUsuario", idUsuario);
            comando.CommandType = CommandType.Text;

            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            this.Dispose();

            return retorno;
        }

        /// <summary>
        /// Obtem e retorna os dados para o relatório de resultado do SITPLAN
        /// </summary>
        /// <param name="idSitPlan">id do sitplan a ser consultado</param>
        /// <returns></returns>
        public DataSet RelatorioTA(int idSitPlan)
        {
            comando.CommandText = @"select sp.Inicio, sp.Nome as NomeSITPLAN, 
                                    (select count(*)
                                      from contatos_sit_plan
                                      where contatos_sit_plan.ID_SIT_PLAN = sp.ID) as total_ligacoes, 
                                    (select count(*)
                                      from contatos_sit_plan
                                      join contato ON contatos_sit_plan.ID_Contato = contato.ID
                                      where contatos_sit_plan.ID_SIT_PLAN = sp.ID
                                      and contato.ID_Status_Contato <> contatos_sit_plan.ID_Status_Pre_TA) as total_atualizado, 
                                    (select count(sc.Status)
                                      from contatos_sit_plan cs
                                      join contato c ON cs.ID_Contato = c.ID
                                      join status_contato sc ON c.ID_Status_Contato = sc.ID
                                      where cs.ID_SIT_PLAN = sp.ID
                                      and sc.Status = 'TA NÃO ATENDEU') as TA_NAO_ATENDEU, 
                                    (select count(sc.Status)
                                      from contatos_sit_plan cs
                                      join contato c ON cs.ID_Contato = c.ID
                                      join status_contato sc ON c.ID_Status_Contato = sc.ID
                                      where cs.ID_SIT_PLAN = sp.ID
                                      and sc.Status = 'TA NÃO QUER') as TA_NAO_QUER, 
                                    (select count(sc.Status)
                                      from contatos_sit_plan cs
                                      join contato c ON cs.ID_Contato = c.ID
                                      join status_contato sc ON c.ID_Status_Contato = sc.ID
                                      where cs.ID_SIT_PLAN = sp.ID
                                      and sc.Status = 'TA LIGAÇÃO FUTURA') as TA_LIGACAO_FUTURA, 
                                    (select count(sc.Status)
                                      from contatos_sit_plan cs
                                      join contato c ON cs.ID_Contato = c.ID
                                      join status_contato sc ON c.ID_Status_Contato = sc.ID
                                      where cs.ID_SIT_PLAN = sp.ID
                                      and sc.Status = 'TA JÁ É CLIENTE') as TA_JA_E_CLIENTE, 
                                    (select count(sc.Status)
                                      from contatos_sit_plan cs
                                      join contato c ON cs.ID_Contato = c.ID
                                      join status_contato sc ON c.ID_Status_Contato = sc.ID
                                      where cs.ID_SIT_PLAN = sp.ID
                                      and sc.Status = 'TA OI AGENDADO') as TA_OI_AGENDADO, 
                                    (select count(sc.Status)
                                      from contatos_sit_plan cs
                                      join contato c ON cs.ID_Contato = c.ID
                                      join status_contato sc ON c.ID_Status_Contato = sc.ID
                                      where cs.ID_SIT_PLAN = sp.ID
                                      and sc.Status = 'OI DELAY') as OI_DELAY, 
                                    (select count(sc.Status)
                                      from contatos_sit_plan cs
                                      join contato c ON cs.ID_Contato = c.ID
                                      join status_contato sc ON c.ID_Status_Contato = sc.ID
                                      where cs.ID_SIT_PLAN = sp.ID
                                      and sc.Status = 'OI REALIZADO') as OI_REALIZADO, 
                                    (select count(sc.Status)
                                      from contatos_sit_plan cs
                                      join contato c ON cs.ID_Contato = c.ID
                                      join status_contato sc ON c.ID_Status_Contato = sc.ID
                                      where cs.ID_SIT_PLAN = sp.ID
                                      and sc.Status = 'PC LIGAÇÃO FUTURA') as PC_LIGACAO_FUTURA, 
                                    (select count(sc.Status)
                                      from contatos_sit_plan cs
                                      join contato c ON cs.ID_Contato = c.ID
                                      join status_contato sc ON c.ID_Status_Contato = sc.ID
                                      where cs.ID_SIT_PLAN = sp.ID
                                      and sc.Status = 'PC DELAY') as PC_DELAY, 
                                    (select count(sc.Status)
                                      from contatos_sit_plan cs
                                      join contato c ON cs.ID_Contato = c.ID
                                      join status_contato sc ON c.ID_Status_Contato = sc.ID
                                      where cs.ID_SIT_PLAN = sp.ID
                                      and sc.Status = 'PC N') as PC_N, 
                                    (select count(sc.Status)
                                      from contatos_sit_plan cs
                                      join contato c ON cs.ID_Contato = c.ID
                                      join status_contato sc ON c.ID_Status_Contato = sc.ID
                                      where cs.ID_SIT_PLAN = sp.ID
                                      and sc.Status = 'PC C2') as PC_C2, 
                                    (select count(sc.Status)
                                      from contatos_sit_plan cs
                                      join contato c ON cs.ID_Contato = c.ID
                                      join status_contato sc ON c.ID_Status_Contato = sc.ID
                                      where cs.ID_SIT_PLAN = sp.ID
                                      and sc.Status = 'MEU CLIENTE') as MEU_CLIENTE, 
                                    (select count(sc.Status)
                                      from contatos_sit_plan cs
                                      join contato c ON cs.ID_Contato = c.ID
                                      join status_contato sc ON c.ID_Status_Contato = sc.ID
                                      where cs.ID_SIT_PLAN = sp.ID
                                      and sc.Status = 'NENHUM') as NENHUM
                                    from sit_plan sp
                                    where sp.ID = @idSitPlan;";
            comando.Parameters.AddWithValue("@idSitPlan", idSitPlan);
            comando.CommandType = CommandType.Text;

            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            this.Dispose();

            return retorno;
        }
    }
}
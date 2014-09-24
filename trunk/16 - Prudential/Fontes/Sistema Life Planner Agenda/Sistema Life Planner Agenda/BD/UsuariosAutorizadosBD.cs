﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;

namespace Sistema_Life_Planner_Agenda.BD
{
    public class UsuariosAutorizadosBD : BancoBase
    {
        /// <summary>
        /// Incluir usuário autorizado
        /// </summary>
        /// <param name="Admin">1 se for administrador, 0 se não for</param>
        /// <param name="Email">Email autorizado</param>
        public void Incluir(
            int Admin,
            string Email)
        {
            comando.CommandText = @"INSERT INTO usuarios_autorizados
                                    (Email, Admin) 
                                    VALUES (@Email, @Admin);";
            comando.Parameters.AddWithValue("@Email", Email);
            comando.Parameters.AddWithValue("@Admin", Admin);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();
        }

        /// <summary>
        /// Remove usuário autorizado
        /// </summary>
        /// <param name="email">email para remoção</param>
        public void Excluir(
            string email)
        {
            comando.CommandText = @"DELETE FROM usuarios_autorizados
                                        WHERE Email = @Email;";
            comando.Parameters.AddWithValue("@Email", email);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();

        }
        
        /// <summary>
        /// Lista os emails autorizados
        /// </summary>
        /// <returns>lista de emails autorizados</returns>
        public DataSet Listar()
        {
            comando.CommandText = @"SELECT Email, CASE WHEN Admin = 0 THEN 'Não' ELSE 'Sim' END AS Admin 
                                    FROM usuarios_autorizados
                                    ORDER BY Email;";
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;
        }
    }
}
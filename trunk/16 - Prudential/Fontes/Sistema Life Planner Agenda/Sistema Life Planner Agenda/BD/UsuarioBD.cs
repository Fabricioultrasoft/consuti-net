using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace Sistema_Life_Planner_Agenda.BD
{
    public class UsuarioBD : BancoBase
    {
        public void Incluir()
        {
            //TODO: Incluir Usuário
        }

        public void Alterar()
        {
            //TODO: Alterar Usuário
        }

        /// <summary>
        /// Autentica email e senha e retorna o nome do usuário
        /// </summary>
        /// <param name="email">email do login</param>
        /// <param name="senha">senha do login</param>
        /// <returns>Nome do usuário autenticado.</returns>
        public string Autenticar(
            string email,
            string senha)
        {

            comando.CommandText = @"SELECT Nome
                                    FROM usuario
                                    WHERE email = @email AND Senha = @senha";
            comando.Parameters.Add(new MySqlParameter("@email", email));
            comando.Parameters.Add(new MySqlParameter("@senha", senha));
            object resultadoBusca = comando.ExecuteScalar();

            try
            {
                return resultadoBusca.ToString();
            }
            catch (Exception)
            {
                return string.Empty;
            }
            
        }

        public void Obter()
        {
            //TODO: Obter Usuário
        }

        /// <summary>
        /// Verifica se o usuário é admin
        /// </summary>
        /// <param name="email">email para verificar</param>
        /// <returns>true se o usuário é admin, false otherwise</returns>
        public bool UsuarioAdmin(string email)
        {
            //TODO: verifica se o usuário logado é o usuário administrador

            comando.CommandText = @"SELECT Nome
                                    FROM usuario
                                    WHERE email = @email AND Admin = 1";
            comando.Parameters.Add(new MySqlParameter("@email", email));
            object resultadoBusca = comando.ExecuteScalar();

            if (!resultadoBusca.ToString().Equals(string.Empty))
            {
                return true;
            }
            return false;
        }
    }
}
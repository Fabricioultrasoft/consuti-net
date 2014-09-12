using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace Sistema_Life_Planner_Agenda.BD
{
    public class UsuarioBD : BancoBase
    {
        /// <summary>
        /// Cadastro de usuário SISLPA
        /// </summary>
        /// <param name="AgendaGoogleEmail"></param>
        /// <param name="AgendaGoogleSenha"></param>
        /// <param name="Email"></param>
        /// <param name="Nome"></param>
        /// <param name="Senha"></param>
        /// <param name="Telefone"></param>
        public void Incluir(
            string AgendaGoogleEmail,
            string AgendaGoogleSenha,
            string Email, 
            string Nome,
            string Senha,
            string Telefone)
        {
            comando.CommandText = @"INSERT INTO usuario
                                    (AgendaGoogleEmail, AgendaGoogleSenha, Email, Nome, Senha, Telefone) 
                                    VALUES (@AgendaGoogleEmail, @AgendaGoogleSenha, @Email, @Nome, @Senha, @Telefone);";
            comando.Parameters.AddWithValue("@AgendaGoogleEmail", AgendaGoogleEmail);
            comando.Parameters.AddWithValue("@AgendaGoogleSenha", AgendaGoogleSenha);
            comando.Parameters.AddWithValue("@Email", Email);
            comando.Parameters.AddWithValue("@Nome", Nome);
            comando.Parameters.AddWithValue("@Senha", Senha);
            comando.Parameters.AddWithValue("@Telefone", Telefone);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();
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
            comando.CommandText = @"SELECT Email
                                    FROM usuarios_autorizados
                                    WHERE email = @email AND Admin = 1";
            comando.Parameters.Add(new MySqlParameter("@email", email));
            object resultadoBusca = comando.ExecuteScalar();

            if (!resultadoBusca.ToString().Equals(string.Empty))
            {
                return true;
            }
            return false;
        }

        /// <summary>
        /// Valida se o email está autorizado no sistema
        /// </summary>
        /// <param name="email"></param>
        /// <returns>true se o email for autorizado, false otherwise</returns>
        public bool EmailAutorizado(string email)
        {
            comando.CommandText = @"SELECT Email
                                    FROM usuarios_autorizados
                                    WHERE email = @email";
            comando.Parameters.Add(new MySqlParameter("@email", email));

            try
            {
                object resultadoBusca = comando.ExecuteScalar();
                if (!resultadoBusca.ToString().Equals(string.Empty))
                {
                    return true;
                }
                return false;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
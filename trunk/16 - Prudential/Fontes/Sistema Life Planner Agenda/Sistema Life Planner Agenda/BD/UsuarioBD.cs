using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;

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
            
            this.Dispose();

            //Inclui o proprio usuário como contato
            new ContatoBD().Incluir(1,
                7,
                4,
                string.Empty,
                Email,
                string.Empty,
                DateTime.Now,
                0,
                0,
                Nome,
                string.Empty,
                string.Empty,
                'S',
                Telefone,
                string.Empty,
                string.Empty,
                string.Empty);
        }

        /// <summary>
        /// Atualiza os dados cadastrais de usuário.
        /// </summary>
        /// <param name="senha"></param>
        /// <param name="nomeCompleto"></param>
        /// <param name="telefone"></param>
        /// <param name="emailGoogleAgenda"></param>
        /// <param name="senhaGoogleAgenda"></param>
        /// <param name="email"></param>
        public void Alterar(
            string senha,
            string nomeCompleto,
            string telefone,
            string emailGoogleAgenda,
            string senhaGoogleAgenda,
            string email)
        {
            // criar um comando para executar a alteração / executar comando
            comando.CommandText = @"UPDATE bd_sislpa.usuario 
                                    SET AgendaGoogleEmail = @AgendaGoogleEmail , AgendaGoogleSenha = @AgendaGoogleSenha, 
                                        Nome = @Nome, Senha = @Senha, Telefone = @Telefone 
                                    WHERE Email = @Email";
            comando.Parameters.AddWithValue("@Senha", senha);
            comando.Parameters.AddWithValue("@Nome", nomeCompleto);
            comando.Parameters.AddWithValue("@Telefone", telefone);
            comando.Parameters.AddWithValue("@AgendaGoogleEmail", emailGoogleAgenda);
            comando.Parameters.AddWithValue("@AgendaGoogleSenha", senhaGoogleAgenda);
            comando.Parameters.AddWithValue("@Email", email);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();

            this.Dispose();

            
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

            this.Dispose();

            try
            {
                return resultadoBusca.ToString();
            }
            catch (Exception)
            {
                return string.Empty;
            }

        }



        /// <summary>
        /// Obtem um usuário a partir do email
        /// </summary>
        /// <param name="email"></param>
        /// <returns>DataSet com os dados cadastrais do usuário</returns>
        public DataSet Obter(string email)
        {
            comando.CommandText = @"SELECT AgendaGoogleEmail, AgendaGoogleSenha, Email, Nome, Senha, Telefone 
                                    FROM usuario
                                    WHERE email = @email;";
            comando.Parameters.Add(new MySqlParameter("@email", email));
            comando.CommandType = CommandType.Text;
            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);
            DataSet retorno = new DataSet();
            adap.Fill(retorno);
            
            this.Dispose();

            return retorno;
        }

        /// <summary>
        /// Obtem e retorna o ID do usuário a partir do e-mail
        /// </summary>
        /// <param name="email"></param>
        /// <returns></returns>
        public string ObterID(string email)
        {
            comando.CommandText = @"SELECT Id
                                    FROM usuario
                                    WHERE email = @email";
            comando.Parameters.Add(new MySqlParameter("@email", email));
            object resultadoBusca = comando.ExecuteScalar();

            this.Dispose();

            try
            {
                return resultadoBusca.ToString();
            }
            catch (Exception)
            {
                return string.Empty;
            }
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

            this.Dispose();

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
            finally
            {
                this.Dispose();
            }
        }

        /// <summary>
        /// Recupera a senha de um usuário a partir do email
        /// </summary>
        /// <param name="email">Email utilizado de parâmetro para consulta</param>
        /// <returns>Senha do usuário cadastrado</returns>
        public string RecuperarSenha(string email)
        {
            comando.CommandText = @"SELECT Senha
                                    FROM usuario
                                    WHERE email = @email;";
            comando.Parameters.Add(new MySqlParameter("@email", email));
            object resultadoBusca = comando.ExecuteScalar();

            this.Dispose();

            try
            {
                return resultadoBusca.ToString();
            }
            catch (Exception)
            {
                return string.Empty;
            }

        }
    }
}
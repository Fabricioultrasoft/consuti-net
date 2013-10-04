using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IntegracaoBD;
using System.Data;
using MySql.Data.MySqlClient;
using Utilitarios.Ferramentas;
using Utilitarios.DTOs;

namespace IntegracaoBD.Repositorios
{
    public class UsuarioBD : BaseBD
    {
        /// <summary>
        /// Valida se o email e a senha existem no banco de dados;
        /// </summary>
        /// <param name="Email"></param>
        /// <param name="Senha"></param>
        /// <returns>Nome do usuário se a combinação de email e senha bater.</returns>
        public string UsuarioValidado(string Email, string Senha)
        {
            string senhaCriptografada = new FerramentasTexto().CriptografarSenhaCriptoRandom(Senha);
            try
            {
                comando.CommandText = @"SELECT Nome 
                                        FROM usuario 
                                        WHERE Email = @Email AND SUBSTRING(senha, 6) = @Senha;";
                comando.Parameters.AddWithValue("@Email", Email);
                comando.Parameters.AddWithValue("@Senha", senhaCriptografada.Substring(5));

                object resultadoBusca = comando.ExecuteScalar();
                if (resultadoBusca != null)
                {
                    return Convert.ToString(resultadoBusca);
                }
            }
            catch (Exception ex)
            {
                throw new DataException(ex.Message);
            }
            return string.Empty;
        }

        public void Cadastrar(
            string Email,
            string Senha,
            string Nome)
        {
            comando.CommandText = @"INSERT INTO usuario (Email, Senha, Nome) 
                                    VALUES (@Email, @Senha, @Nome);";

            comando.Parameters.AddWithValue("@Email", Email);
            comando.Parameters.AddWithValue("@Senha", new FerramentasTexto().CriptografarSenhaCriptoRandom(Senha));
            comando.Parameters.AddWithValue("@Nome", Nome);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();
        }

        /// <summary>
        /// Obtem o usuário por e-mail
        /// </summary>
        /// <param name="Email"></param>
        public CadastroUsuarioDTO ObterPorEmail(string Email)
        {
            CadastroUsuarioDTO dadosUsuario = new CadastroUsuarioDTO();

            try
            {
                comando.CommandText = @"SELECT Email, Senha, Nome
                                    FROM usuario
                                    WHERE Email = @Email;";

                comando.Parameters.AddWithValue("@Email", Email);
                comando.CommandType = CommandType.Text;

                // Classe que auxilia no preenchimento de um dataset
                MySqlDataAdapter adap = new MySqlDataAdapter(comando);

                DataSet retorno = new DataSet();
                adap.Fill(retorno);

                DataRow dr = retorno.Tables[0].Rows[0];

                dadosUsuario.Email = dr["Email"].ToString();
                dadosUsuario.Nome = dr["Nome"].ToString();
                dadosUsuario.Senha = new FerramentasTexto().DescriptografarSenhaCriptoRandom(dr["Senha"].ToString());

                return dadosUsuario;
            }
            catch (DataException ex)
            {
                throw ex;
            }
            catch (IndexOutOfRangeException ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Excluir Usuário por email
        /// </summary>
        /// <param name="Email"></param>
        public void Excluir(string Email)
        {
            try
            {
                comando.CommandText = @"DELETE FROM usuario 
                                        WHERE Email = @Email;";

                comando.Parameters.AddWithValue("@Email", Email);
                comando.CommandType = System.Data.CommandType.Text;
                comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new DataException(ex.Message);
            }
        }
    }
}

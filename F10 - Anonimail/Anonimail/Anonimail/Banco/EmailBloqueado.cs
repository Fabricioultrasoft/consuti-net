using System.Data;
using MySql.Data.MySqlClient;

namespace Anonimail.Banco
{
    public class EmailBloqueado : BancoBase
    {
        public void BloquearEmail(string email, string CodDesbloqueio)
        {
            if (VerificaEmailBloqueado(email))
            {
                AtualizarBloquearEmail(email, CodDesbloqueio);
            }
            else
            {
                comando.CommandText = @"INSERT INTO emailsbloqueados(Email, CodDesbloqueio) VALUES (@EmailI, @CodDesbloqueioI)";
                comando.Parameters.AddWithValue("@emailI", email);
                comando.Parameters.AddWithValue("@CodDesbloqueioI", CodDesbloqueio);

                comando.CommandType = System.Data.CommandType.Text;
                comando.ExecuteNonQuery();

                comando.Dispose();
            }
        }

        public void AtualizarBloquearEmail(string emailB, string CodDesbloqueioB)
        {
            // criar um comando para executar a alteração / executar comando
            comando.CommandText = @"UPDATE emailsbloqueados 
                                    SET CodDesbloqueio = @CodDesbloqueioB 
                                    WHERE email = @emailB;";

            comando.Parameters.AddWithValue("@emailB", emailB);
            comando.Parameters.AddWithValue("@CodDesbloqueioB", CodDesbloqueioB);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();

            comando.Dispose();
        }

        /// <summary>
        /// Verifica um email bloqueado
        /// </summary>
        /// <param name="email"></param>
        /// <returns>Retorna True se o email estiver bloqueado</returns>
        public bool VerificaEmailBloqueado(string email)
        {
            comando.CommandText = @"SELECT Email 
                                    FROM emailsbloqueados 
                                    WHERE Email = @email";
            comando.Parameters.Add(new MySqlParameter("@Email", email));

            object resultadoBusca = comando.ExecuteScalar();
            comando.Dispose();

            if (resultadoBusca != null)
            {
                return true;
            }
            return false;
        }

        public string ObterEmailBloqueado(string CodDesbloqueio)
        {
            comando.CommandText = @"SELECT Email 
                                    FROM emailsbloqueados 
                                    WHERE CodDesbloqueio = @CodDesbloqueio";
            comando.Parameters.Add(new MySqlParameter("@CodDesbloqueio", CodDesbloqueio));
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            // Cria uma instância da classe DataRow para receber uma linha do DataSet.
            DataRow dr = retorno.Tables[0].Rows[0];
            comando.Dispose();

            //RETORNA com o valor do DataRow.
            return dr["EMAIL"].ToString();
        }

        public void DesbloquearEmail(string email)
        {
            // criar um comando para executar a alteração / executar comando
            comando.CommandText = @"UPDATE emailsbloqueados 
                                    SET CodDesbloqueio = '' 
                                    WHERE email = @email;";

            comando.Parameters.AddWithValue("@email", email);
            
            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();

            comando.Dispose();
        }
    }
}
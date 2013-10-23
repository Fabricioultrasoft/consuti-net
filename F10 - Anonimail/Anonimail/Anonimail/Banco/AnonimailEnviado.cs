using System;
using MySql.Data.MySqlClient;

namespace Anonimail.Banco
{
    public class AnonimailEnviado : BancoBase
    {
        /// <summary>
        /// Salva um AnôniMail no banco.
        /// </summary>
        /// <param name="emailDestinatario"></param>
        /// <param name="dataEnvio"></param>
        /// <param name="texto"></param>
        /// <param name="titulo"></param>
        /// <param name="codEnvio"></param>
        public void Incluir(
            string emailDestinatario,
            DateTime dataEnvio,
            string texto,
            string titulo,
            string codEnvio, 
            string emailResposta)
        {
            comando.CommandText = @"INSERT INTO anonimail (EmailDestinatario, Texto, Titulo, CodEnvio, DataEnvio, EmailResposta) 
                                    VALUES (@emailDestinatario, @texto, @titulo, @codEnvio, @dataEnvio, @emailResposta);";
            comando.Parameters.AddWithValue("@emailDestinatario", emailDestinatario);
            comando.Parameters.AddWithValue("@texto", texto);
            comando.Parameters.AddWithValue("@titulo", titulo);
            comando.Parameters.AddWithValue("@codEnvio", codEnvio);
            comando.Parameters.AddWithValue("@dataEnvio", dataEnvio);
            comando.Parameters.AddWithValue("@emailResposta", emailResposta);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();
        }

        /// <summary>
        /// Salva uma resposta enviada no banco.
        /// </summary>
        /// <param name="dataEnvio"></param>
        /// <param name="texto"></param>
        /// <param name="titulo"></param>
        /// <param name="codEnvio"></param>
        public void Incluir(
            DateTime dataEnvio,
            string texto,
            string titulo,
            string codEnvio)
        {
            comando.CommandText = @"INSERT INTO anonimail (EmailDestinatario, Texto, Titulo, CodEnvio, DataEnvio, EmailResposta) 
                                    VALUES (@emailDestinatario, @texto, @titulo, @codEnvio, @dataEnvio, @EmailResposta);";
            comando.Parameters.AddWithValue("@emailDestinatario", "RESPOSTA");
            comando.Parameters.AddWithValue("@texto", texto);
            comando.Parameters.AddWithValue("@titulo", titulo);
            comando.Parameters.AddWithValue("@codEnvio", codEnvio);
            comando.Parameters.AddWithValue("@dataEnvio", dataEnvio);
            comando.Parameters.AddWithValue("@emailResposta", "RESPOSTA");

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();
        }

        /// <summary>
        /// Verifica um codigo de anonimail para resposta
        /// </summary>
        /// <param name="codAnonimail"></param>
        /// <returns>Retorna True se o codigo de anonimail para resposta existir</returns>
        public bool VerificaCodigoAnonimail(string codAnonimail)
        {
            comando.CommandText = @"SELECT CodEnvio 
                                    FROM anonimail 
                                    WHERE CodEnvio = @codAnonimail";
            comando.Parameters.Add(new MySqlParameter("@codAnonimail", codAnonimail));

            object resultadoBusca = comando.ExecuteScalar();
            comando.Dispose();

            if (resultadoBusca != null)
            {
                return true;
            }
            return false;
        }
    }
}
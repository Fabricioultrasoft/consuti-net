using System;
using MySql.Data.MySqlClient;
using System.Data;
using System.Collections.Generic;

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

        public List<AnonimailDTO> ObterConversa(string CodEnvio)
        {
            List<AnonimailDTO> conversa = new List<AnonimailDTO>();
            comando.CommandText = @"SELECT Texto, DataEnvio, Titulo 
                                    FROM anonimail
                                    WHERE codEnvio = @CodEnvio
                                    ORDER BY DataEnvio desc";
            comando.Parameters.Add(new MySqlParameter("@CodEnvio", CodEnvio));
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            for (int i = 0; i < retorno.Tables[0].Rows.Count; i++)
            {
                AnonimailDTO aux = new AnonimailDTO();
                DataRow dr = retorno.Tables[0].Rows[i];

                aux.Texto = dr["Texto"].ToString();
                aux.dataEnvio = Convert.ToDateTime(dr["DataEnvio"].ToString());
                aux.Titulo = dr["Titulo"].ToString();

                conversa.Add(aux);
            }

            comando.Dispose();

            return conversa;
        }
    }
}
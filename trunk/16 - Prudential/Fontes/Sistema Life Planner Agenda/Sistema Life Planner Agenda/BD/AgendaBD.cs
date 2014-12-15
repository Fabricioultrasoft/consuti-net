using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;

namespace Sistema_Life_Planner_Agenda.BD
{
    public class AgendaBD : BancoBase
    {
        /// <summary>
        /// Cadastra um compromisso na agenda
        /// </summary>
        /// <param name="ID_Contato"></param>
        /// <param name="ID_Usuario"></param>
        /// <param name="Criar_Google_Agenda"></param>
        /// <param name="Data"></param>
        /// <param name="Hora"></param>
        /// <param name="Minutos"></param>
        /// <param name="Mais_Informacoes"></param>
        /// <param name="Preferencia_Contato"></param>
        public void Incluir(
            int ID_Contato,
            int ID_Usuario,
            bool Criar_Google_Agenda,
            DateTime Data,
            int Hora,
            int Minutos,
            string Mais_Informacoes,
            string Preferencia_Contato,
            string Periodo)
        {
            comando.CommandText = @"INSERT INTO agenda
                                           (ID_Contato, ID_Usuario, Criar_Google_Agenda, Data, Hora, Minutos, Mais_Informacoes, Preferencia_Contato, Periodo) 
                                    VALUES (@ID_Contato, @ID_Usuario, @Criar_Google_Agenda, @Data, @Hora, @Minutos, @Mais_Informacoes, @Preferencia_Contato, @Periodo);";
            comando.Parameters.AddWithValue("@ID_Contato", ID_Contato);
            comando.Parameters.AddWithValue("@ID_Usuario", ID_Usuario);
            comando.Parameters.AddWithValue("@Criar_Google_Agenda", Criar_Google_Agenda);
            comando.Parameters.AddWithValue("@Data", Data);
            comando.Parameters.AddWithValue("@Hora", Hora);
            comando.Parameters.AddWithValue("@Minutos", Minutos);
            comando.Parameters.AddWithValue("@Mais_Informacoes", Mais_Informacoes);
            comando.Parameters.AddWithValue("@Preferencia_Contato", Preferencia_Contato);
            comando.Parameters.AddWithValue("@Periodo", Periodo);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();

            this.Dispose();
        }

        /// <summary>
        /// Altera o cadastro de um compromisso
        /// </summary>
        /// <param name="ID_Agenda"></param>
        /// <param name="ID_Contato"></param>
        /// <param name="ID_Usuario"></param>
        /// <param name="Criar_Google_Agenda"></param>
        /// <param name="Data"></param>
        /// <param name="Hora"></param>
        /// <param name="Minutos"></param>
        /// <param name="Mais_Informacoes"></param>
        /// <param name="Preferencia_Contato"></param>
        /// <param name="Periodo"></param>
        public void Alterar(
            int ID_Agenda,
            int ID_Contato,
            int ID_Usuario,
            bool Criar_Google_Agenda,
            DateTime Data,
            int Hora,
            int Minutos,
            string Mais_Informacoes,
            string Preferencia_Contato,
            string Periodo)
        {
            // criar um comando para executar a alteração / executar comando
            comando.CommandText = @"UPDATE agenda 
                                    SET ID_Contato = @ID_Contato, Criar_Google_Agenda = @Criar_Google_Agenda, 
                                        Data = @Data, Hora = @Hora, Minutos = @Minutos, Mais_Informacoes = @Mais_Informacoes, 
                                        Preferencia_Contato = @Preferencia_Contato, Periodo = @Periodo 
                                    WHERE ID = @ID_Agenda
                                    AND ID_Usuario = @ID_Usuario";
            comando.Parameters.AddWithValue("@ID_Agenda", ID_Agenda);
            comando.Parameters.AddWithValue("@ID_Contato", ID_Contato);
            comando.Parameters.AddWithValue("@ID_Usuario", ID_Usuario);
            comando.Parameters.AddWithValue("@Criar_Google_Agenda", Criar_Google_Agenda);
            comando.Parameters.AddWithValue("@Data", Data);
            comando.Parameters.AddWithValue("@Hora", Hora);
            comando.Parameters.AddWithValue("@Minutos", Minutos);
            comando.Parameters.AddWithValue("@Mais_Informacoes", Mais_Informacoes);
            comando.Parameters.AddWithValue("@Preferencia_Contato", Preferencia_Contato);
            comando.Parameters.AddWithValue("@Periodo", Periodo);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();

            this.Dispose();
        }

        /// <summary>
        /// Lista os compromissos de um usuário
        /// </summary>
        /// <param name="idContato"></param>
        /// <param name="dataInicioDe"></param>
        /// <param name="dataInicioAte"></param>
        /// <param name="idUsuario"></param>
        /// <returns></returns>
        public DataSet Listar(
           string idContato,
           DateTime dataInicioDe,
           DateTime dataInicioAte,
           int idUsuario)
        {
            string filtrarContato = string.Empty;
            if (!string.IsNullOrEmpty(idContato))
            {
                filtrarContato = " AND ID_Contato = " + idContato;
            }

            comando.CommandText = @"SELECT c.Nome, agenda.ID, ID_Contato, ID_Usuario, Criar_Google_Agenda, CAST(SUBSTRING(DATE_FORMAT(Data, '%d/%m/%Y') FROM 1 FOR 10) AS CHAR) AS Data, 
                                           CAST(CONCAT(Hora, ':', Minutos) AS CHAR) AS Hora, Mais_Informacoes, Preferencia_Contato, Periodo 
                                    FROM agenda
                                    JOIN contato c ON c.id = agenda.ID_Contato
                                    WHERE ID_Usuario = @ID_Usuario 
                                    AND Data >= @dataInicioDe
                                    AND Data <= @dataInicioAte" +
                                    filtrarContato +
                                    " ORDER BY Data DESC ";
            comando.Parameters.AddWithValue("@ID_Usuario", idUsuario);
            comando.Parameters.AddWithValue("@dataInicioDe", dataInicioDe);
            comando.Parameters.AddWithValue("@dataInicioAte", dataInicioAte.AddHours(23).AddMinutes(59).AddSeconds(59));
            comando.CommandType = CommandType.Text;

            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            this.Dispose();

            return retorno;
        }

        /// <summary>
        /// Exclui o compromisso da agenda
        /// </summary>
        /// <param name="idAgenda"></param>
        public void Excluir(int idAgenda)
        {
            comando.CommandText = @"DELETE FROM agenda 
                                    WHERE ID = @idAgenda;";

            comando.Parameters.AddWithValue("@idAgenda", idAgenda);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();

            this.Dispose();
        }

        /// <summary>
        /// Obtem os dados de um compromisso
        /// </summary>
        /// <param name="ID_Agenda"></param>
        /// <param name="ID_Usuario"></param>
        /// <returns></returns>
        public DataSet Obter(string ID_Agenda, string ID_Usuario)
        {
            comando.CommandText = @"SELECT ID, ID_Contato, ID_Usuario, Criar_Google_Agenda, Data, Hora, Minutos, Mais_Informacoes, Preferencia_Contato, Periodo 
                                    FROM agenda
                                    WHERE ID_Usuario = @ID_Usuario
                                    AND ID = @ID_Agenda;";
            comando.Parameters.Add(new MySqlParameter("@ID_Usuario", ID_Usuario));
            comando.Parameters.Add(new MySqlParameter("@ID_Agenda", ID_Agenda));
            comando.CommandType = CommandType.Text;
            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);
            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            this.Dispose();

            return retorno;
        }
    }
}
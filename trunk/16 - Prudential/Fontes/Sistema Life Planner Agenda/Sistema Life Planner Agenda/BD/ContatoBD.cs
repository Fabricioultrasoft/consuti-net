using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;

namespace Sistema_Life_Planner_Agenda.BD
{
    public class ContatoBD : BancoBase
    {
        /// <summary>
        /// Cadastro de Contato
        /// </summary>
        /// <param name="ID_Contato_Recomendante"></param>
        /// <param name="ID_Status_Contato"></param>
        /// <param name="ID_Tipo_Contato"></param>
        /// <param name="Cidade"></param>
        /// <param name="Email"></param>
        /// <param name="Estado_Civil"></param>
        /// <param name="Data_Cadastro"></param>
        /// <param name="Filhos"></param>
        /// <param name="Idade"></param>
        /// <param name="Nome"></param>
        /// <param name="Outras_Informacoes"></param>
        /// <param name="Profissao"></param>
        /// <param name="Sexo"></param>
        /// <param name="Telefone_Alternativo_1"></param>
        /// <param name="Telefone_Alternativo_2"></param>
        /// <param name="Telefone_Principal"></param>
        /// <param name="UF"></param>
        public void Incluir(
            int ID_Contato_Recomendante,
            int ID_Status_Contato, 
            int ID_Tipo_Contato,
            string Cidade, 
            string Email, 
            string Estado_Civil, 
            DateTime Data_Cadastro,
            int Filhos, 
            int Idade, 
            string Nome, 
            string Outras_Informacoes, 
            string Profissao,
            char Sexo, 
            string Telefone_Alternativo_1, 
            string Telefone_Alternativo_2,
            string Telefone_Principal,
            string UF)
        {
            comando.CommandText = @"INSERT INTO contato
                                        (ID_Contato_Recomendante, ID_Status_Contato, ID_Tipo_Contato, 
                                        Cidade, Email, Estado_Civil, Data_Cadastro, Filhos, Idade, Nome, Outras_Informacoes, 
                                        Profissao, Sexo, Telefone_Alternativo_1, Telefone_Alternativo_2, Telefone_Principal, UF) 
                                    VALUES (@ID_Contato_Recomendante, @ID_Status_Contato, @ID_Tipo_Contato, @Cidade,
                                        @Email, @Estado_Civil, @Data_Cadastro, @Filhos, @Idade, @Nome, @Outras_Informacoes, @Profissao,
                                        @Sexo, @Telefone_Alternativo_1, @Telefone_Alternativo_2, @Telefone_Principal, @UF);";
            comando.Parameters.AddWithValue("@ID_Contato_Recomendante", ID_Contato_Recomendante);
            comando.Parameters.AddWithValue("@ID_Status_Contato", ID_Status_Contato);
            comando.Parameters.AddWithValue("@ID_Tipo_Contato", ID_Tipo_Contato);
            comando.Parameters.AddWithValue("@Cidade", Cidade);
            comando.Parameters.AddWithValue("@Email", Email);
            comando.Parameters.AddWithValue("@Estado_Civil", Estado_Civil);
            comando.Parameters.AddWithValue("@Data_Cadastro", Data_Cadastro);
            comando.Parameters.AddWithValue("@Filhos", Filhos);
            comando.Parameters.AddWithValue("@Idade", Idade);
            comando.Parameters.AddWithValue("@Nome", Nome);
            comando.Parameters.AddWithValue("@Outras_Informacoes", Outras_Informacoes);
            comando.Parameters.AddWithValue("@Profissao", Profissao);
            comando.Parameters.AddWithValue("@Sexo", Sexo);
            comando.Parameters.AddWithValue("@Telefone_Alternativo_1", Telefone_Alternativo_1);
            comando.Parameters.AddWithValue("@Telefone_Alternativo_2", Telefone_Alternativo_2);
            comando.Parameters.AddWithValue("@Telefone_Principal", Telefone_Principal);
            comando.Parameters.AddWithValue("@UF", UF);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();
        }



        /// <summary>
        /// Lista os contatos cadastrados e seus ID's
        /// </summary>
        /// <returns></returns>
        public DataSet Listar()
        {   
            comando.CommandText = @"SELECT ID, Nome
                                    FROM contato" +
                                  " ORDER BY Nome ASC";
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;
        }

        /// <summary>
        /// Obtem os dados cadastrais de um usuário a apartir do ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public DataSet Obter(int id)
        {
            comando.CommandText = @"SELECT ID_Contato_Recomendante, ID_Status_Contato, ID_Tipo_Contato, 
                                        Cidade, Email, Estado_Civil, Data_Cadastro, Filhos, Idade, Nome, 
                                        Outras_Informacoes, Profissao, Sexo, Telefone_Alternativo_1, 
                                        Telefone_Alternativo_2, Telefone_Principal, UF 
                                    FROM contato
                                    WHERE ID = @id;";
            comando.Parameters.AddWithValue("@id", id);

            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;
        }
    }
}
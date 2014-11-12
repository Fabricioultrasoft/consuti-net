using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;
using MySql.Data.Types;

namespace Sistema_Life_Planner_Agenda.BD
{
    public class ContatoBD : BancoBase
    {
        /// <summary>
        /// Inclui um contato e retorna o codigo do contato cadastrado
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
        /// <returns></returns>
        public int Incluir(
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

            this.Dispose();

            return new ContatoBD().ObterID(
                ID_Contato_Recomendante,
                Data_Cadastro,
                Nome,
                Sexo,
                Telefone_Principal);
        }

        /// <summary>
        /// Obtem o Id de um usuário cadastrado
        /// </summary>
        /// <param name="ID_Contato_Recomendante"></param>
        /// <param name="Email"></param>
        /// <param name="Data_Cadastro"></param>
        /// <param name="Nome"></param>
        /// <param name="Outras_Informacoes"></param>
        /// <param name="Sexo"></param>
        /// <param name="Telefone_Principal"></param>
        /// <returns></returns>
        public int ObterID(
            int ID_Contato_Recomendante,            
            DateTime Data_Cadastro,
            string Nome,
            char Sexo,
            string Telefone_Principal
            )
        {
            comando.CommandText = @"SELECT Id
                                    FROM contato
                                    WHERE ID_Contato_Recomendante = @ID_Contato_Recomendante                                     
                                    AND Data_Cadastro = @Data_Cadastro
                                    AND Nome = @Nome
                                    AND Sexo = @Sexo
                                    AND Telefone_Principal = @Telefone_Principal";
            comando.Parameters.AddWithValue("@ID_Contato_Recomendante", ID_Contato_Recomendante);            
            comando.Parameters.AddWithValue("@Data_Cadastro", Data_Cadastro);
            comando.Parameters.AddWithValue("@Nome", Nome);
            comando.Parameters.AddWithValue("@Sexo", Sexo);
            comando.Parameters.AddWithValue("@Telefone_Principal", Telefone_Principal);
            object resultadoBusca = comando.ExecuteScalar();

            this.Dispose();

            try
            {
                return Convert.ToInt32(resultadoBusca.ToString());
            }
            catch (Exception)
            {
                return 0;
            }

            
        }

        /// <summary>
        /// Obtém o ID do Contato a partir Nome e Email para listar o usuário logado
        /// </summary>
        /// <param name="ID_Contato_Recomendante"></param>
        /// <param name="Nome"></param>
        /// <param name="Email"></param>
        /// <returns></returns>
        public int ObterID(
            int ID_Contato_Recomendante,
            string Nome,
            string Email)
        {
            comando.CommandText = @"SELECT Id
                                    FROM contato
                                    WHERE ID_Contato_Recomendante = @ID_Contato_Recomendante
                                    AND Nome = @Nome
                                    AND Email = @Email";
            comando.Parameters.AddWithValue("@ID_Contato_Recomendante", ID_Contato_Recomendante);
            comando.Parameters.AddWithValue("@Nome", Nome);
            comando.Parameters.AddWithValue("@Email", Email);
            object resultadoBusca = comando.ExecuteScalar();

            this.Dispose();

            try
            {
                return Convert.ToInt32(resultadoBusca.ToString());
            }
            catch (Exception)
            {
                return 0;
            }
        }


        /// <summary>
        /// Atualiza um contato
        /// </summary>
        /// <param name="ID"></param>
        /// <param name="ID_Contato_Recomendante"></param>
        /// <param name="ID_Status_Contato"></param>
        /// <param name="ID_Tipo_Contato"></param>
        /// <param name="Cidade"></param>
        /// <param name="Email"></param>
        /// <param name="Estado_Civil"></param>
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
        public void Atualizar(
            int ID,
            int ID_Contato_Recomendante,
            int ID_Status_Contato,
            int ID_Tipo_Contato,
            string Cidade,
            string Email,
            string Estado_Civil,
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
            comando.CommandText = @"UPDATE contato 
                                    SET ID_Contato_Recomendante = @ID_Contato_Recomendante, 
                                        ID_Status_Contato = @ID_Status_Contato, ID_Tipo_Contato = @ID_Tipo_Contato, 
                                        Cidade = @Cidade, Email = @Email, Estado_Civil = @Estado_Civil, 
                                        Filhos = @Filhos, Idade = @Idade, Nome = @Nome, Outras_Informacoes = @Outras_Informacoes, 
                                        Profissao = @Profissao, Sexo = @Sexo, Telefone_Alternativo_1 = @Telefone_Alternativo_1, 
                                        Telefone_Alternativo_2 = @Telefone_Alternativo_2, Telefone_Principal = @Telefone_Principal,
                                        UF = @UF 
                                    WHERE ID = @id;";

            comando.Parameters.AddWithValue("@ID_Contato_Recomendante", ID_Contato_Recomendante);
            comando.Parameters.AddWithValue("@ID_Status_Contato", ID_Status_Contato);
            comando.Parameters.AddWithValue("@ID_Tipo_Contato", ID_Tipo_Contato);
            comando.Parameters.AddWithValue("@Cidade", Cidade);
            comando.Parameters.AddWithValue("@Email", Email);
            comando.Parameters.AddWithValue("@Estado_Civil", Estado_Civil);
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
            comando.Parameters.AddWithValue("@id", ID);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();

            this.Dispose();
        }

        /// <summary>
        /// Lista os contatos cadastrados e seus ID's
        /// </summary>
        /// <returns></returns>
        public DataSet Listar(int idUsuario)
        {
            comando.CommandText = @"SELECT contato.ID as ID, contato.Nome as Nome
                                    FROM contato
                                    JOIN usuario_contato ON usuario_contato.ID_Contato = contato.ID
                                    WHERE usuario_contato.ID_Usuario = @idUsuario
                                    ORDER BY Nome ASC";
            comando.Parameters.AddWithValue("@idUsuario", idUsuario);
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            this.Dispose();

            return retorno;
        }

        /// <summary>
        /// Lista os contatos de um usuário, pesquisando por nome, recomendante ou telefone.
        /// Na busca por telefone, ele irá considerar todos os telefones cadastrados para o usuário.
        /// </summary>
        /// <param name="nome"></param>
        /// <param name="idRecomendante"></param>
        /// <param name="telefonePrincipal"></param>
        /// <param name="idUsuario"></param>
        /// <returns></returns>
        public DataSet Listar(string nome,
            string idRecomendante,
            string telefonePrincipal,
            string idStatus,
            int idUsuario)
        {
            #region Lógica de filtros

            string filtrarRecomendante = string.Empty, filtrarNomeTelefone = string.Empty, filtrarStatus = string.Empty;
            if (!string.IsNullOrEmpty(idRecomendante))
            {
                filtrarRecomendante = " AND c.ID_Contato_Recomendante = " + idRecomendante;
            }
            if (!string.IsNullOrEmpty(idStatus))
            {
                filtrarStatus = " AND c.ID_Status_Contato = " + idStatus;
            }
            if (!string.IsNullOrEmpty(nome) && !string.IsNullOrEmpty(telefonePrincipal))
            {
                filtrarNomeTelefone = @" AND (c.Nome LIKE '%" + nome + "%' " +
                                        @" OR c.Telefone_Principal LIKE '%" + telefonePrincipal + "%' " +
                                        @" OR c.Telefone_Alternativo_1 LIKE '%" + telefonePrincipal + "%' " +
                                        @" OR c.Telefone_Alternativo_2 LIKE '%" + telefonePrincipal + "%') ";
            }
            else if (!string.IsNullOrEmpty(nome) && string.IsNullOrEmpty(telefonePrincipal))
            {
                filtrarNomeTelefone = @" AND c.Nome LIKE '%" + nome + "%' ";
            }
            else if (string.IsNullOrEmpty(nome) && !string.IsNullOrEmpty(telefonePrincipal))
            {
                filtrarNomeTelefone = @" AND c.Telefone_Principal LIKE '%" + telefonePrincipal + "%' " +
                                        @" OR c.Telefone_Alternativo_1 LIKE '%" + telefonePrincipal + "%' " +
                                        @" OR c.Telefone_Alternativo_2 LIKE '%" + telefonePrincipal + "%' ";
            }

            #endregion

            comando.CommandText = @"SELECT c.ID, c.nome,
                                           CONCAT('(', SUBSTRING(Telefone_Principal, 1,2), ')',' ', SUBSTRING(Telefone_Principal, 3,4), '-',SUBSTRING(Telefone_Principal, 7,5) ) AS telefonePrincipal, 
                                           c.Data_Cadastro AS DataCadastro,  
                                           (SELECT status FROM status_contato WHERE status_contato.id = c.ID_Status_Contato) AS status,
                                           (SELECT nome FROM contato WHERE contato.id = c.ID_Contato_Recomendante) AS recomendante
                                    FROM contato c
                                    JOIN usuario_contato uc ON uc.ID_Contato = c.ID                                    
                                    WHERE uc.ID_Usuario = @idUsuario " +
                                    filtrarRecomendante +
                                    filtrarStatus +
                                    filtrarNomeTelefone +
                                    " ORDER BY c.Nome ASC";
            comando.Parameters.AddWithValue("@idUsuario", idUsuario);
            comando.CommandType = CommandType.Text;

            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            this.Dispose();

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

            this.Dispose();

            return retorno;
        }

        /// <summary>
        /// Exclui um contato
        /// </summary>
        /// <param name="id"></param>
        public void Excluir(int id)
        {
            comando.CommandText = @"DELETE FROM contato 
                                    WHERE ID = @Id;";
            comando.Parameters.AddWithValue("@Id", id);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();

            this.Dispose();

            AtualizarRecomendante(
                id, 2);
            // ao excluir, tem que setar o recomendante para "NENHUM". Registro de carga inicial.
        }

        public int IncluirLote(
            int ID_Contato_Recomendante,
            DateTime Data_Cadastro,
            string Nome,
            string Outras_Informacoes,
            char Sexo,
            string Telefone_Principal)
        {
            comando.CommandText = @"INSERT INTO contato
                                        (ID_Contato_Recomendante, ID_Status_Contato, ID_Tipo_Contato, 
                                        Cidade, Email, Estado_Civil, Data_Cadastro, Filhos, Idade, Nome, Outras_Informacoes, 
                                        Profissao, Sexo, Telefone_Alternativo_1, Telefone_Alternativo_2, Telefone_Principal, UF) 
                                    VALUES (@ID_Contato_Recomendante, @ID_Status_Contato, @ID_Tipo_Contato, @Cidade,
                                        @Email, @Estado_Civil, @Data_Cadastro, @Filhos, @Idade, @Nome, @Outras_Informacoes, @Profissao,
                                        @Sexo, @Telefone_Alternativo_1, @Telefone_Alternativo_2, @Telefone_Principal, @UF);";
            comando.Parameters.AddWithValue("@ID_Contato_Recomendante", ID_Contato_Recomendante);
            comando.Parameters.AddWithValue("@ID_Status_Contato", 7); //7 - Nenhum
            comando.Parameters.AddWithValue("@ID_Tipo_Contato", 4); // 4 - Nenhum
            comando.Parameters.AddWithValue("@Cidade", string.Empty);
            comando.Parameters.AddWithValue("@Email", string.Empty);
            comando.Parameters.AddWithValue("@Estado_Civil", string.Empty);
            comando.Parameters.AddWithValue("@Data_Cadastro", Data_Cadastro);
            comando.Parameters.AddWithValue("@Filhos", 0);
            comando.Parameters.AddWithValue("@Idade", 0);
            comando.Parameters.AddWithValue("@Nome", Nome);
            comando.Parameters.AddWithValue("@Outras_Informacoes", Outras_Informacoes);
            comando.Parameters.AddWithValue("@Profissao", string.Empty);
            comando.Parameters.AddWithValue("@Sexo", Sexo);
            comando.Parameters.AddWithValue("@Telefone_Alternativo_1", string.Empty);
            comando.Parameters.AddWithValue("@Telefone_Alternativo_2", string.Empty);
            comando.Parameters.AddWithValue("@Telefone_Principal", Telefone_Principal);
            comando.Parameters.AddWithValue("@UF", string.Empty);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();

            this.Dispose();

            return new ContatoBD().ObterID(
                ID_Contato_Recomendante,
                Data_Cadastro,
                Nome,
                Sexo,
                Telefone_Principal);
        }

        /// <summary>
        /// Retorna a lista de usuários com o mesmo telefone
        /// </summary>
        /// <param name="idUsuario"></param>
        /// <param name="telefone"></param>
        /// <returns></returns>
        public DataSet PesquisaContatoPeloTelefone(
            string idUsuario,
            string telefone)
        {
            comando.CommandText = @"SELECT *
                FROM contato c
                JOIN usuario_contato uc ON uc.ID_Contato = c.ID  
                WHERE uc.ID_Usuario = @idUsuario
                AND (Telefone_Principal LIKE '%" + telefone + "%' " +
                "OR Telefone_Alternativo_1 LIKE '%" + telefone + "%' " +  
                "OR Telefone_Alternativo_2 LIKE '%" + telefone + "%') " +
                "ORDER BY c.Nome";

            comando.Parameters.AddWithValue("@idUsuario", idUsuario);

            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            this.Dispose();

            return retorno;       
        
        }

        /// <summary>
        /// Atualiza apenas o recomendante do contato
        /// </summary>
        /// <param name="ID"></param>
        /// <param name="IDContatoRecomendanteNovo"></param>
        public void AtualizarRecomendante(
            int ID,
            int IDContatoRecomendanteNovo)
        {
            comando.CommandText = @"UPDATE contato 
                                    SET IDContatoRecomendanteNovo = @IDContatoRecomendanteNovo
                                    WHERE ID = @id;";

            comando.Parameters.AddWithValue("@IDContatoRecomendanteNovo", IDContatoRecomendanteNovo);
            comando.Parameters.AddWithValue("@id", ID);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();

            this.Dispose();
        }
    }
}
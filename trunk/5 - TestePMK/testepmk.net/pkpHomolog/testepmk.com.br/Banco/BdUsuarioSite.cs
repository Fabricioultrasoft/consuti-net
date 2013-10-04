using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

namespace testePMK.com.br.Banco
{
    public class BdUsuarioSite
    {
        //variáveis de conexão e comandos para o banco
        private MySqlConnection conexao = null;
        private MySqlCommand comando = null;

        /// <summary>
        /// cria conexão com banco
        /// </summary>
        public BdUsuarioSite()
        {
            //abrir conexão com banco  
            conexao = new MySqlConnection(ConfigurationSettings.AppSettings["constr"]);
            conexao.Open();

            //executar a inclusão
            comando = new MySqlCommand();
            comando = conexao.CreateCommand();
        }

        //liberar recursos
        public void Dispose()
        {
            comando.Dispose();
            conexao.Dispose();
        }

        /// <summary>
        /// valida a existencia de um usuário com o login e senha especificado
        /// </summary>
        /// <param name="email">email do usuário</param>
        /// <param name="senha">senha do usuário</param>
        /// <returns>true se o usuário existir, false caso contrário</returns>
        public bool validaUsuario(
            string email, string senha)
        {

            bool AdminOk = false;
            comando.CommandText = "SELECT * FROM usuario WHERE EMAIL = @email AND SENHA = @senha";
            comando.Parameters.Add(new MySqlParameter("@email", email));
            comando.Parameters.Add(new MySqlParameter("@senha", senha));
            object resultadoBusca = comando.ExecuteScalar();
            if (resultadoBusca != null)
            {
                AdminOk = true;
            }
            return AdminOk;
        }

        public DataSet DadosUser()
        {
            comando.CommandText = "SELECT CPF, NOME, DATA_NASC, SENHA, SEXO, CELULAR, " +
                "TEL_FIXO, RUA, BAIRRO, COMPLEMENTO, CIDADE, ESTADO, PROFISSAO, EMAIL, CNPJ, RAZAO_SOCIAL " +
                "FROM usuario;";
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;
        }

        public void AlterarUsuario(
            string login,
            string senha)
        {
            // criar um comando para executar a alteração / executar comando
            comando.CommandText = "UPDATE adm " +
                "SET Login = @login, Senha = @senha " +
                "WHERE ID = 1 ";
            comando.Parameters.AddWithValue("@login", login);
            comando.Parameters.AddWithValue("@senha", senha);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();

        }

        /// <summary>
        /// valida a existencia de um usuário e retorna sua senha
        /// </summary>
        /// <param name="email">email a ser validado</param>
        /// <returns>a senha se existir o cadastro, "" caso não exista o email</returns>
        public string validaExistencia(string email)
        {
            string usuarioOK;

            try
            {
                comando.CommandText = "SELECT SENHA, EMAIL " +
                    "FROM usuario " +
                    "WHERE EMAIL = @email;";
                comando.Parameters.Add(new MySqlParameter("@email", email));
                comando.CommandType = CommandType.Text;

                // Classe que auxilia no preenchimento de um dataset
                MySqlDataAdapter adap = new MySqlDataAdapter(comando);

                DataSet retorno = new DataSet();
                adap.Fill(retorno);

                // Cria uma instância da classe DataRow para receber uma linha do DataSet.
                DataRow dr = retorno.Tables[0].Rows[0];

                //Inicializa os campos da tela com os valores do DataRow.
                usuarioOK = dr["SENHA"].ToString();
            }
            catch (Exception)
            {
                usuarioOK = "";
            }
            return usuarioOK;
        }

        public string GetNome(string email)
        {
            comando.CommandText = "SELECT NOME " +
                    "FROM usuario " +
                    "WHERE EMAIL = @eml;";
            comando.Parameters.Add(new MySqlParameter("@eml", email));
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            // Cria uma instância da classe DataRow para receber uma linha do DataSet.
            DataRow dr = retorno.Tables[0].Rows[0];

            //RETORNA com o valor do DataRow.
            return dr["NOME"].ToString();
        }

        //cadastra o usuário externo do site
        public void CadastraUsuario(
            string cpf,
            string nome,
            string dataNascimento,
            string senha,
            string sexo,
            string celular,
            string telefoneFixo,
            string rua,
            string bairro,
            string complemento,
            string cidade,
            string estado,
            string profissao,
            string email,
            string cnpj,
            string razaoSocial,
            int numero, 
            string cep,
            string inscrEstadual,
            string rg)
        {
            
            // criar um comando para executar a alteração / executar comando
            comando.CommandText = "INSERT INTO usuario " +
                "(CPF, NOME, DATA_NASC, SENHA, SEXO, CELULAR, TEL_FIXO, RUA, BAIRRO, " +
                "COMPLEMENTO, CIDADE, ESTADO, PROFISSAO, EMAIL, CNPJ, RAZAO_SOCIAL, NUMERO, CEP, INSCRICAO_ESTADUAL, RG) " +
                "VALUES (@cpf, @nome, @dataNasc, @senha, @sexo, @celular, @telefoneFixo, " +
                "@rua, @bairro, @complemento, @cidade, @estado, @profissao, @email, @cnpj, " +
                "@razaoSocial, @numero, @cep, @inscrEstadual, @rg);";
            comando.Parameters.AddWithValue("@cpf", cpf);
            comando.Parameters.AddWithValue("@nome", nome);            
            
            if (dataNascimento == "null")
            {
                comando.Parameters.AddWithValue("@dataNasc", dataNascimento);
            }else{
               comando.Parameters.AddWithValue("@dataNasc", Convert.ToDateTime(dataNascimento));
            }
            
            comando.Parameters.AddWithValue("@senha", senha);
            comando.Parameters.AddWithValue("@sexo", sexo);
            comando.Parameters.AddWithValue("@celular", celular);
            comando.Parameters.AddWithValue("@telefoneFixo", telefoneFixo);
            comando.Parameters.AddWithValue("@rua", rua);
            comando.Parameters.AddWithValue("@bairro", bairro);
            comando.Parameters.AddWithValue("@complemento", complemento);
            comando.Parameters.AddWithValue("@cidade", cidade);
            comando.Parameters.AddWithValue("@profissao", profissao);
            comando.Parameters.AddWithValue("@estado", estado);
            comando.Parameters.AddWithValue("@email", email);
            comando.Parameters.AddWithValue("@cnpj", cnpj);
            comando.Parameters.AddWithValue("@razaoSocial", razaoSocial);
            comando.Parameters.AddWithValue("@numero", numero);
            comando.Parameters.AddWithValue("@cep", cep);
            comando.Parameters.AddWithValue("@inscrEstadual", inscrEstadual);
            comando.Parameters.AddWithValue("@rg", rg);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();
        }

        /// <summary>
        /// Obtém os dados de um usuário em específico
        /// </summary>
        /// <param name="idUsuario"></param>
        /// <returns></returns>
        public DataSet GetDetalhesUsuario(int idUsuario)
        {
            comando.CommandText = "SELECT ID, CPF, NOME, DATA_NASC, SEXO, CELULAR, TEL_FIXO, RUA, " +
                "BAIRRO, COMPLEMENTO, CIDADE, ESTADO, PROFISSAO, EMAIL, CNPJ, RAZAO_SOCIAL, NUMERO, CEP, INSCRICAO_ESTADUAL, RG " +
                "FROM usuario WHERE ID = @idUsuario;";
            comando.Parameters.AddWithValue("@idUsuario", idUsuario);
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;
        }

        /// <summary>
        /// lista todos os usuários cadastrados no sistema 
        /// </summary>
        /// <returns>dataSet com a listagem de usuários cadastrados</returns>
        public DataSet Listar()
        {
            comando.CommandText = "SELECT ID, CPF, NOME, DATA_NASC, SENHA, SEXO, CELULAR, TEL_FIXO, RUA, " +
                "BAIRRO, COMPLEMENTO, CIDADE, ESTADO, PROFISSAO, EMAIL, CNPJ, RAZAO_SOCIAL, NUMERO, CEP, INSCRICAO_ESTADUAL, RG " +
                "FROM usuario;";
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;
        }

        /// <summary>
        /// lista todos os usuários cadastrados no sistema ordenando-os conforme requisição
        /// </summary>        
        /// <param name="ordem">coluna que será usada para ordenar</param>
        /// <returns>dataSet com a listagem de usuários cadastrados</returns>>
        public DataSet Listar(int ordem)
        {
            string orderBy = "ORDER BY ";

            //captura qual a ordenação
            if (ordem == 1)
            {
                orderBy += "ID";
            }
            else if (ordem == 2)
            {
                orderBy += "NOME";
            }
            else if (ordem == 3)
            {
                orderBy += "EMAIL";
            }
            comando.CommandText = "SELECT ID, CPF, NOME, DATA_NASC, SENHA, SEXO, CELULAR, TEL_FIXO, RUA, " +
                "BAIRRO, COMPLEMENTO, CIDADE, ESTADO, PROFISSAO, EMAIL, CNPJ, RAZAO_SOCIAL, NUMERO, CEP, INSCRICAO_ESTADUAL, RG " +
                "FROM usuario " + orderBy + " ASC;";
            comando.CommandType = CommandType.Text;

            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);

            DataSet retorno = new DataSet();
            adap.Fill(retorno);

            return retorno;
        }

        /// <summary>
        /// lista todos os usuários cadastrados no sistema que contenham alguma parte da string relacionada
        /// </summary>        
        /// <param name="ordem">coluna que será usada para ordenar</param>
        /// <param name="filtro">elemento que será usado para filtrar o email e o nome</param>
        /// <returns>dataSet com a listagem de usuários cadastrados</returns>
        public DataSet Listar(int ordem, string filtro)
        {
            string orderBy = "ORDER BY ";

            //captura qual a ordenação
            if (ordem == 1)
            {
                orderBy += "ID";
            }
            else if (ordem == 2)
            {
                orderBy += "NOME";
            }
            else if (ordem == 3)
            {
                orderBy += "EMAIL";
            }
            comando.CommandText = "SELECT ID, CPF, NOME, DATA_NASC, SENHA, SEXO, CELULAR, TEL_FIXO, RUA, " +
                "BAIRRO, COMPLEMENTO, CIDADE, ESTADO, PROFISSAO, EMAIL, CNPJ, RAZAO_SOCIAL, NUMERO, CEP, INSCRICAO_ESTADUAL, RG " +
                "FROM usuario " +
                "WHERE NOME LIKE '%" + filtro + "%' OR EMAIL LIKE '%" + filtro + "%' " +
                orderBy + " ASC;";
            comando.CommandType = CommandType.Text;
            // Classe que auxilia no preenchimento de um dataset
            MySqlDataAdapter adap = new MySqlDataAdapter(comando);
            DataSet retorno = new DataSet();
            adap.Fill(retorno);
            return retorno;
        }
    }
}
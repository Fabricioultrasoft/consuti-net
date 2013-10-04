using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace ProGeS
{
    class cadastrarLogin
    {
        private string usuario;
        private string senha;
        //para proteger a senha usar a conversão para int e usar peso por casa
        private int senhaProtegida;

        //construtor padrão
        public cadastrarLogin()
        {
            usuario = "";
            senha = "";
        }        

        public string salvaUser(string nomeUsuario, string senhaUsuario, string dicaSenha)
        {
            if (validaExistencia(nomeUsuario) == true)
            {
                //gerar a senha "criptografada".
                protegerSenha senhaTratada = new protegerSenha(senhaUsuario);
                senhaProtegida = senhaTratada.retornaSenha();
                //procedimentos para abrir arquivo e adicionar os próximos valores ao final do arquivo
                Stream cadastraLogin = File.Open("logins.txt", FileMode.Append);//Escrever no final
                StreamWriter adiconaValores = new StreamWriter(cadastraLogin);
                adiconaValores.WriteLine(nomeUsuario + ";" + senhaProtegida + ";" + dicaSenha + ";" + DateTime.Now + "&");
                adiconaValores.Flush();
                adiconaValores.Close();
                usuario = nomeUsuario;
                senha = senhaUsuario;
                return "Cadastrado com sucesso!";
            }
            else
            {
                return "Usuário não cadastrado! O usuário " + nomeUsuario + " já existe. Verifique os dados e tente novamente.";
            }
        }

        public string retornaUsuarioCad()
        {
            return usuario;
        }

        public string retornaSenhaCad()
        {
            return senha;
        }


        /// <summary>
        /// valida se já existe usuário com o login desejado
        /// </summary>
        /// <param name="usuario">usuário a ser validado</param>
        /// <returns>true se o usuário não existir, false se já existir</returns>
        private bool validaExistencia(string usuario)
        {
            TextReader buscaUsuario = new StreamReader("logins.txt");
            string testaNome = "";
            string[] split;
            bool retorno = true;
            try
            {
                //para buscar o usuário                 
                while (buscaUsuario.Peek() != -1 || testaNome != usuario)
                {
                    testaNome = buscaUsuario.ReadLine();
                    split = testaNome.Split(';');
                    testaNome = split[0];
                }
                //se encontrou usuário, pega a dica
                if (usuario == testaNome)
                {
                    retorno = false;
                }
            }
            catch (Exception)
            {
                //nada
            }
            finally
            {
                buscaUsuario.Dispose();
            }

            return retorno;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace ProGeS
{
    class dicaSenhaLogin
    {
        private string usuario = "", testaNome = "", msg;
        private string[] split;

        public dicaSenhaLogin(string inUsuario)
        {
            usuario = inUsuario;
        }

        /// <summary>
        /// Pesquisa o usuário e retorna sua dica de senha
        /// </summary>
        /// <returns>mensagem com o resultado da busca de dica de senha</returns>
        public string RetornaDica()
        {
            TextReader buscaUsuario = new StreamReader("logins.txt");
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
                    msg = "A dica de senha do usuário " + usuario +
                        " é: \n" + split[2];
                }
            }
            catch (Exception)
            {
                msg = "Dica para este usuário não encontrada!";
            }
            finally
            {
                buscaUsuario.Dispose();
            }

            return msg;
        }
    }
}

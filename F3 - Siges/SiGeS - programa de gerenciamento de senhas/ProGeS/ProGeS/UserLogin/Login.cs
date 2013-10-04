using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace ProGeS
{
    class Login
    {
        private string usuario, senha, testaNome = "", testaSenha = "";
        private bool usuarioOK, senhaOK;        
        private string[] split;

        /// <summary>
        /// Construtor alternativo
        /// </summary>
        /// <param name="inUsuario">Usuário digitado</param>
        /// <param name="inSenha">Senha digitada</param>
        public Login(string inUsuario, string inSenha)
        {
            usuario = inUsuario;
            //gerar a senha "criptografada".
            protegerSenha senhaTratadaLogin = new protegerSenha(inSenha);
            senha = Convert.ToString(senhaTratadaLogin.retornaSenha());            
        }

        /// <summary>
        /// Valida se o usuário digitado é valido
        /// </summary>
        /// <returns>true caso o usuário seja válido</returns>
        public bool validaUsuario()
        {
            TextReader buscaUsuario = new StreamReader("logins.txt");
            try
            {
                while (buscaUsuario.Peek() != -1 || testaNome != usuario)
                {
                    testaNome = buscaUsuario.ReadLine();
                    split = testaNome.Split(';');
                    testaNome = split[0];
                }

                if (usuario == testaNome)
                    usuarioOK = true;
            }
            catch (Exception)
            {
                //nada
            }
            finally
            {
                buscaUsuario.Dispose();
            }
                return usuarioOK;
            
        }
        
        /// <summary>
        /// Valida se a senha digitada é uma senha cadastrada
        /// </summary>
        /// <returns>true caso a senha seja válida</returns>
        public bool validaSenha()
        {
            TextReader buscaSenha = new StreamReader("logins.txt");
            try
            {
                while (buscaSenha.Peek() != -1 || testaSenha != senha)
                {
                    testaSenha = buscaSenha.ReadLine();
                    split = testaSenha.Split(';');
                    testaSenha = split[1];
                }
                if (senha == testaSenha)
                    senhaOK = true;
            }
            catch (Exception)
            {
                //nada
            }
            finally
            {
                buscaSenha.Dispose();
            }

            return senhaOK;            
        }
    }
}

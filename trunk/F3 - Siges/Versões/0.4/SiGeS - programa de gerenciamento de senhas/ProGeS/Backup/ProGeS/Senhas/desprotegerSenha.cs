using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProGeS
{
    class desprotegerSenha
    {
        private string senhaReal;
        public desprotegerSenha(string senhaCriptografada)
        {
            for (int i = 0; i < senhaCriptografada.Length; i++)
            {
                //transformar a senha em string novamente
                senhaReal = "";
            }
        }

        public string retornaSenha()
        {
            //retona a senha Real
            return senhaReal;
        }
    }
}

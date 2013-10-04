using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ProGeS
{
    //classe para segunrança do sistema
    class protegerSenha
    {
        private int senhaCriptografada;
        public protegerSenha(string senha)
        {
            senhaCriptografada = -1;
            for (int i = 0; i < senha.Length; i++)
            {
                //transformar a senha em int multiplicando pelo peso para 
                //poder transformar novamente em string
                senhaCriptografada = Convert.ToInt32(senha[i]) * (i+1);
            }
        }

        public int retornaSenha()
        {
            //retona a senha "criptografada"
            return senhaCriptografada;
        }
    }
}

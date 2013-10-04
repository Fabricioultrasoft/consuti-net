using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Utilitarios.Ferramentas
{
    public class FerramentasTexto
    {
        /// <summary>
        /// Embaralhando a senha em um valor não legível ao olho humano.
        /// </summary>
        /// <param name="senha"></param>
        /// <returns></returns>
        public string CriptografarSenhaCriptoRandom(string senha)
        {
            string hex = "";
            foreach (char c in senha)
            {
                int tmp = c;
                hex += String.Format("{0:x2}", (uint)System.Convert.ToUInt32(tmp.ToString()));
            }

            return new Random().Next(10000, 99999) + hex;
        }

        /// <summary>
        /// Descriptografa a senha criptografada
        /// </summary>
        /// <param name="senha"></param>
        /// <returns></returns>
        public string DescriptografarSenhaCriptoRandom(string senhaCriptografada)
        {
            string StrValue = "";
            string HexValue = senhaCriptografada.Substring(5, senhaCriptografada.Length - 5);

            while (HexValue.Length > 0)
            {
                StrValue += System.Convert.ToChar(System.Convert.ToUInt32(HexValue.Substring(0, 2), 16)).ToString();
                HexValue = HexValue.Substring(2, HexValue.Length - 2);
            }
            return StrValue;
        }
    }
}

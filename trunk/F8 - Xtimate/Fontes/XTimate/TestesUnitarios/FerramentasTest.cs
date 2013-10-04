using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Utilitarios.Ferramentas;

namespace TestesUnitarios
{
    [TestClass]
    public class FerramentasTest
    {   
        [TestMethod]
        public void ConsegueCriptografarDescriptografar()
        {
            string senha = "123456cristian@!";

            string senhaCriptografada = new FerramentasTexto().CriptografarSenhaCriptoRandom(senha);
            Assert.AreNotEqual(senha, senhaCriptografada);

            string senhaDescriptografada = new FerramentasTexto().DescriptografarSenhaCriptoRandom(senhaCriptografada);
            Assert.AreEqual(senha, senhaDescriptografada);
        }
    }
}

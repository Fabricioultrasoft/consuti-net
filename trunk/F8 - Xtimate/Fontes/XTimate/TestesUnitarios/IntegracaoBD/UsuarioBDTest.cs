using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using IntegracaoBD.Repositorios;

namespace TestesUnitarios.IntegracaoBD
{
    [TestClass]
    public class UsuarioBDTest
    {
        [TestMethod]
        public void ConsegueValidarUsuarioTest()
        {   
            new UsuarioBD().Cadastrar("testeUnitario@teste.com", "123abc!@#", "TestesUnitarios");

            Assert.AreEqual("TestesUnitarios", new UsuarioBD().UsuarioValidado("testeUnitario@teste.com", "123abc!@#"));
            new UsuarioBD().Excluir("testeUnitario@teste.com");

            Assert.AreEqual(string.Empty, new UsuarioBD().UsuarioValidado("testeUnitario@teste.com", "123abc!@#"));
        }
    }
}

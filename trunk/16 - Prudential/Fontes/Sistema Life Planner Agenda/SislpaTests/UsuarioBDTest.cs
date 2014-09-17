using Sistema_Life_Planner_Agenda.BD;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;

namespace SislpaTests
{
    
    
    /// <summary>
    ///This is a test class for UsuarioBDTest and is intended
    ///to contain all UsuarioBDTest Unit Tests
    ///</summary>
    [TestClass()]
    public class UsuarioBDTest
    {


        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Additional test attributes
        // 
        //You can use the following additional attributes as you write your tests:
        //
        //Use ClassInitialize to run code before running the first test in the class
        //[ClassInitialize()]
        //public static void MyClassInitialize(TestContext testContext)
        //{
        //}
        //
        //Use ClassCleanup to run code after all tests in a class have run
        //[ClassCleanup()]
        //public static void MyClassCleanup()
        //{
        //}
        //
        //Use TestInitialize to run code before running each test
        //[TestInitialize()]
        //public void MyTestInitialize()
        //{
        //}
        //
        //Use TestCleanup to run code after each test has run
        //[TestCleanup()]
        //public void MyTestCleanup()
        //{
        //}
        //
        #endregion


        /// <summary>
        ///A test for Autenticar
        ///</summary>
        [TestMethod()]
        public void AutenticarTest()
        {
            UsuarioBD target = new UsuarioBD(); 
            string email = "cristian.co.gomes@gmail.com";
            string senha = "123456"; 
            string expected = "Cristian Gomes"; 
            string actual;
            actual = target.Autenticar(email, senha);
            Assert.AreEqual(expected, actual);
        }

        /// <summary>
        ///A test for UsuarioAdmin
        ///</summary>
        [TestMethod()]
        public void UsuarioAdminTest()
        {
            UsuarioBD target = new UsuarioBD(); 
            string email = "cristian.co.gomes@gmail.com"; 
            bool expected = true;
            bool actual;
            actual = target.UsuarioAdmin(email);
            Assert.AreEqual(expected, actual);
        }

        /// <summary>
        ///A test for Incluir
        ///</summary>
        [TestMethod()]
        public void IncluirTest()
        {
            UsuarioBD target = new UsuarioBD();
            string AgendaGoogleEmail = DateTime.Now.Millisecond.ToString() + "@testeunitario.com";
            string AgendaGoogleSenha = "123456";
            string Email = DateTime.Now.Millisecond.ToString() + "@testeunitario.com";
            string Nome = "TesteUnitario";
            string Senha = "123456";
            string Telefone = "(31) 97653922";
            target.Incluir(AgendaGoogleEmail, AgendaGoogleSenha, Email, Nome, Senha, Telefone);
        }

        /// <summary>
        ///A test for EmailAutorizado
        ///</summary>
        [TestMethod()]
        public void EmailAutorizadoTest()
        {
            UsuarioBD target = new UsuarioBD(); 
            string email = "cristian.co.gomes@gmail.com"; 
            bool expected = true;
            bool actual;
            actual = target.EmailAutorizado(email);
            Assert.AreEqual(expected, actual);
        }

        /// <summary>
        /// Testar a recuperação de senha
        /// </summary>
        [TestMethod()]
        public void RecuperarSenhaTest()
        {
            UsuarioBD target = new UsuarioBD(); 
            string email = "cristian.co.gomes@gmail.com"; 
            string expected = "123456"; 
            string actual;
            actual = target.RecuperarSenha(email);
            Assert.AreEqual(expected, actual);
        }
    }
}

using Sistema_Life_Planner_Agenda.BD;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using System.Data;

namespace SislpaTests
{
    
    
    /// <summary>
    ///This is a test class for UsuariosAutorizadosBDTest and is intended
    ///to contain all UsuariosAutorizadosBDTest Unit Tests
    ///</summary>
    [TestClass()]
    public class UsuariosAutorizadosBDTest
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
        ///A test for Incluir
        ///</summary>
        [TestMethod()]
        public void IncluirTest()
        {
            UsuariosAutorizadosBD target = new UsuariosAutorizadosBD(); 
            int Admin = 1; 
            string Email = "testeUnitario@email.com";
            target.Incluir(Admin, Email);
        }

        /// <summary>
        ///A test for Excluir
        ///</summary>
        [TestMethod()]
        public void ExcluirTest()
        {
            UsuariosAutorizadosBD target = new UsuariosAutorizadosBD();
            string email = "testeUnitario@email.com"; 
            target.Excluir(email);
        }

        /// <summary>
        ///A test for Listar
        ///</summary>
        [TestMethod()]
        public void ListarTest()
        {
            UsuariosAutorizadosBD target = new UsuariosAutorizadosBD();
            DataSet actual;
            actual = target.Listar();
            Assert.IsTrue(actual.Tables[0].Rows.Count > 0);
        }
    }
}

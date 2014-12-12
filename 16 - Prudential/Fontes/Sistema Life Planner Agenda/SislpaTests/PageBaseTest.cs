using Sistema_Life_Planner_Agenda.Classes;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;

namespace SislpaTests
{
    
    
    /// <summary>
    ///This is a test class for PageBaseTest and is intended
    ///to contain all PageBaseTest Unit Tests
    ///</summary>
    [TestClass()]
    public class PageBaseTest
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


        [TestMethod()]
        public void CodificarTest()
        {
            string entrada = "marc123"; 
            string actual;
            actual = PageBase.Criptografar(entrada);
            
            string expected = PageBase.Decriptografar(actual);
            Assert.AreEqual(expected, entrada);
            Assert.Inconclusive("a senha " + entrada + " criptografada é: " + actual);
        }
    }
}

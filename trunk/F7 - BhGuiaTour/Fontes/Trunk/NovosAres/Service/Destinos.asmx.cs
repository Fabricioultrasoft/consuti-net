namespace NovosAres.Service
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.Services;
    using System.Collections.Specialized;
    using AjaxControlToolkit;
    using NovosAres.Blog;
    using System.Data;

    /// <summary>
    /// Summary description for Destinos
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.Web.Script.Services.ScriptService]
    public class Destinos : System.Web.Services.WebService
    {
        /// <summary>
        /// Recupera todos os continentes cadastrados na base.
        /// </summary>
        /// <returns>DataSet de continentes.</returns>
        [WebMethod]
        public DataSet GetContinentes()
        {
            BdDestinos bdContinentes = new BdDestinos();
            return bdContinentes.RuperarContinentes();
        }

        /// <summary>
        /// Recupera os países de acordo com o continente selecionado.
        /// </summary>
        /// <param name="idContinente">Id do continente selecionado no DropDown de continentes.</param>
        [WebMethod]
        public DataSet GetPaisesByContinente(int idContinente)
        {
            BdDestinos bdDestinos = new BdDestinos();
            return bdDestinos.RecuperarPaisesPeloIdDoContinente(idContinente);
        }

        /// <summary>
        /// Recupera as cidades de acordo com o pais selecionado.
        /// </summary>
        /// <param name="idContinente">Id do país selecionado no DropDown de paises.</param>
        [WebMethod]
        public DataSet GetCidadesByPaises(int idPais)
        {
            BdDestinos bdDestinos = new BdDestinos();
            return bdDestinos.RecuperarCidadesPeloIdDoPais(idPais);
        }
    }
}
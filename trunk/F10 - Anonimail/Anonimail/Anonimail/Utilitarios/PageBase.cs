using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AjaxControlToolkit.HTMLEditor;

namespace Anonimail.Utilitarios
{
    public class PageBase : System.Web.UI.Page
    {
        /// <summary>
        /// Exibe mensgem em popUp para usuário
        /// </summary>
        /// <param name="mensagem">mensagem a ser exibida</param>
        public void ExibeMensagemPopUp(string mensagem)
        {
            ClientScript.RegisterStartupScript(
                            this.GetType(),
                            "arquivo",
                            "alert('" + mensagem + "');",
                            true);
        }
    }
}
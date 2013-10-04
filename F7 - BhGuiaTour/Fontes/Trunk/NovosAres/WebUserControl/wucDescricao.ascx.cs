using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NovosAres.WebUserControl
{
    /// <summary>
    /// Classe do UserControl Descricao.
    /// </summary>
    public partial class wucDescricao : System.Web.UI.UserControl
    {
        /// <summary>
        /// Recupera o conteúdo da descrição.
        /// </summary>
        public string GetValue()
        {
            string descricao = txtDescricao.Text;
            return descricao;
        }

        /// <summary>
        /// Grava o conteúdo da descrição.
        /// </summary>
        public void SetValue(string descricao)
        {
            txtDescricao.Text = descricao;
        }

        /// <summary>
        /// Responsável por efetuar o carregamento da página.
        /// </summary>
        /// <param name="sender">Objeto gerador do eventos.</param>
        /// <param name="e">Contém os parâmetros do evento gerado.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}
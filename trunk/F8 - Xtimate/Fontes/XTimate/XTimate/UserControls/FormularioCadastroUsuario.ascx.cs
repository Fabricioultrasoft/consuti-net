using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilitarios.DTOs;

namespace XTimate.UserControls
{
    public partial class FormularioCadastroUsuario : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public CadastroUsuarioDTO ObterDadosFormulario()
        {
            return new CadastroUsuarioDTO()
            {
                Email = EmailTextBox.Text,
                Nome = NomeTextBox.Text,
                Senha = SenhaTextBox.Text
            };
        }
    }
}
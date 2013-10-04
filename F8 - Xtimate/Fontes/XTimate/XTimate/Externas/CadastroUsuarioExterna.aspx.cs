using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilitarios.Paginas;
using IntegracaoBD.Repositorios;
using Utilitarios;

namespace XTimate.Externas
{
    public partial class CadastroUsuarioExterna : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SalvarButton_Click(object sender, EventArgs e)
        {
            try
            {
                var dadosUsuario = ucFormularioCadastroUsuario.ObterDadosFormulario();
                new UsuarioBD().Cadastrar(dadosUsuario.Email, dadosUsuario.Senha, dadosUsuario.Nome);
                ExibeMensagemPopUp("Cadastro realizado com sucesso!");
                Response.Redirect(PaginasExternas.Login);                    
            }
            catch (Exception ex)
            {
                ExibeMensagemPopUp("Falha ao tentar cadastrar o usuário. Detalhes:" + ex.Message);
            }
        }

        protected void CancelarButton_Click(object sender, EventArgs e)
        {
            Response.Redirect(PaginasExternas.Login);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NovosAres.Blog.Banco;

namespace NovosAres.Blog.AdmBlog
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //limite de 3 tentativas de login para proteger de robos de força bruta
            #region Proteção contra acesso por força bruta
            if (Session["protecao"] == null)
            {
                Session["protecao"] = "1";
            }
            else if (Convert.ToInt32(Session["protecao"].ToString()) < 3)
            {
                Session["protecao"] = Convert.ToInt32(Session["protecao"].ToString()) + 1;
            }
            else
            {
                Response.Redirect("http://www.novosares.com.br");
            }
            #endregion
        }

        protected void imgBtnEsqueciSenha_Click(object sender, ImageClickEventArgs e)
        {
            //envia email para o administrador e para o webmaster informando a solicitação
        }

        /// <summary>
        /// Logica de login à administração do painel
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgBtnEntrar_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                //Objeto para validação no banco de dados
                MyBDLogin validaLogin = new MyBDLogin();
                //se for válido, inicializa a sessão e redireciona para a página de adm
                if (validaLogin.VerificaUsuarioAdmin(txbLogin.Text, txbSenha.Text).Equals(true))
                {
                    Session.Timeout = 10;
                    Session.Add("logado", "ok");
                    Response.Redirect("admBlog.aspx");
                }
                //Se não for válido, exibe mensagem e contador de tentativas
                else
                {
                    ExibeMensagemPopUp("Erro! Login ou senha incorreto(s). Verifique os dados e tente novamente. Tentativas restantes: " +
                            (4 - Convert.ToInt32(Session["protecao"].ToString())));
                }
            }
            catch (Exception ex)
            {
                ExibeMensagemPopUp("Erro interno no sistema. Contate o Administrador. " + ex.ToString());
            }
        }

        /// <summary>
        /// Exibe mensagem popup.
        /// </summary>
        /// <param name="mensagem">Mensagem a ser exibida no popup.</param>
        private void ExibeMensagemPopUp(string mensagem)
        {
            ClientScript.RegisterStartupScript(
                            this.GetType(),
                            "arquivo",
                            "alert('" + mensagem + "');",
                            true);
        }

        protected void imgBtnVoltarSite_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void lbtnVoltarSite_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}
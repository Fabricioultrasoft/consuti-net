using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using testePMK.com.br.Banco;
using System.Web.Security;

namespace testePMK.com.br
{
    public partial class LoginAdm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
                Response.Redirect("Default.aspx");
            }
            #endregion

            if (!IsPostBack)
            {
            }

        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        /// <summary>
        /// validação de acesso à area administrativa
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnAcessar_Click(object sender, EventArgs e)
        {
            try
            {
                BdUsuario validaAdm = new BdUsuario();
                if (validaAdm.validaAdmin(TxbLogin.Text, TxbPass.Text) == true)
                {
                    FormsAuthentication.RedirectFromLoginPage("ADMPMK_" + TxbLogin.Text, false);
                    Response.Redirect("~/Adm/Default.aspx");
                }
                else
                {
                    ExibeMensagemPopUp("Dados de Acesso Incorretos!! Verifique os dados e tente novamente. Tentativas restantes: " +
                        (4 - Convert.ToInt32(Session["protecao"].ToString())));
                }
                validaAdm.Dispose();
            }
            catch (Exception)
            {
                ExibeMensagemPopUp("Base de dados indisponível no momento. Contate Administrador do sistema ou tente novamente mais tarde");
            }


        }

        /// <summary>
        /// Exibe mensgem resultado
        /// </summary>
        /// <param name="mensagem">mensagem a ser exibida</param>
        private void ExibeMensagemPopUp(string mensagem)
        {
            ClientScript.RegisterStartupScript(
                            this.GetType(),
                            "arquivo",
                            "alert('" + mensagem + "');",
                            true);
        }
    }
}
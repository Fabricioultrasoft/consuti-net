using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using testePMK.com.br.Banco;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using testePMK.com.br.Adm.Usuario;


namespace testePMK.com.br.Adm.Usuario
{
    public partial class LoginUserExt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["msgLogin"] != null)
                {
                    litLogin.Text = Session["msgLogin"].ToString();
                    
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        /// <summary>
        /// envia o lembrete de senha para o usuário esquecido
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lbtnLembraSenha_Click(object sender, EventArgs e)
        {
            if (txbEmail.Text == "")
            {
                ExibeMensagemPopUp("Preencha o campo EMAIL e em seguida clique para lembrar a senha. Você receberá um email com o lembrete.");
            }
            else
            {
                BdUsuarioSite recSenha = new BdUsuarioSite();
                Ferramentas enviaEmailLembrete = new Ferramentas();
                
                try
                {
                    string validaExistencia = recSenha.validaExistencia(txbEmail.Text);
                    if (validaExistencia != "")
                    {
                        enviaEmailLembrete.EnviaEmail(
                            "testepmk@testepmk.com.br",
                            txbEmail.Text,
                            "TestePMK.com.br - Recuperação de Acesso",
                            "Este é um email automático e confidencial. Não responda e nem compartilhe. " +
                            "<br />Os dados de acesso a sua conta no site testepmk.com.br são os seguintes: " +
                            "<br />" +
                            "<br />----------------------------------------------------------------------" +
                            "<br /> Email cadastrado: " + txbEmail.Text +
                            "<br /> Senha: " + validaExistencia +
                            "<br />----------------------------------------------------------------------" +
                            "<br />" +
                            "<br />Data da solicitação: " + DateTime.Now +
                            "<br /><br /><br />Portal de vendas do Testepmk.com.br" +
                            "<br /><br /><br />Desenvolvido por ConsuTI.net");

                            
                        ExibeMensagemPopUp("Um email com a sua senha foi enviada para sua caixa de correio cadastrada.");
                    }
                    else
                    {
                        ExibeMensagemPopUp("Email inexistente ou inválido!");
                    }
                }
                catch (Exception)
                {
                    ExibeMensagemPopUp("Erro interno! Verifique os dados e tente novamente");
                }
            }
        }

        /// <summary>
        /// Exibe mensgem resultado
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
        
        protected void btnOK_Click(object sender, EventArgs e)
        {
            BdUsuarioSite validauser = new BdUsuarioSite();
            string[] nomeUser;
            try
            {
                if (validauser.validaUsuario(txbEmail.Text, txbSenha.Text) == true)
                {
                    nomeUser = validauser.GetNome(txbEmail.Text).Split(new char[] { ' ' });
                    //autentica usuário segundo web.config
                    FormsAuthentication.RedirectFromLoginPage(nomeUser[0], false);
                    if (litLogin.Text == "")
                    {
                        Response.Redirect("~/Default.aspx");
                    }
                    else
                    {
                        Session["msgLogin"] = null;
                        Response.Redirect("~/PedidosUserExt.aspx");
                    }
                }
                else
                {
                    ExibeMensagemPopUp("Login não efetuado! O email " + txbEmail.Text + " não foi encontrado ou a senha digitada não esta correta.");
                }
            }
            catch (Exception)
            {
                ExibeMensagemPopUp("Erro interno no servidor! Verifique os dados e tente novamente mais tarde!");
            }
            finally
            {
                validauser.Dispose();
            }
        }

        protected void btnNovoCadastro_Click(object sender, EventArgs e)
        {
            Response.Redirect("CadUser.aspx");
        }
    }
}
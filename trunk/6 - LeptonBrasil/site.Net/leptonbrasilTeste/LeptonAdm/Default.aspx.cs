using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using leptonbrasil.Banco;

namespace leptonbrasil.LeptonAdm
{
    public partial class Default : System.Web.UI.Page
    {
        /// <summary>
        /// Variáveis de controle de email
        /// </summary>        
        public string EmailCopiaOcultaContato = "correio@consuti.net";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.Page.Title = ".:Lepton - Login ADM:.";
            }
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
                Page.Response.Redirect("~/Default.aspx");
            }
            #endregion
        }

        /// <summary>
        /// Evento de click no botão de esquecia a senha
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lbEsqueciSenha_Click(object sender, EventArgs e)
        {
            if (txbEmail.Text.Equals(""))
            {
                ExibeMensagem("Preencha o campo EMAIL.");
            }
            else
            {
                //enviar email de solicitação de senha para o usuário e para o webmaster
                try
                {
                    bool emailEnviado = EnviaEmail(TextoRecuperacaoSenha(txbEmail.Text));
                    if (emailEnviado.Equals(true))
                    {
                        ExibeMensagem("Um email com a sua senha foi enviado para " + txbEmail.Text + ".");
                    }
                    else if (emailEnviado.Equals(false))
                    {
                        ExibeMensagem("ERRO! Procedimento não realizado. " +
                        "Verifique os dados e tente novamente mais tarde. Caso o erro persista, procure o Adminsitrador.");
                    }
                }
                catch (Exception ex)
                {
                    ExibeMensagem("O Email Informado não corresponde ao email de administração do Site. " +
                            "Verifique os dados e tente novamente ou procure o Administrador.");
                }
            }
        }

        /// <summary>
        /// Envia email 
        /// </summary>
        /// <returns>true se sucesso no envio; false otherwise</returns>
        private bool EnviaEmail( string textoEmail)
        {
            Ferramentas.Correio enviaEmail = new Ferramentas.Correio();            
            return enviaEmail.EnviaEmail(
                "Administração leptonbrasil.com.br",
                   txbEmail.Text,
                   txbEmail.Text,
                   EmailCopiaOcultaContato,
                   "Recuperação de Senha do Painel Administrativo",
                   textoEmail);            
        }

        /// <summary>
        /// Geração do texto de recuperação de emails
        /// </summary>
        /// <param name="email">email do administrador do painel</param>
        /// <returns>string com o texto do email</returns>
        private string TextoRecuperacaoSenha(string email) {
            MyBdUsuario getSenha = new MyBdUsuario();
            string senha = getSenha.GetSenha(email);
            
            return  "Este é um email automático e confidencial. Não responda e nem compartilhe. " +
                            "<br />Os dados de acesso ao painel administrativo do site leptonbrasil.com.br são os seguintes: " +
                            "<br />" +
                            "<br />----------------------------------------------------------------------" +
                            "<br /> Email cadastrado: " + txbEmail.Text +
                            "<br /> Senha: " + senha +
                            "<br />----------------------------------------------------------------------" +
                            "<br />" +
                            "<br />Data da solicitação: " + DateTime.Now +
                            "<br /><br /><br />www.leptonbrasil.com.br" +
                            "<br /><br /><br />Desenvolvido por ConsuTI.net";
        }

        /// <summary>
        /// Evento de cancelamento do login
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Page.Response.Redirect("~/Default.aspx");
        }

        //Exibe mensgem ao usuário
        private void ExibeMensagem(string mensagem)
        {
            this.Page.ClientScript.RegisterStartupScript(
                            this.GetType(),
                            "arquivo",
                            "alert('" + mensagem + "');",
                            true);
        }

        //Evento de acesso ao painel administrativo do site
        protected void btnOK_Click(object sender, EventArgs e)
        {
            //variaveis para validação
            bool acessoGarantido = false;
            Banco.MyBdUsuario validaAcesso = new Banco.MyBdUsuario();
            try
            {
                //tenta validar as credencias
                acessoGarantido = validaAcesso.VerificaUsuarioAdmin(
                    txbEmail.Text,
                    txbSenha.Text);
                if (acessoGarantido.Equals(true))
                {//se sucesso na validação          
                    FormsAuthentication.RedirectFromLoginPage(txbEmail.Text, false);
                    Page.Response.Redirect("~/LeptonAdm/Painel/", false);
                    //Session.Add("logado", "ok");
                    //Session.Timeout = 10;
                }
                else
                {//se insucesso na validação
                    ExibeMensagem("Erro! Login ou senha incorreto(s). Verifique os dados e tente novamente. Tentativas restantes: " +
                            (4 - Convert.ToInt32(Session["protecao"].ToString())));
                }
            }
            catch (Exception ex)
            {//se erro do sistema em tentativa de validação
                ExibeMensagem("Erro interno! Acesso ao painel " +
                "administrativo indisponível no momento. Por favor tente novamente mais tarde ou procure o Administrador do sistema.");
            }
        }
    }
}
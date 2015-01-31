﻿using System;
using Sistema_Life_Planner_Agenda.Classes;
using System.Web.UI.WebControls;
using System.Web.Security;
using Sistema_Life_Planner_Agenda.BD;

namespace Sistema_Life_Planner_Agenda
{
    public partial class WebForm1 : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void novoUsuarioLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("CadastroUsuario\\Default.aspx");
        }

        protected void okButton_Click(object sender, EventArgs e)
        {
            if (emailLoginTextBox.Text.Equals(string.Empty) || senhaTextBox.Text.Equals(string.Empty))
            {
                ExibeMensagemPopUp("Preencha todos os campos obrigatórios!");
            }
            else
            {
                AuthenticateEventArgs a = new AuthenticateEventArgs();

                /// Busca nome do usuário se dados de acesso forem válidos
                string nomeUsuario = new UsuarioBD().Autenticar(emailLoginTextBox.Text, Criptografar(senhaTextBox.Text));
                if (nomeUsuario.Equals(string.Empty))
                {
                    a.Authenticated = false;
                    ExibeMensagemPopUp("Dados de acesso não conferem! Verifique e-mail e senha informados.");
                }
                else if (new UsuarioBD().EmailAutorizado(emailLoginTextBox.Text))
                {
                    a.Authenticated = true;
                    Session["emailUsuarioLogado"] = emailLoginTextBox.Text;
                    Session["nomeUsuarioLogado"] = nomeUsuario;
                    FormsAuthentication.RedirectFromLoginPage(nomeUsuario, false);
                }
                else
                {
                    ExibeMensagemPopUp("Usuário não possui mais acesso autorizado ao sistema. Procure o Administrador.");
                }
            }
        }

        protected void esqueciSenhaLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("RecuperarSenha\\Default.aspx");
        }
    }
}
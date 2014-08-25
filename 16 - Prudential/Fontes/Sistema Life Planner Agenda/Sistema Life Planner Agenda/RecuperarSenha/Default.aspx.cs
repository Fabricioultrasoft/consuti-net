using System;
using Sistema_Life_Planner_Agenda.Classes;

namespace Sistema_Life_Planner_Agenda.RecuperarSenha
{
    public partial class Default : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cancelarButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\Login.aspx");
        }

        protected void okButton_Click(object sender, EventArgs e)
        {
            if (!EmailCadastrado(emailTextBox.Text))
            {
                ExibeMensagemPopUp("E-mail " + emailTextBox.Text + " não cadastrado!");
            }
            else
            {
                ExibeMensagemPopUp("E-mail enviado com a senha para " + emailTextBox.Text + ".");
            }
        }

        /// <summary>
        /// Verifica se o e-mail informado está cadastrado no sistema.
        /// </summary>
        /// <param name="email">E-mail a ser verificado.</param>
        /// <returns>True se e-mail for válido; false caso contrário.</returns>
        private bool EmailCadastrado(string email)
        {
            //TODO: Validar Email para Recuperar Senha
            return false;
        }
    }
}
using System;
using Sistema_Life_Planner_Agenda.Classes;
using System.Configuration;
using Sistema_Life_Planner_Agenda.BD;

namespace Sistema_Life_Planner_Agenda.CadastroUsuario
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
            if (!ValidarEmailAutorizado(emailTextBox.Text))
            {
                ExibeMensagemPopUp("O e-mail " + emailTextBox.Text + " não está autorizado. " +
                    "Solicite acesso para " + ConfigurationManager.AppSettings["emailContatoAutorizacao"].ToString());
            }
            else
            {
                try
                {
                    SalvarUsuario(emailTextBox.Text,
                    Criptografar(senhaTextBox.Text),
                    nomeCompletoTextBox.Text,
                    DDDTextBox.Text + telefoneTextBox.Text,
                    emailGoogleTextBox.Text,
                    SenhaEmailGoogleTextBox.Text);
                    ExibeMensagemPopUp("Salvo com sucesso!");

                    //DEPOIS QUE CADASTRAR O USUÁRIO, CADASTRAR O MESMO COMO CONTATO DO SISTEMA, PARA QUE SEJA POSSÍVEL SER O RECOMENDANTE
                    LimparCampos();
                }
                catch (Exception ex)
                {
                    if (ex.Message.Contains("Duplicate"))
                    {
                        ExibeMensagemPopUp("ERRO! E-mail informado já está cadastrado no sistema.");
                    }
                    ExibeMensagemPopUp("Erro interno no sistema. Não foi possível cadastrar. Detalhes do erro: " + ex.Message);
                }
            }
        }

        /// <summary>
        /// Salva os dados do usuário no banco
        /// </summary>
        /// <param name="email"></param>
        /// <param name="senha"></param>
        /// <param name="nomeCompleto"></param>
        /// <param name="telefone"></param>
        /// <param name="emailGoogle"></param>
        /// <param name="senhaEmailGoogle"></param>
        /// <returns></returns>
        private void SalvarUsuario(
            string email,
            string senha,
            string nomeCompleto,
            string telefone,
            string emailGoogle,
            string senhaEmailGoogle)
        {
            new UsuarioBD().Incluir(
                emailGoogle,
                senhaEmailGoogle,
                email,
                nomeCompleto,
                senha,
                telefone);
        }

        /// <summary>
        /// Verifica se o email informado está autorizado na lista de emails
        /// </summary>
        /// <param name="email">email a ser verificado</param>
        /// <returns>true se o email estiver autorizado; false se não autorizado</returns>
        private bool ValidarEmailAutorizado(string email)
        {   
            return new UsuarioBD().EmailAutorizado(email);
        }

        /// <summary>
        /// Limpa os campos da tela
        /// </summary>
        private void LimparCampos()
        {
            emailTextBox.Text =
                confirmaEmailTextBox.Text =
                senhaTextBox.Text =
                confirmaSenhaTextBox.Text =
                nomeCompletoTextBox.Text =
                telefoneTextBox.Text =
                DDDTextBox.Text =
                emailGoogleTextBox.Text =
                SenhaEmailGoogleTextBox.Text =
                string.Empty;
        }

    }
}
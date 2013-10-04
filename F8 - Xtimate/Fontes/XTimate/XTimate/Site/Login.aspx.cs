using System;
using System.Data;
using System.Net.Mail;
using System.Web.Security;
using IntegracaoBD.Repositorios;
using Utilitarios;
using Utilitarios.DTOs;
using Utilitarios.Ferramentas;
using Utilitarios.Paginas;

namespace XTimate.Site
{
    public partial class Login : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CadastrarButton_Click(object sender, EventArgs e)
        {
            Response.Redirect(PaginasExternas.CadastrarUsuario);
        }

        protected void EntrarButton_Click(object sender, EventArgs e)
        {
            try
            {
                string validacaoUsuario = new UsuarioBD().UsuarioValidado(EmailTextBox.Text, SenhaTextBox.Text);
                if (!string.IsNullOrEmpty(validacaoUsuario))
                {
                    FormsAuthentication.RedirectFromLoginPage(validacaoUsuario, true);
                    Response.Redirect(PaginasInternas.Home);
                }
                else
                {
                    ExibeMensagemPopUp("Dados informados não conferem!");
                }
            }
            catch (DataException)
            {
                ExibeMensagemPopUp("Falha ao conectar à base de dados!");
            }

        }

        /// <summary>
        /// recupera os dados de acesso do usuário e envia por email.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void EnviarButton_Click(object sender, EventArgs e)
        {
            try
            {
                CadastroUsuarioDTO dadosUser = new UsuarioBD().ObterPorEmail(RecEmailTextBox.Text);
                //TODO: implementar regra para o caso de não existir usuário na base de dados
                new FerramentasEmail().EnviaEmail("Sistema Xtimate",
                    "no-replay@xtimate.com.br",
                    dadosUser.Email,
                    string.Empty,
                    "Recuperação de senha do Xtimate",
                    FormataMensagemRecSenha(dadosUser));

                ExibeMensagemPopUp("Um e-mail foi enviado com os dados de acesso do sistema.");
            }
            catch (DataException ex)
            {
                ExibeMensagemPopUp("Erro! Não foi possível recuperar os dados do usuário de e-mail " +
                    RecEmailTextBox.Text + ". Detalhes: " + ex.Message);
            }
            catch (SmtpException ex)
            {
                ExibeMensagemPopUp("Erro! Não foi possível enviar o e-mail com os dados recuperados do usuário para o endereço " +
                    RecEmailTextBox.Text + ". Detalhes: " + ex.Message);
            }
            catch (IndexOutOfRangeException ex)
            {
                ExibeMensagemPopUp("Erro! Não existe usuário cadastrado com o email " + RecEmailTextBox.Text + ". Verifique os dados e tente novamente. Detalhes: " + ex.Message);
            }
            catch (Exception ex)
            {
                ExibeMensagemPopUp("Erro interno do servidor. Tente novamente mais tarde. Detalhes: " + ex.Message);
            }
        }

        private string FormataMensagemRecSenha(CadastroUsuarioDTO dadosUser)
        {
            return @"<p><span style=""font-size:16px;""><strong>Recupera&ccedil;&atilde;o de senha do sistema Xtimate</strong></span></p>
                     <p><span style=""font-size:14px;"">Dados de acesso ao sistema Xtimate:</span></p><ul>
                        <li style=""margin-left: 40px;""><span style=""font-size:14px;"">Nome: " + dadosUser.Nome + @"</span></li>
                        <li style=""margin-left: 40px;""><span style=""font-size:14px;"">Email: " + dadosUser.Email + @"</span></li>
                        <li style=""margin-left: 40px;""><span style=""font-size:14px;"">Senha: " + dadosUser.Senha + @"</span></li></ul>
                     <p><span style=""font-size:14px;"">Solicita&ccedil;&atilde;o realizada em: " + DateTime.Now + @"</span></p>
                     <p>&nbsp;</p><p><span style=""font-size:12px;"">N&atilde;o responda esse email por favor.</span></p>";

        }
    }
}
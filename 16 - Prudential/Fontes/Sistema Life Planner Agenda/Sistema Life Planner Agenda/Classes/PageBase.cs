using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Web.Security;

namespace Sistema_Life_Planner_Agenda.Classes
{
    public class PageBase : System.Web.UI.Page
    {
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

        /// <summary>
        /// Envia emails
        /// </summary>
        /// <param name="nomeRemetente"></param>
        /// <param name="emailRemetente"></param>
        /// <param name="emailDestinatario"></param>
        /// <param name="emailComCopiaOculta"></param>
        /// <param name="assuntoMensagem"></param>
        /// <param name="conteudoMensagem"></param>
        /// <param name="caminhoAnexo"></param>
        public void EnviaEmail(
            string nomeRemetente,
            string emailRemetente,
            string emailDestinatario,
            string emailComCopiaOculta,
            string assuntoMensagem,
            string conteudoMensagem,
            string caminhoAnexo)
        {
            SmtpClient clienteSmtp = new SmtpClient("localhost", 25);
            MailMessage email = new MailMessage(emailDestinatario, emailDestinatario);

            try
            {
                if (!string.IsNullOrEmpty(emailComCopiaOculta))
                {
                    email.Bcc.Add(emailComCopiaOculta);
                }
                if (!string.IsNullOrEmpty(caminhoAnexo))
                {
                    email.Attachments.Add(new Attachment(caminhoAnexo));
                }
                email.IsBodyHtml = true;
                email.ReplyTo = new System.Net.Mail.MailAddress(nomeRemetente + "<" + emailRemetente + ">");
                email.Subject = assuntoMensagem;
                email.Body = conteudoMensagem;

                clienteSmtp.Send(email);
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                email.Dispose();
            }
        }

        /// <summary>
        /// recebe o telefone completo e devolve tratado, com o ddd sendo o primeiro item da lista
        /// </summary>
        /// <param name="telParam"></param>
        /// <returns></returns>
        public List<string> TratarTelefone(string telParam)
        {
            List<string> telefoneTratado = new List<string>();

            telefoneTratado.Add(telParam.Substring(1, 2));
            telefoneTratado.Add(telParam.Substring(4));

            return telefoneTratado;
        }

        /// <summary>
        /// Se não houver email do usuário logado na sessão, redireciona para a tela de login
        /// </summary>
        public void ValidaUserLogado()
        {
            if (Session["emailUsuarioLogado"] == null)
            {
                FormsAuthentication.SignOut();
                Response.Redirect("~/Login.aspx");
            }
        }

        /// <summary>
        /// Valida se a data inicial é maior que a data final
        /// </summary>
        /// <returns>true se as datas foram válidas</returns>
        public bool ValidarIntervaloDatas(string PeriodoDe, string PeriodoAte)
        {
            if (!string.IsNullOrEmpty(PeriodoDe) &&
               !string.IsNullOrEmpty(PeriodoAte) &&
                Convert.ToDateTime(PeriodoAte) < Convert.ToDateTime(PeriodoDe))
            {
                return false;
            }
            return true;
        }
    }
}
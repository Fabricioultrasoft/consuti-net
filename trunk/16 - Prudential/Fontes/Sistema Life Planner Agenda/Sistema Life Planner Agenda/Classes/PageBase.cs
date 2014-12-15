using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Web.Security;
using System.Data;
using Sistema_Life_Planner_Agenda.BD;
using System.Security.Cryptography;
using System.Text;

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
        /// Envio email
        /// </summary>
        /// <param name="nomeRemetente"></param>
        /// <param name="emailRemetente"></param>
        /// <param name="emailDestinatario"></param>
        /// <param name="assuntoMensagem"></param>
        /// <param name="conteudoMensagem"></param>
        public void EnviaEmail(
            string nomeRemetente,
            string emailRemetente,
            string emailDestinatario,
            string assuntoMensagem,
            string conteudoMensagem)
        {
            //Cria objeto com dados do e-mail.
            MailMessage objEmail = new MailMessage();

            //Define o Campo From e ReplyTo do e-mail.
            objEmail.From = new System.Net.Mail.MailAddress(nomeRemetente + "<" + emailRemetente + ">");

            //Define os destinatários do e-mail.
            objEmail.To.Add(emailDestinatario);

            //Define a prioridade do e-mail.
            objEmail.Priority = System.Net.Mail.MailPriority.Normal;

            //Define o formato do e-mail HTML (caso não queira HTML alocar valor false)
            objEmail.IsBodyHtml = true;

            //Define título do e-mail.
            objEmail.Subject = assuntoMensagem;

            //Define o corpo do e-mail.
            objEmail.Body = conteudoMensagem;

            //Para evitar problemas de caracteres "estranhos", configuramos o charset para "ISO-8859-1"
            objEmail.SubjectEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");
            objEmail.BodyEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");

            //Cria objeto com os dados do SMTP
            System.Net.Mail.SmtpClient objSmtp = new System.Net.Mail.SmtpClient();

            //Alocamos o endereço do host para enviar os e-mails, localhost(recomendado) ou smtp2.locaweb.com.br
            objSmtp.Host = "localhost";
            objSmtp.Port = 25;

            //Enviamos o e-mail através do método .send()
            try
            {
                objSmtp.Send(objEmail);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                //excluímos o objeto de e-mail da memória
                objEmail.Dispose();
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

        public DataSet Municipios(string UF)
        {
            return new CidadesBD().Listar(UF);
        }

        /// <summary>
        /// Criptografa uma string
        /// </summary>
        /// <param name="entrada"></param>
        /// <returns></returns>
        public static string Criptografar(string entrada)
        {
            TripleDESCryptoServiceProvider tripledescryptoserviceprovider = new TripleDESCryptoServiceProvider();
            MD5CryptoServiceProvider md5cryptoserviceprovider = new MD5CryptoServiceProvider();

            try
            {
                if (entrada.Trim() != "")
                {
                    string myKey = "SISLPA";  //Aqui vc inclui uma chave qualquer para servir de base para cifrar, que deve ser a mesma no método Decodificar
                    tripledescryptoserviceprovider.Key = md5cryptoserviceprovider.ComputeHash(ASCIIEncoding.ASCII.GetBytes(myKey));
                    tripledescryptoserviceprovider.Mode = CipherMode.ECB;
                    ICryptoTransform desdencrypt = tripledescryptoserviceprovider.CreateEncryptor();
                    ASCIIEncoding MyASCIIEncoding = new ASCIIEncoding();
                    byte[] buff = Encoding.ASCII.GetBytes(entrada);

                    return Convert.ToBase64String(desdencrypt.TransformFinalBlock(buff, 0, buff.Length));

                }
                else
                {
                    return "";
                }
            }
            catch (Exception exception)
            {
                throw exception;
            }
            finally
            {
                tripledescryptoserviceprovider = null;
                md5cryptoserviceprovider = null;
            }
        }

        public static string Decriptografar(string entrada)
        {
            TripleDESCryptoServiceProvider tripledescryptoserviceprovider = new TripleDESCryptoServiceProvider();
            MD5CryptoServiceProvider md5cryptoserviceprovider = new MD5CryptoServiceProvider();

            try
            {
                if (entrada.Trim() != "")
                {
                    string myKey = "SISLPA";  //Aqui vc inclui uma chave qualquer para servir de base para cifrar, que deve ser a mesma no método Codificar
                    tripledescryptoserviceprovider.Key = md5cryptoserviceprovider.ComputeHash(ASCIIEncoding.ASCII.GetBytes(myKey));
                    tripledescryptoserviceprovider.Mode = CipherMode.ECB;
                    ICryptoTransform desdencrypt = tripledescryptoserviceprovider.CreateDecryptor();
                    byte[] buff = Convert.FromBase64String(entrada);

                    return ASCIIEncoding.ASCII.GetString(desdencrypt.TransformFinalBlock(buff, 0, buff.Length));
                }
                else
                {
                    return "";
                }
            }
            catch (Exception exception)
            {
                throw exception;
            }
            finally
            {
                tripledescryptoserviceprovider = null;
                md5cryptoserviceprovider = null;
            }
        }

        /// <summary>
        /// Valida as horas e minutos
        /// </summary>
        /// <param name="hora"></param>
        /// <param name="minutos"></param>
        /// <returns></returns>
        public bool ValidaHora(int hora, int minutos)
        {
            if (hora > 23 || minutos > 59)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

    }
}
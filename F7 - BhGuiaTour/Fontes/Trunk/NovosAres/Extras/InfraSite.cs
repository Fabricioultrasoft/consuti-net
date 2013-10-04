using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Net.Mail;

namespace NovosAres.Extras
{
    public class InfraSite
    {
        /// <summary>
        /// Logica de Geração do Fundo do site aleatório a cada post
        /// </summary>
        /// <returns>caminho da nova imagem a ser exibida no fundo do site</returns>
        public string ObtemUrlImagemFundo()
        {
            Random rand = new Random();
            HttpServerUtility auxCaminho = HttpContext.Current.Server;
            string caminho = "~\\Graficos\\FundoSite\\Fundo" + rand.Next(1, 9) + ".jpg";
            
            //pesquisa até 10 vezes se existe a imagem a ser exibida
            while (File.Exists(auxCaminho.MapPath(caminho)) == false)
            {
                //escolhe a imagem aleatoriamente
                caminho = "~\\Graficos\\FundoSite\\Fundo" + rand.Next(1, 9) + ".jpg";
            }
            return caminho;
        }

        /// <summary>
        /// Lógica de geração da logo com as frases aleatórias do site
        /// </summary>
        /// <returns>caminho da imagem a frase a ser exida</returns>
        public string ObtemUrlImagemLogoHome()
        {
            Random rand = new Random();
            HttpServerUtility auxCaminho = HttpContext.Current.Server;
            string caminho = "~\\Graficos\\Logo" + rand.Next(1, 9) + ".png";

            //pesquisa até 10 vezes se existe a imagem a ser exibida
            while (File.Exists(auxCaminho.MapPath(caminho)) == false)
            {
                //escolhe a imagem aleatoriamente
                caminho = "~\\Graficos\\Logo" + rand.Next(1, 9) + ".png";
            }
            return caminho;
        }

        /// <summary>
        /// envia email 
        /// </summary>
        /// <param name="nomeRemetente"></param>
        /// <param name="emailRemetente"></param>
        /// <param name="emailDestinatario"></param>
        /// <param name="emailComCopia"></param>
        /// <param name="emailComCopiaOculta"></param>
        /// <param name="assuntoMensagem"></param>
        /// <param name="conteudoMensagem"></param>
        /// <returns>false se não enviado, true se enviado</returns>
        public bool EnviaEmail(
            string nomeRemetente,
            string emailRemetente,
            string emailDestinatario,
            string emailComCopiaOculta,
            string assuntoMensagem,
            string conteudoMensagem)
        {
            bool Retorno = true;


            SmtpClient clienteSmtp = new SmtpClient("localhost");
            MailMessage email = new MailMessage(emailDestinatario, emailDestinatario);

            try
            {
                email.Bcc.Add(emailComCopiaOculta);
                email.IsBodyHtml = true;
                email.ReplyTo = new System.Net.Mail.MailAddress(nomeRemetente + "<" + emailRemetente + ">");
                email.Subject = assuntoMensagem;
                email.Body = conteudoMensagem;
                clienteSmtp.Send(email);
            }
            catch (Exception)
            {
                Retorno = false;
            }
            finally
            {
                //excluímos o objeto de e-mail da memória
                email.Dispose();
                //anexo.Dispose();
            }
            return Retorno;
        }

    }
}
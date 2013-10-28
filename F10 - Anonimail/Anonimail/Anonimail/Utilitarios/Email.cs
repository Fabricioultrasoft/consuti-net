using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System;

namespace Anonimail.Utilitarios
{
    public class Email
    {
        private string CAMINHO_ARQUIVO_PALAVROES = System.AppDomain.CurrentDomain.BaseDirectory + "Utilitarios\\";

        public void EnviaEmail(string remetente, string destinatario, string titulo, string mensagemEmail)
        {
            SmtpClient clienteSmtp = new SmtpClient("localhost");
            MailMessage email = new MailMessage();
            email.From = new MailAddress(remetente);
            email.To.Add(destinatario);
            email.Subject = titulo;
            email.Body = mensagemEmail;

            email.Priority = MailPriority.High;
            email.SubjectEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");
            email.BodyEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");
            email.IsBodyHtml = true;

            clienteSmtp.Send(email);
            email.Dispose();
        }

        /// <summary>
        /// Trata e formata o conteúdo do email a ser enviado.
        /// </summary>
        /// <param name="txtEmail"></param>
        /// <param name="codigoAnonimail"></param>
        /// <param name="emailResposta"></param>
        /// <returns></returns>
        public string TratarConteudoEmail(string txtEmail, string codigoAnonimail, string emailResposta)
        {
            //TODO: colocar o link no final do texto do email para resposta 
            //além de colocar a assinatura do site. Se não possui email resposta não envia link e informa que o quem enviou não deseja receber replica
            //TODO: Criar um e-mail mais adequado para identificar o envio de anonimail 
            string textoEmail = txtEmail + codigoAnonimail + emailResposta;

            return textoEmail;
        }

        public bool ValidaEmail(string email)
        {
            Regex rg = new Regex(@"^[A-Za-z0-9](([_\.\-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)*)\.([A-Za-z]{2,})$");

            if (rg.IsMatch(email))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// Busca palavrões no texto
        /// </summary>
        /// <param name="texto">Texto a ser filtrado.</param>
        /// <returns>Lista com os palavrões encntrados.</returns>
        public List<string> BuscaPalavroesTexto(string texto)
        {
            List<string> palavroesEncontrados = new List<string>();

            var pls = (from s in CarregaListaPalavroes()
                       orderby s descending
                       select s).Distinct();

            foreach (var palavrao in pls)
            {
                if (texto.Contains(palavrao))
                    palavroesEncontrados.Add(palavrao);
            }
            return palavroesEncontrados;
        }

        /// <summary>
        /// Obtem uma lista de palavras de um arquivo de texto salvo na pasta "Utilitários".
        /// </summary>
        /// <returns>Lista com as palavras listadas.</returns>
        public List<string> CarregaListaPalavroes()
        {
            string palavrao;
            List<string> listaPalavroes = new List<string>();
            try
            {
                string caminho = CAMINHO_ARQUIVO_PALAVROES + ConfigurationManager.AppSettings["arquivoPalavroes"].ToString();
                var file = new FileStream(caminho, FileMode.Open, FileAccess.Read);
                using (StreamReader sr = new StreamReader(file))
                {
                    while ((palavrao = sr.ReadLine()) != null)
                    {
                        listaPalavroes.Add(palavrao.Replace(";", ""));
                    }
                }
            }
            catch (Exception)
            {

                listaPalavroes = new List<string>();
            }

            return listaPalavroes;

        }
    }
}
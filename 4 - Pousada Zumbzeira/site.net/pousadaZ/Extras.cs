using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;
using System.Net.Mail;


namespace pousadaZ
{
    public class Extras
    {
        //variáveis de conexão e comandos para o banco
        private MySqlConnection conexao = null;
        private MySqlCommand comando = null;

        /// <summary>
        /// cria conexão com banco
        /// </summary>
        public Extras()
        {
            //abrir conexão com banco  
            conexao = new MySqlConnection(ConfigurationSettings.AppSettings["constr"]);
            conexao.Open();

            //executar a inclusão
            comando = new MySqlCommand();
            comando = conexao.CreateCommand();
        }

        //liberar recursos
        public void Dispose()
        {
            comando.Dispose();
            conexao.Dispose();
        }


        /// <summary>
        /// retorna o contador de acessos
        /// </summary>
        /// <returns></returns>
        public string GetContador()
        {
            string SelectBuscaCont = "SELECT cont_acessos FROM CONTADOR";
            object sqlResultBuscaID;

            MySqlCommand comandoBuscaCont = new MySqlCommand(SelectBuscaCont, conexao);

            sqlResultBuscaID = comandoBuscaCont.ExecuteScalar();
            conexao.Close();

            return Convert.ToString(sqlResultBuscaID);
        }

        public void ContPlusPlus()
        {
            comando.CommandText = "UPDATE CONTADOR " +
                "SET cont_acessos = (cont_acessos + 1) " +
                "WHERE ID = 'PZUMBZEIRA';";

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();
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


            ////Cria objeto com dados do e-mail.
            //MailMessage objEmail = new MailMessage();

            ////Define o Campo From e ReplyTo do e-mail.
            //objEmail.From = new System.Net.Mail.MailAddress(nomeRemetente + "<" + emailRemetente + ">");

            ////Define os destinatários do e-mail.
            //objEmail.To.Add(emailDestinatario);           

            ////Enviar cópia oculta para.
            //objEmail.Bcc.Add(emailComCopiaOculta);

            ////Define a prioridade do e-mail.
            //objEmail.Priority = System.Net.Mail.MailPriority.Normal;

            ////Define o formato do e-mail HTML (caso não queira HTML alocar valor false)
            //objEmail.IsBodyHtml = true;

            ////Define título do e-mail.
            //objEmail.Subject = assuntoMensagem;

            ////Define o corpo do e-mail.
            //objEmail.Body = conteudoMensagem;

            ////Para evitar problemas de caracteres "estranhos", configuramos o charset para "ISO-8859-1"
            //objEmail.SubjectEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");
            //objEmail.BodyEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");


            //// Caso queira enviar um arquivo anexo
            ////Caminho do arquivo a ser enviado como anexo
            ////string arquivo = Server.MapPath("arquivo.jpg");

            //// Ou especifique o caminho manualmente
            ////string arquivo = @"e:\home\LoginFTP\Web\arquivo.jpg";

            //// Cria o anexo para o e-mail
            ////Attachment anexo = new Attachment(arquivo, System.Net.Mime.MediaTypeNames.Application.Octet);

            //// Anexa o arquivo a mensagemn
            ////objEmail.Attachments.Add(anexo);

            ////Cria objeto com os dados do SMTP
            //System.Net.Mail.SmtpClient objSmtp = new System.Net.Mail.SmtpClient();

            ////Alocamos o endereço do host para enviar os e-mails, localhost(recomendado) ou smtp2.locaweb.com.br
            //objSmtp.Host = "localhost";
            //objSmtp.Port = 25;

            ////Enviamos o e-mail através do método .send()
            //try
            //{
            //    objSmtp.Send(objEmail);                
            //}
            //catch (Exception)
            //{
            //    Retorno = false;
            //}
            //finally
            //{
            //    //excluímos o objeto de e-mail da memória
            //    objEmail.Dispose();
            //    //anexo.Dispose();
            //}
            //return Retorno;
        }


        public bool EnviaRespostaAutomatica(string emailDestinatario, string caminhoAnexo)
        {
            string nomeRemetente = "Pousada Zumbzeira";
            string emailRemetente = "pousadazumbzeira@pousadazumbzeira.com.br";
            string assuntoMensagem = "Pousada Zumbzeira - A paz e tranquilidade próximas de você";
            string conteudoMensagem = "<br /><p class=MsoNormal>A <b style='mso-bidi-font-weight:normal'><span style='color:#1F497D;mso-themecolor:text2'>Pousada Zumbzeira</span></b> agradece sua consulta.</p>" +
                        "<p class=MsoNormal style='text-align:justify;text-indent:1.0cm'>Abaixo elaboramos algumas respostas que visam subsidiar a escolha da nossa Pousada.</p>" +
                        "<p class=MsoNormal style='text-align:justify'><b style='mso-bidi-font-weight:normal'><span style='color:#1F497D;mso-themecolor:text2'>Proximidade com Belo Horizonte<o:p></o:p></span></b></p>" +
                        "<p class=MsoNormal style='text-align:justify;text-indent:1.0cm'>Estamos a 14 km do BH Shopping, não sendo necessário descer até o povoado de Macacos, uma das opções é a Estrada do Engenho. Basta entrar no viaduto da BR 040 com sentido a Macacos, após a rotatória entre a direita na Estrada do Engenho. " +
                        "Siga até chegar à frente ao estacionamento <span class=GramE>da Vale</span> - Mina Mar Azul e a partir daí já pode-se ver placas com destino a nossa pousada. Confira o mapa para maiores detalhes (<a href='http://www.pousadazumbzeira.com.br/Localizacao.aspx'>HTTP://www.pousadazumbzeira.com.br/Localizacao.aspx</a>).</p>" +
                        "<p class=MsoNormal style='text-align:justify'><b style='mso-bidi-font-weight: normal'><span style='color:#1F497D;mso-themecolor:text2'>Ambiente<o:p></o:p></span></b></p>" +
                        "<p class=MsoNormal style='text-align:justify;text-indent:1.0cm'>Temos bela vista panorâmica, bom clima, área ensolarada, suítes com varandas privativas, suítes king <span class=SpellE>size</span> e chalés.</p>" +
                        "<p class=MsoNormal style='text-align:justify;text-indent:1.0cm'>Salão de jogos com sinuca, piscina, área de churrasco disponível ao cliente, restaurante com maravilhosa vista panorâmica</p> " +
                        "<p class=MsoNormal style='text-align:justify'>(<a href='http://www.pousadazumbzeira.com.br/LazerServicos.aspx'>HTTP://www.pousadazumbzeira.com.br/LazerServicos.aspx</a>).</p><p class=MsoNormal style='text-align:justify'><b style='mso-bidi-font-weight: " +
                        "normal'><span style='color:#1F497D;mso-themecolor:text2'>Preços<o:p></o:p></span></b></p>" +
						"<p class=MsoNormal style='text-align:justify;text-indent:1.0cm'><u><span style='color:#4F6228;mso-themecolor:accent3;mso-themeshade:128'>Hospedagens<o:p></o:p></span></u></p><p class=MsoNormal style='text-align:justify;text-indent:1.0cm'>" +
                        "<span style='mso-tab-count:1'></span><span style='mso-tab-count:1'></span>Valor médio para <span class=GramE>2</span> pessoas 180,00*.</p>" +
						"<p class=MsoNormal style='text-align:justify;text-indent:1.0cm'><u><span style='color:#4F6228;mso-themecolor:accent3;mso-themeshade:128'>Refeições<o:p></o:p></span></u></p><p class=MsoNormal style='text-align:justify;text-indent:1.0cm'>" +
                        "<span style='mso-tab-count:1'></span><span style='mso-tab-count:1'></span>Valor médio para <span class=GramE>2</span> pessoas 35,00.</p><p class=MsoNormal style='margin-left:35.4pt;text-align:justify;text-indent: 35.4pt'><span style='mso-tab-count:1'>            </span>Servimos petiscos diversos.</p>" +
                        "<span style='mso-tab-count:1'></span><span style='mso-tab-count:1'></span>Café da manhã gratis para hospedagem.</p>" +
                        "<p class=MsoNormal style='margin-left:35.4pt;text-align:justify;text-indent: 35.4pt'>Existem restaurantes tradicionais nas proximidades da pousada.<u></u></p>" +
                        "<p class=MsoNormal style='margin-left:35.4pt;text-align:justify;text-indent: 35.4pt'>*Os preços não são válidos para feriados ou datas comemorativas nacionais. Consulte a pousada para mais detalhes.<u></u></p>" +
                        "<br /><p class=MsoNormal style='margin-left:35.4pt;text-align:justify;text-indent: 35.4pt'>Se você é cliente da Pousada adquira já seu Cartão Fidelidade, com ele você terá inúmeros benefícios!<br /> Confira em: <a href='http://www.pousadazumbzeira.com.br/Fideliza.aspx'>http://www.pousadazumbzeira.com.br/Fideliza.aspx</a></p><br />" +
                        "<p class=MsoNormal style='text-align:justify'><b style='mso-bidi-font-weight: normal'><span style='color:#1F497D;mso-themecolor:text2'>Recomendação<o:p></o:p></span></b></p> <p class=MsoNormal style='text-align:justify;text-indent:1.0cm'>Para garantir " +
                        "sua estadia e necessário fazer sua reserva antecipada de 50% (por cento) do valor do serviço desejado e confirmar o depósito por telefone. Caso não possa realizar sua hospedagem naquela data, é necessário avisar com antecedência para que<span class=GramE><span style='mso-spacerun:yes'>  </span></span>seu crédito fique disponível para nova hospedagem.</p> " +
                        "<p class=MsoNormal style='text-align:justify;text-indent:1.0cm'><u><span style='color:#4F6228;mso-themecolor:accent3;mso-themeshade:128'>Dados para Depósito.<o:p></o:p></span></u></p> <p class=MsoNormal style='margin-left:35.4pt;text-align:justify;text-indent: 35.4pt'>Banco do Brasil<u><o:p></o:p></u></p> " +
                        "<p class=MsoNormal style='margin-left:70.8pt;text-align:justify;text-indent: 35.4pt'>AG: 4446-6<span style='mso-spacerun:yes'>     </span>Conta: 6284-7<span style='mso-spacerun:yes'>    </span><span style='mso-spacerun:yes'> </span><span style='mso-spacerun:yes'> </span>Nome: Pousada Zumbzeira</p> " +
                        "<p class=MsoNormal style='text-align:justify'><b style='mso-bidi-font-weight: normal'><span style='color:#1F497D;mso-themecolor:text2'>Fotos disponíveis<o:p></o:p></span></b></p> " +
                        "<p class=MsoNormal style='text-align:justify;text-indent:1.0cm'><a href='HTTP://www.pousadazumbzeira.com.br/Galeria.aspx'>HTTP://www.pousadazumbzeira.com.br/Galeria.aspx</a></p> <p class=MsoNormal style='text-align:justify;text-indent:1.0cm'><a href='HTTP://www.pousadazumbzeira.com.br/Acomodacoes.aspx'>HTTP://www.pousadazumbzeira.com.br/Acomodacoes.aspx</a></p> " +
                        "<p class=MsoNormal style='text-align:justify;text-indent:1.0cm'><a href='http://www.portalmacacos.com.br/pousadazumbzeiraemmacacos.html'>http://www.portalmacacos.com.br/pousadazumbzeiraemmacacos.html</a></p> " +
                        "<p class=MsoNormal style='text-align:justify;text-indent:1.0cm'>Confira também nosso perfil no Orkut e seja nosso amigo.</a></p> " +
                        "<p class=MsoNormal style='text-align:justify'><b style='mso-bidi-font-weight: normal'><span style='color:#1F497D;mso-themecolor:text2'>Central de Informações e Reservas<o:p></o:p></span></b></p> <p class=MsoNormal style='text-align:justify'><b style='mso-bidi-font-weight: normal'><span style='mso-tab-count:1'>            </span></b>31 3581-8906</p>" +
                        "<p class=MsoNormal style='text-align:justify;text-indent:35.4pt'>31 8841-8888</p>";
            bool Retorno = true;
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

            //Adciona anexo
            objEmail.Attachments.Add(new Attachment(caminhoAnexo));

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
            catch (Exception)
            {
                Retorno = false;
            }
            finally
            {
                //excluímos o objeto de e-mail da memória
                objEmail.Dispose();
                //anexo.Dispose();
            }
            return Retorno;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using testePMK.com.br.Banco;
using System.Data;
using System.Web.Security;

namespace testePMK.com.br
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                carregaPromocao();
                if (this.Context.User.Identity.IsAuthenticated)
                {
                    lituser.Text = this.Context.User.Identity.Name;
                    lbtnLogin.Text = "Logoff";

                }
                else
                {
                    lituser.Text = "Visitante";
                    lbtnLogin.Text = "Login";

                }

            }
            imgBtnVoltar.Attributes.Add("onClick", "javascript:history.go(-1);return false;");
            LbtnVoltar.Attributes.Add("onClick", "javascript:history.go(-1);return false;");
            imgBtnsecure.Attributes.Add("onClick", "javascript:window.open('https://secure.comodo.com/ttb_searcher/trustlogo?v_querytype=W&v_shortname=SC&v_search=https://painel.locaweb.com.br/painel_controle/aplicativos/default.asp&x=6&y=5 " +
                                    "','','resizable=yes, menubar=yes, scrollbars=yes, statusbar=yes, width=500, height=600, top=150, left=150')");
            imgPagSeguroLogo.Attributes.Add("onClick", "javascript:window.open('https://pagseguro.uol.com.br" +
                                    "','','resizable=yes, menubar=yes, scrollbars=yes, statusbar=yes, width=500, height=600, top=150, left=150')");
        }

        private void carregaPromocao()
        {
            BdBanner promoc = new BdBanner();
            DataSet ds = promoc.Listar();
            
            try
            {
                DataRow dr = ds.Tables[0].Rows[0];

                lblTituPtomoc.Text = dr["TITULO"].ToString();
                lblDescrPromocao.Text = dr["DESCRICAO"].ToString();
                imgBannPromocao.ImageUrl = "~\\Adm\\Banners\\" + dr["ID"] + ".jpg";
            }
            catch (Exception)
            {
                //nada
            }
            finally
            {
                promoc.Dispose();
            }
        }

        protected void imgbtnLogin_Click(object sender, ImageClickEventArgs e)
        {
            Session["msgLogin"] = "";
            Response.Redirect("LoginUserExt.aspx");
        }

        protected void imgBtnEmpresa_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Empresa.aspx");
        }

        protected void lbtnEmpresa_Click(object sender, EventArgs e)
        {
            Response.Redirect("Empresa.aspx");
        }

        protected void imgBtnPedidos_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("PedidosUserExt.aspx");
        }

        protected void lbtnPedidos_Click(object sender, EventArgs e)
        {
            Response.Redirect("PedidosUserExt.aspx");
        }

        protected void imgBtnContato_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Contato.aspx");
        }

        protected void lbtnContato_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contato.aspx");
        }

        protected void imgBtnLocaliza_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Localizacao.aspx");
        }

        protected void lbtnLocaliza_Click(object sender, EventArgs e)
        {
            Response.Redirect("Localizacao.aspx");
        }

        protected void lbtnLogin_Click(object sender, EventArgs e)
        {
            Session["msgLogin"] = "";
            if (lbtnLogin.Text != "Logoff")
            {
                Response.Redirect("LoginUserExt.aspx");
            }
            else
            {
                FormsAuthentication.SignOut();
                lituser.Text = "Visitante";
            }
        }

        protected void ImgbtnHome_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void LbtnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnEnviaIndicacao_Click(object sender, EventArgs e)
        {
            //mensagem que irá para e email indicado
            string msg = "Olá " + txbNomeAmigo.Text + "!" +
                "<br/> Seu amigo " + TxbNome.Text + " recomenda a você o site www.testepmk.com.br. " +
                "Acesse e conheça o site da Eber Móveis Profissionais e confira todas as ofertas que podem ser de seu interesse." +
                "<br/><br/><br/>Este email foi enviado automáticamente. Por favor não responda.";
            
            //mensagem que irá para notificação de indicação
            string msg2 = "O site foi indicado por: " + TxbNome.Text + 
                "<br/>para: " + txbNomeAmigo.Text + 
                "<br/>cujo email é: " + TxbEmailAmigo.Text +
                "<br/>Data e Hora do Evento: " + DateTime.Now +
                "<br/><br/> Email gerado automaticamente, por favor não responda. " +
                "<br/>ConsuTI.net";
            
            var EmailIndicacao = new Adm.Usuario.Ferramentas();            
            try
            {
                EmailIndicacao.EnviaEmail(
                    "TestePMK <testepmk@testepmk.com.br>",
                    TxbEmailAmigo.Text, TxbNome.Text + " recomenda o site TestePMK.com.br a você!",
                    msg);
                ExibeMensagemPopUp("Recomendação enviada com sucesso! MUITO OBRIGADO!");
                
                //envia alerta que o site foi indicado
                EmailIndicacao = new Adm.Usuario.Ferramentas();
                EmailIndicacao.EnviaEmail(
                    "siteindicado@testepmk.com",
                    "mesapmk@gmail.com",
                    "TestePMK.com.br - Site Indicado",
                    msg2);

                LimpaCampos();
            }
            catch (Exception)
            {
                ExibeMensagemPopUp("ERRO! Recomendação não enviada. Verifique os dados e tente novamente.");
            }

        }

        /// <summary>
        /// Exibe mensgem resultado
        /// </summary>
        /// <param name="mensagem">mensagem a ser exibida</param>
        public void ExibeMensagemPopUp(string mensagem)
        {
            Page.ClientScript.RegisterStartupScript(
                            this.GetType(),
                            "arquivo",
                            "alert('" + mensagem + "');",
                            true);
        }

        /// <summary>
        /// Limpa os campos da tela
        /// </summary>
        private void LimpaCampos()
        {
            TxbNome.Text = "";
            txbNomeAmigo.Text = "";
            TxbEmailAmigo.Text = "";
        }
    }
}
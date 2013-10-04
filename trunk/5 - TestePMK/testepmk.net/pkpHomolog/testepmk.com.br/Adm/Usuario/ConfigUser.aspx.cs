using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using testePMK.com.br.Banco;
using System.Data;

namespace testePMK.com.br.Adm.Usuario
{
    public partial class ConfigUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Context.User.Identity.Name == "")
            {//se não houver usuário autenticado volta ao login                
                Session["msgLogin"] = "Efetue Login para acessar o sistema";
                Response.Redirect("~/LoginAdm.aspx");
            }

            if (!IsPostBack)
            {
                PreencheCampos();
            }
        }

        /// <summary>
        /// Carrega com os dados do banco de dados
        /// </summary>
        private void PreencheCampos()
        {
            try
            {
                BdUsuario getDados = new BdUsuario();
                DataSet DsUserAdm = getDados.AdmDadosAcesso();
                DataRow DrUserAdm = DsUserAdm.Tables[0].Rows[0];
                TxbLogin.Text = DrUserAdm["Login"].ToString();
                TxbSenha.Attributes.Add("value", DrUserAdm["Senha"].ToString());
                TxbRepSenha.Attributes.Add("value", DrUserAdm["Senha"].ToString());
                getDados.Dispose();
            }
            catch (Exception)
            {
                //nada
            }
        }

        /// <summary>
        /// Salva os dados alterados pelo usuário
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            BdUsuario alterPass = new BdUsuario();
            Ferramentas enviaLembrete = new Ferramentas();
            try
            {
                //altera dados no banco
                alterPass.AlterarAdm(
                    TxbLogin.Text,
                    TxbSenha.Text);

                //envia email de lembrete
                enviaLembrete.EnviaEmail(
                    "testepmk@testepmk.com.br",
                    txbEmail.Text,
                    "Alteração de dados de acesso à Administração do Site TestePMK.com.br",
                    "Seus dados de acesso à area administrativa do site foram atualizados. Os novos dados de acesso são: " +
                    "<br/>Login: " + TxbLogin.Text +
                    "<br/>Senha: " + TxbSenha.Text);

                //recupera os novos dados
                PreencheCampos();

                //exibe mensagem para usuário
                ExibeMensagemPopUp("Alteração realizada com sucesso!");
            }
            catch (Exception)
            {
                ExibeMensagemPopUp("Erro! Operação não realizada. Tente novamente ou contate Administrador.");
            }
            finally
            {
                alterPass.Dispose();
            }
        }

        /// <summary>
        /// Exibe mensgem resultado
        /// </summary>
        /// <param name="mensagem">mensagem a ser exibida</param>
        private void ExibeMensagemPopUp(string mensagem)
        {
            ClientScript.RegisterStartupScript(
                            this.GetType(),
                            "arquivo",
                            "alert('" + mensagem + "');",
                            true);
        }

        /// <summary>
        /// Desfazer modificações
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConfigUser.aspx");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pousadaZ
{
    public partial class CartaoFidelidade : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //se o cartão for válido...
                if (!IsPostBack && ConfirmaValidade(Request.QueryString["numCartao"].ToString()).Equals(true))
                {
                    MontaCartao();
                }
                else
                {
                    pnlDicas.Visible = false;
                    lblMsgExp.Text = "Prazo para geração do cartão expirado!";
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void MontaCartao()
        {
            try
            {
                if (Request.QueryString["tipoCartao"].ToString().Equals("serieamigos"))
                {
                    pnlCartao.BackImageUrl = "~/Graficos/CartaoSerieAmigos.png";
                }
                //if (Request.QueryString["tipoCartao"].ToString().Equals("serieespecial"))
                //{
                //    pnlCartao.BackImageUrl = "~/Graficos/CartaoSerieEspecial.png";
                //}
                //if (Request.QueryString["tipoCartao"].ToString().Equals("Bronze"))
                //{
                //    pnlCartao.BackImageUrl = "~/Graficos/CartaoBronze.png";
                //}
                //else if (Request.QueryString["tipoCartao"].ToString().Equals("Prata"))
                //{
                //    pnlCartao.BackImageUrl = "~/Graficos/CartaoPrata.png";
                //}
                //else if (Request.QueryString["tipoCartao"].ToString().Equals("Ouro"))
                //{
                //    pnlCartao.BackImageUrl = "~/Graficos/CartaoOuro.png";
                //}

                lblNomeProprietario.Text = Request.QueryString["nome"].ToString();
                lblNumCartao.Text = Request.QueryString["numCartao"].ToString();
                lblValidade.Text = "Val.: " + DateTime.Now.AddMonths(6).ToShortDateString();
            }
            catch (Exception)
            {
                throw;
            }
        }

        /// <summary>
        /// recebe as datas misturadas ao numero do cartão e resolve se a requisição ainda é válida
        /// </summary>
        /// <param name="codCartao">codigo do cartão que contém a data de geração do cartão</param>
        /// <returns>true se o cartão é válido</returns>
        private bool ConfirmaValidade(string codCartao)
        {
            bool retorno = false;
            Array descobreValidade = codCartao.ToCharArray();
            string dia = descobreValidade.GetValue(0).ToString() + descobreValidade.GetValue(1).ToString();
            string mes = descobreValidade.GetValue(15).ToString() + descobreValidade.GetValue(16).ToString();
            DateTime dataGerada = Convert.ToDateTime(dia + "/" + mes + "/" + DateTime.Now.Year);

            if ((DateTime.Now - dataGerada).Days < 15)
            {
                retorno = true;
            }
            return retorno;
        }
    }
}

    
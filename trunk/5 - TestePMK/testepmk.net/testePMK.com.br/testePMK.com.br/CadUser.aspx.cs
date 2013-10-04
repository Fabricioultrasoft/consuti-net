using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using testePMK.com.br.Banco;
using testePMK.com.br.Adm.Usuario;

namespace testePMK.com.br
{
    public partial class CadUser : System.Web.UI.Page
    {
        private string dataNasc;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListItem sex = new ListItem("<selecione>", "");
                ddlSexo.Items.Insert(0, sex);

                ListItem estado = new ListItem("<selecione>", "");
                ddlEstado.Items.Insert(0, estado);
            }

            if (DdlSelecioneTipo.SelectedItem.Value == "1")
            {
                PnlSelecione.Visible = false;
                pnlJuridica.Visible = false;
                pnlFormCadastro.Visible = true;
            }
            else if (DdlSelecioneTipo.SelectedItem.Value == "2")
            {
                PnlSelecione.Visible = false;
                pnlFisica.Visible = false;
                pnlFormCadastro.Visible = true;
            }
            else
            {
                PnlSelecione.Visible = true;
                pnlFormCadastro.Visible = false;
            }
        }
        
        //valida o cpf e o cnpj
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            Response.Redirect("CadUser.aspx");
        }

        /// <summary>
        /// Algoritimo de Validação de CPF
        /// </summary>
        /// <param name="sourceCPF">CPF de Origem</param>
        /// <returns></returns>
        public bool ValidaCPF(string sourceCPF)
        {
            // Pré-Verificação do Tamanho da String (Apenas para Performance)
            if (sourceCPF.Length != 14)
            {
                return false;
            }

            // Cria Objetos
            string clearCPF;
            int[] cpfArray;
            int totalDigitoI = 0;
            int totalDigitoII = 0;
            int modI;
            int modII;

            // Limpa o CPF
            clearCPF = sourceCPF.Trim(); // Elimina Espaços em Branco
            clearCPF = clearCPF.Replace("-", ""); // Remove Separador de Dígito Verificador
            clearCPF = clearCPF.Replace(".", ""); // Remove os Separadores das Casas

            // Verifica o Tamanho do Texto de Input
            if (clearCPF.Length != 11)
            {
                return false;
            }

            // Verifica os Patterns mais Comuns para CPF's Inválidos
            if (clearCPF.Equals("00000000000") ||
                clearCPF.Equals("11111111111") ||
                clearCPF.Equals("22222222222") ||
                clearCPF.Equals("33333333333") ||
                clearCPF.Equals("44444444444") ||
                clearCPF.Equals("55555555555") ||
                clearCPF.Equals("66666666666") ||
                clearCPF.Equals("77777777777") ||
                clearCPF.Equals("88888888888") ||
                clearCPF.Equals("99999999999"))
            {
                return false;
            }

            // Verifica se no Array Existe Apenas Números
            foreach (char c in clearCPF)
            {
                if (!char.IsNumber(c))
                {
                    return false;
                }
            }

            // Converte o CPF em Array Numérico para Validar
            cpfArray = new int[11];
            for (int i = 0; i < clearCPF.Length; i++)
            {
                cpfArray[i] = int.Parse(clearCPF[i].ToString());
            }

            // Computa os Totais para os 2 Dígitos Verificadores
            for (int position = 0; position < cpfArray.Length - 2; position++)
            {
                totalDigitoI += cpfArray[position] * (10 - position);
                totalDigitoII += cpfArray[position] * (11 - position);
            }

            // Aplica Regras do Dígito 1
            modI = totalDigitoI % 11;
            if (modI < 2) { modI = 0; }
            else { modI = 11 - modI; }

            // Verifica o Digito 1
            if (cpfArray[9] != modI)
            {
                return false;
            }

            // Aplica o Peso para o Digito Verificador 2
            totalDigitoII += modI * 2;

            // Aplica Regras do Dígito Verificador 2
            modII = totalDigitoII % 11;
            if (modII < 2) { modII = 0; }
            else { modII = 11 - modII; }

            // Verifica o Digito 2
            if (cpfArray[10] != modII)
            {
                return false;
            }

            // CPF Válido!
            return true;
        }

        /// <summary>
        /// Valida o CNPJ do usuário
        /// </summary>
        /// <param name="TxtCnpj">cnpj a ser validado</param>
        /// <returns>False se o cnpj for inválido, true oderwise</returns>
        public static bool ValidaCNPJ(string TxtCnpj)
        {
            TxtCnpj = TxtCnpj.Replace(".", "");
            TxtCnpj = TxtCnpj.Replace("-", "");
            TxtCnpj = TxtCnpj.Replace("/", "");
            int[] cnpj = new int[TxtCnpj.Length];

            for (int i = 0; i < TxtCnpj.Length; i++)
            {
                cnpj[i] = int.Parse(TxtCnpj[i].ToString());
            }

            /* Se o número de dígitos numéricos do CNPJ for maior que 14, 
            significa que é um número inválido. */
            if (cnpj.Length > 14) { return false; }
            else // Caso contrário...
            {
                /* Se o número de dígitos numéricos do CNPJ for menor que 14,
                significa que é um número inválido. */
                if (cnpj.Length < 14) { return false; }
                else // Caso contrário...
                {
                    int[] v = new int[2];

                    // Cálculo do primeiro dígito para validação.
                    v[0] = 5 * cnpj[0] + 4 * cnpj[1] + 3 * cnpj[2] + 2 * cnpj[3];
                    v[0] += 9 * cnpj[4] + 8 * cnpj[5] + 7 * cnpj[6] + 6 * cnpj[7];
                    v[0] += 5 * cnpj[8] + 4 * cnpj[9] + 3 * cnpj[10] + 2 * cnpj[11];
                    v[0] = 11 - v[0] % 11;
                    /* Se o resultado for maior ou igual a 10, 
                    então é zero. */
                    if (v[0] >= 10) { v[0] = 0; }

                    // Cálculo do segundo dígito para validação.
                    v[1] = 6 * cnpj[0] + 5 * cnpj[1] + 4 * cnpj[2] + 3 * cnpj[3];
                    v[1] += 2 * cnpj[4] + 9 * cnpj[5] + 8 * cnpj[6] + 7 * cnpj[7];
                    v[1] += 6 * cnpj[8] + 5 * cnpj[9] + 4 * cnpj[10] + 3 * cnpj[11];
                    v[1] += 2 * v[0];
                    v[1] = 11 - v[1] % 11;
                    /* Se o resultado for maior ou igual a 10,
                    então é zero. */
                    if (v[1] >= 10) { v[1] = 0; }

                    // Retorno: Verdadeiro se os dígitos de validação são os esperados.
                    return (v[0] == cnpj[12] & v[1] == cnpj[13]);
                }
            }
        }

        /// <summary>
        /// valida o Rg do Usuário
        /// </summary>
        /// <param name="rg">RG a ser validado</param>
        /// <returns>True se o Rg for válido</returns>
        public bool validaRg(string rg)
        {
            //Elimina da string os traços, pontos e virgulas,
            rg = rg.Replace("-", "").Replace(".", "").Replace(",", "");            
            
            //Verifica se o tamanho da string é 9
            if (rg.Length == 9)
            {
                int[] n = new int[9];

                try
                {
                    n[0] = Convert.ToInt32(rg.Substring(0, 1));
                    n[1] = Convert.ToInt32(rg.Substring(1, 1));
                    n[2] = Convert.ToInt32(rg.Substring(2, 1));
                    n[3] = Convert.ToInt32(rg.Substring(3, 1));
                    n[4] = Convert.ToInt32(rg.Substring(4, 1));
                    n[5] = Convert.ToInt32(rg.Substring(5, 1));
                    n[6] = Convert.ToInt32(rg.Substring(6, 1));
                    n[7] = Convert.ToInt32(rg.Substring(7, 1));
                    if (rg.Substring(8, 1).Equals("x") || rg.Substring(8, 1).Equals("X"))
                    {
                        n[8] = 10;
                    }
                    else
                    {
                        n[8] = Convert.ToInt32(rg.Substring(8, 1));
                    }
                }
                catch (Exception)
                {
                    return false;
                }
                //obtém cada um dos caracteres do rg

                //Aplica a regra de validação do RG, multiplicando cada digito por valores pré-determinados
                n[0] *= 2;
                n[1] *= 3;
                n[2] *= 4;
                n[3] *= 5;
                n[4] *= 6;
                n[5] *= 7;
                n[6] *= 8;
                n[7] *= 9;
                n[8] *= 100;

                //Valida o RG
                int somaFinal = n[0] + n[1] + n[2] + n[3] + n[4] + n[5] + n[6] + n[7] + n[8];
                if ((somaFinal % 11) == 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// valida a data
        /// </summary>
        /// <param name="data">data a ser validada</param>
        /// <returns>true se a data for válida, false caso contrário</returns>
        private bool validaData(string data)
        {
            DateTime dataOk;
            bool retorno = true;
            try
            {
                dataOk = Convert.ToDateTime(data);
                if (dataOk > DateTime.Now)
                {
                    retorno = false;
                }
            }
            catch (Exception)
            {
                retorno = false;
            }
            return retorno;
        }

        /// <summary>
        /// convert string para array de int
        /// </summary>
        /// <param name="myString"></param>
        /// <returns></returns>
        public static int[] StringToInts(string myString)
        {
            List<int> ints = new List<int>();
            string[] strings = myString.Split(',');

            foreach (string s in strings)
            {
                int i;
                if (int.TryParse(s.Trim(), out i))
                {
                    ints.Add(i);
                }
            }
            return ints.ToArray();
        }

        /// <summary>
        /// cadastra o usuário 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            BdUsuarioSite validaExistCadUser = new BdUsuarioSite();

            if (validaExistCadUser.validaExistencia(txbEmail.Text) != "")
            {
                ExibeMensagemPopUp("ERRO! Email já cadastrado no site. Por favor utilize outro email ou recupere sua senha.");
                validaExistCadUser.Dispose();
            }
            else if (txbCNPJ.Text != "" && ValidaCNPJ(txbCNPJ.Text) != true)
            {
                ExibeMensagemPopUp("ERRO! CNPJ informado é inválido.");
            }
            //else if (txbRG.Text != "" && validaRg(txbRG.Text) != true)
            //{
            //    ExibeMensagemPopUp("ERRO! RG informado é Inválido.");
            //}
            else if (txbCPF.Text != "" && ValidaCPF(txbCPF.Text) != true)
            {
                ExibeMensagemPopUp("ERRO! CPF informado é inválido");
            }
            else if (txbDataNasc.Text != "" && validaData(txbDataNasc.Text) != true)
            {
                ExibeMensagemPopUp("ERRO! Data de nascimento informada é inválida.");
            }
            else
            {

                BdUsuarioSite cadUser = new BdUsuarioSite();
                try
                {
                    trataCampos();
                    cadUser.CadastraUsuario(
                        txbCPF.Text,
                        txbNome.Text.ToUpper(),
                        dataNasc,
                        txbSenha.Text,
                        ddlSexo.SelectedItem.Text,
                        txbCelular.Text,
                        txbTelFixo.Text,
                        txbRua.Text,
                        txbBairro.Text,
                        txbComplemento.Text,
                        txbCidade.Text,
                        ddlEstado.SelectedItem.Text,
                        txbProfissao.Text,
                        txbEmail.Text,
                        txbCNPJ.Text,
                        txbRazSocial.Text.ToUpper(),
                        Convert.ToInt32(txbNumero.Text),
                        txbCEP.Text,
                        txbInscEstad.Text,
                        txbRG.Text);
                    enviaEmailConfirmacao(txbEmail.Text);
                    LimpaCampos();
                    ExibeMensagemPopUp("Cadastro realizado com sucesso! " +
                        "Você receberá um email com a confirmação.");

                }
                catch (Exception)
                {
                    ExibeMensagemPopUp("Erro interno! Cadastro não realizado! Verifique os dados e tente novamente mais tarde. " +
                        "Se o erro persistir, entre em contato por favor.");
                }
                finally
                {
                    cadUser.Dispose();
                }
            }

        }

        /// <summary>
        /// Exibe mensgem resultado
        /// </summary>
        /// <param name="mensagem">mensagem a ser exibida</param>
        private void ExibeMensagemPopUp(string mensagem)
        {
            try
            {
                ClientScript.RegisterStartupScript(
                                this.GetType(),
                                "arquivo",
                                "alert('" + mensagem + "');",
                                true);
            }
            catch (Exception)
            {
                //nada
            }
        }

        /// <summary>
        /// Limpa os campos da tela
        /// </summary>
        private void LimpaCampos()
        {
            txbCPF.Text = "";
            txbNome.Text = "";
            txbDataNasc.Text = "";
            txbSenha.Text = "";
            ddlSexo.SelectedValue = "";
            txbCelular.Text = "";
            txbTelFixo.Text = "";
            txbRua.Text = "";
            txbBairro.Text = "";
            txbComplemento.Text = "";
            txbCidade.Text = "";
            ddlEstado.SelectedValue = "";
            txbProfissao.Text = "";
            txbEmail.Text = "";
            txbCNPJ.Text = "";
            txbRazSocial.Text = "";
            txbNumero.Text = "";
            txbCEP.Text = "";
            txbInscEstad.Text = "";
            txbRG.Text = "";
        }

        /// <summary>
        /// trata os campos que não são preenchidos
        /// </summary>
        private void trataCampos()
        {
            //se o cadastro for de pessoa fisica
            if (DdlSelecioneTipo.SelectedItem.Value == "1")
            {
                txbRazSocial.Text = txbNome.Text;
                txbInscEstad.Text = txbRG.Text;
                txbCNPJ.Text = txbCPF.Text;
                dataNasc = txbDataNasc.Text;
            }
            //se o cadastro for de pessoa jurídica
            else if (DdlSelecioneTipo.SelectedItem.Value == "2")
            {
                txbNome.Text = txbRazSocial.Text;
                txbCPF.Text = txbCNPJ.Text;
                txbRG.Text = txbInscEstad.Text;
                txbProfissao.Text = "";
                dataNasc = null;
                ddlSexo.SelectedItem.Text = "";
            }
            if (txbCelular.Text == "(__) ____-____")
            {
                txbCelular.Text = "";
            }
            if (txbInscEstad.Text == "")
            {
                txbInscEstad.Text = "ISENTO";
            }
        }

        /// <summary>
        /// envia o email de confirmação de cadastro
        /// </summary>
        /// <param name="to">endereço de destino</param>
        private void enviaEmailConfirmacao(string to)
        {
            string msg = "Obrigado por se cadastrar no portal Teste PMK!" +
                    "<br /><br />Seus dados de acesso são: <br /><br /> " +
                    "<br />Email: " + txbEmail.Text +
                    "<br />Senha: " + txbSenha.Text +
                    "<br /><br /><br />Obrigado por utilizar nossa loja! Em caso de dúvida acesse: www.testepmk.com.br/contato.aspx" +
                    "<br /><br /><br /><br />Email gerado automaticamente. Por favor não responda.";

            var enviaEmail = new Ferramentas();
            try
            {
                enviaEmail.EnviaEmail("Confirmação de Cadastro <correio@testepmk.com.br>", to, "Cadastro de Novo Usuário no Site testepmk.com.br", msg, txbEmail.Text);
            }
            catch (Exception)
            {
                //nada
            }
        }
    }
}
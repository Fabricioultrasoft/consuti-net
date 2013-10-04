using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO;

namespace ProGeS
{
    public partial class CADASTRO : Form
    {
        private int senhaProtegida; 
        private string arquivo = "Gold.txt";
        public CADASTRO()
        {
            InitializeComponent();
        }

        private void toolStripMenuItem2_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnLimpar_Click(object sender, EventArgs e)
        {
            LimpaCampos();
        }

        /// <summary>
        /// limpa os campos da tela
        /// </summary>
        private void LimpaCampos()
        {
            txbObs.Text = "";
            txbOrigem.Text = "";
            txbRepSenha2.Text = "";
            txbRepSenhaPrinc.Text = "";
            txbSenha2.Text = "";
            txbSenhaPrinc.Text = "";
            rbBasico.Checked = false;
            rbGeral.Checked = false;
            rbMaster.Checked = false;
            rbBasico2.Checked = false;
            rbGeral2.Checked = false;
            rbMaster2.Checked = false;
        }

        /// <summary>
        /// Salva os dados 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnSalvar_Click(object sender, EventArgs e)
        {
            try
            {
                //valida os campos obrigatórios
                if (validaCampos(
                    txbOrigem,
                    txbRepSenhaPrinc,
                    geraCombinacaoRadioBtn(rbMaster, rbGeral, rbBasico)) == true)
                {
                    //valida se as senhas estão OK
                    if (validaSenhas(txbSenhaPrinc.Text, txbRepSenhaPrinc.Text) == true
                        && validaSenhas(txbSenha2.Text, txbRepSenha2.Text) == true)
                    {
                        //valida se origem esta OK
                        if (validaOrigem(txbOrigem.Text) == true)
                        {
                            //gerar a senha "criptografada".
                            protegerSenha senhaTratada = new protegerSenha(txbSenhaPrinc.Text);
                            senhaProtegida = senhaTratada.retornaSenha();

                            //procedimentos para abrir arquivo e adicionar os próximos valores ao final do arquivo
                            Stream cadastraLogin = File.Open("Gold.txt", FileMode.Append);//Escrever no final
                            StreamWriter adiconaValores = new StreamWriter(cadastraLogin);
                            adiconaValores.WriteLine(
                                txbOrigem.Text + ";" + senhaProtegida + ";" +
                                geraCombinacaoRadioBtn(rbMaster, rbGeral, rbBasico) +
                                txbSenha2.Text +
                                geraCombinacaoRadioBtn(rbMaster2, rbGeral2, rbBasico2) +
                                 ";" + DateTime.Now + "&");
                            adiconaValores.Flush();
                            adiconaValores.Close();
                            MessageBox.Show("Cadastro realizado com sucesso!");
                            LimpaCampos();
                        }
                        else
                        {
                            MessageBox.Show("A origem " + txbOrigem.Text +
                                " já foi cadastrada. Não é possível cadastrar novamente.");
                        }
                    }
                    else
                    {
                        MessageBox.Show("Senhas não conferem. Verifique as senhas digitadas!");
                    }
                }
                else
                {
                    MessageBox.Show("ERRO! Campos obrigatórios não preenchidos.");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("ERRO! Procedimento não realizado. Verifique os dados e tente novamente. " +
                    "Caso o erro persista entre em contato pelo email consuti@consuti.net.\n +" + ex.ToString());
            }
        }        

        /// <summary>
        /// valida a existencia da origem
        /// </summary>
        /// <param name="origem">origem a ser validada</param>
        /// <returns>true se valida, false se origem já existir</returns>
        private bool validaOrigem(string origem)
        {
            if (!File.Exists(arquivo))
            {
                File.Create(arquivo).Close();                
            }
            TextReader buscaOrigem = new StreamReader(arquivo);
            string testaOrigem = "";
            string[] split;
            bool retorno = true;

            try
            {
                //para buscar a origem  
                testaOrigem = buscaOrigem.ReadLine();
                if (testaOrigem != null)
                {
                    while (buscaOrigem.Peek() != -1 || testaOrigem != origem)
                    {
                        testaOrigem = buscaOrigem.ReadLine();
                        split = testaOrigem.Split(';');
                        testaOrigem = split[0];                        
                    }
                    //se encontrou a origem
                    if (origem == testaOrigem)
                    {
                        retorno = false;
                    }
                }
            }
            catch (Exception ex)
            {
                retorno = false;
            }
            finally
            {
                buscaOrigem.Dispose();
            }
            return retorno;
        }
        
        /// <summary>
        /// valida se as duas sennhas são iguais
        /// </summary>
        /// <param name="senha1">1ª senha a ser comparada</param>
        /// <param name="senha2">2ª senha a ser comparada</param>
        /// <returns>true se as senhas estiverem OK, false se as senhas forem diferentes</returns>
        private bool validaSenhas(
            string senha1,
            string senha2)
        {
            if (senha1 == senha2)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// Gera um codigo de acordo com a combinação de nível selecionada
        /// </summary>
        /// <param name="rbMaster">radio button master</param>
        /// <param name="rbGeral">radio button geral</param>
        /// <param name="rbBasico">radio button básico</param>
        /// <returns>1 se basico, 2 se geral, 3 se master</returns>
        private int geraCombinacaoRadioBtn(
            RadioButton rbMaster,
            RadioButton rbGeral,
            RadioButton rbBasico)
        {
            if (rbBasico.Checked == true)
            {
                return 1;
            }
            else if (rbGeral.Checked == true)
            {
                return 2;
            }
            else if (rbMaster.Checked == true)
            {
                return 3;
            }
            else
            {
                return 0;
            }
        }
        
        /// <summary>
        /// valida se os campos obrigatórios estão preenchidos
        /// </summary>
        /// <param name="campo1">campo 1</param>
        /// <param name="campo2">campo 2</param>
        /// <param name="radioBtns">radio buttons </param>
        /// <returns>true se os campos obrigatórios estiverem OK, false caso contrário</returns>
        private bool validaCampos(
            TextBox campo1,
            TextBox campo2,
            int radioBtns)
        {
            if (campo1.Text != "" && campo2.Text != "" && radioBtns != 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}

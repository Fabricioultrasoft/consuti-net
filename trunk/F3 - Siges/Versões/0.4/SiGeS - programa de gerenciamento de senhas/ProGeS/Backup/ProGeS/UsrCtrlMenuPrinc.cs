using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace ProGeS
{
    public partial class UsrCtrlMenuPrinc : UserControl
    {
        public UsrCtrlMenuPrinc()
        {
            InitializeComponent();
        }

        private void pesquisarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form.ActiveForm.Hide();            
            PESQUISAR_SENHA PesqSenha = new PESQUISAR_SENHA();
            PesqSenha.Show();
        }

        private void novaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form.ActiveForm.Hide();
            CADASTRO cadSenha = new CADASTRO();
            cadSenha.Show();
        }

        private void alterarToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void excluirToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void criptografiaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form.ActiveForm.Hide();
            CRIPTOGRAFIA funcCriptografia = new CRIPTOGRAFIA();
            funcCriptografia.Show();
        }

        private void novosCadastrosToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void todosCadastrosToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void relatoriosDeAcessoToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void todasSenhasCuidadoToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void alterarDicaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form.ActiveForm.Hide();
            ALTERAR_DICA altDicaLogin = new ALTERAR_DICA();
            altDicaLogin.Show();
        }

        private void alterarSenhaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form.ActiveForm.Hide();
            ALTERA_SENHA_LOGIN_SISTEMA altSenhaLogin = new ALTERA_SENHA_LOGIN_SISTEMA();
            altSenhaLogin.Show();
        }

        private void trocarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form.ActiveForm.Hide();
            LOGIN logoff = new LOGIN();
            logoff.Show();
        }

        private void topicosToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void versaoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form.ActiveForm.Hide();
            VERSAO versao = new VERSAO();
            versao.Show();
        }

        private void creditosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form.ActiveForm.Hide();
            CREDITOS formCreditos = new CREDITOS();
            formCreditos.Show();
        }

        private void sairToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace ProGeS
{
    public partial class LOGIN : Form
    {
        public LOGIN()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void grbLogin_Enter(object sender, EventArgs e)
        {

        }

        private void Entrar_Click(object sender, EventArgs e)
        {
            if (txbUsuario.Text != "" && txbSenha.Text != "")
            {
                Login entrar = new Login(txbUsuario.Text, txbSenha.Text);
                try
                {
                    if (entrar.validaUsuario() == true)
                    {
                        if (entrar.validaSenha() == true)
                        {
                            this.Hide();
                            MAIN formPrinc = new MAIN();
                            formPrinc.Show();
                        }
                    }
                    else
                    {
                        MessageBox.Show("Login e/ou Senha invalido(s)!! \nTente novamente.");
                    }
                }
                catch (Exception)
                {
                    MessageBox.Show("Erro ao validar acesso. Verifique os dados e tente novamente mais tarde. " +
                        "Caso o erro persista, entre em contato com consuti@consuti.net");
                }
            }
            else
            {
                MessageBox.Show("ERRO! Digite Login e Senha para acessar.");
            }
        }

        private void btnSair_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void llbCadastrar_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            this.Hide();
            CADLOGIN cadLogin = new CADLOGIN();
            cadLogin.Show();

        }

        private void llbLembrarSenha_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            if (txbUsuario.Text != "")
            {
                dicaSenhaLogin dicaDeSenha = new dicaSenhaLogin(txbUsuario.Text);
                MessageBox.Show(dicaDeSenha.RetornaDica());
            }
            else
            {
                MessageBox.Show("Informe o Usuário!");
            }
            

        }
    }
}

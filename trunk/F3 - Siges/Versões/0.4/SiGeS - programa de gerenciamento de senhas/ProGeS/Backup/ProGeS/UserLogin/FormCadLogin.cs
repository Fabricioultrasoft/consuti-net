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
    public partial class CADLOGIN : Form
    {
        public CADLOGIN()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void Entrar_Click(object sender, EventArgs e)
        {
            if (txbUsuarioCad.Text != "")
            {
                string usuario, senha, repSenha, dicaSenha;
                usuario = txbUsuarioCad.Text;
                senha = txbSenhaCad.Text;
                repSenha = txbRepSenhaCad.Text;
                dicaSenha = txbDicaSenhaCad.Text;

                if (senha == repSenha)
                {
                    cadastrarLogin cadLogin = new cadastrarLogin();
                    MessageBox.Show(cadLogin.salvaUser(usuario, senha, dicaSenha));
                    this.Hide();
                    LOGIN entrar = new LOGIN();
                    entrar.Show();
                }
                else
                {
                    MessageBox.Show("Senha não confere!");
                }
            }
            else
            {
                MessageBox.Show("Impossível cadastrar com campo [Usuário] em branco!");
            }
        }

        private void txbSenha_TextChanged(object sender, EventArgs e)
        {

        }

        private void txbSenhaCad_TextChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            txbUsuarioCad.Clear();
            txbSenhaCad.Clear();
            txbRepSenhaCad.Clear();
            txbDicaSenhaCad.Clear();
        }
    }
}

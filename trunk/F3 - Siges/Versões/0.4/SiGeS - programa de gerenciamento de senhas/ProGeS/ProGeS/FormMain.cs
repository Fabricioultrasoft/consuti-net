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
    public partial class MAIN : Form
    {
        public MAIN()
        {
            InitializeComponent();
        } 

        private void llAdd_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Form.ActiveForm.Hide();
            CADASTRO cadSenha = new CADASTRO();
            cadSenha.Show();
        }

        private void pbAdd_Click(object sender, EventArgs e)
        {
            Form.ActiveForm.Hide();
            CADASTRO cadSenha = new CADASTRO();
            cadSenha.Show();
        }

        private void llPesquisar_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Form.ActiveForm.Hide();
            PESQUISAR_SENHA PesqSenha = new PESQUISAR_SENHA();
            PesqSenha.Show();
        }

        private void pbFind_Click(object sender, EventArgs e)
        {
            Form.ActiveForm.Hide();
            PESQUISAR_SENHA PesqSenha = new PESQUISAR_SENHA();
            PesqSenha.Show();
        }
    }
}

﻿using System;
using System.Data;
using Sistema_Life_Planner_Agenda.BD;
using Sistema_Life_Planner_Agenda.Classes;

namespace Sistema_Life_Planner_Agenda.Usuario
{
    public partial class AtualizarUsuario : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ValidaUserLogado();
                CarregarDados();
            }
        }

        protected void okButton_Click(object sender, EventArgs e)
        {
            if (Session["emailUsuarioLogado"].ToString().Equals(emailTextBox.Text))
            {
                try
                {
                    new UsuarioBD().Alterar(
                        Criptografar(confirmaSenhaTextBox.Text),
                        nomeCompletoTextBox.Text,
                        DDDTextBox.Text + telefoneTextBox.Text,
                        Session["emailUsuarioLogado"].ToString()
                        );
                    CarregarDados();
                    ExibeMensagemPopUp("Dados atualizados com sucesso!");
                }
                catch (Exception ex)
                {
                    ExibeMensagemPopUp("Não foi possível atualizar os dados cadastrais. Tente novamente mais tarde. Detalhes: " +
                                        ex.Message);
                }
            }
            else
            {
                ExibeMensagemPopUp("Falha na tentativa de atualização de dados. A sessão do usuário foi encerrada.");
            }
        }

        protected void cancelarButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AtualizarUsuario.aspx");
        }

        private void CarregarDados()
        {
            try
            {
                DataSet dadosCadastrais = new UsuarioBD().Obter(Session["emailUsuarioLogado"].ToString());

                DataRow DrUser = dadosCadastrais.Tables[0].Rows[0];
                emailTextBox.Text = DrUser["Email"].ToString();
                nomeCompletoTextBox.Text = DrUser["Nome"].ToString();
                DDDTextBox.Text = DrUser["Telefone"].ToString().Substring(0, 2);
                telefoneTextBox.Text = DrUser["Telefone"].ToString().Substring(2);
            }
            catch (Exception ex)
            {
                ExibeMensagemPopUp("Não foi possível recuperar os dados cadastrais. Tente novamente mais tarde. Detalhes: " +
                    ex.Message);
            }

        }
    }
}
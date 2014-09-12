﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sistema_Life_Planner_Agenda.Classes;

namespace Sistema_Life_Planner_Agenda.Contato
{
    public partial class CadastrarLote : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cancelarButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("PesquisarContato.aspx");

        }

        protected void salvarButton_Click(object sender, EventArgs e)
        {
            try
            {
                //TODO: Salvar contatoslote
                ExibeMensagemPopUp("Contatos Salvos com Sucesso!");
                Response.Redirect("CadastrarLote.aspx");
            }
            catch (Exception)
            {
                throw;
            }

        }
    }
}
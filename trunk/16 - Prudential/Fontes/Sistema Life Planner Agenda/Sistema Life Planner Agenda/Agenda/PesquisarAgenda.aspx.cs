﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sistema_Life_Planner_Agenda.Classes;

namespace Sistema_Life_Planner_Agenda.Agenda
{
    public partial class PesquisarAgenda : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void pesquisarButton_Click(object sender, EventArgs e)
        {

        }

        protected void limparButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("PesquisarAgenda.aspx");
        }

        protected void novoButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("CadastrarAgenda.aspx");
        }
    }
}
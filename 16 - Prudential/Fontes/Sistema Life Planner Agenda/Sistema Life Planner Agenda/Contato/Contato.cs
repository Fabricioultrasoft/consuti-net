using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sistema_Life_Planner_Agenda.Contato
{
    public class Contato
    {
        public int ID { get; set; }

        public int ID_Contato_Recomendante { get; set; }

        public int ID_Status_Contato { get; set; }

        public int ID_Tipo_Contato { get; set; }

        public string Cidade { get; set; }

        public string Email { get; set; }

        public string Estado_Civil { get; set; }

        public DateTime Data_Cadastro { get; set; }

        public int Filhos { get; set; }

        public int Idade { get; set; }

        public string Nome { get; set; }

        public string Outras_Informacoes { get; set; }

        public string Profissao { get; set; }

        public char Sexo { get; set; }

        public string Telefone_Alternativo_1 { get; set; }

        public string Telefone_Alternativo_2 { get; set; }

        public string Telefone_Principal { get; set; }

        public string UF { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sistema_Life_Planner_Agenda.BD
{
    public class ContatosUsuarioBD : BancoBase
    {
        /// <summary>
        /// Associa um contato a um usuário
        /// </summary>
        /// <param name="ID_Contato"></param>
        /// <param name="ID_Usuario"></param>
        /// <param name="Data_Cadastro"></param>
        public void Incluir(
            int ID_Contato,
            int ID_Usuario,
            DateTime Data_Cadastro)
        {
            comando.CommandText = @"INSERT INTO contatos_usuario
                                        (ID_Contato, ID_Usuario, Data_Cadastro) 
                                    VALUES (@ID_Contato, @ID_Usuario, @Data_Cadastro);";
            comando.Parameters.AddWithValue("@ID_Contato", ID_Contato);
            comando.Parameters.AddWithValue("@Data_Cadastro", Data_Cadastro);
            comando.Parameters.AddWithValue("@ID_Usuario", ID_Usuario);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();

            this.Dispose();
        }
    }
}
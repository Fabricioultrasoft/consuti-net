using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.Types;

namespace Anonimail.Banco
{
    public class ContadorAcesso : BancoBase
    {
        public void AdicionarAcesso(
            string ip,
            DateTime data,
            string tela,
            string browsertName)
        {
            comando.CommandText = @"INSERT INTO contadoracesso(IP, Data, Tela, BrowsertName) VALUES (@ip, @data, @tela, @browsertName)";
            comando.Parameters.AddWithValue("@ip", ip);
            comando.Parameters.AddWithValue("@data", data);
            comando.Parameters.AddWithValue("@tela", tela);
            comando.Parameters.AddWithValue("@browsertName", browsertName);

            comando.CommandType = System.Data.CommandType.Text;
            comando.ExecuteNonQuery();
        }
    }
}
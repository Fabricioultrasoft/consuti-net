<?
/*
Desenvolvido por Cristian Gomes - www.ConsuTI.net
*/
?>
<? 
include "site.php";
?>
<title><? echo "{$nome_site} Login"; ?></title>
<p>&nbsp;</p>

<br>
<link href="style.css" rel="stylesheet" type="text/css">
<? 
if (isset($acao)):
 
	$nome = ereg_replace("\"","&quot;",$nome);

	if ($nome == "" || $email == "" || $senha == ""):
		echo "<center><table><font face=\"Arial, Helvetica, sans-serif\" size=\"3\">";
		echo "Algum dado está vazio! Preencha novamente!<br>";
        echo "<form method=\"post\" action=\"cadastro.php\">
			<input type=\"hidden\" name=\"acao\" value=\"ok\">";
		echo "</font></table></center>";


		if ($nome == ""):
			echo "<center><table><font face=\"Arial, Helvetica, sans-serif\" size=\"2\">";
			echo "<b>O campo Nome esta vazio!</b><br><br>Nome:<br>";
			echo "<input type=\"text\" name=\"nome\" size=\"20\" maxlength=\"20\"><br><br>";
			echo "</font></table></center>";
		else:
			echo "<input type=\"hidden\" name=\"nome\" value=\"$nome\">";

		endif;

		if ($email == ""):
			echo "<center><table><font face=\"Arial, Helvetica, sans-serif\" size=\"2\">";
			echo "<b>O campo Email esta vazio!</b><br><br>Email:<br>";
			echo "<input type=\"text\" name=\"email\" size=\"20\" maxlength=\"30\"><br><br>";
			echo "</font></table></center>";

		else:
			echo "<input type=\"hidden\" name=\"email\" value=\"$email\">";

		endif;

		if ($senha == ""):
			echo "<center><table><font face=\"Arial, Helvetica, sans-serif\" size=\"2\">";
			echo "<b>O campo Senha esta vazio!</b><br><br>Senha:<br>";
			echo "<input type=\"password\" name=\"senha\" size=\"20\" maxlength=\"12\"><br><br>";
			echo "</font></table></center>";

		else:
			echo "<input type=\"hidden\" name=\"senha\" value=\"$senha\">";

		endif;

		echo "<center><table>";
		echo "<br><input type=\"submit\" value=\"OK\">
			 </form>";
		echo "</table></center>";


    else:
     
    	$checa_nome = "$nome";
			
		$checa_nome = ereg_replace("\"","",$checa_nome);
		$checa_nome = ereg_replace("\"","",$checa_nome);
		$checa_nome = ereg_replace("\*","",$checa_nome);
		$checa_nome = ereg_replace(" ","",$checa_nome);  

		if (file_exists("usuarios/$nome.php") || $checa_nome != "$nome"):

			echo "<br><center><table><font face=\"Arial, Helvetica, sans-serif\" size=\"3\">DADOS INCORRETOS!
				 </font></table></center><br>";

				if (file_exists("usuarios/$nome.php")):
					echo "<br><center><table><font face=\"Arial, Helvetica, sans-serif\" size=\"2\">Usuário <b>$nome</b> existente!
						 </font></table></center><br>";
				endif;
				
				if ($checa_nome != "$nome"):
					echo "<br><center><table><font face=\"Arial, Helvetica, sans-serif\" size=\"2\">Nome inválido para usuário!
						 </font></table></center><br>";
				endif;

			echo "<center><table><font face=\"Arial, Helvetica, sans-serif\" size=\"2\">
			<form method=\"post\" action=\"cadastro.php\">
			<input type=\"hidden\" name=\"acao\" value=\"ok\">
			Usuário:<br>
			<input type=\"text\" name=\"nome\" size=\"20\" maxlength=\"20\"></table></center>";

			echo "<center><table><input type=\"hidden\" name=\"email\" value=\"$email\">
			<input type=\"hidden\" name=\"senha\" value=\"$senha\">
			<br><br><input type=\"submit\" value=\"OK\">
			</form></font></table></center>";

		else:

			$senha_mail = "$senha";
			
			$senha = crypt($senha,"salt");


			$arquivo = "<?\n";
			$arquivo .="\$nome = \"$nome\";\n";
			$arquivo .="\$email = \"$email\";\n";
			$arquivo .="\$senha = \"$senha\";\n";
			$arquivo .="?>";

			$fp = fopen("usuarios/$nome.php","w+");
			fputs($fp,$arquivo);
			fclose($fp);


			$from    =  "$nome_site";
			$to      =  "$email";
			$subject =  "$nome_site: Cadastro Efetuado!";
			$message =  "PARABÉNS, CADASTRO EFETUADO COM SUCESSO.
						SEUS DADOS ESTAO ABAIXO:
						
						Login: $nome
						Senha: $senha_mail

						Grato, Equipe $nome_site
						$url_site						
						";

		
			mail($to,$subject,$message,"From: ".$from);

			echo "<font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><center><table>
				 Cadastro efetuado com sucesso!<br>
				 O usuário está apto para logar no site.<br>
Um e-mail foi enviado ao usuário informando-o sobre seu nome de usuário e senha.			 
<br><br>			 <a href=\"login.php?nome=$nome\">Logar</a><br>
				 <a href=\"$url_site\">$nome_site</a>
				 </table></center></font>";
			
		endif;

	endif;

else:


echo "
<center>
<table width=\"200\" border=\"0\" cellspacing=\"10\" style=\"border= 1px solid black\">
<tr> 
<td align=\"center\"> <font face=\"Arial, Helvetica, sans-serif\" size=\"2\"> 
<strong>CADASTRO $nome_site</strong></font></td>
</tr>
<tr> 
<td align=\"center\">
<hr>
<font face=\"Arial, Helvetica, sans-serif\" size=\"1\">
<form method=\"post\" action=\"cadastro.php\">
<input type=\"hidden\" name=\"acao\" value=\"ok\">
USU&Aacute;RIO:<br>
<input type=\"text\" name=\"nome\" size=\"20\" maxlength=\"20\"><br>
EMAIL:<br>
<input type=\"text\" name=\"email\" size=\"20\" maxlength=\"30\"><br>
SENHA:<br>
<input type=\"password\" name=\"senha\" size=\"20\" maxlength=\"10\"><br><br>
<br>
<input type=\"submit\" value=\"Cadastrar\" title=\"Processa os dados cadastrais\">
</form>
</font>
</td>
</tr>
</table></center>";

endif;

?>
<br><br>
<center>
<input type="button" value="Retornar" name="retorna" onClick="location.href='login_center.php'" title="Retorna ao Painel de controle">
<input type="button" value="Cancelar" name="retorna" onClick="window.close()" title="Cancela a operação e fecha a janela atual">

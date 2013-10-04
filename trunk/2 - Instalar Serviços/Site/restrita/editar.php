<!-- DESENVOLVIDO POR CRISTIAN GOMES - CONSUTI.NET       consuti@consuti.net             -->

<? 
include "site.php";
?>
<br>
<title><? echo "{$nome_site} Login"; ?></title>
<link href="style.css" rel="stylesheet" type="text/css">
<?
if ($acao == "editar" || $acao == "deletar"):

		if (file_exists("usuarios/$nome.php")):		
			include("usuarios/$nome.php");
		
			if ($c == "n"):
			else:
				$uid = crypt($password, "salt");
			endif;
	
			if ($uid == "$senha"):
	
				if ($acao == "editar"):

					if ($nome != "$nome2" && file_exists("usuarios/$nome2.php")):
				
						echo "<font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><center><table>
				 		Já existe um usuário com esse Login.<br>
						<a href=\"editar.php\">Tentar denovo.</a>
						<form
						</table></center></font>";
				
					else:
	
						$fileMessage = "<?\n";
						
						if ($nome2 == ""):
							$fileMessage .="\$nome = \"$nome\";\n";
						else:
							$fileMessage .="\$nome = \"$nome2\";\n";
						endif;
						
						if ($nova_senha == ""):
							$fileMessage .="\$senha = \"$uid\";\n";
						else:
							$senha = crypt($nova_senha, "salt");
							$fileMessage .="\$senha = \"$senha\";\n";
						endif;

						if ($email2 == ""):
							$fileMessage .="\$email = \"$email\";\n";
						else:
							$fileMessage .="\$email = \"$email2\";\n";
						endif;

						$fileMessage .="?>";

						if ($nome2 != ""):
							unlink("usuarios/$nome.php");

							$fp = fopen("usuarios/$nome2.php","w");
							fputs($fp,$fileMessage);
							fclose($fp);
						else:
							$fp = fopen("usuarios/$nome.php","w");
							fputs($fp,$fileMessage);
							fclose($fp);
						endif;

								
						echo "<font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><center><table>
				 		Dados editados com Sucesso!<br><br>

				 		<a href=\"login.php?nome=$nome2\">Logar</a><br>
				 		<a href=\"$url_site\">$nome_site</a>
						</table></center></font>";

					endif;
					
				endif;
	
				if ($acao == "deletar"):	
	
					unlink("usuarios/$nome.php");
				
					echo "<font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><center><table>
				 	Usuário $nome deletado com Sucesso!<br>
					<a href=\"$url_site\">$nome_site</a>
				 	</table></center></font>";
					
				endif;
	
			else:
		
				echo "<font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><center><table>
				 Senha incorreta!<br>
				 <a href=\"editar.php\">Tentar novamente.</a>
				 </table></center></font>";
		
			endif;	
	
		else:
		
			echo "<font face=\"Arial, Helvetica, sans-serif\" size=\"3\"><center><table>
				 Usuário $nome inexistente!<br>
				 <a href=\"editar.php\">Tentar novamente.</a>
				 </table></center></font>";
		
		endif;
				
	else:

echo "
<center>
<table width=\"250\" border=\"0\" cellspacing=\"10\" style=\"border= 1px solid black\">
<tr> 
<td align=\"center\"> <font face=\"Arial, Helvetica, sans-serif\" size=\"2\"> 
<strong>Editar / deletar usuário  $nome_site</strong></font></td>
</tr>
<tr> 
<td align=\"center\">
<hr>
<font face=\"Arial, Helvetica, sans-serif\" size=\"1\">
<form method=\"post\" action=\"editar.php\">
<input type=\"radio\" name=\"acao\" value=\"editar\" checked> &nbsp;&nbsp;Editar Usuário<br>
<input type=\"radio\" name=\"acao\" value=\"deletar\"> Deletar Usuário<br><br>
LOGIN:<br>
<input type=\"text\" name=\"nome\" size=\"20\" maxlength=\"20\"><br>
SENHA:<br>
<input type=\"password\" name=\"password\" size=\"20\" maxlength=\"12\"><br>
<br>
Deixe em branco os campos abaixo que n&atilde;o quiser alterar e n&atilde;o 
os preencha se for deletar seu usu&aacute;rio.<br>
<br>
NOVO LOGIN:<br>
<input type=\"text\" name=\"nome2\" size=\"20\" maxlength=\"20\"><br>
NOVA SENHA:<br>
<input type=\"password\" name=\"nova_senha\" size=\"20\" maxlength=\"12\"><br>
NOVO EMAIL:<br>
<input type=\"text\" name=\"email2\" size=\"20\" maxlength=\"30\"><br>
<br><br>
<input type=\"submit\" value=\"OK\">
</form>
</font>
</td>
</tr>
</table></center>";

endif;
?>
<center><br>
<input type="button" value="Retornar" onClick="location.href='login_center.php'" title="Retorna ao painel de controle.">
<input type="button" value="Cancelar" onClick="window.close()" title="Cancela a operação e fecha a janela.">
</center>
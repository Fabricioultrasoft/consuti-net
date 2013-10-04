<?
if (file_exists("usuarios/$nome.php")):
	include("usuarios/$nome.php");

else:
echo "<h4><img border=0 src=../smiles/alert.gif> F E C H A N D O . . .</h4><script>confirm('Usuário $username não Cadastrado, a janela será fechada')</script><body onLoad=\"window.close()\"></body><body onUnLoad=\"alert('A janela foi encerrada por questões de segurança. Tente novamente apenas se for administrador!')\">";
exit();
endif;




		if ($c == "n"):
		else:
			$uid = crypt($password, "salt");
		endif;
	
		if ($uid == "$senha"):

		else:
echo"<h4><img border=0 src=../smiles/alert.gif> F E C H A N D O . . .</h4><script>alert('Senha incorreta para o usuário $nome. A janela será fechada.')</script><body onLoad=\"window.close()\"></body><body onUnLoad=\"alert('A janela foi encerrada por questões de segurança. Tente novamente apenas se for administrador!')\">  ";
		exit();	
        endif;


			session_start();
			$logado= "ok";
			session_register("logado");
                        $usuario_logado=$nome;
			session_register("usuario_logado");
			
				
				if (file_exists("../".$HTTP_POST_VARS[retorna])):
					header("location:../".$HTTP_POST_VARS[retorna]);
				endif;

?>
<?
$grava_usuario = fopen("usuario.inc","w+");
fputs ($grava_usuario, "$nome");
fclose($grava_usuario);
?>
<title><? echo "{$nome_site} Login"; ?></title>
<link href="style.css" rel="stylesheet" type="text/css">

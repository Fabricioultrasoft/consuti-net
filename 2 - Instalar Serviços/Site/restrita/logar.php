<!-- DESENVOLVIDO POR CRISTIAN GOMES - CONSUTI.NET       consuti@consuti.net             -->

<?
	$senha = $_POST["senha"]; //pega o valor da senha por POST

	if (file_exists("usuarios/$nome.php")): //testa se o usuário existe, se existir ele carrega o arquivo de personalização
		include("usuarios/$nome.php");

		else:  //senão apresenta erro na tela
			echo "<h4><img border=0 src=../smiles/alert.gif> F E C H A N D O 1. . .</h4><script>confirm('Usuário $username não Cadastrado, a janela será fechada')</script><body onLoad=\"window.close()\"></body><body onUnLoad=\"alert('A janela foi encerrada por questões de segurança. Tente novamente apenas se for administrador!')\">";
			exit();
	endif;

	if ($password == "$senha"):
		session_start();
		$logado= "ok";
		session_register("logado");
                       $usuario_logado=$nome;
		session_register("usuario_logado");			
		if (file_exists("../".$HTTP_POST_VARS[retorna])):
			header("location:../agenda.php");
		endif;
	endif;
	/*if ($uid == "$senha")://não sei do que se trata ainda
	else:
		echo"<h4><img border=0 src=../smiles/alert.gif> F E C H A N D O 2. . .</h4><script>alert('Senha incorreta para o usuário $nome. A janela será fechada.')</script><body onLoad=\"window.close()\"></body><body onUnLoad=\"alert('A janela foi encerrada por questões de segurança. Tente novamente apenas se for administrador!')\">  ";
		exit();	
     endif*/	

?>

<!--/não sei do que se trata ainda-->

<? /*
	$grava_usuario = fopen("usuarios/$nome.php","w+");
	fputs ($grava_usuario, "$nome");
	fclose($grava_usuario);
*/ ?>

<title><? echo "{$nome_site} Login"; ?></title>
<link href="style.css" rel="stylesheet" type="text/css">

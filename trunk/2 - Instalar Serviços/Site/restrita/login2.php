<?php
	session_start();

	$usuario = $_POST['usuario'];
	$senha = $_POST['senha'];
	
	if($usuario == "Instalar")				//controla o usu�rio master
		if($senha == "123456"){				//controla senha
			$_SESSION["logado"] = true;
			header("location:cadastro.php");
		}
		else:  //sen�o apresenta erro na tela
			echo "<h4><img border=0 src=../smiles/alert.gif> F E C H A N D O . . .</h4><script>confirm('Usu�rio Adminisgtrador Incorreto, a janela ser� fechada')</script><body onLoad=\"window.close()\"></body><body onUnLoad=\"alert('A janela foi encerrada por quest�es de seguran�a. Tente novamente apenas se for administrador!')\">";
			exit();
	endif;
			
?>
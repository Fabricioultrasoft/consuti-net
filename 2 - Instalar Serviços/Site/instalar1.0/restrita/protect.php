<?
/*
LLBRA LOGIN - llbra@bol.com.br
*/
session_start();

if($HTTP_SESSION_VARS["logado"] != "ok"){
	header("Location:login.php?erro=PasswProtected");
	exit;
}
?>

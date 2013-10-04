<!-- DESENVOLVIDO POR CRISTIAN GOMES - CONSUTI.NET       consuti@consuti.net             -->

<?
session_start();

if($HTTP_SESSION_VARS["logado"] != "ok"){
	header("Location:login.php?erro=PasswProtected");
	exit;
}
?>

<?
session_start();
if(isset($_GET['logout'])){
$logado = NULL;
session_unregister("logado");
session_destroy();
header("Location: login.php");
}
?>
<?
/*

*/
?>
<? 
include "site.php";
?>
<title><? echo "{$nome_site} Login"; ?></title>
<link href="style.css" rel="stylesheet" type="text/css">
<?
if (file_exists("login_center.php")):
	include "login_center.php";
endif;
?>
<link href="../estilo.css" rel="stylesheet" type="text/css">

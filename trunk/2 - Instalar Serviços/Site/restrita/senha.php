<!-- DESENVOLVIDO POR CRISTIAN GOMES - CONSUTI.NET       consuti@consuti.net             -->

<?
$adminusr="xxx";
$adminpwd="yyy";

if ( (!isset($PHP_AUTH_USER)) || ! (($PHP_AUTH_USER == $adminusr) && ( $PHP_AUTH_PW == $adminpwd )) ) {
header("WWW-Authenticate: Basic realm=�REA RESTRITA");
header("HTTP/1.0 401 Unauthorized");
echo("ACESSO NEGADO");
} else {
echo("ACESSO OK");
}
?>







<?php /*
// d� permiss�o 755
$username = "webmaster"; // username p/ entrar na p�gina
$password = "webmaster"; // password p/ entrar na p�gina

if ($PHP_AUTH_USER != $username)//testar sem a valida��o de senha || $PHP_AUTH_PW != $password)
{
  header("WWW-Authenticate: basic realm='�rea restrita'");
  header("HTTP/1.0 401 Unauthorized");
  echo "<h4><img border=0 src=../smiles/alert.gif> F E C H A N D O . . .</h4><script>alert('Acesso negado. Verifique login e senha!')</script><body onLoad=\"window.close()\"></body><body onUnLoad=\"alert('A janela foi encerrada por quest�es de seguran�a. Tente novamente apenas se for administrador!')\">"; //login inv�lido
  exit;
  }else{
  include "cadastro.php";
  }
*/ ?>

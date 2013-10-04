<!-- DESENVOLVIDO POR CRISTIAN GOMES - CONSUTI.NET       consuti@consuti.net             -->

<?
$adminusr="xxx";
$adminpwd="yyy";

if ( (!isset($PHP_AUTH_USER)) || ! (($PHP_AUTH_USER == $adminusr) && ( $PHP_AUTH_PW == $adminpwd )) ) {
header("WWW-Authenticate: Basic realm=ÁREA RESTRITA");
header("HTTP/1.0 401 Unauthorized");
echo("ACESSO NEGADO");
} else {
echo("ACESSO OK");
}
?>







<?php /*
// dê permissão 755
$username = "webmaster"; // username p/ entrar na página
$password = "webmaster"; // password p/ entrar na página

if ($PHP_AUTH_USER != $username)//testar sem a validação de senha || $PHP_AUTH_PW != $password)
{
  header("WWW-Authenticate: basic realm='Área restrita'");
  header("HTTP/1.0 401 Unauthorized");
  echo "<h4><img border=0 src=../smiles/alert.gif> F E C H A N D O . . .</h4><script>alert('Acesso negado. Verifique login e senha!')</script><body onLoad=\"window.close()\"></body><body onUnLoad=\"alert('A janela foi encerrada por questões de segurança. Tente novamente apenas se for administrador!')\">"; //login inválido
  exit;
  }else{
  include "cadastro.php";
  }
*/ ?>

<?php
// d� permiss�o 755
$username = "webmaster"; // username p/ entrar na p�gina
$password = "webmaster"; // password p/ entrar na p�gina
if ($PHP_AUTH_USER != $username || $PHP_AUTH_PW != $password)
{
  header("WWW-Authenticate: basic realm='�rea restrita'");
  header("HTTP/1.0 401 Unauthorized");
  echo "<h4><img border=0 src=../smiles/alert.gif> F E C H A N D O . . .</h4><script>alert('Acesso negado. Verifique login e senha!')</script><body onLoad=\"window.close()\"></body><body onUnLoad=\"alert('A janela foi encerrada por quest�es de seguran�a. Tente novamente apenas se for administrador!')\">"; //login inv�lido
  exit;
}else
  {
  include "cadastro.php";
  }
?>

<!-- DESENVOLVIDO POR CRISTIAN GOMES - CONSUTI.NET       consuti@consuti.net             -->

<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<?php $retorna="agenda.php"          //retorno apos a validação do login                        	?>

<body>
<center>
<p>&nbsp;</p>
<p>&nbsp;</p>
<font face="Arial, Helvetica, sans-serif" size=2>
<form method="POST" action="logar.php">
  <input type="hidden" name="retorna" value="<? echo $retorna ?>" />
  <table width="200" border="0" cellspacing="10" style="border= 1px solid black">
    <tr> 
        <td align="center"> <font face="Arial, Helvetica, sans-serif" size="2"> 
          <strong>Acesso restrito</strong></font>        </td>
    </tr>
    <tr> 
        <td align="center"> <p><font size="2" face="Arial, Helvetica, sans-serif"><hr>
          <br>
          <strong><font size="1">LOGIN</font></strong><br>
          <input type="text" name="nome" value="">
          <br>
          <br>
          <strong><font size="1">SENHA:</font></strong><br>
          <input type="password" name="senha" value="">
          <br>
          <br>
          <input type="submit" name="Submit" value="Acessar">
          <hr>
          </font></td>
</tr>
</table>
</form>
<a href=# onClick="location.href='cadastro.php'"><img border=0 src="../smiles/chave.gif" alt="Cadastrar usuário"></a>
</center>
</body>
</html>

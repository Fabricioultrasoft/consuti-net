<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="estilo.css" type="text/css">
<script type="text/javascript" src="scripts.js"></script>
<script language="JavaScript">
function Link(cod)
	{
		//pagina = "reportagens.php";
		//parametros = "&codInteresse="+cod;
		pagina = "reportagens.php";
    parametros = "";
    OpenNewWindow(pagina, parametros, 500, 800, 1, 0);
	}
  
	var nmVelocidadeRolagem = 1;	// Especifica a Velocidade da Rolagem.
	var nmTempoInicio = 700;			// Especifica o tempo, em milisegundos, que levar para iniciar a rolar o texto
	var cache = nmVelocidadeRolagem;
	
	if (window.addEventListener)
	{
		window.addEventListener("load", initializeScroller, false);
	}
	else if (window.attachEvent)
	{
		window.attachEvent("onload", initializeScroller);
	}
	else
	{
		window.onload = initializeScroller;
	}

	function mudaVelocidade(vlrVelocidade)
	{
		nmVelocidadeRolagem = vlrVelocidade;
	}
	
	function initializeScroller()
	{
		if(document.all)
		{
				dataobj = document.all.layDados;
		}
		else
		{
				dataobj = document.getElementById("layDados");
		}

		dataobj.style.top = "5px";
		setTimeout("getdataheight()", nmTempoInicio);
	}
	
	function getdataheight()
	{
	
		thelength=dataobj.offsetHeight;
	
		if (thelength==0)
		{
			setTimeout("getdataheight()",10);
		}
		else
		{
			scrollDiv();
		}
	
	}
	
	function scrollDiv()
	{
	
		dataobj.style.top = ( parseInt(dataobj.style.top) - nmVelocidadeRolagem ) +"px";
		
		if ( parseInt(dataobj.style.top) < thelength * (-1) )
		{
			dataobj.style.top="5px";
		}
		setTimeout("scrollDiv()",40);
	
	}
</script>
<style type="text/css">
<!--
.style1 {color: #FFFFFF}
-->
</style>
</head>
<body>
<p>&nbsp;</p>

<div id="layDados" style="position:absolute; left:0px; top:10px; width:100%" onMouseover="mudaVelocidade(0);" onMouseout="mudaVelocidade(cache);">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
  <table align="center">
    
    
    <tr onClick="Link(52169);" style="cursor:pointer">   	<td align="right"><p align="center">&nbsp;</p>
      <p align="center">&nbsp;</p>
      <p align="center">&nbsp;</p>
      <p align="center">&nbsp;</p>
      <p align="center"><strong>CLIENTES</strong></p>
      <p><img src="Pict/AutoClub.png" width="170"  align="right"/></p>
      <p>&nbsp;</p>
  	  <p>&nbsp;</p>
  	  <p><img src="Pict/avap.png" width="170" height="82" /></p>
      <p>&nbsp;</p>
  	  <p>&nbsp;</p>
  	  <p><img src="Pict/satplus.png" width="170" height="112" /></p>
  	  <p>&nbsp;</p>
  	  <p><img src="Pict/mitsim.png" width="150" height="148" /></p>
  	  <p>&nbsp;</p>
<p><img src="Pict/coca.png" width="160" height="111" /></p>
<p>&nbsp;</p>
<p><img src="Pict/protegido.png" width="150" height="106" /></p>
<p>&nbsp;</p>
<p><img src="Pict/aguarda.png" width="150" height="144" /></p>
<p>&nbsp;</p>
<p><img src="Pict/protvel.png" width="170" height="77" /></p>
<p>&nbsp;</p>
<p><img src="Pict/plantao.png" width="170" height="36" /></p>
<p>&nbsp;</p>
<br>
<strong> MARCAS QUE  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></br>
  <br align="center">
  <strong> TRABALHAMOS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></p>
<p><strong><img src="Pict/magnetm.png" width="150" height="92" /></strong></p>
<p>&nbsp;</p>
<p><strong><img src="Pict/maxtr.png" width="170" height="77" /></strong></p>
<p>&nbsp;</p>
<p><strong><img src="Pict/3tsys.png" width="150" height="131" /></strong></p>
<p>&nbsp;</p>
<p><strong><img src="Pict/webw.png" width="170" height="56" /></strong></p>
<p>&nbsp;</p>
<p><strong><img src="Pict/svias.png" width="170" height="75" /></strong></br>
</p>
<p>&nbsp;</p>
      
      </td>	
  </tr>
</table>
</div>
</body>
</html>
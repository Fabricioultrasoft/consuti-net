<?php //por Cristian Gomes - Consuti.net

//include "restrita/usuarios/$nome.php";       //pega o arquivo do usuário logado para receber email de contato

$emailsender = "consuti@consuti.net";          //email que vai ser usado para enviar 


//pega as variaveis por POST
$nomeCliente   = $_POST['nomeCliente'];
$dataServ      = $_POST['dataServ'];
$horaServ      = $_POST['horaServ'];
$localServ     = $_POST['localServ'];
$telServ       = $_POST['telServ'];
$veiculoServ   = $_POST['veiculoServ'];
$anoVeiculo    = $_POST['anoVeiculo'];
$placaVeiculo  = $_POST['placaVeiculo'];
$corVeiculo    = $_POST['corVeiculo'];
$mensagemServ  = $_POST['mensagemServ'];

$data      = date("d/m/y");                     //função para pegar a data de envio do e-mail
$hora      = date("H:i");                       //para pegar a hora com a função date

//monta a mensagem para o formato html na caixa
$mensagemHtml = '<p>Nome do Cliente: <b><i>'.$nomeCliente.'</i></b></p><p>Data do Servi&ccedil;o: <b><i>'.$dataServ.'</i></b></p><p>Hora: <b><i>'.$horaServ.'</i></b></p><p>Local do Servi&ccedil;o: <b><i>'.$localServ.'</i></b></p><p>Telefone para Contato: <b><i>'.$telServ.'</i></b></p><p>Ve&iacute;culo: <b><i>'.$veiculoServ.'</i></b></p><p>Ano: <b><i>'.$anoVeiculo.'</i></b></p><p>Placa do Ve&iacute;culo: <b><i>'.$placaVeiculo.'</i></b></p><p>Cor: <b><i>'.$corVeiculo.'</i></b></p><p>Mensagem enviada em: <b><i>'.$data.'</i></b> &agrave;s <b><i>'.$hora.'</i></b></p><p>Mensagem: <i>'.$mensagemServ.'</i></p>';

$titulo = "Instalar - Marca&ccedil;&atilde;o de serviços via Site";                  //titulo da mensagem 

//cabeçalhos da caixa de correio
$headers = "MIME-Version: 1.1\r\n";
$headers .= "Content-type: text/html; charset=iso-8859-1\r\n";
$headers .= "From: $email\r\n";                               // remetente
$headers .= "Reply-To: $email\r\n";                                 //caso queira usar a resposta 
$headers .= "Return-Path: cristian.co.gomes@gmail.com\r\n"; // return-path

//testa o preenchimento do formulario
if (!($nomeCliente=='') && !($dataServ=='') && !($horaServ='') && !($localServ=='') && !($telServ=='') && !($veiculoServ=='') && !($anoVeiculo=='') && !($placaVeiculo=='') &&!(corVeiculo=='')){
	//if (preg_match ("/^[A-Za-z0-9]+([_.-][A-Za-z0-9]+)*@[A-Za-z0-9]+([_.-][A-Za-z0-9]+)*\\.[A-Za-z0-9]{2,4}$/", $email)) {
		
		//envia o e-mail 
		$enviado = mail($emailsender, $titulo, $mensagemHtml, $headers) or die ('Ops! Ocorreu em erro e a mesagem não foi enviada');
		$aviso = "Muito Obrigado! Seu email foi enviado a Instalar corretamente!";
		//header("Location:agenda.php");
	//}else{
		//$aviso = "O e-mail informado - $email - é inválido";
		//header("Location:agenda.php");
	//}
}else{
	$aviso = "Por favor, preencha todos os campos!";
	//header("Location:agenda.php");
	
}

//resposta do envio em messagebox e retorno para a mesma pagina com o Javascript
echo "<script language=\"javascript\" type=\"text/javascript\"> alert(\"$aviso\"); window.location='agenda.php'; </script>";

//se quiser resposta na pagina
/*if ($enviado == 'true')
{
	echo "<p align=center>$nome, sua mensagem foi enviada com sucesso!</p>";
	echo "<p align=center>Estaremos no ar em breve.</p>";
	echo "<p align=center><b> OBRIGADO! </b></p>";
	echo "<p> Enviada em: $data &agrave;s $hora</p>";
}*/	
?>
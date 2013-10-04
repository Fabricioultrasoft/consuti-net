<?php //por Cristian Gomes - Consuti.net

$emailsender = 'consuti@consuti.net';          //email que vai ser usado para enviar 

//pega as variaveis por POST
$nome      = $_POST['nome'];
$email     = $_POST['email'];
$empresa   = $_POST['empresa'];
$mensagem  = $_POST['mensagem'];
$assunto   = $_POST['assunto'];

$data      = date("d/m/y");                     //função para pegar a data de envio do e-mail
$hora      = date("H:i");                       //para pegar a hora com a função date

//monta a mensagem para o formato html na caixa
$mensagemHtml = '<p>Nome: <b><i>'.$nome.'</i></b></p><p>Empresa: <b><i>'.$empresa.'</i></b></p><p>E-mail: <b><i>'.$email.'</i></b></p><p>Assunto: <b><i>'.$assunto.'</i></b></p><p><b><i>'.$data.'</i></b> &agrave;s <b><i>'.$hora.'</i></b></p><p>Mensagem: <i>'.$mensagem.'</i></p>';

$titulo = "Instalar - Contato do Site";                  //titulo da mensagem 

//cabeçalhos da caixa de correio
$headers = "MIME-Version: 1.1\r\n";
$headers .= "Content-type: text/html; charset=iso-8859-1\r\n";
$headers .= "From: $email\r\n";                               // remetente
$headers .= "Reply-To: $email\r\n";                                 //caso queira usar a resposta 
$headers .= "Return-Path: cristian.co.gomes@gmail.com\r\n"; // return-path

//testa o preenchimento do formulario
if (!($nome=='') && !($email=='') && !($empresa='') && !($mensagem=='') && !($assunto=='')){
	if (preg_match ("/^[A-Za-z0-9]+([_.-][A-Za-z0-9]+)*@[A-Za-z0-9]+([_.-][A-Za-z0-9]+)*\\.[A-Za-z0-9]{2,4}$/", $email)) {
		//envia o e-mail 
		$enviado = mail($emailsender, $titulo, $mensagemHtml, $headers) or die ('Ops! Ocorreu em erro e a mesagem não foi enviada');
		$aviso = "Muito Obrigado! Seu email foi enviado a Instalar corretamente!";
		//header("Location:contato.php");
	}else{
		$aviso = "O e-mail informado - $email - é inválido";
		//header("Location:contato.php");
	}
}else{
	$aviso = "Por favor, preencha todos os campos";
	//header("Location:contato.php");
	
}

//resposta do envio em messagebox e retorno para a mesma pagina com o Javascript
echo "<script language=\"javascript\" type=\"text/javascript\"> alert(\"$aviso\"); window.location='contato.php'; </script>";

//se quiser resposta na pagina
/*if ($enviado == 'true')
{
	echo "<p align=center>$nome, sua mensagem foi enviada com sucesso!</p>";
	echo "<p align=center>Estaremos no ar em breve.</p>";
	echo "<p align=center><b> OBRIGADO! </b></p>";
	echo "<p> Enviada em: $data &agrave;s $hora</p>";
}*/	
?>
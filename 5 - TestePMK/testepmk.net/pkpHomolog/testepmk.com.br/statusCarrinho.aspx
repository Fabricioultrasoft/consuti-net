<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="statusCarrinho.aspx.cs"
    Inherits="testePMK.com.br.statusCarrinho" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="~/Estilos.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-color: White; margin: 0px 0px 0px 0px">
    <div class="promocoes" style="margin: 0px 0px 0px 0px; height: 170px; background-image: none">
        <div id="see">
            <h5 style="margin-top: 0px; margin-bottom: 10px;">
                <img alt="ver carrinho" src="Graficos/carrinho.png" align="middle" />&nbsp; Carrinho
                de compras</h5>
            <p>
                Clique no botão abaixo para visualizar os produtos que já foram adicionados ao seu
                carrinho PagSeguro:</p>
            <form id="carrinho" target="pagseguro" action="https://pagseguro.uol.com.br/security/webpagamentos/webpagto.aspx"
            method="post">
            <div>
                <input type="hidden" name="email_cobranca" value="mesapmk@gmail.com" />
                <input type="hidden" name="tipo" value="VER" />
                <input type="submit" name="submit_04" id="submit_04" class="btsee" value="" />
            </div>
            </form>
        </div>
    </div>
</body>
</html>

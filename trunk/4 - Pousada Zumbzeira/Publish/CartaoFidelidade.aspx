<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CartaoFidelidade.aspx.cs"
    Inherits="pousadaZ.CartaoFidelidade" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="shortcut icon" href="../../favicon.ico" />
    <style type="text/css">
        .tamMax
        {
            height: 100%;
            width: 100%;
            font-family: Arial;
        }
        
        #nomeProprietario
        {
            font-size: 16pt;
            margin-top: 20px;
            text-align: center;
            font-family: Arial;
            font-style: oblique;
        }
        
        #numCartao
        {
            margin-top: 34px;
            text-align: right;
            margin-right: 10px;
            font-family: Arial;
        }
        
        #validade
        {
            text-align: left;
            margin-left: 10px;
            font-family: Arial;
        }
        .AlinhaPnl
        {
            margin: 0px auto;
        }
        
        .Pontilhado
        {
            border-style: dashed;
            border-width: thin;
            width: 401px;
            height: 241px;
        }
        
        .GradeCartao
        {
            text-align: center;
            height: 100%;
            width: 100%;
            margin: 0px auto;
        }
        .style1
        {
            text-align: justify;
        }
        
        .pnlDicas
        {
            margin: 0px auto;
            width: 600px;
        }
        .style2
        {
            text-decoration: underline;
        }
    </style>
    <script type="text/javascript" language="javascript">
        function imprimir() {
            window.print();
        }
    </script>
</head>
<body style="background-color: White; text-align: center" onload="imprimir()">
    <form id="form1" runat="server">
    <asp:Panel ID="pnlContent" runat="server">
        <div id="grade" class="GradeCartao">
            <br />
            <div class="Pontilhado AlinhaPnl">
                <asp:Panel ID="pnlCartao" runat="server" Width="400" CssClass="AlinhaPnl" Height="241"
                    BackImageUrl="~/Graficos/CartaoBronze.png">
                    <div class="tamMax">
                        <div style="height: 52px">
                        </div>
                        <div id="validade">
                            &nbsp;<asp:Label ID="lblValidade" runat="server" Text="Erro"></asp:Label>
                        </div>
                        <div id="nomeProprietario">
                            <asp:Label ID="lblNomeProprietario" runat="server" Text="Label" Style="font-weight: 700"></asp:Label>
                        </div>
                        <div id="numCartao">
                            <asp:Label ID="lblNumCartao" runat="server" Text="Erro"></asp:Label>
                        </div>
                    </div>
                </asp:Panel>
            </div>
            <br />
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Graficos/cut.png" />
            &nbsp;Recorte e cuide do seu cartão.<br />
            <br />
            <br />
            <div class="pnlDicas">
            <asp:Panel ID="pnlDicas" runat="server">
                <div style="width: 612px; text-align: left">
                    <span class="style2"><strong>Atenção</strong>: </span>
                    <br />
                    Caso não visualize seu cartão ao solicitar a impressão, você precisa configurar 
                    o navegador para imprimir imagens.<br /> <br />
                </div>
                <div class="style1" style="width: 612px; font-size: small">
                    <strong>Configurando para Internet Explorer: </strong>
                    <br />
                    Navegue no menu Ferramentas / Opções da Internet. Vá na guia Avançadas e no 
                    grupo Impressão, marque a opção &quot;Imprimir cores e imagens do plano de fundo&quot;.
                    <br />
                    Ou em inglês menu Tools / Internet Options. Vá na guia Advanced e no grupo Printing,
                    marque a opção Print background colors and images.</div>
                <div style="width: 612px; font-size: small; text-align: justify">
                    <strong>Configurando o Firefox:</strong>
                    <br />
                    Navegue no menu Arquivo / Configurar Página, no agrupamento Opções marque a opção
                    &quot;Imprimir cores e imagens do plano de fundo&quot;.</div>
                <br />
            </asp:Panel>
            <asp:Label ID="lblMsgExp" runat="server" Style="font-weight: 700; font-size: x-large;
                color: #FF0000"></asp:Label>
        </div>
    </asp:Panel>
    </div>
    </form>
</body>
</html>

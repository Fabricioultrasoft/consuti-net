<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="QSO_Protótipo._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Quero Saber Onde - Encontre tudo!</title>
    <link rel="Stylesheet" href="estilo.css" media="screen" />
    <style type="text/css">
        .style1
        {
            color: #FFFFFF;
            font-size: xx-large;
            font-family: "Segoe Condensed";
            font-weight: bold;
        }
        .style2
        {
            color: #FFFFFF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align:center; float:right">
    
        <div style="background-color: Blue; text-align:center; height:150px; width:800px;"> 
            <span class="style2">
            <br />
            <br />
            Banner da ferramenta ou propaganda de estabelecimento (mais caro)</span><br />
            <span class="style1">CASAS BAHIA - DEDICAÇÃO TOTAL A VOCÊ!!
        </span>
        </div>
        
    
    </div>
    <div><br /><br />
                
    &nbsp;<div style="float:left; background-color:Red; width:110px; height: 220px;">&nbsp; <br /><br />
            IMAGEM DAS PLACAS QSO</div>
                <br />
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp; <div style="margin-left: 120px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            Quero saber onde encontro um(a)
            <asp:DropDownList ID="DropDownList1" runat="server" Width="130px">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem>AÇOUGUE</asp:ListItem>
                <asp:ListItem>BOATE</asp:ListItem>
                <asp:ListItem>FARMÁCIA</asp:ListItem>
                <asp:ListItem>GRIFFE</asp:ListItem>
                <asp:ListItem>IMOBILIÁRIA</asp:ListItem>
                <asp:ListItem>PADARIA</asp:ListItem>
                <asp:ListItem>SHOPPING</asp:ListItem>
                <asp:ListItem>SORVETERIA</asp:ListItem>
            </asp:DropDownList>
            , no bairro
            <asp:DropDownList ID="DropDownList2" runat="server">
            </asp:DropDownList>
            <br />
            <hr style="width: 790px; margin-left: 23px" />
            
            &nbsp;&nbsp;&nbsp;&nbsp; filtros opcionais:<br />
            
            <br />
        </div></div>
    </form>
</body>
</html>

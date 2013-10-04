<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Depoimentos.ascx.cs" Inherits="NovosAres.WebUserControl.Depoimentos" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<link rel="Stylesheet" href="../Estilos/Depoimentos.css" type="text/css" />

<asp:Panel ID="pnlDepoimentos" runat="server" Width="500px" BackImageUrl="~/Graficos/BackBlueTransparent.png" >
<div id="contentDepoimentos">
<div id="btnEsquerdo">
    
    <asp:ImageButton ID="imgBtnLeft" runat="server" ImageAlign="Middle" 
        ImageUrl="~/Graficos/arrowLeft.png" onclick="imgBtnLeft_Click" />
    </div>
<div id="updatePanel"></div>
<div id="btnDireito">
    
    <asp:ImageButton ID="imgBtnRight" runat="server" ImageAlign="Middle" 
        ImageUrl="~/Graficos/arrowRight.png" onclick="imgBtnRight_Click" />
    </div>
</div>
</asp:Panel>



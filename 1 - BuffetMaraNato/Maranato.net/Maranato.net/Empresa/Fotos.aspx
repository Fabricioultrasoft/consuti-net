<%@ Page Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="Fotos.aspx.cs" Inherits="Maranato.net.Empresa.Fotos" Title="" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            font-size: large;
        font-weight: bold;
        text-decoration: underline;
    }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="conteudo">
        <span><span class="style1">Galeria de fotos</span></span><div style="text-align:center">
         
            <br />
            <asp:Image ID="SlideShow" runat="server" />
            <cc1:SlideShowExtender ID="SlideShow_SlideShowExtender" runat="server" 
                AutoPlay="True" Enabled="True" Loop="True" SlideShowServicePath="" 
                TargetControlID="SlideShow" UseContextKey="True" 
                NextButtonID="btnFotosAvancar" PlayButtonID="btnFotosParar" 
                PlayButtonText="Play" PreviousButtonID="btnFotosVoltar" 
                SlideShowServiceMethod="GetSlides" StopButtonText="Parar" 
                PlayInterval="5000">
            </cc1:SlideShowExtender>            
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnFotosVoltar" runat="server" Text="Voltar" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnFotosParar" runat="server" Text="Parar" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnFotosAvancar" runat="server" Text="Avançar" />
        </div>
         
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <br />
    </div>
</asp:Content>

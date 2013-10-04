<%@ Page Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="Salgados.aspx.cs" Inherits="Maranato.net.Produtos.Salgados" Title="Untitled Page" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            text-decoration: underline;
            font-weight: bold;
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="conteudo">
        <span class="style1">Salgados</span><div style="text-align:center">
         
            <asp:Label ID="lblSalgadosNome" runat="server" Text="Nome"></asp:Label>
         
            <br />
            <asp:Image ID="SalgadosSlide" runat="server" />
            <cc1:SlideShowExtender ID="SalgadosSlide_SlideShowExtender" runat="server" 
                AutoPlay="True" Enabled="True" ImageDescriptionLabelID="lblSalgadosDetalhes" 
                ImageTitleLabelID="lblSalgadosNome" Loop="True" 
                NextButtonID="btnSalgadosAvancar" PlayButtonID="btnSalgadosParar" 
                PlayButtonText="Play" PlayInterval="5000" PreviousButtonID="btnSalgadosVoltar" 
                SlideShowServiceMethod="GetSlides" SlideShowServicePath="" 
                StopButtonText="Parar" TargetControlID="SalgadosSlide">
            </cc1:SlideShowExtender>
            <br />
            <asp:Label ID="lblSalgadosDetalhes" runat="server" Text="Detalhes"></asp:Label>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnSalgadosVoltar" runat="server" Text="Voltar" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnSalgadosParar" runat="server" Text="Parar" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnSalgadosAvancar" runat="server" Text="Avançar" />
        </div>
         
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <br />
    </div>
</asp:Content>

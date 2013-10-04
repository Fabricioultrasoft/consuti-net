<%@ Page Title="" Language="C#" MasterPageFile="~/Site/TTR.Master" AutoEventWireup="true"
    CodeBehind="Home.aspx.cs" Inherits="TTR.Site.WebForm1" %>

<%@ Register Src="Usercontrols/ResultadoBusca.ascx" TagName="ResultadoBusca" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="buscaTroca" style="text-align: center">
        <asp:Panel ID="BuscaTrocaPanel" runat="server" DefaultButton="buscaTrocaButton">
            <asp:TextBox ID="buscaTrocaTextBox" runat="server" Width="500px" Height="25px" CssClass="buscaTrocaTextBox"></asp:TextBox>
            <asp:Button ID="buscaTrocaButton" runat="server" Text="Buscar" Width="100px" Height="32px"
                CssClass="buscaTrocaButton" />
        </asp:Panel>
    </div>
    <div id="ResultBusca" style="text-align: center">
        <iframe frameborder="0" src="listaResultadoBusca.aspx" style="height: 1050px; width: 810px">
        </iframe>
    </div>
</asp:Content>

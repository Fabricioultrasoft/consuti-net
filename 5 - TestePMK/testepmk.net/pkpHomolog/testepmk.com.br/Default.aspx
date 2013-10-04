<%@ Page Title="Teste PMK - Home" Language="C#" MasterPageFile="~/Master.Master"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="testePMK.com.br.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel runat="server">
        <iframe frameborder="0" src="listagemProdutos.aspx" style="height: 920px; width: 610px">
        </iframe>
    </asp:Panel>
</asp:Content>

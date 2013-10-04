<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="leptonbrasil.Servicos.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="Stylesheet" href="../Estilos/Servicos.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contentServicos">
        <div id="titulo">
            <br />
            <asp:Label ID="lblTitulo" runat="server" Text="lblTitulo" 
                style="text-decoration: underline"></asp:Label>
            <br />
            <br />
        </div>
        <div id="texto">
            <asp:FormView ID="fvTexto" runat="server">
                <ItemTemplate>
                    <%# Eval("texto") %>
                </ItemTemplate>
            </asp:FormView>
            <br />
            <br />
        </div>
        <div id="exibeImageServ"></div>
    </div>
</asp:Content>

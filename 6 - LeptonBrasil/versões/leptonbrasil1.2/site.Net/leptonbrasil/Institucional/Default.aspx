<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="leptonbrasil.Institucional.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="Stylesheet" href="../Estilos/Institucional.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contentInstitucional">
        <div id="titulo">
            <br />
            <asp:Label ID="lblTitulo" runat="server" Text="lblTitulo" Style="text-decoration: underline"></asp:Label>
            <br />
            <br />
        </div>
        <div id="textoInstitucional">
            <asp:FormView ID="fvTexto" runat="server">
                <ItemTemplate>
                    <%# Eval("texto") %>
                </ItemTemplate>
            </asp:FormView>
            <br />
            <br />
        </div>
        <div id="exibeImageInstit"></div>        
    </div>
</asp:Content>

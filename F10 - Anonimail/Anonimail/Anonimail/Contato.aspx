<%@ Page Title="" Language="C#" MasterPageFile="Anonimail.Master" AutoEventWireup="true"
    CodeBehind="Contato.aspx.cs" Inherits="Anonimail.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul>
        <li><a href="Default.aspx" accesskey="e" title="Enviar">ENVIAR</a></li>
        <li><a href="Responder.aspx" accesskey="r" title="Responder">RESPONDER</a></li>
        <li><a href="Contato.aspx" id="current" accesskey="c" title="Contato">CONTATO</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>

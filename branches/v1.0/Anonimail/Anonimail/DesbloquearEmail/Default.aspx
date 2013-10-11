<%@ Page Title="" Language="C#" MasterPageFile="DesbloquearEmail/Externa.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Anonimail.DesbloquearEmail.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul>
        <li><a href="../Default.aspx" accesskey="e" title="Enviar">ENVIAR</a></li>
        <li><a href="../Responder.aspx" accesskey="r" title="Responder">RESPONDER</a></li>
        <li><a href="../Contato.aspx" accesskey="c" title="Contato">CONTATO</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div>
        Email <strong>
            <asp:Label ID="EmailLabel" runat="server" Text=""></asp:Label></strong> &nbsp;desbloqueado
        com sucesso!</div>
</asp:Content>

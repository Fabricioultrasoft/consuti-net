<%@ Page Title="" Language="C#" MasterPageFile="/Interna.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Sistema_Life_Planner_Agenda.Site.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
    <!-- put class="selected" in the li tag for the selected page - to highlight which page you're on -->
    <li class="selected"><a href="Default.aspx">Home</a></li>
    <li><a href="examples.html">Contatos</a></li>
    <li><a href="page.html">Agenda do LP</a></li>
    <li><a href="another_page.html">SIT PLAN</a></li>
    <li><a href="../Login.aspx">Contact Us</a></li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>

<%@ Page Title="Pesquisar na Agenda do LP - SISLPA" Language="C#" MasterPageFile="~/Interna.Master"
    AutoEventWireup="true" CodeBehind="PesquisarAgenda.aspx.cs" Inherits="Sistema_Life_Planner_Agenda.Agenda.PesquisarAgenda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
    <li><a href="..\Default.aspx">Home</a></li>
    <li><a href="..\Contato\PesquisarContato.aspx">Contatos</a></li>
    <li class="selected"><a href="PesquisarAgenda.aspx">Agenda do LP</a></li>
    <li><a href="..\SITPLAN\PesquisarSITPLAN.aspx">SIT PLAN</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Programacao.aspx.cs" Inherits="CursosTI.Programacao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- navigation -->
    <nav id="navigation">
					<a href="Default.aspx" class="nav-btn">Home<span class="arr"></span></a>
					<ul>
						<li><a href="Default.aspx">Home</a></li>
						<li ><a href="Requisitos.aspx">Análise de Requisitos</a></li>
						<li><a href="Programacao.aspx">Lógica e Programação</a></li>
						<li><a href="Testes.aspx">Testes de Sistemas</a></li>
                        <li><a href="Localizacao.aspx">Localização</a></li>
                        <li class="active"><a href="Contato.aspx">Contato</a></li>
					</ul>
				</nav>
    <!-- end of navigation -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <ul>
        <li><a href="Default.aspx">Home</a></li>
        <li class="active"><a href="Requisitos.aspx">Análise de Requisitos</a></li>
        <li><a href="Programacao.aspx">Lógica e Programação</a></li>
        <li><a href="Testes.aspx">Testes de Sistemas</a></li>
        <li><a href="Localizacao.aspx">Localização</a></li>
        <li class="active"><a href="Contato.aspx">Contato</a></li>
    </ul>
</asp:Content>

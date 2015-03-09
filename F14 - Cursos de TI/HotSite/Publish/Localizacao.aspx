<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true"
    CodeBehind="Localizacao.aspx.cs" Inherits="CursosTI.Localizacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- navigation -->
    <nav id="navigation">
					<a href="Default.aspx" class="nav-btn">Home<span class="arr"></span></a>
					<ul>
						<li><a href="Default.aspx">Home</a></li>
						<li><a href="Requisitos.aspx">Análise de Requisitos</a></li>
						<li><a href="Programacao.aspx">Lógica e Programação</a></li>
						<li><a href="Testes.aspx">Testes de Sistemas</a></li>
                        <li class="active"><a href="Localizacao.aspx">Localização</a></li>
                        <li><a href="Contato.aspx">Contato</a></li>
					</ul>
				</nav>
    <!-- end of navigation -->
    <br />
    <div class="content" style="padding-right: 40px; text-align: justify">
        <div id="titulo" style="text-align: center; font-size: 17pt; font-weight: bold">
            Localização
            <br />
            <br />
        </div>
        <div style="margin: 0 auto; width: 100%">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7501.877534482699!2d-43.969807557028766!3d-19.92698502469373!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xa6971048ca6c37%3A0x9be225aeb623d850!2zWcOBWklHSQ!5e0!3m2!1spt-BR!2sbr!4v1425271500499"
                width="100%" height="450" frameborder="0" style="border: 0"></iframe>
        </div>
        <br />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
<ul>
        <li><a href="Default.aspx">Home</a></li>
        <li><a href="Requisitos.aspx">Análise de Requisitos</a></li>
        <li><a href="Programacao.aspx">Lógica e Programação</a></li>
        <li><a href="Testes.aspx">Testes de Sistemas</a></li>
        <li class="active"><a href="Localizacao.aspx">Localização</a></li>
        <li><a href="Contato.aspx">Contato</a></li>
    </ul>
</asp:Content>

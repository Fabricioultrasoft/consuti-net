<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true"
    CodeBehind="Contato.aspx.cs" Inherits="CursosTI.Contato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            font-weight: bold;
            text-align: right;
            padding-right: 10px;
        }
        .style2
        {
            height: 35px;
        }
    </style>
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
    <div>
        <form id="form1" runat="server">
        <BR />
        <table style="width: 400px; margin: 0 auto">
            <tr class="style2">
                <td class="style1">
                    Nome:
                </td>
                <td>
                    <asp:TextBox ID="name" runat="server" Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr class="style2">
                <td class="style1">
                    E-mail:
                </td>
                <td>
                    <asp:TextBox ID="email" runat="server" Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr class="style2">
                <td class="style1">
                    Telefone:
                </td>
                <td>
                    <asp:TextBox ID="DDDTelefoneTextBox1" runat="server" MaxLength="2" TabIndex="3" Width="16px"></asp:TextBox>
                    &nbsp;<asp:TextBox ID="TelefoneTextBox1" runat="server" MaxLength="9" TabIndex="3"
                        Width="65px"></asp:TextBox>
                </td>
            </tr>
            <tr class="style2">
                <td class="style1">
                    Mensagem:
                </td>
                <td>
                    <asp:TextBox ID="message" runat="server" TextMode="MultiLine" Width="300px" Height="100px"></asp:TextBox>
                </td>
            </tr>
        </table>
        <div id="botoes" style="width: 400px; margin: 0 auto; text-align: right">
        <br />
            <asp:Button ID="EnviaraButton" runat="server" Text="Enviar" Width="100px" />
            &nbsp;
            <asp:Button ID="LimparButton" runat="server" Text="Limpar" Width="100px" />
        </div>
        </form>
    </div>
    <br />
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

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
        <div id="titulo" style="text-align: center; font-size: 17pt; font-weight: bold">
            <br />
            Contato
            <br />
            <br />
        </div>
        <div style="width: 410px; margin: 0 auto; background-color: #C2DBBF; padding: 10px">
            De segunda a sexta, das 09:00 às 21:00 ligue: <strong>(31) 2526-2122</strong>
            <br />
            Ou no Whatsapp: <strong>(31) 9313-2793</strong>
            <br />
            Também pelo e-mail: <a href="mailto:consuti@consuti.net"><strong>consuti@consuti.net</strong></a>
            <br />
        </div>
        <br />
        <table style="width: 410px; margin: 0 auto">
            <tr class="style2">
                <td class="style1">
                    Nome:
                </td>
                <td>
                    <asp:TextBox ID="name" runat="server" Width="300px" TabIndex="1"></asp:TextBox>
                </td>
            </tr>
            <tr class="style2">
                <td class="style1">
                    E-mail:
                </td>
                <td>
                    <asp:TextBox ID="email" runat="server" Width="300px" TabIndex="2"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatoremail" runat="server"
                        ControlToValidate="email" Display="Dynamic" ErrorMessage="*" ToolTip="Campo Obrigatório!"></asp:RequiredFieldValidator>
                    &nbsp;<asp:RegularExpressionValidator ID="EmailTextBoxRegularExpressionValidator"
                        runat="server" Display="Dynamic" ErrorMessage="*" ToolTip="Email Inválido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ControlToValidate="email"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr class="style2">
                <td class="style1">
                    Telefone:
                </td>
                <td>
                    <asp:TextBox ID="DDDTelefoneTextBox1" runat="server" MaxLength="2" TabIndex="3" Width="16px"></asp:TextBox>
                    &nbsp;<asp:TextBox ID="TelefoneTextBox1" runat="server" MaxLength="9" TabIndex="4"
                        Width="65px"></asp:TextBox>
                </td>
            </tr>
            <tr class="style2">
                <td class="style1">
                    Mensagem:
                </td>
                <td>
                    <asp:TextBox ID="message" runat="server" TextMode="MultiLine" Width="300px" Height="100px" TabIndex="5"></asp:TextBox>
                </td>
            </tr>
        </table>
        <div id="botoes" style="width: 400px; margin: 0 auto; text-align: right">
            <br />
            <asp:Button ID="EnviaraButton" runat="server" Text="Enviar" Width="100px" OnClick="EnviaraButton_Click" TabIndex="6" />
            &nbsp;
            <asp:Button ID="LimparButton" runat="server" Text="Limpar" Width="100px" CausesValidation="false"
                OnClick="LimparButton_Click" TabIndex="7" />
        </div>
        </form>
    </div>
    <br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <ul>
        <li><a href="Default.aspx">Home</a></li>
        <li><a href="Requisitos.aspx">Análise de Requisitos</a></li>
        <li><a href="Programacao.aspx">Lógica e Programação</a></li>
        <li><a href="Testes.aspx">Testes de Sistemas</a></li>
        <li><a href="Localizacao.aspx">Localização</a></li>
        <li class="active"><a href="Contato.aspx">Contato</a></li>
    </ul>
</asp:Content>

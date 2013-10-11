<%@ Page Title="" Language="C#" MasterPageFile="Anonimail.Master" AutoEventWireup="true"
    CodeBehind="Responder.aspx.cs" Inherits="Anonimail.WebForm2" %>

    <%@ Register Namespace="Anonimail.Utilitarios" TagPrefix="custom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            text-align: right;
        }
        .style2
        {
            padding: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul>
        <li><a href="Default.aspx" accesskey="e" title="Enviar">ENVIAR</a></li>
        <li><a href="Responder.aspx" id="current" accesskey="r" title="Responder">RESPONDER</a></li>
        <li><a href="Contato.aspx" accesskey="c" title="Contato">CONTATO</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Panel ID="Panel1" runat="server" Width="700px">
        <div>
            <h3>
                Quero <strong>RESPONDER...</strong></h3>
        </div>
        <table style="padding: 5px; width: 100%;">
            <tr>
                <td class="style1">
                    <asp:RegularExpressionValidator ID="CodigoTextBoxRegularExpressionValidator" runat="server"
                        ControlToValidate="CodigoTextBox" Display="Dynamic" ErrorMessage="*" ToolTip="Email Inválido"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="CodigoTextBoxBoxRequiredFieldValidator" runat="server"
                        ControlToValidate="CodigoTextBox" Display="Dynamic" ErrorMessage="*" ForeColor="Red"
                        ToolTip="Campo Obrigatório"></asp:RequiredFieldValidator>
                    Código AnôniMail:
                </td>
                <td class="style2">
                    <asp:TextBox ID="CodigoTextBox" runat="server" Width="280px" MaxLength="100" TabIndex="1"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:RequiredFieldValidator ID="TituloTextBoxRequiredFieldValidator" runat="server"
                        ControlToValidate="TituloTextBox" Display="Dynamic" ErrorMessage="*" ToolTip="Campo Obrigatorio"></asp:RequiredFieldValidator>
                    Titulo da Resposta:
                </td>
                <td class="style2">
                    <asp:TextBox ID="TituloTextBox" runat="server" Width="550px" MaxLength="100" TabIndex="2"></asp:TextBox>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style1" style="vertical-align: top; padding-top: 5px">
                    Texto da Resposta:<br />
                    &nbsp;
                </td>
                <td class="style2" style="vertical-align: top; padding-top: 5px">
                <custom:CustomEditor ID="TextoTextBox" runat="server" Height="310px" Width="550px" CssClass="CustomEditor" TabIndex="3" />
                </td>
            </tr>
        </table>
        <div style="padding: 5px; text-align: right;">
            <asp:Button ID="LimparTudoButton" runat="server" Text="Limpar Tudo" Width="110px"
                CssClass="button" CausesValidation="false" OnClick="LimparTudoButton_Click" />
            <asp:Button ID="EnviarButton" runat="server" Text="Enviar" CausesValidation="true"
                Width="110px" CssClass="button" Style="margin-left: 10px; margin-right: 20px"
                OnClick="EnviarButton_Click" />
        </div>
    </asp:Panel>
</asp:Content>

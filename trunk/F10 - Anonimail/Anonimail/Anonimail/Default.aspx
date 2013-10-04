<%@ Page Title="" Language="C#" MasterPageFile="Anonimail.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Anonimail.WebForm1" %>
<%@ Register Namespace="Anonimail.Utilitarios" TagPrefix="custom" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc2" %>

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
        .style3
        {
            font-size: x-small;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul>
        <li><a href="Default.aspx" id="current" accesskey="e" title="Enviar">ENVIAR</a></li>
        <li><a href="Responder.aspx" accesskey="r" title="Responder">RESPONDER</a></li>
        <li><a href="Contato.aspx" accesskey="c" title="Contato">CONTATO</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Panel ID="Panel1" runat="server" Width="700px">
        <div>
            <h3>
                Quero <strong>ENVIAR...</strong></h3>
        </div>
        <table style="padding: 5px; width: 100%;">
            <tr>
                <td class="style1">
                    <asp:RegularExpressionValidator ID="EmailDestinoTextBoxRegularExpressionValidator"
                        runat="server" ControlToValidate="EmailDestinoTextBox" Display="Dynamic" ErrorMessage="*"
                        ToolTip="Email Inválido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="EmailDestinoTextBoxRequiredFieldValidator" runat="server"
                        ControlToValidate="EmailDestinoTextBox" Display="Dynamic" ErrorMessage="*" ForeColor="Red"
                        ToolTip="Campo Obrigatório"></asp:RequiredFieldValidator>
                    E-mail Destino:
                </td>
                <td class="style2">
                    <asp:TextBox ID="EmailDestinoTextBox" runat="server" Width="250px" MaxLength="100"
                        TabIndex="1"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:RegularExpressionValidator ID="EmailRespostaTextBoxRegularExpressionValidator"
                        runat="server" ControlToValidate="EmailRespostaTextBox" Display="Dynamic" ErrorMessage="*"
                        ToolTip="Email Inválido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    Email Resposta:
                </td>
                <td class="style2">
                    <asp:TextBox ID="EmailRespostaTextBox" runat="server" Width="250px" MaxLength="100"
                        TabIndex="2"></asp:TextBox>
                    &nbsp;<span class="style3">(apenas se desejar receber uma resposta)</span>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:RequiredFieldValidator ID="TituloTextBoxRequiredFieldValidator" runat="server"
                        ControlToValidate="TituloTextBox" Display="Dynamic" ErrorMessage="*" ToolTip="Campo Obrigatorio"></asp:RequiredFieldValidator>
                    Titulo do E-mail:
                </td>
                <td class="style2">
                    <asp:TextBox ID="TituloTextBox" runat="server" Width="550px" MaxLength="100" TabIndex="3"></asp:TextBox>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style1" style="vertical-align: top; padding-top: 5px">
                    Texto da Mensagem:<br />
                    &nbsp;
                </td>
                <td class="style2" style="vertical-align: top; padding-top: 5px">
                    <custom:CustomEditor ID="TextoTextBox" runat="server" Height="310px" Width="550px"
                        CssClass="CustomEditor" TabIndex="4" />
                </td>
            </tr>
        </table>
        <div style="padding: 5px; text-align: right;">
            <asp:Button ID="LimparTudoButton" runat="server" Text="Limpar Tudo" Width="110px"
                CssClass="button" CausesValidation="false" OnClick="LimparTudoButton_Click" TabIndex="5" />
            <asp:Button ID="EnviarButton" runat="server" Text="Enviar" CausesValidation="true"
                Width="110px" CssClass="button" Style="margin-left: 10px; margin-right: 11px"
                OnClick="EnviarButton_Click" TabIndex="6" />
        </div>
        <div>
            <div>
                <cc2:captchacontrol id="Captcha1" runat="server" captchabackgroundnoise="Low" captchalength="5"
                    captchaheight="60" captchawidth="200" captchalinenoise="None" captchamintimeout="5"
                    captchamaxtimeout="240" fontcolor="#529E00" />
            </div>
            <asp:TextBox ID="txtCaptcha" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnVerify" runat="server" Text="Verify" OnClick="btnVerify_Click" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required"
                ControlToValidate="txtCaptcha"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="lblMessage" runat="server" Font-Names="Arial" Text=""></asp:Label>
        </div>
    </asp:Panel>
</asp:Content>

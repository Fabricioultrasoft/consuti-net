<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="XTimate.Site.Login" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            text-align: right;
        }
        .style2
        {
            text-align: left;
        }
    </style>
    <link rel="Stylesheet" href="../App_Themes/Estilos/XTimate.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin: 100px auto; width: 500px; background-color: White; padding: 10px">
        <fieldset>
            <legend>Login</legend>
            <br />
            <table style="margin: 5px auto">
                <tr>
                    <td class="style1">
                        Email:
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="EmailTextBox" runat="server" MaxLength="100" Width="150px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="EmailTextBoxRequiredFieldValidator" runat="server"
                            ErrorMessage="*" ControlToValidate="EmailTextBox" CssClass="AjustaValidator"
                            ToolTip="Campo Obrigatório"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="EmailTextBoxRegularExpressionValidator" runat="server"
                            ErrorMessage="*" CssClass="AjustaValidator" ControlToValidate="EmailTextBox"
                            ToolTip="Email Inválido" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Senha:
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="SenhaTextBox" runat="server" TextMode="Password" MaxLength="20"
                            Width="150px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="EmailTextBoxRequiredFieldValidator0" runat="server"
                            ErrorMessage="*" ToolTip="Campo Obrigatório" CssClass="AjustaValidator" ControlToValidate="SenhaTextBox"></asp:RequiredFieldValidator>
                        &nbsp;<asp:LinkButton ID="EsqueciaSenhaLinkButton" runat="server" Style="font-size: 8pt"
                            CausesValidation="False">Esqueci a senha</asp:LinkButton>
                        <asp:ModalPopupExtender ID="EsqueciaSenhaLinkButton_ModalPopupExtender" runat="server"
                            TargetControlID="EsqueciaSenhaLinkButton" PopupControlID="RecuperaSenhaLoginPanel"
                            BackgroundCssClass="modalBackground" DropShadow="true" Enabled="True" OkControlID="CancelarButton"
                            CancelControlID="CancelarButton" PopupDragHandleControlID="recSenha" Drag="True">
                        </asp:ModalPopupExtender>
                    </td>
                </tr>
            </table>
            <br />
            <div style="width: 90%; text-align: right; padding: 5px">
                <asp:Button ID="EntrarButton" runat="server" Text="Entrar" OnClick="EntrarButton_Click" />
                <asp:Button ID="CadastrarButton" runat="server" Text="Cadastrar" OnClick="CadastrarButton_Click"
                    CausesValidation="false" />
            </div>
        </fieldset>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:Panel ID="RecuperaSenhaLoginPanel" runat="server">
        <div style="margin: 100px auto; width: 350px; background-color: White; padding: 10px">
            <fieldset id="recSenha">
                <legend>Recuperar Senha</legend>
                <br />
                <table style="margin: 5px auto">
                    <tr>
                        <td class="style1">
                            Email:
                        </td>
                        <td class="style2">
                            <asp:TextBox ID="RecEmailTextBox" runat="server" MaxLength="100" Width="150px" ValidationGroup="recSenha_ValidationGroup"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RecEmailTextBox_RequiredFieldValidator" runat="server"
                                ErrorMessage="*" ControlToValidate="RecEmailTextBox" CssClass="AjustaValidator"
                                ToolTip="Campo Obrigatório" ValidationGroup="recSenha_ValidationGroup"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RecEmailTextBox_RegularExpressionValidator" runat="server"
                                ErrorMessage="*" CssClass="AjustaValidator" ControlToValidate="RecEmailTextBox"
                                ToolTip="Email Inválido" ValidationGroup="recSenha_ValidationGroup" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </table>
                <br />
                <div style="width: 95%; text-align: right; padding: 5px">
                    <asp:Button ID="EnviarButton" runat="server" Text="Enviar" CausesValidation="true"
                        ValidationGroup="recSenha_ValidationGroup" onclick="EnviarButton_Click" />
                    <asp:Button ID="CancelarButton" runat="server" Text="Cancelar" CausesValidation="false" />
                </div>
            </fieldset>
        </div>
    </asp:Panel>
    </form>
</body>
</html>

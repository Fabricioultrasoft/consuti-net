<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormularioCadastroUsuario.ascx.cs"
    Inherits="XTimate.UserControls.FormularioCadastroUsuario" %>
<table class="Formularios" width="500px">
    <tr>
        <td class="ColunaEsquerda">
            Nome completo:
        </td>
        <td>
            <asp:TextBox ID="NomeTextBox" runat="server" Width="300px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="NomeTextBoxRequiredFieldValidator" runat="server"
                ErrorMessage="*" ControlToValidate="NomeTextBox" ToolTip="Campo Obrigatório"
                CssClass="AjustaValidator"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="ColunaEsquerda">
            E-mail:
        </td>
        <td>
            <asp:TextBox ID="EmailTextBox" runat="server" Width="300px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="EmailTextBoxRequiredFieldValidator" runat="server"
                ErrorMessage="*" CssClass="AjustaValidator" ControlToValidate="EmailTextBox"
                ToolTip="Campo Obrigatório"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="EmailTextBoxRegularExpressionValidator" runat="server"
                ErrorMessage="*" CssClass="AjustaValidator" ControlToValidate="EmailTextBox"
                ToolTip="Email Inválido" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="ColunaEsquerda">
            Confirmação de e-mail:
        </td>
        <td>
            <asp:TextBox ID="ConfirmaEmailTextBox" runat="server" Width="300px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="ConfirmaEmailTextBoxRequiredFieldValidator" runat="server"
                ErrorMessage="*" ControlToValidate="ConfirmaEmailTextBox" CssClass="AjustaValidator"
                ToolTip="Campo Obrigatório"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="ConfirmaEmailTextBoxRegularExpressionValidator"
                runat="server" ErrorMessage="*" CssClass="AjustaValidator" ControlToValidate="ConfirmaEmailTextBox"
                ToolTip="Email Inválido" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <asp:CompareValidator ID="EmailTextBoxCompareValidator" runat="server" ErrorMessage="*"
                ToolTip="E-mails não conferem" CssClass="AjustaValidator" ControlToCompare="EmailTextBox"
                ControlToValidate="ConfirmaEmailTextBox"></asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td class="ColunaEsquerda">
            Senha do XTimate:
        </td>
        <td>
            <asp:TextBox ID="SenhaTextBox" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="SenhaTextBoxRequiredFieldValidator" runat="server"
                CssClass="AjustaValidator" ErrorMessage="*" ControlToValidate="EmailTextBox"
                ToolTip="Campo Obrigatório"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="ColunaEsquerda">
            Confirmação de senha:
        </td>
        <td>
            <asp:TextBox ID="ConfirmacaoSenhaTextBox" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="ConfirmacaoSenhaTextBoxRequiredFieldValidator" runat="server"
                ErrorMessage="*" CssClass="AjustaValidator" ControlToValidate="EmailTextBox"
                ToolTip="Campo Obrigatório"></asp:RequiredFieldValidator>
        </td>
    </tr>
</table>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginAdm.aspx.cs" Inherits="testePMK.com.br.LoginAdm" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Area Administrativa - Login</title>
    <link href="~/Adm/EstilosAdm.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-image: url(Graficos/FundoSite.jpg)">
    <form id="Form1" runat="server">
    <div align="center" class="Titulo">
        <br />
        AREA ADMINISTRATIVA</div>
    <div>
        <br />
        <br />
        <asp:Panel ID="PnlLogin" runat="server" HorizontalAlign="Center" Width="600px" BorderColor="Green"
            BackColor="White" DefaultButton="BtnAcessar" Style="margin-left: auto; margin-right: auto">
            <br />
            <div>
                Digite seus dados para acessar a area administrativa:<br />
                <br />
            </div>
            <div id="DivLogin">
                Login:&nbsp;
                <asp:TextBox ID="TxbLogin" runat="server" MaxLength="20" TabIndex="1" Width="150px"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RfvLogin" runat="server" ControlToValidate="TxbLogin"
                    Display="None" ErrorMessage="Campo Obrigatório"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="RfvLogin_ValidatorCalloutExtender" runat="server"
                    Enabled="True" TargetControlID="RfvLogin">
                </cc1:ValidatorCalloutExtender>
                <asp:RequiredFieldValidator ID="RfvPass" runat="server" ControlToValidate="TxbPass"
                    Display="None" ErrorMessage="Campo Obrigatório"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="RfvPass_ValidatorCalloutExtender" runat="server"
                    Enabled="True" TargetControlID="RfvPass">
                </cc1:ValidatorCalloutExtender>
                <br />
                Senha:
                <asp:TextBox ID="TxbPass" runat="server" MaxLength="20" TabIndex="2" TextMode="Password"
                    Width="150px"></asp:TextBox>
            </div>
            <br />
            <br />
            <br />
            <div>
                <asp:Button ID="BtnAcessar" runat="server" TabIndex="3" Text="Acessar" OnClick="BtnAcessar_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="BtnCancel" runat="server" TabIndex="4" Text="Cancelar" CausesValidation="False"
                    OnClick="BtnCancel_Click" />
            </div>
            <br />
        </asp:Panel>
        <cc1:RoundedCornersExtender ID="PnlLogin_RoundedCornersExtender" runat="server" BorderColor="White"
            Enabled="True" TargetControlID="PnlLogin" Color="White">
        </cc1:RoundedCornersExtender>
        <cc1:DropShadowExtender ID="PnlLogin_DropShadowExtender" runat="server" Enabled="True"
            Rounded="True" TargetControlID="PnlLogin" Width="7">
        </cc1:DropShadowExtender>
        <br />
        <div class="clear">
        </div>
    </div>
    <div class="footer">
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    </form>
</body>
</html>

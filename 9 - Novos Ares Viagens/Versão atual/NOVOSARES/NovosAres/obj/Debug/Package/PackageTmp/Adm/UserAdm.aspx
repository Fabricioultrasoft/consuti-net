<%@ Page Title="" Language="C#" MasterPageFile="~/Adm/Interna.Master" AutoEventWireup="true" CodeBehind="UserAdm.aspx.cs" Inherits="NovosAres.Adm.UserAdm" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="novosares" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Titulo">
        AREA ADMINISTRATIVA
    </div>
    <div id="Subtitulo">
        Digite seus dados para acessar a area administrativa:
    </div>
    <div id="Login">
        Login:
        <asp:TextBox ID="TxbLogin" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RfvTxtLogin" runat="server" ControlToValidate="TxbLogin"
            Display="None" ErrorMessage="Campo Obrigatório."></asp:RequiredFieldValidator>
        <novosares:ValidatorCalloutExtender ID="RfvTxtLogin_ValidatorCalloutExtender" runat="server"
            Enabled="true" TargetControlID="RfvTxtLogin"></novosares:ValidatorCalloutExtender>
        <br />
        Senha:
        <asp:TextBox ID="TxbSenha" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RfvTxtSenha" runat="server" ControlToValidate="TxbSenha"
            Display="None" ErrorMessage="Campo Obrigatório."></asp:RequiredFieldValidator>
        <novosares:ValidatorCalloutExtender ID="RfvTxtSenha_ValidatorCalloutExtender" runat="server"
            Enabled="true" TargetControlID="RfvTxtSenha"></novosares:ValidatorCalloutExtender>
        <div>
            <asp:Button ID="BtnLogin" runat="server" Text="Login" OnClick="BtnLogin_Click" />
            <asp:Button ID="BtnVoltar" runat="server" Text="Voltar" CausesValidation="false" OnClick="BtnVoltar_Click" />
        </div>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</asp:Content>
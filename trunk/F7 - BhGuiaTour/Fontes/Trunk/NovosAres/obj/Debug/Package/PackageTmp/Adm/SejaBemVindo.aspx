<%@ Page Title="" Language="C#" MasterPageFile="~/Adm/Interna.Master" AutoEventWireup="true"
    CodeBehind="SejaBemVindo.aspx.cs" Inherits="NovosAres.Adm.SejaBemVindo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="novosares" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <span style="color: Red;">*</span> Informe um título:
    </p>

    <asp:TextBox ID="TxtTitulo" runat="server" Width="693px"></asp:TextBox>

    <asp:RequiredFieldValidator ID="RfvTxtTitulo" runat="server" ControlToValidate="TxtTitulo"
        Display="None" ErrorMessage="Campo Obrigatório."></asp:RequiredFieldValidator>
    <novosares:ValidatorCalloutExtender ID="RfvTxtTitulo_ValidatorCalloutExtender" runat="server"
        Enabled="true" TargetControlID="RfvTxtTitulo">
    </novosares:ValidatorCalloutExtender>
    
    <novosares:wucTxtDescricao ID="wucTxtDescricao" runat="server"></novosares:wucTxtDescricao>
    <br />
    <asp:Button ID="btnCadastrarSejaBemVindo" runat="server" Text="Cadastrar" OnClick="BtnCadastrarSejaBemVindo_Click" />
    <asp:Button ID="btnAtualizarSejaBemVindo" runat="server" Text="Atualizar" Visible="false" OnClick="BtnAtualizarSejaBemVindo_Click" />
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Adm/Interna.Master" AutoEventWireup="true"
    CodeBehind="AntesViajar.aspx.cs" Inherits="NovosAres.Adm.AntesViajar" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="novosares" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
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
    <novosares:AsyncFileUpload ID="afuManual" runat="server" ClientIDMode="AutoID" />
    <br />
    Arquivo cadastrado: <span id="nomeManual" runat="server" visible="false">ManualAntesDeViajar.pdf</span>
    <br />
    <br />
    <asp:Button ID="btnCadastrarAntesViajar" runat="server" Text="Cadastrar" OnClick="BtnCadastrarAntesViajar_Click" />
    <asp:Button ID="btnAtualizarAntesViajar" runat="server" Text="Atualizar" Visible="false" OnClick="BtnAtualizarAntesViajar_Click" />
</asp:Content>

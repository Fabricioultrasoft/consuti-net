<%@ Page Title="Teste PMK - Adm Acesso" Language="C#" MasterPageFile="~/Adm/AdmMaster.Master" AutoEventWireup="true"
    CodeBehind="ConfigUser.aspx.cs" Inherits="testePMK.com.br.Adm.Usuario.ConfigUser" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .subTitulo
        {
            text-align: center;
        }
        .style1
        {
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="style1">
        Usuário</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="subTitulo">
        Alteração de dados de acesso</div>
    <asp:Panel ID="pnlConteudo" runat="server">
        <br />
        <div style="margin-left: 30px">
            Login:
            <br />
            <asp:TextBox ID="TxbLogin" runat="server" MaxLength="20"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxbLogin"
                Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
            <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator1_ValidatorCalloutExtender"
                runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1">
            </cc1:ValidatorCalloutExtender>
            <br />
            Senha:
            <br />
            <asp:TextBox ID="TxbSenha" runat="server" MaxLength="20" TextMode="Password"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxbSenha"
                Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
            <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator2_ValidatorCalloutExtender"
                runat="server" Enabled="True" TargetControlID="RequiredFieldValidator2">
            </cc1:ValidatorCalloutExtender>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TxbSenha"
                ControlToValidate="TxbRepSenha" Display="None" ErrorMessage="Senhas Diferentes!"></asp:CompareValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxbRepSenha"
                Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
            <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator3_ValidatorCalloutExtender"
                runat="server" Enabled="True" TargetControlID="RequiredFieldValidator3">
            </cc1:ValidatorCalloutExtender>
            <cc1:ValidatorCalloutExtender ID="CompareValidator1_ValidatorCalloutExtender" runat="server"
                Enabled="True" TargetControlID="CompareValidator1">
            </cc1:ValidatorCalloutExtender>
            <br />
            Repita a senha:
            <br />
            <asp:TextBox ID="TxbRepSenha" runat="server" MaxLength="20" TextMode="Password"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txbEmail" Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
            <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator4_ValidatorCalloutExtender" 
                runat="server" Enabled="True" TargetControlID="RequiredFieldValidator4">
            </cc1:ValidatorCalloutExtender>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="txbEmail" Display="None" ErrorMessage="Email Inválido!" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator1_ValidatorCalloutExtender" 
                runat="server" Enabled="True" TargetControlID="RegularExpressionValidator1">
            </cc1:ValidatorCalloutExtender>
            <br />
            Email para confirmação:<br />
            <asp:TextBox ID="txbEmail" runat="server" MaxLength="200"></asp:TextBox>
            <br />
            <br />
        </div>
        <br />
        <div style="text-align: center">
            <asp:Button ID="btnSalvar" runat="server" Text="Salvar" Width="107px" 
                onclick="btnSalvar_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnLimpar" runat="server" Text="Desfazer " 
                CausesValidation="False" onclick="btnLimpar_Click" Width="107px" />
        </div>
        <br />
    </asp:Panel>
    <cc1:RoundedCornersExtender ID="pnlConteudo_RoundedCornersExtender" runat="server"
        BorderColor="Green" Enabled="True" TargetControlID="pnlConteudo">
    </cc1:RoundedCornersExtender>
</asp:Content>

<%@ Page Title="Teste PMK - Login" Language="C#" MasterPageFile="~/Master.Master"
    AutoEventWireup="true" CodeBehind="LoginUserExt.aspx.cs" Inherits="testePMK.com.br.Adm.Usuario.LoginUserExt" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style8
        {
            color: #339966;
        }
        .colunaEsquerdaTabela
        {
            width: 35%;
            border-right-color: Green;
            border-right-style: solid;
            border-left-width: 0.5px;
            text-align:center;
        }
        .style9
        {
            color: red;
            font-size: xx-small;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
        Login</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <div style="text-align: center; color: #FF0000">
        <asp:Literal ID="litLogin" runat="server"></asp:Literal></div>
    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnOK">
        <div style="text-align: center">
            Preencha os campos para acessar sua conta.<br />
            <br />
        </div>
        <table style="margin: 0px 0px 0px 19px; padding: 0px; width: 100%; border-spacing: 0px; empty-cells: show;">
            <tr>
                <td class="colunaEsquerdaTabela">
                    <span class="style8">
                    <br />
                    NÃO SOU CADASTRADO<br class="categoria" />
                    </span>
                </td>
                <td>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Email: <span class="style9">Mesmo email do PagSeguro</span><asp:RequiredFieldValidator 
                        ID="rfvEmail" runat="server" ControlToValidate="txbEmail" Display="None" 
                        ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                    <cc1:ValidatorCalloutExtender ID="rfvEmail0_ValidatorCalloutExtender" 
                        runat="server" Enabled="True" TargetControlID="rfvEmail">
                    </cc1:ValidatorCalloutExtender>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" 
                        ControlToValidate="txbEmail" Display="None" 
                        ErrorMessage="Formato de Email Inválido!" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator_ValidatorCalloutExtender" 
                        runat="server" Enabled="True" TargetControlID="RegularExpressionValidator">
                    </cc1:ValidatorCalloutExtender>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txbEmail" runat="server" MaxLength="100" TabIndex="1" Width="150px"></asp:TextBox>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="colunaEsquerdaTabela">
                    &nbsp;
                    <asp:Button ID="btnNovoCadastro" runat="server" OnClick="btnNovoCadastro_Click" 
                        Style="text-align: center" Text="Iniciar Cadastro" 
                        CausesValidation="False" />
                </td>
                <td>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Senha:<asp:RequiredFieldValidator ID="rfvSenha" runat="server" ControlToValidate="txbSenha"
                        Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                    <cc1:ValidatorCalloutExtender ID="rfvSenha_ValidatorCalloutExtender" runat="server"
                        Enabled="True" TargetControlID="rfvSenha">
                    </cc1:ValidatorCalloutExtender>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txbSenha" runat="server" MaxLength="20" TabIndex="2" TextMode="Password"
                        Width="150px"></asp:TextBox>
                    &nbsp;
                    <asp:LinkButton ID="lbtnLembraSenha" runat="server" CausesValidation="False" OnClick="lbtnLembraSenha_Click"
                        TabIndex="6">Esqueci a Senha</asp:LinkButton>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="colunaEsquerdaTabela">
                    &nbsp;
                    </td>
                <td style="width: 64%">
                    <div style="text-align: center">
                        <br />
                        <br />
                        <asp:Button ID="btnOK" runat="server" OnClick="btnOK_Click" TabIndex="3" Text="OK"
                            Width="100px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCancelar" runat="server" CausesValidation="False" OnClick="Button2_Click"
                            TabIndex="4" Text="Cancelar" Width="100px" />
                    </div>
                </td>
            </tr>
        </table>
        <br />
        <br />
    </asp:Panel>
    <cc1:RoundedCornersExtender ID="Panel1_RoundedCornersExtender" runat="server" BorderColor="Green"
        Enabled="True" TargetControlID="Panel1">
    </cc1:RoundedCornersExtender>
</asp:Content>

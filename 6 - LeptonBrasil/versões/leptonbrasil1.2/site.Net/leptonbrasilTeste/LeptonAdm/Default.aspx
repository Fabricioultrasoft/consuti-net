<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="leptonbrasil.LeptonAdm.Default" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Estilos/LeptonAdm.css" rel="Stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="login"><br />
        <br />
        <br />
        <br />
        <br />
        <br /><br />
        <asp:Panel ID="pnlLogin" runat="server" Width="500px" BorderColor="White" 
            DefaultButton="btnOK">
            <div class="alinhaCentro">
                <br />
            Preencha os campos para acessar o Painel Administrativo:<br /> 
                <br />
                <br /></div>
            <div id="campos">
                Email:
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                    ControlToValidate="txbEmail" Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="rfvEmail_ValidatorCalloutExtender" 
                    runat="server" Enabled="True" TargetControlID="rfvEmail">
                </cc1:ValidatorCalloutExtender>
                <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                    ControlToValidate="txbEmail" Display="None" 
                    ErrorMessage="Formato Inválido de Email" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <cc1:ValidatorCalloutExtender ID="revEmail_ValidatorCalloutExtender" 
                    runat="server" Enabled="True" TargetControlID="revEmail">
                </cc1:ValidatorCalloutExtender>
                <br />
                <asp:TextBox ID="txbEmail" runat="server" MaxLength="200" Width="200px" 
                    TabIndex="1"></asp:TextBox><br />
                <br />
                Senha:&nbsp;&nbsp;
                <asp:LinkButton ID="lbEsqueciSenha" runat="server" 
                    onclick="lbEsqueciSenha_Click" style="font-size: xx-small" TabIndex="5" 
                    CausesValidation="False">Esqueci</asp:LinkButton>
                <asp:RequiredFieldValidator ID="rfvSenha" runat="server" 
                    ControlToValidate="txbSenha" Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="rfvSenha_ValidatorCalloutExtender" 
                    runat="server" Enabled="True" TargetControlID="rfvSenha">
                </cc1:ValidatorCalloutExtender>
                <br />
                <asp:TextBox ID="txbSenha" runat="server" TextMode="Password" MaxLength="20" 
                    Width="200" TabIndex="2"></asp:TextBox><br />
            </div>
            <br />
            <div id="botoes">
                <asp:Button ID="btnOK" runat="server" Text="Entrar" Width="80px" 
                    onclick="btnOK_Click" TabIndex="3" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" Width="80px" 
                    CausesValidation="False" onclick="btnCancelar_Click" TabIndex="4" /><br /><br />
            </div>
        </asp:Panel>
        <cc1:RoundedCornersExtender ID="pnlLogin_RoundedCornersExtender" runat="server" 
            BorderColor="30, 111, 153" Enabled="True" TargetControlID="pnlLogin">
        </cc1:RoundedCornersExtender>
    </div>
</asp:Content>

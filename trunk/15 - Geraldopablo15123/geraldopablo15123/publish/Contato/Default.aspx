<%@ Page Title="15123 - Contato" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="geraldopablo15123.Contato.Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .style8
        {
            text-align: center;
            font-size: xx-large;
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="style8">
            <strong>CONTATO</strong>
        </div>
    </div>
    <br />
    <p style="margin-left: 10px; text-align: center;">
        FALE DIRETO COM O CANDIDATO GERALDO PABLO VEREADOR 15123
        <br />
        – Mande seu comentário, ou a sua sugestão, opinião, crítica, reclamação ou elogio.</p>
    <asp:Panel ID="PnlContatoFormulario" runat="server" HorizontalAlign="Center" Style="text-align: left;
        margin: 0 auto;" Width="450px" DefaultButton="BtnContatoEnviar">
        <div style="margin-left: 70px">
            <asp:RequiredFieldValidator ID="RfvContatoNome" runat="server" ControlToValidate="txbContatoNome"
                Display="None" ErrorMessage="Campo Obrigatório."></asp:RequiredFieldValidator>
            <cc1:ValidatorCalloutExtender ID="RfvContatoNome_ValidatorCalloutExtender" runat="server"
                Enabled="True" TargetControlID="RfvContatoNome">
            </cc1:ValidatorCalloutExtender>
            <br />
            Nome*:<br />
            <asp:TextBox ID="txbContatoNome" runat="server" Width="300px" MaxLength="100" TabIndex="1"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RfvContatoEmail" runat="server" ControlToValidate="txbContatoEmail"
                Display="None" ErrorMessage="Campo Obrigatório."></asp:RequiredFieldValidator>
            <cc1:ValidatorCalloutExtender ID="RfvContatoEmail_ValidatorCalloutExtender" runat="server"
                Enabled="True" TargetControlID="RfvContatoEmail">
            </cc1:ValidatorCalloutExtender>
            <asp:RegularExpressionValidator ID="RevContatoEmail" runat="server" ControlToValidate="txbContatoEmail"
                Display="None" ErrorMessage="Digite um email válido." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <cc1:ValidatorCalloutExtender ID="RevContatoEmail_ValidatorCalloutExtender" runat="server"
                Enabled="True" TargetControlID="RevContatoEmail">
            </cc1:ValidatorCalloutExtender>
            <br />
            Email*:<br />
            <asp:TextBox ID="txbContatoEmail" runat="server" Width="300px" TabIndex="2"></asp:TextBox>
            <br />
            <asp:RegularExpressionValidator ID="refTel" runat="server" ControlToValidate="txbContatoTelefone"
                Display="None" ErrorMessage="Telefone inválido. Ex: (99) 9999-9999" ValidationExpression="\d{2}\d{4}\d{4}"></asp:RegularExpressionValidator>
            <cc1:ValidatorCalloutExtender ID="refTel_ValidatorCalloutExtender" runat="server"
                Enabled="True" TargetControlID="refTel">
            </cc1:ValidatorCalloutExtender>
            <asp:RequiredFieldValidator ID="RfvContatoTelefone" runat="server" ControlToValidate="txbContatoTelefone"
                Display="None" ErrorMessage="Insira um telefone válido."></asp:RequiredFieldValidator>
            <cc1:ValidatorCalloutExtender ID="RfvContatoTelefone_ValidatorCalloutExtender" runat="server"
                Enabled="True" TargetControlID="RfvContatoTelefone">
            </cc1:ValidatorCalloutExtender>
            <br />
            Telefone*:<br />
            <asp:TextBox ID="txbContatoTelefone" runat="server" Width="128px" MaxLength="20"
                TabIndex="3"></asp:TextBox>
            <cc1:MaskedEditExtender ID="txbContatoTelefone_MaskedEditExtender" runat="server"
                AutoComplete="False" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder=""
                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                CultureTimePlaceholder="" Enabled="True" Mask="(99) 9999-9999" MaskType="Number"
                TargetControlID="txbContatoTelefone">
            </cc1:MaskedEditExtender>
            <br />
            <asp:RequiredFieldValidator ID="RfvContatoAssunto" runat="server" ControlToValidate="txbAssuntoEmail"
                Display="None" ErrorMessage="Informe um Assunto."></asp:RequiredFieldValidator>
            <cc1:ValidatorCalloutExtender ID="RfvContatoAssunto_ValidatorCalloutExtender" runat="server"
                Enabled="True" TargetControlID="RfvContatoAssunto">
            </cc1:ValidatorCalloutExtender>
            <br />
            Assunto*:<br />
            <asp:TextBox ID="txbAssuntoEmail" runat="server" TabIndex="4" Width="300px"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RfvContatoMensagem" runat="server" ControlToValidate="txbContatoDescricao"
                Display="None" ErrorMessage="Digite uma Mensagem."></asp:RequiredFieldValidator>
            <cc1:ValidatorCalloutExtender ID="RfvContatoMensagem_ValidatorCalloutExtender" runat="server"
                Enabled="True" TargetControlID="RfvContatoMensagem">
            </cc1:ValidatorCalloutExtender>
            <br />
            Mensagem*:<br />
            <asp:TextBox ID="txbContatoDescricao" runat="server" TextMode="MultiLine" Rows="3"
                Width="300px" TabIndex="5"></asp:TextBox>
            <br />
            <br />
            <br />
        </div>
        <div style="text-align: center">
            <asp:Button ID="BtnContatoEnviar" runat="server" OnClick="BtnContatoEnviar_Click"
                TabIndex="6" Text="Enviar" Width="70px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:Button ID="BtnContatoLimpar" runat="server" CausesValidation="False" OnClick="BtnContatoLimpar_Click"
                Text="Limpar" Width="70px" TabIndex="7" />
        </div>
        <br />
        <br />
    </asp:Panel>
    <br />
    <cc1:RoundedCornersExtender ID="PnlContatoFormulario_RoundedCornersExtender" runat="server"
        Enabled="True" TargetControlID="PnlContatoFormulario" BorderColor="167, 204, 231"
        Color="White">
    </cc1:RoundedCornersExtender>
    <br />
    <div style="text-align: right; width: 798px">
        Ou mande um e-mail para <a href="mailto:%20gpablo15123vereador@ig.com.br">gpablo15123vereador@ig.com.br</a>
        <br />
        <br />
    </div>
</asp:Content>

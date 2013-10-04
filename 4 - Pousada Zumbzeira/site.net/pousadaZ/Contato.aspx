<%@ Page Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Contato.aspx.cs" Inherits="pousadaZ.WebForm2" Title="Untitled Page" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .style1
        {
            text-decoration: underline;
            font-weight: 700;
            font-size: medium;
        }
        .style2
        {
            text-align: left;
            margin-left: 90px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="titContato">
    <br />
    <p class="style1">
        CONTATO</p>
        <div>
            <p class="MsoNormal">
                Ligue agora ou faça uma <a href="PreReserva.aspx">pré-reserva online</a> para garantir sua reserva nesse paraíso repleto de tranqüilidade e 
                diversas belezas naturais.</p>
        </div>
        <div class="style2">
            Contate-nos pelos telefones<br />
            (31) 3581-8906&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            pelo email
            <br />
            (31) 8841-8888&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="mailto:pousadazumbzeira@gmail.com">pousadazumbzeira@gmail.com</a><br />
            </div>
        <p>
        Preencha o formulário abaixo e nos envie para realizar o contato:</p>
        
        <asp:Panel ID="PnlContatoFormulario" runat="server"  
            HorizontalAlign="Center" style="text-align: left; margin-left: 15%;" 
            Width="450px" DefaultButton="BtnContatoEnviar">
            <div style="margin-left: 70px">
                <asp:RequiredFieldValidator ID="RfvContatoNome" runat="server" 
                    ControlToValidate="txbContatoNome" Display="None" 
                    ErrorMessage="Campo Obrigatório."></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="RfvContatoNome_ValidatorCalloutExtender" 
                    runat="server" Enabled="True" TargetControlID="RfvContatoNome">
                </cc1:ValidatorCalloutExtender>
                <br />
            Nome*:<br />
            <asp:TextBox ID="txbContatoNome" runat="server" Width="300px" MaxLength="100" 
                    CssClass="TxtFundo" TabIndex="1"></asp:TextBox>
                <cc1:TextBoxWatermarkExtender ID="txbContatoNome_TextBoxWatermarkExtender" 
                    runat="server" Enabled="True" TargetControlID="txbContatoNome" 
                    WatermarkCssClass="Marcadagua" WatermarkText="Seu Nome">
                </cc1:TextBoxWatermarkExtender>
            <br />
                <asp:RequiredFieldValidator ID="RfvContatoEmail" runat="server" 
                    ControlToValidate="txbContatoEmail" Display="None" 
                    ErrorMessage="Campo Obrigatório."></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="RfvContatoEmail_ValidatorCalloutExtender" 
                    runat="server" Enabled="True" TargetControlID="RfvContatoEmail">
                </cc1:ValidatorCalloutExtender>
                <asp:RegularExpressionValidator ID="RevContatoEmail" runat="server" 
                    ControlToValidate="txbContatoEmail" Display="None" 
                    ErrorMessage="Digite um email válido." 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <cc1:ValidatorCalloutExtender ID="RevContatoEmail_ValidatorCalloutExtender" 
                    runat="server" Enabled="True" TargetControlID="RevContatoEmail">
                </cc1:ValidatorCalloutExtender>
                <br />
            Email*:<br />
            <asp:TextBox ID="txbContatoEmail" runat="server" Width="300px" CssClass="TxtFundo" 
                    TabIndex="2"></asp:TextBox>
                <cc1:TextBoxWatermarkExtender ID="txbContatoEmail_TextBoxWatermarkExtender" 
                    runat="server" Enabled="True" TargetControlID="txbContatoEmail" 
                    WatermarkCssClass="Marcadagua" WatermarkText="seuemail@seuemail.com">
                </cc1:TextBoxWatermarkExtender>
            <br />
                <asp:RegularExpressionValidator ID="refTel" runat="server" 
                    ControlToValidate="txbContatoTelefone" Display="None" 
                    ErrorMessage="Telefone inválido. Ex: (99) 9999-9999" 
                    ValidationExpression="\d{2}\d{4}\d{4}"></asp:RegularExpressionValidator>
                <cc1:ValidatorCalloutExtender ID="refTel_ValidatorCalloutExtender" 
                    runat="server" Enabled="True" TargetControlID="refTel">
                </cc1:ValidatorCalloutExtender>
                <asp:RequiredFieldValidator ID="RfvContatoTelefone" runat="server" 
                    ControlToValidate="txbContatoTelefone" Display="None" 
                    ErrorMessage="Insira um telefone válido."></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="RfvContatoTelefone_ValidatorCalloutExtender" 
                    runat="server" Enabled="True" TargetControlID="RfvContatoTelefone">
                </cc1:ValidatorCalloutExtender>
                <br />
                Telefone*:<br />
                <asp:TextBox ID="txbContatoTelefone" runat="server" Width="128px" 
                    MaxLength="20" CssClass="TxtFundo" TabIndex="3"></asp:TextBox>
                <cc1:MaskedEditExtender ID="txbContatoTelefone_MaskedEditExtender" 
                    runat="server" AutoComplete="False" 
                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                    CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                    Mask="(99) 9999-9999" MaskType="Number" 
                    TargetControlID="txbContatoTelefone">
                </cc1:MaskedEditExtender>
                <br />
                <asp:RequiredFieldValidator ID="RfvContatoAssunto" runat="server" 
                    ControlToValidate="DdlContatoAssunto" Display="None" 
                    ErrorMessage="Selecione um Assunto."></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="RfvContatoAssunto_ValidatorCalloutExtender" 
                    runat="server" Enabled="True" TargetControlID="RfvContatoAssunto">
                </cc1:ValidatorCalloutExtender>
                <br />
            Assunto*:<br />
            <asp:DropDownList ID="DdlContatoAssunto" runat="server" Width="300px" 
                    CssClass="TxtFundo" TabIndex="4">
                <asp:ListItem Value=" ">&lt;Selecione um Assunto&gt;</asp:ListItem>
                <asp:ListItem Value="1">Pagamento</asp:ListItem>
                <asp:ListItem Value="2">Hospedagem</asp:ListItem>
                <asp:ListItem Value="3">Localização</asp:ListItem>
                <asp:ListItem Value="4">Valores</asp:ListItem>
                <asp:ListItem Value="5">Outros</asp:ListItem>
            </asp:DropDownList>
            <br />
                <asp:RequiredFieldValidator ID="RfvContatoMensagem" runat="server" 
                    ControlToValidate="txbContatoDescricao" Display="None" 
                    ErrorMessage="Digite uma Mensagem."></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="RfvContatoMensagem_ValidatorCalloutExtender" 
                    runat="server" Enabled="True" TargetControlID="RfvContatoMensagem">
                </cc1:ValidatorCalloutExtender>
                <br />
            Mensagem*:<br />
            <asp:TextBox ID="txbContatoDescricao" runat="server" TextMode="MultiLine" 
                Rows="3" Width="300px" CssClass="TxtFundo" TabIndex="5"></asp:TextBox>
                <br />
                <br />
                <br />
                
        </div>
        <div style="text-align:center">
                
                    <asp:Button ID="BtnContatoEnviar" runat="server" 
                        onclick="BtnContatoEnviar_Click" TabIndex="6" Text="Enviar" Width="70px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                
                <asp:Button ID="BtnContatoLimpar" runat="server" CausesValidation="False" 
                    onclick="BtnContatoLimpar_Click" Text="Limpar" Width="70px" TabIndex="7" />
                    </div>
                <br />
                <br />
        </asp:Panel>
        
        <cc1:RoundedCornersExtender ID="PnlContatoFormulario_RoundedCornersExtender" 
            runat="server" Enabled="True" TargetControlID="PnlContatoFormulario" 
            BorderColor="167, 204, 231" Color="White">
        </cc1:RoundedCornersExtender>
        <p>
        </p></div>
</asp:Content>

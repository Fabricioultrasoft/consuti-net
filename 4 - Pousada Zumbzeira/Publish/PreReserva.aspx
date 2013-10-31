<%@ Page Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PreReserva.aspx.cs"
    Inherits="pousadaZ.WebForm22" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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
            text-decoration: underline;
        }
        .style3
        {
            color: #FF0000;
            font-size: medium;
        }
        .style3
        {
            color: #FF0000;
            font-size: medium;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="titContato">
        <br />
        <span class="style1">
            PRÉ-RESERVA</span><br />
        <span class="style5">Ficha de Cliente</span>
        <div>
            <p class="MsoNormal">
                Preencha os campos abaixo para realizar sua pré-reserva online. Para maiores informações
                acesse <a href="Contato.aspx">Contato</a>.</p>
            <p class="style3">
                Atenção: A reserva só será efetivada após a confirmação da Pousada Zumbzeira.</p>
        </div>
        <asp:Panel ID="PnlContatoFormulario" runat="server" HorizontalAlign="Center" Style="text-align: left;
            margin-left: 15%;" Width="450px" DefaultButton="BtnContatoEnviar">
            <div style="margin-left: 20px">
                <span class="style2">Dados Pessoais<br />
                </span>
                <br />
                Nome Completo*:<asp:RequiredFieldValidator ID="RfvNomeCompleto" runat="server" ControlToValidate="TxbNomeCompleto"
                    Display="None" ErrorMessage="Campo Obrigatório"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="RfvNomeCompleto_ValidatorCalloutExtender" runat="server"
                    Enabled="True" TargetControlID="RfvNomeCompleto">
                </cc1:ValidatorCalloutExtender>
                <br />
                <asp:TextBox ID="TxbNomeCompleto" runat="server" CssClass="TxtFundo" MaxLength="100"
                    Width="400px" TabIndex="1"></asp:TextBox>
                <cc1:TextBoxWatermarkExtender ID="TxbNomeCompleto_TextBoxWatermarkExtender" runat="server"
                    Enabled="True" TargetControlID="TxbNomeCompleto" WatermarkCssClass="Marcadagua"
                    WatermarkText="Seu nome completo">
                </cc1:TextBoxWatermarkExtender>
                <br />
                Email*:<asp:RequiredFieldValidator ID="RfvContatoEmail" runat="server" ControlToValidate="txbContatoEmail"
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
                <asp:TextBox ID="txbContatoEmail" runat="server" Width="400px" CssClass="TxtFundo"
                    TabIndex="2"></asp:TextBox>
                <cc1:TextBoxWatermarkExtender ID="txbContatoEmail_TextBoxWatermarkExtender" runat="server"
                    Enabled="True" TargetControlID="txbContatoEmail" WatermarkCssClass="Marcadagua"
                    WatermarkText="seuemail@seuemail.com">
                </cc1:TextBoxWatermarkExtender>
                <br />
                Rua*:<asp:RequiredFieldValidator ID="RfvRua" runat="server" ControlToValidate="TxbRua"
                    Display="None" ErrorMessage="Campo Obrigatório"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="RfvRua_ValidatorCalloutExtender" runat="server"
                    Enabled="True" TargetControlID="RfvRua">
                </cc1:ValidatorCalloutExtender>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp; Nº*:<asp:RequiredFieldValidator ID="RfvNum" runat="server" ControlToValidate="TxbNumero"
                    Display="None" ErrorMessage="Campo Obrigatório"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="RfvNum_ValidatorCalloutExtender" runat="server"
                    Enabled="True" TargetControlID="RfvNum">
                </cc1:ValidatorCalloutExtender>
                <br />
                <asp:TextBox ID="TxbRua" runat="server" CssClass="TxtFundo" MaxLength="100" Width="260px"
                    TabIndex="3"></asp:TextBox>
                <cc1:TextBoxWatermarkExtender ID="TxbRua_TextBoxWatermarkExtender" runat="server"
                    Enabled="True" TargetControlID="TxbRua" WatermarkCssClass="Marcadagua" WatermarkText="Sua Rua">
                </cc1:TextBoxWatermarkExtender>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TxbNumero" runat="server" CssClass="TxtFundo" MaxLength="5" Width="105px"
                    TabIndex="4"></asp:TextBox>
                <cc1:FilteredTextBoxExtender ID="TxbNumero_FilteredTextBoxExtender" runat="server"
                    Enabled="True" TargetControlID="TxbNumero" ValidChars="1234567890">
                </cc1:FilteredTextBoxExtender>
                <cc1:TextBoxWatermarkExtender ID="TxbNumero_TextBoxWatermarkExtender" runat="server"
                    Enabled="True" TargetControlID="TxbNumero" WatermarkCssClass="Marcadagua" WatermarkText="Numero">
                </cc1:TextBoxWatermarkExtender>
                <br />
                Complemento:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                Bairro*:<asp:RequiredFieldValidator ID="RfvBairro" runat="server" ControlToValidate="TxbBairro"
                    Display="None" ErrorMessage="Campo Obrigatório"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="RfvBairro_ValidatorCalloutExtender" runat="server"
                    Enabled="True" TargetControlID="RfvBairro">
                </cc1:ValidatorCalloutExtender>
                <br />
                <asp:TextBox ID="txbComplemento" runat="server" CssClass="TxtFundo" MaxLength="100"
                    Width="190px" TabIndex="5"></asp:TextBox>
                <cc1:TextBoxWatermarkExtender ID="txbComplemento_TextBoxWatermarkExtender" runat="server"
                    Enabled="True" TargetControlID="txbComplemento" WatermarkCssClass="Marcadagua"
                    WatermarkText="Complemento do Endereço">
                </cc1:TextBoxWatermarkExtender>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TxbBairro" runat="server" CssClass="TxtFundo" MaxLength="100" Width="180px"
                    TabIndex="6"></asp:TextBox>
                <cc1:TextBoxWatermarkExtender ID="TxbBairro_TextBoxWatermarkExtender" runat="server"
                    Enabled="True" TargetControlID="TxbBairro" WatermarkCssClass="Marcadagua" WatermarkText="Seu bairro">
                </cc1:TextBoxWatermarkExtender>
                <br />
                Cidade*:<asp:RequiredFieldValidator ID="RfvCidade" runat="server" ControlToValidate="TxbCidade"
                    Display="None" ErrorMessage="Campo Obrigatório"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="RfvCidade_ValidatorCalloutExtender" runat="server"
                    Enabled="True" TargetControlID="RfvCidade">
                </cc1:ValidatorCalloutExtender>
                <br />
                <asp:TextBox ID="TxbCidade" runat="server" CssClass="TxtFundo" MaxLength="100" Width="400px"
                    TabIndex="7"></asp:TextBox>
                <cc1:TextBoxWatermarkExtender ID="TxbCidade_TextBoxWatermarkExtender" runat="server"
                    Enabled="True" TargetControlID="TxbCidade" WatermarkCssClass="Marcadagua" WatermarkText="Sua cidade">
                </cc1:TextBoxWatermarkExtender>
                <br />
                Estado*:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp; CEP:<asp:RequiredFieldValidator ID="RfvEstado" runat="server" ControlToValidate="TxbEstado"
                    Display="None" ErrorMessage="Campo Obrigatório"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="RfvEstado_ValidatorCalloutExtender" runat="server"
                    Enabled="True" TargetControlID="RfvEstado">
                </cc1:ValidatorCalloutExtender>
                <asp:RegularExpressionValidator ID="RevCEP" runat="server" ControlToValidate="TxbCEP"
                    Display="None" ErrorMessage="CEP inválido. Ex(99999-999)" ValidationExpression="\d{5}\d{3}"></asp:RegularExpressionValidator>
                <cc1:ValidatorCalloutExtender ID="RevCEP_ValidatorCalloutExtender" runat="server"
                    Enabled="True" TargetControlID="RevCEP">
                </cc1:ValidatorCalloutExtender>
                <asp:RegularExpressionValidator ID="refCelular" runat="server" ControlToValidate="TxbTelCelular"
                    Display="None" ErrorMessage="Telefone inválido. Ex: (99) 9999-9999" ValidationExpression="\d{2}\d{4}\d{4}"></asp:RegularExpressionValidator>
                <cc1:ValidatorCalloutExtender ID="refCelular_ValidatorCalloutExtender" runat="server"
                    Enabled="True" TargetControlID="refCelular">
                </cc1:ValidatorCalloutExtender>
                <br />
                <asp:TextBox ID="TxbEstado" runat="server" CssClass="TxtFundo" MaxLength="50" Width="128px"
                    TabIndex="8"></asp:TextBox>
                <cc1:TextBoxWatermarkExtender ID="TxbEstado_TextBoxWatermarkExtender" runat="server"
                    Enabled="True" TargetControlID="TxbEstado" WatermarkCssClass="Marcadagua" WatermarkText="Estado">
                </cc1:TextBoxWatermarkExtender>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TxbCEP" runat="server" CssClass="TxtFundo" MaxLength="9" Width="128px"
                    TabIndex="9"></asp:TextBox>
                <cc1:MaskedEditExtender ID="TxbCEP_MaskedEditExtender" runat="server" AutoComplete="False"
                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                    CultureTimePlaceholder="" Enabled="True" Mask="99999-999" MaskType="Number" TargetControlID="TxbCEP">
                </cc1:MaskedEditExtender>
                <br />
                Tel. Fixo*:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;Tel. Celular*:<asp:RequiredFieldValidator
                    ID="RfvCelular" runat="server" ControlToValidate="TxbTelCelular" Display="None"
                    ErrorMessage="Campo Obrigatório"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="RfvCelular_ValidatorCalloutExtender" runat="server"
                    Enabled="True" TargetControlID="RfvCelular">
                </cc1:ValidatorCalloutExtender>
                <asp:RequiredFieldValidator ID="RfvFixo" runat="server" ControlToValidate="TxbTelFixo"
                    Display="None" ErrorMessage="Campo Obrigatório"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="RfvFixo_ValidatorCalloutExtender" runat="server"
                    Enabled="True" TargetControlID="RfvFixo">
                </cc1:ValidatorCalloutExtender>
                <asp:RegularExpressionValidator ID="refFixo" runat="server" ControlToValidate="TxbTelFixo"
                    Display="None" ErrorMessage="Telefone inválido. Ex: (99) 9999-9999" ValidationExpression="\d{2}\d{4}\d{4}"></asp:RegularExpressionValidator>
                <cc1:ValidatorCalloutExtender ID="refFixo_ValidatorCalloutExtender" runat="server"
                    Enabled="True" TargetControlID="refFixo">
                </cc1:ValidatorCalloutExtender>
                <br />
                <asp:TextBox ID="TxbTelFixo" runat="server" CssClass="TxtFundo" MaxLength="13" TabIndex="10"
                    Width="128px"></asp:TextBox>
                <cc1:MaskedEditExtender ID="TxbTelFixo_MaskedEditExtender" runat="server" AutoComplete="False"
                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                    CultureTimePlaceholder="" Enabled="True" Mask="(99) 9999-9999" MaskType="Number"
                    TargetControlID="TxbTelFixo">
                </cc1:MaskedEditExtender>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TxbTelCelular" runat="server" CssClass="TxtFundo" MaxLength="13"
                    TabIndex="11" Width="128px"></asp:TextBox>
                <cc1:MaskedEditExtender ID="TxbTelCelular_MaskedEditExtender" runat="server" AutoComplete="False"
                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                    CultureTimePlaceholder="" Enabled="True" Mask="(99) 9999-9999" MaskType="Number"
                    TargetControlID="TxbTelCelular">
                </cc1:MaskedEditExtender>
                <br />
                Data de Nascimento:*<asp:RequiredFieldValidator ID="rfvDataNasc" runat="server" ControlToValidate="txbDataNasc"
                    Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="rfvDataNasc_ValidatorCalloutExtender" runat="server"
                    Enabled="True" PopupPosition="Left" TargetControlID="rfvDataNasc">
                </cc1:ValidatorCalloutExtender>
                <br />
                <asp:TextBox ID="txbDataNasc" runat="server" CssClass="TxtFundo" TabIndex="49" Width="70px"></asp:TextBox>
                <cc1:CalendarExtender ID="txbDataNasc_CalendarExtender" runat="server" CssClass="ajax__calendar"
                    Enabled="True" Format="dd/MM/yyyy" PopupButtonID="IbtnDatanasc" TargetControlID="txbDataNasc"
                    TodaysDateFormat=" d MMMM yyyy">
                </cc1:CalendarExtender>
                <cc1:MaskedEditExtender ID="txbDataNasc_MaskedEditExtender" runat="server" AutoComplete="False"
                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                    CultureTimePlaceholder="" Enabled="True" Mask="99/99/9999" MaskType="Date" TargetControlID="txbDataNasc">
                </cc1:MaskedEditExtender>
                &nbsp;<asp:ImageButton ID="IbtnDatanasc" runat="server" CausesValidation="False"
                    Height="24px" ImageAlign="Middle" ImageUrl="Graficos/calendario_32x32.png" TabIndex="12"
                    ToolTip="Selecione a data no calendário" Width="24px" />
                <br />
                Empresa:<br />
                <asp:TextBox ID="TxbEmpresa" runat="server" CssClass="TxtFundo" TabIndex="13" Width="400px"></asp:TextBox>
                <cc1:TextBoxWatermarkExtender ID="TxbEmpresa_TextBoxWatermarkExtender" runat="server"
                    Enabled="True" TargetControlID="TxbEmpresa" WatermarkCssClass="Marcadagua" WatermarkText="Nome da Empresa que trabalha">
                </cc1:TextBoxWatermarkExtender>
                <br />
                <br />
                <hr />
                <span class="style2">Dados da Pré-Reserva</span><br />
                <br />
                <div>
                    <div style="float: left; width: 49%">
                        Data de Entrada*:<asp:RequiredFieldValidator ID="rfvDataEntrada" runat="server" ControlToValidate="txbDataEntrada"
                            Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="rfvDataNasc1_ValidatorCalloutExtender" runat="server"
                            Enabled="True" PopupPosition="Left" TargetControlID="rfvDataEntrada">
                        </cc1:ValidatorCalloutExtender>
                        <br />
                        <asp:TextBox ID="txbDataEntrada" runat="server" CssClass="TxtFundo" TabIndex="50"
                            Width="70px"></asp:TextBox>
                        <cc1:CalendarExtender ID="txbDataEntrada_CalendarExtender" runat="server" CssClass="ajax__calendar"
                            Enabled="True" Format="dd/MM/yyyy" PopupButtonID="ibtnDataEntrada" TargetControlID="txbDataEntrada"
                            TodaysDateFormat=" d MMMM yyyy">
                        </cc1:CalendarExtender>
                        <cc1:MaskedEditExtender ID="txbDataEntrada_MaskedEditExtender" runat="server" AutoComplete="False"
                            CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                            CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                            CultureTimePlaceholder="" Enabled="True" Mask="99/99/9999" MaskType="Date" TargetControlID="txbDataEntrada">
                        </cc1:MaskedEditExtender>
                        &nbsp;<asp:ImageButton ID="ibtnDataEntrada" runat="server" CausesValidation="False"
                            Height="24px" ImageAlign="Middle" ImageUrl="Graficos/calendario_32x32.png" TabIndex="14"
                            ToolTip="Selecione a data no calendário" Width="24px" />
                        <br />
                        <br />
                    </div>
                    <div style="float: right; width: 49%">
                        Data de Saída*:<asp:RequiredFieldValidator ID="rfvDataSaida" runat="server" ControlToValidate="txbDataSaida"
                            Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="txbDataSaida_ValidatorCalloutExtender" runat="server"
                            Enabled="True" PopupPosition="Left" TargetControlID="rfvDataSaida">
                        </cc1:ValidatorCalloutExtender>
                        <br />
                        <asp:TextBox ID="txbDataSaida" runat="server" CssClass="TxtFundo" TabIndex="51" Width="70px"></asp:TextBox>
                        <cc1:CalendarExtender ID="txbDataSaida_CalendarExtender" runat="server" CssClass="ajax__calendar"
                            Enabled="True" Format="dd/MM/yyyy" PopupButtonID="ibtnDataSaida" TargetControlID="txbDataSaida"
                            TodaysDateFormat=" d MMMM yyyy">
                        </cc1:CalendarExtender>
                        <cc1:MaskedEditExtender ID="txbDataSaida_MaskedEditExtender" runat="server" AutoComplete="False"
                            CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                            CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                            CultureTimePlaceholder="" Enabled="True" Mask="99/99/9999" MaskType="Date" TargetControlID="txbDataSaida">
                        </cc1:MaskedEditExtender>
                        &nbsp;<asp:ImageButton ID="ibtnDataSaida" runat="server" CausesValidation="False"
                            Height="24px" ImageAlign="Middle" ImageUrl="Graficos/calendario_32x32.png" TabIndex="15"
                            ToolTip="Selecione a data no calendário" Width="24px" />
                        <br />
                        <br />
                    </div>
                    <br />
                    Número do Depósito em Conta ou Número Cupom Promocional:<asp:RequiredFieldValidator
                        ID="RfvNumDeposito" runat="server" ControlToValidate="txbNumDeposito" Display="None"
                        ErrorMessage="Campo Obrigatório"></asp:RequiredFieldValidator>
                    <cc1:ValidatorCalloutExtender ID="FfvNumDeposito_ValidatorCalloutExtender" runat="server"
                        Enabled="True" TargetControlID="RfvNumDeposito">
                    </cc1:ValidatorCalloutExtender>
                    <br />
                    <asp:TextBox ID="txbNumDeposito" runat="server" CssClass="TxtFundo" MaxLength="100"
                        Width="400px" TabIndex="16"></asp:TextBox>
                    <cc1:TextBoxWatermarkExtender ID="txbNumDeposito_TextBoxWatermarkExtender" runat="server"
                        Enabled="True" TargetControlID="txbNumDeposito" WatermarkCssClass="Marcadagua"
                        WatermarkText="Numero/Código do Depósito/Cupom Promocional">
                    </cc1:TextBoxWatermarkExtender>
                </div>
                Observações:<br />
                <asp:TextBox ID="txbContatoDescricao" runat="server" CssClass="TxtFundo" Rows="3"
                    TextMode="MultiLine" Width="400px" TabIndex="17"></asp:TextBox>
                <br />
                <br />
                Hospedagens adquiridas em promoções de clubes de desconto deverão ser agendadas 
                exclusivamente pelo telefone (31) 3581-8906.
                <br />
                <br />
                <div style="text-align: center;">
                    <asp:Button ID="BtnContatoEnviar" runat="server" OnClick="BtnContatoEnviar_Click"
                        TabIndex="18" Text="Enviar" Width="70px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:Button ID="BtnContatoLimpar" runat="server" CausesValidation="False" OnClick="BtnContatoLimpar_Click"
                        TabIndex="19" Text="Limpar" Width="70px" />
                </div>
                <br />
                <div style="text-align: left; font-size: xx-small">
                    &nbsp;&nbsp; * Campo Obrigatório</div>
            </div>
        </asp:Panel>
        <cc1:RoundedCornersExtender ID="PnlContatoFormulario_RoundedCornersExtender" runat="server"
            Enabled="True" TargetControlID="PnlContatoFormulario" BorderColor="167, 204, 231"
            Color="White">
        </cc1:RoundedCornersExtender>
        <br />
        <br />
    </div>
</asp:Content>
    
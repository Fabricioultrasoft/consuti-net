<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true"
    CodeBehind="Fideliza.aspx.cs" Inherits="pousadaZ.WebForm11" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            text-decoration: underline;
            font-weight: bold;
            font-size: medium;
        }
        .style2
        {
            text-align: left;
        }
        .style5
        {
            text-decoration: underline;
        }
        .style6
        {
            text-align: center;
        }
        .MsoNormal
        {
            text-align: justify;
        }
        .style7
        {
            font-size: medium;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="titContato">
        <br />
        <br />
        <span class="style1">CARTÃO FIDELIDADE POUSADA ZUMBZEIRA</span>
        <div style="width: 500px; text-align: right; font-size: smaller; margin-top: 5px;">
            Série Amigos - semestral</div>
        <div style="text-align: left; margin-left: 55px; margin-right: 45px; font-size: small;">
            <p class="MsoNormal">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Para os seus clientes fieis, a Pousada Zumbzeira oferece o Cartão 
                Fidelidade. Com ele o portador terá acesso à descontos nos serviços da pousada. </p>
            <div class="style7" style="text-align: center">
                <strong>Confira as vantagens!</strong></div>
            <p class="MsoNormal">
                <strong>&gt; DIÁRIAS</strong>: Redução considerável no valor da diária, de R$180,00
                para R$120,00.
            </p>
            <p class="MsoNormal">
                <strong>&gt; UTILIZAÇÃO DO ESPAÇO</strong>: Isenção da taxa de utilização de piscinas,
                churrasqueira e áreas comuns de sexta a domingo no valor de R$25,00 por pessoa, podendo trazer até 
                2 convidados indicados na ficha de proposta do cartão.
            </p>
            <p class="MsoNormal">
                <strong>&gt; FERIADOS E VÉSPERAS</strong>: Redução de 10% nos valores das diárias
                em feriados e vésperas.
            </p>
            <p class="MsoNormal">
                <strong>&gt;&nbsp;INDICAÇÃO</strong>: Nomes indicados como referência serão contemplados
                com 20% nas diárias normais.</p>
            <p class="MsoNormal">
                <span class="style5"><strong>ATENÇÃO</strong></span>: Promoção exclusiva para clientes
                da Pousada Zumbzeira. As hospedagens adquiridas por meio de <strong>compras coletivas
                    são válidas</strong> e <strong>quanto mais você comprar mais descontos você vai ganhar</strong>.
                Ou seja, cada hospedagem adquirida conta na aquisição do seu Cartão Fidelidade.
                O cartão não da direito à desconto acumulativo.
            </p>
            <p class="MsoNormal">
                VALOR DA TAXA DE ADESÃO DO CARTÃO: <strong>R$60,00</strong>.</p>
                <p class="MsoNormal">
                VENCIMENTO DO CARTÃO: <strong>Semestral</strong></p>
            <p class="MsoNormal">
                <strong>COMO ADQUIRIR?</strong> Pagar a taxa de adesão nos bancos indicados &gt; 
                Preencher a ficha de cadastro com o nome e informar o comprovante do depósito &gt; 
                Após a confirmação da Pousada Zumbzeira, o cartão será autorizado e deverá ser 
                emitido pelo solicitante.</p>
            <div class="style6">
                Dados para depósito do Pagamento:<br />
                <br />
                <strong>POUSADA ZUMBZEIRA</strong><br />
                <div style="width: 100%; float: left">
                    <span class="style5">
                        <br />
                        BANCO DO BRASIL</span><br />
                    <br />
                    AGÊNCIA: <strong>4446/6</strong><br />
                    CONTA CORRENTE: <strong>6284/7</strong></div>
            </div>
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <p style="text-align: justify; margin-left: 50px; margin-right: 50px">
            Solicite agora o seu cartão de desconto preenchendo os campos abaixo, você receberá
            em seu email a autorização para impressão do mesmo.</p>
        <div style="margin-left: 55px">
            <br />
            <asp:Panel ID="Panel1" runat="server" BorderColor="#3366FF" Width="554px" HorizontalAlign="Center"
                Style="font-size: small" DefaultButton="BtnEnviar">
                <div class="style2" style="margin-left: 40px">
                <br />
                    Número do comprovante de depósito*:<asp:RequiredFieldValidator ID="ComprovanteRequiredFieldValidator" runat="server" ControlToValidate="TxbComprovante"
                        Display="None" ErrorMessage="Campo Obrigatório"></asp:RequiredFieldValidator>
                    <cc1:ValidatorCalloutExtender ID="ComprovanteValidatorCalloutExtender" runat="server"
                        Enabled="True" TargetControlID="ComprovanteRequiredFieldValidator">
                    </cc1:ValidatorCalloutExtender>
                    <br />
                    <asp:TextBox ID="TxbComprovante" runat="server" Width="400px" MaxLength="100" CssClass="TxtFundo"
                        TabIndex="1"></asp:TextBox>
                    <cc1:TextBoxWatermarkExtender ID="ComprovanteTextBoxWatermarkExtender" runat="server"
                        Enabled="True" TargetControlID="TxbComprovante" WatermarkCssClass="Marcadagua"
                        WatermarkText="Número do Comprovante de Depósito">
                    </cc1:TextBoxWatermarkExtender>
                    <br />
                    Nome Completo*:<asp:RequiredFieldValidator ID="RfvNomeCompleto" runat="server" ControlToValidate="TxbNomeCompleto"
                        Display="None" ErrorMessage="Campo Obrigatório"></asp:RequiredFieldValidator>
                    <cc1:ValidatorCalloutExtender ID="RfvNomeCompleto_ValidatorCalloutExtender" runat="server"
                        Enabled="True" TargetControlID="RfvNomeCompleto">
                    </cc1:ValidatorCalloutExtender>
                    <br />
                    <asp:TextBox ID="TxbNomeCompleto" runat="server" Width="400px" MaxLength="100" CssClass="TxtFundo"
                        TabIndex="1"></asp:TextBox>
                    <cc1:TextBoxWatermarkExtender ID="TxbNomeCompleto_TextBoxWatermarkExtender" runat="server"
                        Enabled="True" TargetControlID="TxbNomeCompleto" WatermarkCssClass="Marcadagua"
                        WatermarkText="Seu nome completo">
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
                    <asp:TextBox ID="TxbRua" runat="server" Width="260px" MaxLength="100" CssClass="TxtFundo"
                        TabIndex="2"></asp:TextBox>
                    <cc1:TextBoxWatermarkExtender ID="TxbRua_TextBoxWatermarkExtender" runat="server"
                        Enabled="True" TargetControlID="TxbRua" WatermarkCssClass="Marcadagua" WatermarkText="Sua Rua">
                    </cc1:TextBoxWatermarkExtender>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TxbNumero" runat="server" Width="105px" MaxLength="5" CssClass="TxtFundo"
                        TabIndex="3"></asp:TextBox>
                    <cc1:FilteredTextBoxExtender ID="TxbNumero_FilteredTextBoxExtender" runat="server"
                        Enabled="True" TargetControlID="TxbNumero" ValidChars="1234567890">
                    </cc1:FilteredTextBoxExtender>
                    <cc1:TextBoxWatermarkExtender ID="TxbNumero_TextBoxWatermarkExtender" runat="server"
                        Enabled="True" TargetControlID="TxbNumero" WatermarkCssClass="Marcadagua" WatermarkText="Numero">
                    </cc1:TextBoxWatermarkExtender>
                    <br />
                    Complemento:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp; Bairro*:<asp:RequiredFieldValidator ID="RfvBairro" runat="server"
                        ControlToValidate="TxbBairro" Display="None" ErrorMessage="Campo Obrigatório"></asp:RequiredFieldValidator>
                    <cc1:ValidatorCalloutExtender ID="RfvBairro_ValidatorCalloutExtender" runat="server"
                        Enabled="True" TargetControlID="RfvBairro">
                    </cc1:ValidatorCalloutExtender>
                    <br />
                    <asp:TextBox ID="txbComplemento" runat="server" Width="190px" MaxLength="100" CssClass="TxtFundo"
                        TabIndex="4"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TxbBairro" runat="server" Width="180px" MaxLength="100" CssClass="TxtFundo"
                        TabIndex="5"></asp:TextBox>
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
                    <asp:TextBox ID="TxbCidade" runat="server" Width="400px" MaxLength="100" CssClass="TxtFundo"
                        TabIndex="6"></asp:TextBox>
                    <cc1:TextBoxWatermarkExtender ID="TxbCidade_TextBoxWatermarkExtender" runat="server"
                        Enabled="True" TargetControlID="TxbCidade" WatermarkCssClass="Marcadagua" WatermarkText="Sua cidade">
                    </cc1:TextBoxWatermarkExtender>
                    <br />
                    Estado*:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp; CEP:<asp:RequiredFieldValidator ID="RfvEstado" runat="server" ControlToValidate="TxbEstado"
                        Display="None" ErrorMessage="Campo Obrigatório"></asp:RequiredFieldValidator>
                    <cc1:ValidatorCalloutExtender ID="RfvEstado_ValidatorCalloutExtender" runat="server"
                        Enabled="True" TargetControlID="RfvEstado">
                    </cc1:ValidatorCalloutExtender>
                    <asp:RegularExpressionValidator ID="RevCEP" runat="server" ControlToValidate="TxbCEP"
                        Display="None" ErrorMessage="CEP inválido. Ex(99999-999)" ValidationExpression="\d{5}\d{3}"></asp:RegularExpressionValidator>
                    <cc1:ValidatorCalloutExtender ID="RevCEP_ValidatorCalloutExtender" runat="server"
                        Enabled="True" TargetControlID="RevCEP">
                    </cc1:ValidatorCalloutExtender>
                    <br />
                    <asp:TextBox ID="TxbEstado" runat="server" MaxLength="50" CssClass="TxtFundo" Width="128px"
                        TabIndex="7"></asp:TextBox>
                    <cc1:TextBoxWatermarkExtender ID="TxbEstado_TextBoxWatermarkExtender" runat="server"
                        Enabled="True" TargetControlID="TxbEstado" WatermarkCssClass="Marcadagua" WatermarkText="Estado">
                    </cc1:TextBoxWatermarkExtender>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TxbCEP" runat="server" MaxLength="9" CssClass="TxtFundo" Width="128px"
                        TabIndex="8"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="TxbCEP_MaskedEditExtender" runat="server" AutoComplete="False"
                        CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                        CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                        CultureTimePlaceholder="" Enabled="True" Mask="99999-999" MaskType="Number" TargetControlID="TxbCEP">
                    </cc1:MaskedEditExtender>
                    <br />
                    Tel. Fixo*:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; Tel. Celular*:<asp:RequiredFieldValidator
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
                    <asp:RegularExpressionValidator ID="refCel" runat="server" ControlToValidate="TxbTelCelular"
                        Display="None" ErrorMessage="Telefone inválido. Ex: (99) 9999-9999" ValidationExpression="\d{2}\d{4}\d{4}"></asp:RegularExpressionValidator>
                    <cc1:ValidatorCalloutExtender ID="refCel_ValidatorCalloutExtender" runat="server"
                        Enabled="True" TargetControlID="refCel">
                    </cc1:ValidatorCalloutExtender>
                    <cc1:ValidatorCalloutExtender ID="refFixo_ValidatorCalloutExtender" runat="server"
                        Enabled="True" TargetControlID="refFixo">
                    </cc1:ValidatorCalloutExtender>
                    <br />
                    <asp:TextBox ID="TxbTelFixo" runat="server" MaxLength="13" CssClass="TxtFundo" Width="128px"
                        TabIndex="9"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="TxbTelFixo_MaskedEditExtender" runat="server" AutoComplete="False"
                        CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                        CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                        CultureTimePlaceholder="" Enabled="True" Mask="(99) 9999-9999" MaskType="Number"
                        TargetControlID="TxbTelFixo">
                    </cc1:MaskedEditExtender>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TxbTelCelular" runat="server" MaxLength="13" CssClass="TxtFundo"
                        Width="128px" TabIndex="10"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="TxbTelCelular_MaskedEditExtender" runat="server" AutoComplete="False"
                        CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                        CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                        CultureTimePlaceholder="" Enabled="True" Mask="(99) 9999-9999" MaskType="Number"
                        TargetControlID="TxbTelCelular">
                    </cc1:MaskedEditExtender>
                    <br />
                    CPF*:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp; Identidade*:<asp:RequiredFieldValidator ID="RfvCPF" runat="server"
                        ControlToValidate="TxbCPF" Display="None" ErrorMessage="Campo Obrigatório"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RfvRG" runat="server" ControlToValidate="TxbRG" Display="None"
                        ErrorMessage="Campo Obrigatório"></asp:RequiredFieldValidator>
                    <cc1:ValidatorCalloutExtender ID="RfvRG_ValidatorCalloutExtender" runat="server"
                        Enabled="True" TargetControlID="RfvRG">
                    </cc1:ValidatorCalloutExtender>
                    <cc1:ValidatorCalloutExtender ID="RfvCPF_ValidatorCalloutExtender" runat="server"
                        Enabled="True" TargetControlID="RfvCPF">
                    </cc1:ValidatorCalloutExtender>
                    <asp:RegularExpressionValidator ID="RevCPF" runat="server" ControlToValidate="TxbCPF"
                        Display="None" ErrorMessage="CPF inválido. Ex(999.999.999-99)" ValidationExpression="\d{3}\.\d{3}\.\d{3}\d{2}"></asp:RegularExpressionValidator>
                    <cc1:ValidatorCalloutExtender ID="RevCPF_ValidatorCalloutExtender" runat="server"
                        Enabled="True" TargetControlID="RevCPF">
                    </cc1:ValidatorCalloutExtender>
                    <br />
                    <asp:TextBox ID="TxbCPF" runat="server" CssClass="TxtFundo" MaxLength="14" Width="128px"
                        TabIndex="11"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="TxbCPF_MaskedEditExtender" runat="server" AutoComplete="False"
                        CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                        CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                        CultureTimePlaceholder="" Enabled="True" Mask="999,999,999-99" MaskType="Number"
                        TargetControlID="TxbCPF">
                    </cc1:MaskedEditExtender>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TxbRG" runat="server" CssClass="TxtFundo" MaxLength="13" TabIndex="12"
                        Width="128px"></asp:TextBox>
                    <cc1:TextBoxWatermarkExtender ID="TxbRG_TextBoxWatermarkExtender" runat="server"
                        Enabled="True" TargetControlID="TxbRG" WatermarkCssClass="Marcadagua" WatermarkText="MG 99999999">
                    </cc1:TextBoxWatermarkExtender>
                    <br />
                    Data de Nascimento:*<asp:RequiredFieldValidator ID="rfvDataNasc" runat="server" ControlToValidate="TxbDataNascimento"
                        Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                    <cc1:ValidatorCalloutExtender ID="rfvDataNasc_ValidatorCalloutExtender" runat="server"
                        Enabled="True" TargetControlID="rfvDataNasc" PopupPosition="Left">
                    </cc1:ValidatorCalloutExtender>
                    <br />
                    <asp:TextBox ID="TxbDataNascimento" runat="server" CssClass="TxtFundo" TabIndex="49"
                        Width="128px"></asp:TextBox>
                    <cc1:CalendarExtender ID="TxbDataNascimento_CalendarExtender" runat="server" CssClass="ajax__calendar"
                        Enabled="True" Format="dd/MM/yyyy" PopupButtonID="IbtnDatanasc" TargetControlID="TxbDataNascimento"
                        TodaysDateFormat=" d MMMM yyyy">
                    </cc1:CalendarExtender>
                    <cc1:MaskedEditExtender ID="TxbDataNascimento_MaskedEditExtender" runat="server"
                        AutoComplete="False" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder=""
                        CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                        CultureTimePlaceholder="" Enabled="True" Mask="99/99/9999" MaskType="Date" TargetControlID="TxbDataNascimento">
                    </cc1:MaskedEditExtender>
                    &nbsp;<asp:ImageButton ID="IbtnDatanasc" runat="server" CausesValidation="False"
                        Height="24px" ImageAlign="Middle" ImageUrl="Graficos/calendario_32x32.png" TabIndex="13"
                        ToolTip="Selecione a data no calendário" Width="24px" />
                    <br />
                    Empresa:<br />
                    <asp:TextBox ID="TxbEmpresa" runat="server" CssClass="TxtFundo" Width="400px" TabIndex="14"></asp:TextBox>
                    <br />
                    Cargo:<br />
                    <asp:TextBox ID="TxbCargo" runat="server" CssClass="TxtFundo" Width="400px" TabIndex="15"></asp:TextBox>
                    <br />
                    Email*:<asp:RequiredFieldValidator ID="RfvEmail" runat="server" ControlToValidate="TxbEmail"
                        Display="None" ErrorMessage="Campo Obrigatório"></asp:RequiredFieldValidator>
                    <cc1:ValidatorCalloutExtender ID="RfvEmail_ValidatorCalloutExtender" runat="server"
                        Enabled="True" TargetControlID="RfvEmail">
                    </cc1:ValidatorCalloutExtender>
                    <asp:RegularExpressionValidator ID="RevEmail" runat="server" ControlToValidate="TxbEmail"
                        Display="None" ErrorMessage="Digite um email válido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <cc1:ValidatorCalloutExtender ID="RevEmail_ValidatorCalloutExtender" runat="server"
                        Enabled="True" TargetControlID="RevEmail">
                    </cc1:ValidatorCalloutExtender>
                    <br />
                    <asp:TextBox ID="TxbEmail" runat="server" Width="400px" CssClass="TxtFundo" TabIndex="16"></asp:TextBox>
                    <cc1:TextBoxWatermarkExtender ID="TxbEmail_TextBoxWatermarkExtender" runat="server"
                        Enabled="True" TargetControlID="TxbEmail" WatermarkCssClass="Marcadagua" WatermarkText="seuemail@seudominio.com.br">
                    </cc1:TextBoxWatermarkExtender>
                    <br />
                    <br />
                    <hr style="height: -12px" />
                    <p style="text-align: center">
                        Referência de Dois Amigos:</p>
                    Nome:<br />
                    <asp:TextBox ID="TxbNomeAmigo1" runat="server" Width="400px" MaxLength="100" CssClass="TxtFundo"
                        TabIndex="17"></asp:TextBox>
                    <cc1:TextBoxWatermarkExtender ID="TxbNomeAmigo1_TextBoxWatermarkExtender" runat="server"
                        Enabled="True" TargetControlID="TxbNomeAmigo1" WatermarkCssClass="Marcadagua"
                        WatermarkText="Nome do Seu Amigo">
                    </cc1:TextBoxWatermarkExtender>
                    <br />
                    Telefone:<asp:RegularExpressionValidator ID="refTelAmigo1" runat="server" ControlToValidate="TxbTelefoneAmigo1"
                        Display="None" ErrorMessage="Telefone inválido. Ex: (99) 9999-9999" ValidationExpression="\d{2}\d{4}\d{4}"></asp:RegularExpressionValidator>
                    <cc1:ValidatorCalloutExtender ID="refTelAmigo1_ValidatorCalloutExtender" runat="server"
                        Enabled="True" TargetControlID="refTelAmigo1">
                    </cc1:ValidatorCalloutExtender>
                    <br />
                    <asp:TextBox ID="TxbTelefoneAmigo1" runat="server" MaxLength="13" CssClass="TxtFundo"
                        Width="128px" TabIndex="18"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="TxbTelefoneAmigo1_MaskedEditExtender" runat="server"
                        AutoComplete="False" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder=""
                        CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                        CultureTimePlaceholder="" Enabled="True" Mask="(99) 9999-9999" MaskType="Number"
                        TargetControlID="TxbTelefoneAmigo1">
                    </cc1:MaskedEditExtender>
                    <br />
                    Nome:<br />
                    <asp:TextBox ID="TxbNomeAmigo2" runat="server" CssClass="TxtFundo" MaxLength="100"
                        Width="400px" TabIndex="19"></asp:TextBox>
                    <cc1:TextBoxWatermarkExtender ID="TxbNomeAmigo2_TextBoxWatermarkExtender" runat="server"
                        Enabled="True" TargetControlID="TxbNomeAmigo2" WatermarkCssClass="Marcadagua"
                        WatermarkText="Nome do Seu Amigo">
                    </cc1:TextBoxWatermarkExtender>
                    <br />
                    Telefone:<asp:RegularExpressionValidator ID="refTelAmigo2" runat="server" ControlToValidate="TxbTelefoneAmigo2"
                        Display="None" ErrorMessage="Telefone inválido. Ex: (99) 9999-9999" ValidationExpression="\d{2}\d{4}\d{4}"></asp:RegularExpressionValidator>
                    <cc1:ValidatorCalloutExtender ID="refTelAmigo2_ValidatorCalloutExtender" runat="server"
                        Enabled="True" TargetControlID="refTelAmigo2">
                    </cc1:ValidatorCalloutExtender>
                    <br />
                    <asp:TextBox ID="TxbTelefoneAmigo2" runat="server" MaxLength="13" CssClass="TxtFundo"
                        Width="128px" TabIndex="20"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="TxbTelefoneAmigo2_MaskedEditExtender" runat="server"
                        AutoComplete="False" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder=""
                        CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                        CultureTimePlaceholder="" Enabled="True" Mask="(99) 9999-9999" MaskType="Number"
                        TargetControlID="TxbTelefoneAmigo2">
                    </cc1:MaskedEditExtender>
                    <br />
                    <br />
                    <br />
                    <hr class="TxtFundo" />
                    <p style="text-align: center">
                        Qual será a forma de pagamento caso venha a se hospedar conosco*?</p>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="DdlTipoPagamento" runat="server" CssClass="TxtFundo" TabIndex="21">
                        <asp:ListItem Value="0">Pagamento em Dinheiro</asp:ListItem>
                        <asp:ListItem Value="1">Depósito B. Brasil</asp:ListItem>                        
                        <asp:ListItem Value="2">Cheque</asp:ListItem>
                        <asp:ListItem Value="3">Cartão</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RfvFormaPaga" runat="server" ControlToValidate="DdlTipoPagamento"
                        Display="None" ErrorMessage="Selecione uma forma de pagamento."></asp:RequiredFieldValidator>
                    <cc1:ValidatorCalloutExtender ID="RfvFormaPaga_ValidatorCalloutExtender" runat="server"
                        Enabled="True" TargetControlID="RfvFormaPaga">
                    </cc1:ValidatorCalloutExtender>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:CheckBox ID="CienteCheckBox" runat="server" 
                        Text="Estou de acordo e ciente que tenho que avisar a pousada previamente" />
                    <br />
                    <br />
                    <div style="text-align: right">
                        <asp:Button ID="BtnEnviar" runat="server" Text="Solicitar Cartão" OnClick="BtnEnviar_Click"
                            TabIndex="222" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="BtnLimpar" runat="server" Text="Limpar Tudo" CausesValidation="False"
                            OnClick="BtnLimpar_Click" TabIndex="223" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                    <br />
                    <span style="font-size: xx-small">*Campo Obrigatório</span>
                    <br />
                </div>
            </asp:Panel>
            <br />
            <br />
        </div>
    </div>
</asp:Content>

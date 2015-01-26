<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true"
    CodeBehind="CadUser.aspx.cs" Inherits="testePMK.com.br.CadUser" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style8
        {
            font-size: xx-small;
            color: red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
        Cadastro de Usuário</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:Panel ID="PnlSelecione" runat="server">
        <div style="margin-left: 30px">
            <br />
            Selecione o tipo:<br />
            <asp:DropDownList ID="DdlSelecioneTipo" runat="server" AutoPostBack="True">
                <asp:ListItem Value="0">&lt;Selecione Tipo&gt;</asp:ListItem>
                <asp:ListItem Value="1">Pessoa Física</asp:ListItem>
                <asp:ListItem Value="2">Pessoa Jurídica</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
        </div>
    </asp:Panel>
    <cc1:RoundedCornersExtender ID="PnlSelecione_RoundedCornersExtender" runat="server"
        BorderColor="Green" Enabled="True" TargetControlID="PnlSelecione">
    </cc1:RoundedCornersExtender>
    <br />
    <asp:Panel ID="pnlFormCadastro" runat="server" Visible="False" DefaultButton="btnCadastrar">
        <div style="text-align: center">
            Preencha os campos para realizar o cadastro no site:</div>
        <asp:Panel ID="pnlFisica" runat="server" Style="margin-left: 30px" Width="476px">
            <br />
            Nome Completo:*<asp:RequiredFieldValidator ID="rfvNome" runat="server" ControlToValidate="txbNome"
                Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
            <cc1:ValidatorCalloutExtender ID="rfvNome_ValidatorCalloutExtender" runat="server"
                Enabled="True" TargetControlID="rfvNome" PopupPosition="Left">
            </cc1:ValidatorCalloutExtender>
            <br />
            <asp:TextBox ID="txbNome" runat="server" CssClass="campoObrigatorio" MaxLength="100"
                Width="450px" TabIndex="1"></asp:TextBox>
            <cc1:FilteredTextBoxExtender ID="txbNome_FilteredTextBoxExtender" runat="server"
                Enabled="True" FilterMode="InvalidChars" FilterType="Numbers" InvalidChars="1234567890&quot;!@#$%¨&amp;*()-_=+"
                TargetControlID="txbNome">
            </cc1:FilteredTextBoxExtender>
            <br />
            <table style="width: 100%;">
                <tr>
                    <td>
                        CPF:*<asp:RequiredFieldValidator ID="rfvCPF" runat="server" ControlToValidate="txbCPF"
                            Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="rfvCPF_ValidatorCalloutExtender" runat="server"
                            Enabled="True" TargetControlID="rfvCPF">
                        </cc1:ValidatorCalloutExtender>
                        <br />
                        <asp:TextBox ID="txbCPF" runat="server" CssClass="campoObrigatorio" Width="100px"
                            MaxLength="11" TabIndex="2"></asp:TextBox>
                        <cc1:MaskedEditExtender ID="txbCPF_MaskedEditExtender" runat="server" AutoComplete="False"
                            ClearMaskOnLostFocus="False" ClipboardEnabled="False" CultureAMPMPlaceholder=""
                            CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder=""
                            CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder=""
                            Enabled="True" Mask="999,999,999-99" MaskType="Number" TargetControlID="txbCPF">
                        </cc1:MaskedEditExtender>
                    </td>
                    <td>
                        Sexo:*<asp:RequiredFieldValidator ID="rfvSexo0" runat="server" ControlToValidate="ddlSexo"
                            Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="rfvSexo0_ValidatorCalloutExtender" runat="server"
                            Enabled="True" TargetControlID="rfvSexo0">
                        </cc1:ValidatorCalloutExtender>
                        <br />
                        <asp:DropDownList ID="ddlSexo" runat="server" CssClass="campoObrigatorio" TabIndex="3">
                            <asp:ListItem Value="1">Masculino</asp:ListItem>
                            <asp:ListItem Value="2">Feminino</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        Data de Nascimento:*<asp:RequiredFieldValidator ID="rfvDataNasc1" runat="server"
                            ControlToValidate="txbDataNasc" Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="rfvDataNasc1_ValidatorCalloutExtender" runat="server"
                            Enabled="True" TargetControlID="rfvDataNasc1" PopupPosition="Left">
                        </cc1:ValidatorCalloutExtender>
                        <br />
                        <asp:TextBox ID="txbDataNasc" runat="server" CssClass="campoObrigatorio" TabIndex="4"
                            Width="70px"></asp:TextBox>
                        <cc1:CalendarExtender ID="txbDataNasc_CalendarExtender" runat="server" CssClass="ajax__calendar"
                            Enabled="True" Format="dd/MM/yyyy" PopupButtonID="IbtnDatanasc" TargetControlID="txbDataNasc"
                            TodaysDateFormat=" d MMMM yyyy">
                        </cc1:CalendarExtender>
                        <cc1:MaskedEditExtender ID="txbDataNasc_MaskedEditExtender" runat="server" AutoComplete="False"
                            ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder=""
                            CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                            CultureTimePlaceholder="" Enabled="True" Mask="99/99/9999" MaskType="Date" TargetControlID="txbDataNasc">
                        </cc1:MaskedEditExtender>
                        &nbsp;<asp:ImageButton ID="IbtnDatanasc" runat="server" CausesValidation="False"
                            Height="24px" ImageAlign="Middle" ImageUrl="Graficos/calendario_32x32.png" ToolTip="Selecione a data no calendário"
                            Width="24px" TabIndex="5" />
                    </td>
                </tr>
            </table>
            <table style="width: 100%;">
                <tr>
                    <td>
                        RG:<asp:RequiredFieldValidator ID="rfvRG" runat="server" ControlToValidate="txbRG"
                            Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="rfvRG_ValidatorCalloutExtender" runat="server"
                            Enabled="True" TargetControlID="rfvRG">
                        </cc1:ValidatorCalloutExtender>
                        <br />
                        <asp:TextBox ID="txbRG" runat="server" CssClass="campoObrigatorio" MaxLength="20"
                            TabIndex="6" Width="100px"></asp:TextBox>
                    </td>
                    <td>
                        Profissão:<br />
                        <asp:TextBox ID="txbProfissao" runat="server" CssClass="campoNaoObrigatorio" MaxLength="100"
                            TabIndex="6" Width="250px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br />
            <hr />
            <br />
        </asp:Panel>
        <asp:Panel ID="pnlJuridica" runat="server" Style="margin-left: 30px" Width="476px">
            <br />
            Razão Social*:<asp:RequiredFieldValidator ID="rfvRazSocial" runat="server" ControlToValidate="txbRazSocial"
                Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
            <cc1:ValidatorCalloutExtender ID="rfvRazSocial_ValidatorCalloutExtender" runat="server"
                Enabled="True" PopupPosition="Left" TargetControlID="rfvRazSocial">
            </cc1:ValidatorCalloutExtender>
            <br />
            <asp:TextBox ID="txbRazSocial" runat="server" Width="450px" CssClass="campoObrigatorio"
                MaxLength="200" TabIndex="7"></asp:TextBox>
            <br />
            <table style="width: 100%;">
                <tr>
                    <td>
                        CNPJ*:<asp:RequiredFieldValidator ID="rfvCNPJ" runat="server" 
                            ControlToValidate="txbCNPJ" Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="rfvCNPJ_ValidatorCalloutExtender" 
                            runat="server" Enabled="True" TargetControlID="rfvCNPJ">
                        </cc1:ValidatorCalloutExtender>
                        <br />
                        <asp:TextBox ID="txbCNPJ" runat="server" CssClass="campoObrigatorio" MaxLength="14"
                            TabIndex="8" Width="115px"></asp:TextBox>
                        <cc1:MaskedEditExtender ID="txbCNPJ_MaskedEditExtender" runat="server" 
                            AutoComplete="False" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder=""
                            CultureDateFormat="" CultureDatePlaceholder="" 
                            CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                            CultureTimePlaceholder="" Enabled="True" Mask="99,999,999/9999-99" MaskType="Number"
                            TargetControlID="txbCNPJ">
                        </cc1:MaskedEditExtender>
                    </td>
                    <td>
                        Inscrição Estadual:<br />
                        <asp:TextBox ID="txbInscEstad" runat="server" CssClass="campoNaoObrigatorio" MaxLength="14"
                            TabIndex="8" Width="200px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br />
            <hr />
            <br />
        </asp:Panel>
        <asp:Panel ID="pnlShare" runat="server" Style="margin-left: 30px" Width="475px">
            <table style="width: 100%; margin-left: 0px;">
                <tr>
                    <td>
                        Telefone Fixo:*<asp:RequiredFieldValidator ID="rfvTelFixo" runat="server" ControlToValidate="txbTelFixo"
                            Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="rfvTelFixo_ValidatorCalloutExtender" runat="server"
                            Enabled="True" TargetControlID="rfvTelFixo">
                        </cc1:ValidatorCalloutExtender>
                        <br />
                        <asp:TextBox ID="txbTelFixo" runat="server" CssClass="campoObrigatorio" MaxLength="11"
                            TabIndex="9" Width="200px"></asp:TextBox>
                        <cc1:MaskedEditExtender ID="txbTelFixo_MaskedEditExtender" runat="server" 
                            AutoComplete="False" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder=""
                            CultureDateFormat="" CultureDatePlaceholder="" 
                            CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                            CultureTimePlaceholder="" Enabled="True" Mask="(99) 9999-9999" MaskType="Number"
                            TargetControlID="txbTelFixo">
                        </cc1:MaskedEditExtender>
                    </td>
                    <td>
                        Celular:<br />
                        <asp:TextBox ID="txbCelular" runat="server" CssClass="campoNaoObrigatorio" MaxLength="11"
                            TabIndex="10" Width="200px"></asp:TextBox>
                        <cc1:MaskedEditExtender ID="txbCelular_MaskedEditExtender" runat="server" 
                            AutoComplete="False" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder=""
                            CultureDateFormat="" CultureDatePlaceholder="" 
                            CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                            CultureTimePlaceholder="" Enabled="True" Mask="(99) 9999-9999" MaskType="Number"
                            TargetControlID="txbCelular">
                        </cc1:MaskedEditExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        Rua:*<asp:RequiredFieldValidator ID="rfvRua" runat="server" ControlToValidate="txbRua"
                            Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="rfvRua_ValidatorCalloutExtender" runat="server"
                            Enabled="True" TargetControlID="rfvRua">
                        </cc1:ValidatorCalloutExtender>
                        <br />
                        <asp:TextBox ID="txbRua" runat="server" CssClass="campoObrigatorio" MaxLength="200"
                            TabIndex="11" Width="200px"></asp:TextBox>
                    </td>
                    <td>
                        Número:*<asp:RequiredFieldValidator ID="rfvNum" runat="server" ControlToValidate="txbNumero"
                            Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="rfvNum_ValidatorCalloutExtender" runat="server"
                            Enabled="True" PopupPosition="Left" TargetControlID="rfvNum">
                        </cc1:ValidatorCalloutExtender>
                        <br />
                        <asp:TextBox ID="txbNumero" runat="server" CssClass="campoObrigatorio" MaxLength="6"
                            TabIndex="12" Width="80px"></asp:TextBox>
                        <cc1:FilteredTextBoxExtender ID="txbNumero_FilteredTextBoxExtender" runat="server"
                            Enabled="True" TargetControlID="txbNumero" ValidChars="1234567890">
                        </cc1:FilteredTextBoxExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        Complemento:<br />
                        <asp:TextBox ID="txbComplemento" runat="server" CssClass="campoNaoObrigatorio" MaxLength="200"
                            TabIndex="13" Width="200px"></asp:TextBox>
                    </td>
                    <td>
                        Bairro:*<asp:RequiredFieldValidator ID="rfvBairro" runat="server" ControlToValidate="txbBairro"
                            Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="rfvBairro_ValidatorCalloutExtender" runat="server"
                            Enabled="True" PopupPosition="Left" TargetControlID="rfvBairro">
                        </cc1:ValidatorCalloutExtender>
                        <br />
                        <asp:TextBox ID="txbBairro" runat="server" CssClass="campoObrigatorio" MaxLength="100"
                            TabIndex="14" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Cidade:*<asp:RequiredFieldValidator ID="rfvCidade" runat="server" ControlToValidate="txbCidade"
                            Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="rfvCidade_ValidatorCalloutExtender" runat="server"
                            Enabled="True" TargetControlID="rfvCidade">
                        </cc1:ValidatorCalloutExtender>
                        <br />
                        <asp:TextBox ID="txbCidade" runat="server" CssClass="campoObrigatorio" MaxLength="100"
                            TabIndex="15" Width="200px"></asp:TextBox>
                    </td>
                    <td>
                        Estado:*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        CEP:*<asp:RequiredFieldValidator ID="rfvEstado" runat="server" ControlToValidate="ddlEstado"
                            Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="rfvEstado_ValidatorCalloutExtender" runat="server"
                            Enabled="True" TargetControlID="rfvEstado">
                        </cc1:ValidatorCalloutExtender>
                        <asp:RequiredFieldValidator ID="rfvCep" runat="server" ControlToValidate="txbCEP"
                            Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="rfvCep_ValidatorCalloutExtender" runat="server"
                            Enabled="True" PopupPosition="Left" TargetControlID="rfvCep">
                        </cc1:ValidatorCalloutExtender>
                        <br />
                        <asp:DropDownList ID="ddlEstado" runat="server" CssClass="campoObrigatorio" TabIndex="16">
                            <asp:ListItem>AC</asp:ListItem>
                            <asp:ListItem>AL</asp:ListItem>
                            <asp:ListItem>AM</asp:ListItem>
                            <asp:ListItem>AP</asp:ListItem>
                            <asp:ListItem>BA</asp:ListItem>
                            <asp:ListItem>CE</asp:ListItem>
                            <asp:ListItem>DF</asp:ListItem>
                            <asp:ListItem>ES</asp:ListItem>
                            <asp:ListItem>GO</asp:ListItem>
                            <asp:ListItem>MA</asp:ListItem>
                            <asp:ListItem>MG</asp:ListItem>
                            <asp:ListItem>MS</asp:ListItem>
                            <asp:ListItem>MT</asp:ListItem>
                            <asp:ListItem>PA</asp:ListItem>
                            <asp:ListItem>PB</asp:ListItem>
                            <asp:ListItem>PE</asp:ListItem>
                            <asp:ListItem>PI</asp:ListItem>
                            <asp:ListItem>PR</asp:ListItem>
                            <asp:ListItem>RJ</asp:ListItem>
                            <asp:ListItem>RN</asp:ListItem>
                            <asp:ListItem>RO</asp:ListItem>
                            <asp:ListItem>RR</asp:ListItem>
                            <asp:ListItem>RS</asp:ListItem>
                            <asp:ListItem>SC</asp:ListItem>
                            <asp:ListItem>SE</asp:ListItem>
                            <asp:ListItem>SP</asp:ListItem>
                            <asp:ListItem>TO</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                        <asp:TextBox ID="txbCEP" runat="server" CssClass="campoObrigatorio" Width="70px"
                            TabIndex="17"></asp:TextBox>
                        <cc1:MaskedEditExtender ID="txbCEP_MaskedEditExtender" runat="server" CultureAMPMPlaceholder=""
                            CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder=""
                            CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder=""
                            Enabled="True" Mask="99999-999" MaskType="Number" TargetControlID="txbCEP" 
                            ClearMaskOnLostFocus="False">
                        </cc1:MaskedEditExtender>
                    </td>
                </tr>
            </table>
            <br />
            <hr />
            <br />
            Email para contato:* <span class="style8">(se já possui cadastro no PagSeguro, 
            informe o mesmo email)</span><asp:RegularExpressionValidator ID="refEmail" 
                runat="server" ControlToValidate="txbEmail" Display="None" 
                ErrorMessage="Formato de email inválido!" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <cc1:ValidatorCalloutExtender ID="refEmail_ValidatorCalloutExtender" 
                runat="server" Enabled="True" PopupPosition="Left" TargetControlID="refEmail">
            </cc1:ValidatorCalloutExtender>
            <br />
            <asp:TextBox ID="txbEmail" runat="server" CssClass="campoObrigatorio" 
                MaxLength="100" TabIndex="18" Width="450px"></asp:TextBox>
            <br />
            Senha para acesso ao site:*<asp:RequiredFieldValidator ID="rfvSenha" 
                runat="server" ControlToValidate="txbSenha"
                Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
            <cc1:ValidatorCalloutExtender ID="rfvSenha_ValidatorCalloutExtender" runat="server"
                Enabled="True" TargetControlID="rfvSenha">
            </cc1:ValidatorCalloutExtender>
            <br />
            <asp:TextBox ID="txbSenha" runat="server" Width="200px" CssClass="campoObrigatorio"
                TextMode="Password" MaxLength="20" TabIndex="19"></asp:TextBox>
            <br />
            Repita a Senha:*<asp:RequiredFieldValidator ID="rfvRepSenha" runat="server" ControlToValidate="txbRepSenha"
                Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
            <cc1:ValidatorCalloutExtender ID="rfvRepSenha_ValidatorCalloutExtender" runat="server"
                Enabled="True" TargetControlID="rfvRepSenha" PopupPosition="Left">
            </cc1:ValidatorCalloutExtender>
            <br />
            <asp:TextBox ID="txbRepSenha" runat="server" Width="200px" CssClass="campoObrigatorio"
                TextMode="Password" MaxLength="20" TabIndex="20"></asp:TextBox>
            <br />
        </asp:Panel>
        <div style="width: 90%; margin-left: 30px">
            <div style="text-align: center; margin-top: 28px;">
                <asp:CompareValidator ID="cvSenhas" runat="server" ControlToCompare="txbSenha" ControlToValidate="txbRepSenha"
                    Display="None" ErrorMessage="Senhas não conferem!"></asp:CompareValidator>
                <cc1:ValidatorCalloutExtender ID="cvSenhas_ValidatorCalloutExtender" runat="server"
                    Enabled="True" TargetControlID="cvSenhas">
                </cc1:ValidatorCalloutExtender>
                <br />
                <asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar" Width="107px" OnClick="btnCadastrar_Click"
                    TabIndex="21" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnLimpar" runat="server" Text="Limpar Tudo" CausesValidation="False"
                    OnClick="btnLimpar_Click" Width="107px" TabIndex="22" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CausesValidation="False"
                    OnClick="btnCancelar_Click" Width="107px" TabIndex="23" />
                <br />
                <br />
            </div>
        </div>
    </asp:Panel>
    <cc1:RoundedCornersExtender ID="pnlFormCadastro_RoundedCornersExtender" runat="server"
        BorderColor="Green" Enabled="True" TargetControlID="pnlFormCadastro">
    </cc1:RoundedCornersExtender>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/LeptonAdm/Painel/AdmMaster.Master"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="leptonbrasil.LeptonAdm.Painel.AdmParametros.Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Estilos/AdmParametros.css" type="text/css" rel="Stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <br />
        <div id="cabecalho">
            <div id="dataHora">
                <strong>Parâmetros de configuração do site</strong></div>
        </div>
        <div id="conteudoFuncional">
            <fieldset>
                <legend>Site</legend>Logo Site:
                <span class="style6">(235 x 70 pixel)</span><br />
                <asp:FileUpload ID="LogoSiteFileUpload" runat="server" Width="500px" />
                <br />
                <br />
                Imagem Fundo Site:
                <span class="style6">(sem limite de dimensões)</span><br />
                 <asp:FileUpload ID="FundoSiteFileUpload" runat="server" Width="500px" />
                <br />
                <br />
                Cor do Fundo Site: <span class="style6">(deixe o campo em branco caso queira 
                exibir a imagem de fundo)</span><br />
                <asp:Panel ID="Sample1" Style="width: 500px; height: 21px; border: 0; float: left"
                    runat="server">
                    <asp:TextBox runat="server" ID="CorFundoSiteTextBox" AutoCompleteType="None" MaxLength="6"
                        Style="float: left" Width="60px" />
                    <asp:ImageButton runat="Server" ID="Image1" Style="float: left; margin: 0 3px" ImageUrl="~/Graficos/cp_button.png"
                        AlternateText="Clique para escolher uma cor" ImageAlign="Baseline" Height="21px" />
                        <cc1:ColorPickerExtender ID="buttonCPE" runat="server" TargetControlID="CorFundoSiteTextBox"
                    PopupButtonID="Image1" SampleControlID="Sample1" />
                </asp:Panel>
            </fieldset><br />
            <fieldset>
                <legend>Contato</legend>
                <div>
                    <div style="width:49%; float:left">
                        Telefone Contato 1:<br />
                        <asp:TextBox ID="telefone1TextBox" runat="server"></asp:TextBox>
                        <cc1:MaskedEditExtender ID="telefone1TextBox_MaskedEditExtender" runat="server" AutoComplete="False"
                            CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                            CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                            CultureTimePlaceholder="" Enabled="True" Mask="(99) 9999-9999" MaskType="Number"
                            TargetControlID="telefone1TextBox" ClearMaskOnLostFocus="False">
                        </cc1:MaskedEditExtender>                        
                        <br />
                        <br />
                    </div>
                    <div  style="width:49%; float:right">
                        Telefone Contato 2:<br />
                        <asp:TextBox ID="telefone2TextBox" runat="server"></asp:TextBox>
                        <cc1:MaskedEditExtender ID="telefone2TextBox_MaskedEditExtender" runat="server" AutoComplete="False"
                            CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                            CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                            CultureTimePlaceholder="" Enabled="True" Mask="(99) 9999-9999" MaskType="Number"
                            TargetControlID="telefone2TextBox" ClearMaskOnLostFocus="False">
                        </cc1:MaskedEditExtender>
                        <br />
                        <br />
                    </div>
                </div>
                Email Contato: <span class="style6">(onde também serão entregues os emails da tela de
                    contatos)</span><br />
                <asp:TextBox ID="emailTextBox" runat="server" Width="500px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RevContatoEmail" runat="server" ControlToValidate="emailTextBox"
                    Display="None" ErrorMessage="Digite um email válido." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <cc1:ValidatorCalloutExtender ID="RevContatoEmail_ValidatorCalloutExtender" runat="server"
                    Enabled="True" TargetControlID="RevContatoEmail">
                </cc1:ValidatorCalloutExtender>
                <br />
            </fieldset><br />
            <fieldset>
                <legend>Home</legend>Imagem Topo Home:
                <span class="style6">(690 x 300 pixel)</span><br />
                 <asp:FileUpload ID="imgTopoHomeFileUpload" runat="server" Width="500px" />
                <br />
                <br />
                Texto Menu Serviços:<br />
                <asp:TextBox ID="TextoMenuServicosTextBox" runat="server" MaxLength="200" Width="500px"></asp:TextBox>
                <br />
                <br />
                Texto Menu Contato:<br />
                <asp:TextBox ID="TextoMenuContatoTextBox" runat="server" MaxLength="200" Width="500px"></asp:TextBox>
                <br />
                <br />
                Texto Menu Notícias:
                <br />
                <asp:TextBox ID="TextoMenuNoticiasTextBox" runat="server" MaxLength="200" Width="500px"></asp:TextBox>
                <br />
                <br />
                Texto Menu Institucional:
                <br />
                <asp:TextBox ID="TextoMenuInstitucionalTextBox" runat="server" MaxLength="200" Width="500px"></asp:TextBox>
                <br />
            </fieldset>
            <div id="botoesTela">
                <br />
                <asp:Button ID="btnSalvar" runat="server" Text="Salvar" Width="80px" CausesValidation="true" 
                    onclick="btnSalvar_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="tbnCancelar" runat="server" Text="Cancelar" Width="80px" CausesValidation="false" 
                    onclick="tbnCancelar_Click" />
                <br />
                <br />
            </div>
        </div>
    </div>
</asp:Content>

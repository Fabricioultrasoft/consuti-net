<%@ Page Title="Teste PMK - Contato" Language="C#" MasterPageFile="~/Master.Master"
    AutoEventWireup="true" CodeBehind="Contato.aspx.cs" Inherits="testePMK.com.br.Contato" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style8
        {
            text-align: justify;
        width: 586px;
    }
        #formContato
        {
            margin-left: 43px;
        }
    </style>
    <script type="text/javascript">
        //javascript para controlar o tamanho do text box
        var max = 501;
        var ancho = 300;
        function progreso_tecla(obj) {
            var progreso = document.getElementById("progresso");
            if (obj.value.length < max) {
                progreso.style.backgroundColor = "#E8EEF9";
                progreso.style.backgroundImage = "url(textarea.png)";
                progreso.style.color = "#000000";
                var pos = ancho - parseInt((ancho * parseInt(obj.value.length)) / 500);
                progreso.style.backgroundPosition = "-" + pos + "px 0px";
            }
            else {
                progreso.style.backgroundColor = "#CC0000";
                progreso.style.backgroundImage = "url()";
                progreso.style.color = "#E8EEF9";
                obj.value = obj.value.substring(0, max);
            }

            progreso.innerHTML = "(" + obj.value.length + " / " + (max - 1) + ")";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
        Contato</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="Subtitulo">
            <br />
            Contato
        </div>
        <asp:Panel ID="pnlContato" runat="server">
            <div id="formContato">
                <br />
                Preencha o formulário abaixo para realizar o contato com a Loja.
                <br />
                <br />
                Nome Completo:*<asp:RequiredFieldValidator ID="rfvNome" runat="server" ErrorMessage="Campo Obrigatório!"
                    ControlToValidate="txbNome" Display="None"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="rfvNome_ValidatorCalloutExtender" runat="server"
                    Enabled="True" TargetControlID="rfvNome">
                </cc1:ValidatorCalloutExtender>
                <br />
                <asp:TextBox ID="txbNome" runat="server" Width="520px" MaxLength="200"></asp:TextBox>
                <cc1:FilteredTextBoxExtender ID="txbNome_FilteredTextBoxExtender" runat="server"
                    Enabled="True" FilterMode="InvalidChars" FilterType="Numbers" InvalidChars="0123456789"
                    TargetControlID="txbNome">
                </cc1:FilteredTextBoxExtender>
                <br />
                <br />
                Email:*<asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Campo Obrigatório!"
                    ControlToValidate="txbEmail" Display="None"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="rfvEmail_ValidatorCalloutExtender" runat="server"
                    Enabled="True" TargetControlID="rfvEmail">
                </cc1:ValidatorCalloutExtender>
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txbEmail"
                    Display="None" ErrorMessage="Formato de email inválido!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <cc1:ValidatorCalloutExtender ID="revEmail_ValidatorCalloutExtender" runat="server"
                    Enabled="True" TargetControlID="revEmail">
                </cc1:ValidatorCalloutExtender>
                <br />
                <asp:TextBox ID="txbEmail" runat="server" Width="520px" MaxLength="200"></asp:TextBox>
                <br />
                <br />
                Telefone:<br />
                <asp:TextBox ID="txbTelefone" runat="server" Width="120px"></asp:TextBox>
                <cc1:MaskedEditExtender ID="txbTelefone_MaskedEditExtender" runat="server" CultureAMPMPlaceholder=""
                    CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder=""
                    CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder=""
                    Enabled="True" Mask="(99) 9999-9999" MaskType="Number" 
                    TargetControlID="txbTelefone" ClearMaskOnLostFocus="False">
                </cc1:MaskedEditExtender>
                <br />
                <br />
                Mensagem:*<asp:RequiredFieldValidator ID="rfvMensagem" runat="server" ErrorMessage="Campo Obrigatório!"
                    ControlToValidate="txbMensagem" Display="None"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="rfvMensagem_ValidatorCalloutExtender" runat="server"
                    Enabled="True" TargetControlID="rfvMensagem">
                </cc1:ValidatorCalloutExtender>
                <br />
                <asp:TextBox ID="txbMensagem" runat="server" Height="170px" 
                    TextMode="MultiLine" Width="520px"
                    onkeyup="progreso_tecla(this)"></asp:TextBox>
                <br />
                <div id="progresso">
                    (0 / 500)</div>
                <br />
                <div style="text-align: center; height: 36px;">
                    <asp:Button ID="btnEnviar" runat="server" Text="Enviar" Width="110px" OnClick="btnEnviar_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnLimpar" runat="server" Text="Limpar Tudo" Width="110px" CausesValidation="False"
                        OnClick="btnLimpar_Click" />
                    <br />
                </div>
            </div>
        </asp:Panel>
        <cc1:RoundedCornersExtender ID="pnlContato_RoundedCornersExtender" runat="server"
            BorderColor="Green" Enabled="True" TargetControlID="pnlContato">
        </cc1:RoundedCornersExtender>
        <br />
        <br />
        <br />
        <div class="Subtitulo">
            Televendas<br />
            <br />
        </div>
        <div class="style8">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Efetue suas compras também pelo telefone <strong>0xx
                31 8805-1820</strong> ou <strong>0xx 31 3327-6893</strong>. Esta é mais uma
            opção para que você efetue suas compras com toda a comodidade sem sair de casa.
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; O nosso atendimento está disponível de segunda a
            sexta feira das <strong>09:00h às 21:00h</strong>, aos sábados das <strong>09:00h às
                16:00h</strong>. Aproveite nossas ofertas e boas compras!<br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Prazo de entrega: Em até <strong>10 dias </strong>
            úteis após a confirmação da compra.
            <br />
            <br />
        </div>
    </div>
</asp:Content>

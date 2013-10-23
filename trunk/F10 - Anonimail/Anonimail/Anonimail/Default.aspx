<%@ Page Title="" Language="C#" MasterPageFile="Anonimail.Master" CodeBehind="Default.aspx.cs"
    Inherits="Anonimail.WebForm1" AutoEventWireup="true" %>

<%@ Register Namespace="Anonimail.Utilitarios" TagPrefix="custom" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            text-align: right;
        }
        .style2
        {
            padding: 5px;
        }
        .style3
        {
            font-size: x-small;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul>
        <li><a href="Default.aspx" id="current" accesskey="e" title="Enviar">ENVIAR</a></li>
        <li><a href="Responder.aspx" accesskey="r" title="Responder">RESPONDER</a></li>
        <li><a href="Contato.aspx" accesskey="c" title="Contato">CONTATO</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Panel ID="Panel1" runat="server" Width="700px">
        <div>
            <h3>
                Quero <strong>ENVIAR...</strong></h3>
        </div>
        <table style="padding: 5px; width: 100%;">
            <tr>
                <td class="style1">
                    <asp:RegularExpressionValidator ID="EmailDestinoTextBoxRegularExpressionValidator"
                        runat="server" ControlToValidate="EmailDestinoTextBox" Display="Dynamic" ErrorMessage="*"
                        ToolTip="Email Inválido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="EmailDestinoTextBoxRequiredFieldValidator" runat="server"
                        ControlToValidate="EmailDestinoTextBox" Display="Dynamic" ErrorMessage="*" ForeColor="Red"
                        ToolTip="Campo Obrigatório"></asp:RequiredFieldValidator>
                    E-mail Destino:
                </td>
                <td class="style2">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="EmailDestinoTextBox" runat="server" Width="250px" MaxLength="100"
                                TabIndex="1" AutoPostBack="True"></asp:TextBox>
                            <asp:Image ID="EmailBloqueadoImage" runat="server" ImageAlign="Middle" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:RegularExpressionValidator ID="EmailRespostaTextBoxRegularExpressionValidator"
                        runat="server" ControlToValidate="EmailRespostaTextBox" Display="Dynamic" ErrorMessage="*"
                        ToolTip="Email Inválido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    Email Resposta:
                </td>
                <td class="style2">
                    <asp:TextBox ID="EmailRespostaTextBox" runat="server" Width="250px" MaxLength="100"
                        TabIndex="2"></asp:TextBox>
                    &nbsp;<span class="style3">(apenas se desejar receber uma resposta)</span>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:RequiredFieldValidator ID="TituloTextBoxRequiredFieldValidator" runat="server"
                        ControlToValidate="TituloTextBox" Display="Dynamic" ErrorMessage="*" ToolTip="Campo Obrigatorio"></asp:RequiredFieldValidator>
                    Titulo do E-mail:
                </td>
                <td class="style2">
                    <asp:TextBox ID="TituloTextBox" runat="server" Width="550px" MaxLength="100" onkeyup="Contador(this)"
                        TabIndex="3"></asp:TextBox>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style1" style="vertical-align: top; padding-top: 5px">
                    Texto da Mensagem:<br />
                    &nbsp;
                </td>
                <td class="style2" style="vertical-align: top; padding-top: 5px">
                    <custom:CustomEditor ID="TextoTextBox" runat="server" Height="210px" Width="550px"
                        CssClass="CustomEditor" TabIndex="4" />
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <div style="font-size: 8pt; margin-top: -5px; text-align: center">
                        <input type="text" readonly="readonly" id="totalPlain" value="" style="border: 0;
                            font-size: 8pt; width: 24px; background-color: #F8F8F8; text-align: right" />
                        / 1000
                    </div>
                </td>
            </tr>
        </table>
        <br />
        <div style="text-align: center; background-color: White; border: 1px solid #87ae12;
            width: 400px; margin-left: 200px">
            <asp:Panel ID="codVerificadorPanel" runat="server" BackColor="#87ae12" ForeColor="White">
                Código Verificador
                <asp:Label ID="CodInvalidoLabel" runat="server" Text=""></asp:Label>
            </asp:Panel>
            <br />
            <div style="width: 300px; margin: 0 auto">
                <cc2:CaptchaControl ID="Captcha1" runat="server" CaptchaBackgroundNoise="Low" CaptchaLength="5"
                    CaptchaHeight="60" CaptchaWidth="300" CaptchaLineNoise="None" CaptchaMinTimeout="3"
                    CaptchaMaxTimeout="600" FontColor="#529E00" Width="300px" />
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                ControlToValidate="txtCaptcha">
            </asp:RequiredFieldValidator>
            <asp:TextBox ID="txtCaptcha" runat="server" MaxLength="5" Text="" Width="100px"></asp:TextBox>
            <div style="text-align: center; padding: 7px">
                <asp:Button ID="LimparTudoButton" runat="server" Text="Limpar Tudo" Width="110px"
                    CssClass="button" CausesValidation="false" OnClick="LimparTudoButton_Click" TabIndex="5" />
                <asp:Button ID="EnviarButton" runat="server" Text="Enviar" CausesValidation="true"
                    Width="110px" CssClass="button" Style="margin-left: 10px; margin-right: 11px"
                    OnClick="EnviarButton_Click" TabIndex="6" />
            </div>
        </div>
        <%--<asp:Panel ID="captchaPanel" runat="server" BackColor="White" Width="350px" Height="150px"
            BorderColor="Green" BorderWidth="1px">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div style="text-align: right; margin-right: 10px; margin-top: 10px">
                        <asp:Button ID="btnVerify" runat="server" Text="Enviar" CssClass="button" Width="75px"
                            CausesValidation="true" OnClick="btnVerify_Click" />
                        &nbsp;&nbsp;
                        <asp:Button ID="CancelarButton" runat="server" Text="Cancelar" CssClass="button"
                            Width="75px" OnClick="CancelarButton_Click" CausesValidation="false" />
                    </div>
                    <br />
                    <br />
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
        <cc3:ModalPopupExtender ID="captchaPanel_ModalPopupExtender" runat="server" DynamicServicePath=""
            Enabled="True" TargetControlID="EnviarButton" PopupControlID="captchaPanel" DropShadow="true"
            BackgroundCssClass="modalBackground">
        </cc3:ModalPopupExtender>--%>
    </asp:Panel>
    <script type="text/javascript">
        // on Application load
        debugger
        Sys.Application.add_load(function () {
            var editor = $find("<%= TextoTextBox.ClientID %>");
            var editPanel = editor.get_editPanel();
            var designPanel = editPanel.get_modePanels()[AjaxControlToolkit.HTMLEditor.ActiveModeType.Design];

            editPanel._setActive_saved = editPanel._setActive;
            editPanel._setActive = function () {
                if (this.get_activeMode() == AjaxControlToolkit.HTMLEditor.ActiveModeType.Design) {
                    var designPanel = this.get_activePanel();
                    designPanel.onContentChanged();
                }
                this._setActive_saved();
            };

            designPanel.onContentChanged = function () {
                if (parseInt((this._doc.body.innerText).length) > 1000) {
                    var myString = this._doc.body.innerText;
                    this._doc.body.innerText = myString.substring(0, myString.length - 1);

                    alert("Limite atingido!");
                    return false;
                }
                else {
                    var innerText;

                    if (AjaxControlToolkit.HTMLEditor.isIE) {
                        innerText = this._doc.body.innerText;
                    } else {
                        var div1 = document.createElement("div");
                        var html = new AjaxControlToolkit.HTMLEditor.jsDocument(true);
                        AjaxControlToolkit.HTMLEditor.__MozillaGetInnerText(div1, html);
                        innerText = html.toString();
                        delete div1;
                        delete html;
                    }

                    // Plain text length
                    var plainTextLength = (this._doc.body.innerText).length;

                    // Place here your code:
                    document.getElementById("totalPlain").value = plainTextLength;
                }
            }
        });
    </script>
</asp:Content>

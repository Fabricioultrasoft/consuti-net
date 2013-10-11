<%@ Page Title="" Language="C#" MasterPageFile="Anonimail.Master" AutoEventWireup="true"
    CodeBehind="Responder.aspx.cs" Inherits="Anonimail.WebForm2" %>

<%@ Register Namespace="Anonimail.Utilitarios" TagPrefix="custom" %>
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
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul>
        <li><a href="Default.aspx" accesskey="e" title="Enviar">ENVIAR</a></li>
        <li><a href="Responder.aspx" id="current" accesskey="r" title="Responder">RESPONDER</a></li>
        <li><a href="Contato.aspx" accesskey="c" title="Contato">CONTATO</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Panel ID="Panel1" runat="server" Width="700px">
        <div>
            <h3>
                Quero <strong>RESPONDER...</strong></h3>
        </div>
        <table style="padding: 5px; width: 100%;">
            <tr>
                <td class="style1">
                    <asp:RegularExpressionValidator ID="CodigoTextBoxRegularExpressionValidator" runat="server"
                        ControlToValidate="CodigoTextBox" Display="Dynamic" ErrorMessage="*" ToolTip="Email Inválido"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="CodigoTextBoxBoxRequiredFieldValidator" runat="server"
                        ControlToValidate="CodigoTextBox" Display="Dynamic" ErrorMessage="*" ForeColor="Red"
                        ToolTip="Campo Obrigatório"></asp:RequiredFieldValidator>
                    Código AnôniMail:
                </td>
                <td class="style2">
                    <asp:TextBox ID="CodigoTextBox" runat="server" Width="280px" MaxLength="100" TabIndex="1"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:RequiredFieldValidator ID="TituloTextBoxRequiredFieldValidator" runat="server"
                        ControlToValidate="TituloTextBox" Display="Dynamic" ErrorMessage="*" ToolTip="Campo Obrigatorio"></asp:RequiredFieldValidator>
                    Titulo da Resposta:
                </td>
                <td class="style2">
                    <asp:TextBox ID="TituloTextBox" runat="server" Width="550px" MaxLength="100" TabIndex="2"></asp:TextBox>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style1" style="vertical-align: top; padding-top: 5px">
                    Texto da Resposta:<br />
                    &nbsp;
                </td>
                <td class="style2" style="vertical-align: top; padding-top: 5px">
                    <custom:CustomEditor ID="TextoTextBox" runat="server" Height="310px" Width="550px"
                        CssClass="CustomEditor" TabIndex="3" />
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <div style="font-size: 8pt; margin-top: -5px">
                        <input type="text" readonly="readonly" id="totalPlain" value="" style="border: 0;
                            font-size: 8pt; width: 24px; background-color: #F8F8F8; text-align: right" />
                        / 1000
                    </div>
                    <div style="text-align: right; margin-top: -15px">
                        <asp:Button ID="LimparTudoButton" runat="server" Text="Limpar Tudo" Width="110px"
                            CssClass="button" CausesValidation="false" OnClick="LimparTudoButton_Click" />
                        <asp:Button ID="EnviarButton" runat="server" Text="Enviar" CausesValidation="true"
                            Width="110px" CssClass="button" Style="margin-left: 10px; margin-right: 20px"
                            OnClick="EnviarButton_Click" />
                    </div>
                </td>
            </tr>
        </table>
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

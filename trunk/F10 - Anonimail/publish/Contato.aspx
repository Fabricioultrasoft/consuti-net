<%@ Page Title="" Language="C#" MasterPageFile="Anonimail.Master" AutoEventWireup="true"
    CodeBehind="Contato.aspx.cs" Inherits="Anonimail.WebForm3" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc3" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc2" %>
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
        <li><a href="Default.aspx" accesskey="e" title="Enviar">ENVIAR</a></li>
        <li><a href="Responder.aspx" accesskey="r" title="Responder">RESPONDER</a></li>
        <li><a href="Contato.aspx" id="current" accesskey="c" title="Contato">CONTATO</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Panel ID="Panel1" runat="server" Width="700px">
        <div>
            <h3>
                Enviar <strong>CONTATO...</strong></h3>
        </div>
        <table style="padding: 5px; width: 100%;">
            <tr>
                <td class="style1">
                    <asp:RequiredFieldValidator ID="NomeContatoTextBoxRequiredFieldValidator" runat="server"
                        ControlToValidate="NomeContatoTextBox" Display="Dynamic" ErrorMessage="*" ForeColor="Red"
                        ToolTip="Campo Obrigatório"></asp:RequiredFieldValidator>
                    Nome:
                </td>
                <td class="style2">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="NomeContatoTextBox" runat="server" Width="250px" MaxLength="100"
                                TabIndex="1" AutoPostBack="True"></asp:TextBox>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:RegularExpressionValidator ID="EmailContatoTextBoxRegularExpressionValidator"
                        runat="server" ControlToValidate="EmailContatoTextBox" Display="Dynamic" ErrorMessage="*"
                        ToolTip="Email Inválido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    Email:
                </td>
                <td class="style2">
                    <asp:TextBox ID="EmailContatoTextBox" runat="server" Width="250px" MaxLength="100"
                        TabIndex="2"></asp:TextBox>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:RequiredFieldValidator ID="AssuntoContatoTextBoxRequiredFieldValidator" runat="server"
                        ControlToValidate="AssuntoContatoTextBox" Display="Dynamic" ErrorMessage="*" ToolTip="Campo Obrigatorio"></asp:RequiredFieldValidator>
                    Assunto:
                </td>
                <td class="style2">
                    <asp:TextBox ID="AssuntoContatoTextBox" runat="server" Width="550px" MaxLength="100" TabIndex="3"></asp:TextBox>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style1" style="vertical-align: top; padding-top: 5px">
                    Texto do Contato:<br />
                    &nbsp;
                </td>
                <td class="style2" style="vertical-align: top; padding-top: 5px">
                    <custom:CustomEditor ID="TextoTextBox" runat="server" Height="210px" Width="545px"
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
        <div style="text-align: right; padding: 7px">
            <asp:Button ID="LimparTudoButton" runat="server" Text="Limpar Tudo" Width="110px"
                CssClass="button" CausesValidation="false" OnClick="LimparTudoButton_Click" TabIndex="5" />
            <asp:Button ID="EnviarButton" runat="server" Text="Enviar" CausesValidation="true"
                Width="110px" CssClass="button" Style="margin-left: 10px; margin-right: 28px"
                OnClick="EnviarButton_Click" TabIndex="6" />
        </div>
        </asp:Panel>
        <script type="text/javascript">
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

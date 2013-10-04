<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="leptonbrasil.Contato.Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="Stylesheet" href="../Estilos/Contato.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="ConteudoContato">
        <asp:Panel ID="PnlContato" runat="server" DefaultButton="btnEnviar">
            <div style="text-align: center">
                <br />
                Entre em contato com a Lepton através do formulário abaixo.<br /> <br />
                <br />
            </div>
            <div id="elementosForm">
                Nome Completo:<asp:RequiredFieldValidator ID="rfvNome" runat="server" ControlToValidate="txbNome"
                    Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="rfvNome_ValidatorCalloutExtender" runat="server"
                    Enabled="True" TargetControlID="rfvNome">
                </cc1:ValidatorCalloutExtender>
                <br />
                <asp:TextBox ID="txbNome" runat="server" Width="450px" MaxLength="200"></asp:TextBox>
                <br />
                <br />
                Email:<asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txbEmail"
                    Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="rfvEmail_ValidatorCalloutExtender" runat="server"
                    Enabled="True" TargetControlID="rfvEmail">
                </cc1:ValidatorCalloutExtender>
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txbEmail"
                    Display="None" ErrorMessage="Formato Inválido de Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <cc1:ValidatorCalloutExtender ID="revEmail_ValidatorCalloutExtender" runat="server"
                    Enabled="True" TargetControlID="revEmail">
                </cc1:ValidatorCalloutExtender>
                <br />
                <asp:TextBox ID="txbEmail" runat="server" Width="450px" MaxLength="200"></asp:TextBox>
                <br />
                <br />
                Assunto:<asp:RequiredFieldValidator ID="rfvAssunto" runat="server" ControlToValidate="txbAssunto"
                    Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="rfvAssunto_ValidatorCalloutExtender" runat="server"
                    Enabled="True" TargetControlID="rfvAssunto">
                </cc1:ValidatorCalloutExtender>
                <br />
                <asp:TextBox ID="txbAssunto" runat="server" Width="450px" MaxLength="200"></asp:TextBox>
                <br />
                <br />
                Mensagem:<asp:RequiredFieldValidator ID="rfvMensagem" runat="server" ControlToValidate="txbMensagem"
                    Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="rfvMensagem_ValidatorCalloutExtender" runat="server"
                    Enabled="True" TargetControlID="rfvMensagem">
                </cc1:ValidatorCalloutExtender>
                <br />
                <asp:TextBox ID="txbMensagem" runat="server" Width="450px" TextMode="MultiLine" Height="100px"></asp:TextBox>
                <br />
                <br />
                <br />
                <div id="btnsForm">
                    <asp:Button ID="btnEnviar" runat="server" Text="Enviar" Width="100px" OnClick="btnEnviar_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCancelar" runat="server" Text="Limpar Tudo" Width="100px" CausesValidation="False"
                        OnClick="btnCancelar_Click" />
                </div>
                <br />
            </div>
            <br />
            <br />
            <div>
                <div id="imgEmailEsquerda">
                    <a href="mailto:%20contato.radioprotecao@leptonbrasil.com.br">
                        <asp:Image ID="imgEmailContato" runat="server" ImageUrl="~/Graficos/EmailContato.png"
                            ImageAlign="Middle" /></a>
                </div>
                <div id="imgEmailDireita">
                    <br />
                    Ou envie emails para <a href="mailto:%20contato.radioprotecao@leptonbrasil.com.br">contato.radioprotecao@leptonbrasil.com.br</a></div>
                <br />
            </div>
        </asp:Panel>
    </div>
</asp:Content>

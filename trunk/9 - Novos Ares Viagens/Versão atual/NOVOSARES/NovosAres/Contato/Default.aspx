<%@ Page Title="" Language="C#" MasterPageFile="~/Externa.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="NovosAres.Contato" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="Stylesheet" href="../Estilos/Contato.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="telaContato">
    <br /><br />
        <div id="formContato">
            <asp:Panel ID="PnlContatoFormulario" runat="server" HorizontalAlign="Center" Style="text-align: left"
                Width="100%" Height="700px" DefaultButton="BtnContatoEnviar" BackImageUrl="~/Graficos/BackOrangeTransparent.png">
                <div id="tituloPag">
                    <br />
                    <h2>
                        Contato Novos Ares Viagens
                    </h2>
                    <hr class="telaContato" style="width: 90%" />
                </div>
                <div style="margin-left: 200px">
                    <asp:RequiredFieldValidator ID="RfvContatoNome" runat="server" ControlToValidate="txbContatoNome"
                        Display="None" ErrorMessage="Campo Obrigatório."></asp:RequiredFieldValidator>
                    <cc1:ValidatorCalloutExtender ID="RfvContatoNome_ValidatorCalloutExtender" runat="server"
                        Enabled="True" TargetControlID="RfvContatoNome">
                    </cc1:ValidatorCalloutExtender>
                    <br />
                    Nome*:<br />
                    <asp:TextBox ID="txbContatoNome" runat="server" Width="400px" MaxLength="100" CssClass="txbContato"
                        TabIndex="1"></asp:TextBox>
                    
                    <br />
                    <asp:RequiredFieldValidator ID="RfvContatoEmail" runat="server" ControlToValidate="txbContatoEmail"
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
                    Email*:<br />
                    <asp:TextBox ID="txbContatoEmail" runat="server" Width="400px" CssClass="txbContato"
                        TabIndex="2"></asp:TextBox>
                    
                    <br />                                    
                    <asp:RequiredFieldValidator ID="RfvContatoTelefone" runat="server" ControlToValidate="txbContatoTelefone"
                        Display="None" ErrorMessage="Campo Obrigatório."></asp:RequiredFieldValidator>
                    <cc1:ValidatorCalloutExtender ID="RfvContatoTelefone_ValidatorCalloutExtender" runat="server"
                        Enabled="True" TargetControlID="RfvContatoTelefone">
                    </cc1:ValidatorCalloutExtender>
                    <br />
                    Telefone*:<br />
                    (<asp:TextBox ID="txbDDD" runat="server" Width="28px" MaxLength="2" CssClass="txbContato"
                        TabIndex="3"></asp:TextBox>)
                    <cc1:FilteredTextBoxExtender ID="txbDDD_FilteredTextBoxExtender" runat="server" 
                        Enabled="True" TargetControlID="txbDDD" ValidChars="1234567890">
                    </cc1:FilteredTextBoxExtender>
                     <asp:TextBox ID="txbContatoTelefone" runat="server" CssClass="txbContato" MaxLength="8"
                        TabIndex="3" Width="100px"></asp:TextBox>
                    <cc1:FilteredTextBoxExtender ID="txbContatoTelefone_FilteredTextBoxExtender" 
                        runat="server" Enabled="True" TargetControlID="txbContatoTelefone" 
                        ValidChars="1234567890">
                    </cc1:FilteredTextBoxExtender>
                    <br />
                    <asp:RequiredFieldValidator ID="RfvContatoAssunto" runat="server" ControlToValidate="txbContatoAssunto"
                        Display="None" ErrorMessage="Digite o Assunto."></asp:RequiredFieldValidator>
                    <cc1:ValidatorCalloutExtender ID="RfvContatoAssunto_ValidatorCalloutExtender" runat="server"
                        Enabled="True" TargetControlID="RfvContatoAssunto">
                    </cc1:ValidatorCalloutExtender>
                    <br />
                    Assunto*:<br />
                    <asp:TextBox ID="txbContatoAssunto" runat="server" CssClass="txbContato" MaxLength="100"
                        TabIndex="1" Width="400px"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RfvContatoMensagem" runat="server" ControlToValidate="txbContatoDescricao"
                        Display="None" ErrorMessage="Campo Obrigatório."></asp:RequiredFieldValidator>
                    <cc1:ValidatorCalloutExtender ID="RfvContatoMensagem_ValidatorCalloutExtender" runat="server"
                        Enabled="True" TargetControlID="RfvContatoMensagem">
                    </cc1:ValidatorCalloutExtender>
                    <br />
                    Mensagem*:<br />
                    <asp:TextBox ID="txbContatoDescricao" runat="server" TextMode="MultiLine" Rows="7"
                        Width="400px" CssClass="txbContato" TabIndex="5"></asp:TextBox>
                    <br />
                    <br />
                    <br />
                </div>
                <div style="text-align: center">
                    <asp:Button ID="BtnContatoEnviar" runat="server" OnClick="BtnContatoEnviar_Click"
                        TabIndex="6" Text="Enviar" Width="100px" Height="30px" CssClass="btnContato" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" CausesValidation="False" OnClick="BtnContatoLimpar_Click"
                        Text="Limpar" Width="100px" Height="30px" TabIndex="7" CssClass="btnContato" />
                </div>
                <br />
                <br />
            </asp:Panel>            
        </div>
    </div>
</asp:Content>

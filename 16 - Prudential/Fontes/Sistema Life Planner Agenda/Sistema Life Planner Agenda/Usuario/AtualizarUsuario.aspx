<%@ Page Title="Atualizar Cadastro de Usuário - SISLPA" Language="C#" MasterPageFile="~/Interna.Master"
    AutoEventWireup="true" CodeBehind="AtualizarUsuario.aspx.cs" Inherits="Sistema_Life_Planner_Agenda.Usuario.AtualizarUsuario" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
    <li><a href="..\Default.aspx">Home</a></li>
    <li><a href="..\Contato\PesquisarContato.aspx">Contatos</a></li>
    <li><a href="..\Agenda\PesquisarAgenda.aspx">Agenda do LP</a></li>
    <li><a href="..\SITPLAN\PesquisarSITPLAN.aspx">SIT PLAN</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="tituloTela">
            ATUALIZAR CADASTRO DE USUÁRIO
        </div>
        <div class="conteudoTela">
            <asp:Panel ID="cadastroUsuarioPanel" runat="server">
                <fieldset>
                    <legend>Dados de Acesso</legend>
                    <table class="Formulario" >
                        <tr>
                            <td class="alinhaDireita">
                                <span class="obrigatorio">*</span>E-mail:
                            </td>
                            <td>
                                <asp:TextBox ID="emailTextBox" runat="server" Width="300px" TabIndex="1" 
                                    MaxLength="100" Enabled="false"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="emailTextBox" Display="Dynamic" ErrorMessage="*" 
                                    ToolTip="Campo Obrigatório!"></asp:RequiredFieldValidator>
                                &nbsp;<asp:RegularExpressionValidator ID="EmailTextBoxRegularExpressionValidator" 
                                    runat="server" ControlToValidate="emailTextBox" Display="Dynamic" 
                                    ErrorMessage="*" ToolTip="Email Inválido" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                <span class="obrigatorio">*</span>Senha:
                            </td>
                            <td>
                                <asp:TextBox ID="senhaTextBox" runat="server" Width="100px" TabIndex="3" MaxLength="50"
                                    TextMode="Password"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="senhaTextBox" Display="Dynamic" ErrorMessage="*" 
                                    ToolTip="Campo Obrigatório!"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                <span class="obrigatorio">*</span>Confirma Senha:
                            </td>
                            <td>
                                <asp:TextBox ID="confirmaSenhaTextBox" runat="server" Width="100px" TabIndex="4"
                                    MaxLength="50" TextMode="Password"></asp:TextBox>
                                &nbsp;<asp:CompareValidator ID="CompareValidator2" runat="server" 
                                    ControlToCompare="senhaTextBox" ControlToValidate="confirmaSenhaTextBox" 
                                    Display="Dynamic" ErrorMessage="*" ToolTip="Senha não confere!"></asp:CompareValidator>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    ControlToValidate="confirmaSenhaTextBox" ErrorMessage="*" 
                                    ToolTip="Campo Obrigatório!"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                    <br />
                </fieldset>
                <fieldset>
                    <legend>Dados Cadastrais</legend>
                    <table class="Formulario" >
                        <tr>
                            <td class="alinhaDireita">
                                <span class="obrigatorio">*</span>Nome Completo:
                            </td>
                            <td>
                                <asp:TextBox ID="nomeCompletoTextBox" runat="server" Width="300px" 
                                    TabIndex="5" MaxLength="100"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                    ControlToValidate="nomeCompletoTextBox" Display="Dynamic" ErrorMessage="*" 
                                    ToolTip="Campo Obrigatório!"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                <span class="obrigatorio">*</span>Telefone:
                            </td>
                            <td>
                                <asp:TextBox ID="DDDTextBox" runat="server" Width="20px" TabIndex="6" 
                                    MaxLength="2"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="DDDTextBox_FilteredTextBoxExtender" 
                                    runat="server" Enabled="True" TargetControlID="DDDTextBox" 
                                    ValidChars="1234567890">
                                </cc1:FilteredTextBoxExtender>
                                &nbsp;<asp:TextBox ID="telefoneTextBox" runat="server" MaxLength="9" TabIndex="6" 
                                    Width="70px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="telefoneTextBox0_FilteredTextBoxExtender" 
                                    runat="server" Enabled="True" TargetControlID="telefoneTextBox" 
                                    ValidChars="1234567890">
                                </cc1:FilteredTextBoxExtender>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                    ControlToValidate="DDDTextBox" Display="Dynamic" ErrorMessage="*" 
                                    ToolTip="Campo Obrigatório!"></asp:RequiredFieldValidator>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                    ControlToValidate="telefoneTextBox" Display="Dynamic" ErrorMessage="*" 
                                    ToolTip="Campo Obrigatório!"></asp:RequiredFieldValidator>
                                &nbsp;<asp:RegularExpressionValidator ID="EmailTextBoxRegularExpressionValidator1" 
                                    runat="server" ControlToValidate="DDDTextBox" Display="Dynamic" 
                                    ErrorMessage="*" ToolTip="DDD Inválido" ValidationExpression="\d{2}"></asp:RegularExpressionValidator>
                                &nbsp;<asp:RegularExpressionValidator ID="EmailTextBoxRegularExpressionValidator2" 
                                    runat="server" ControlToValidate="telefoneTextBox" Display="Dynamic" 
                                    ErrorMessage="*" ToolTip="Telefone Inválido" ValidationExpression="\d{8,9}"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                    </table>
                    <br />
                </fieldset>
                <fieldset>
                    <legend>Configurações de Agenda do Google</legend>
                    <table class="Formulario" >
                        <tr>
                            <td class="alinhaDireita">
                                E-mail do Google:
                            </td>
                            <td>
                                <asp:TextBox ID="emailGoogleTextBox" runat="server" Width="300px" TabIndex="7" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                Senha do E-mail:
                            </td>
                            <td>
                                <asp:TextBox ID="SenhaEmailGoogleTextBox" runat="server" Width="100px" TabIndex="8"
                                    MaxLength="100" TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                </fieldset>
                <div class="barraBotoes">
                    <asp:Button ID="cancelarButton" runat="server" Text="Cancelar" CssClass="botaoCancelar"
                        TabIndex="9" OnClick="cancelarButton_Click" />
                    <asp:Button ID="okButton" runat="server" Text="OK" CssClass="botaoSalvar" TabIndex="10"
                        OnClick="okButton_Click" />
                </div>
            </asp:Panel>
            <br />
        </div>
    </div>
</asp:Content>

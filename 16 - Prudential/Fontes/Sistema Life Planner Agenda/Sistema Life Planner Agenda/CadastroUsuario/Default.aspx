<%@ Page Title="" Language="C#" MasterPageFile="~/Externa.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Sistema_Life_Planner_Agenda.CadastroUsuario.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 600px; margin: 0 auto">
        <div class="tituloTela">
            CADASTRO DE USUÁRIO
        </div>
        <div class="conteudoTela">
            <asp:Panel ID="cadastroUsuarioPanel" runat="server">
                <fieldset>
                    <legend>Dados de Acesso</legend>                    
                    <table class="Formulario" style="width: 500px; margin: 0 auto;" >
                        <tr>
                            <td class="alinhaDireita">
                                <span class="obrigatorio">*</span>E-mail:
                            </td>
                            <td>
                                <asp:TextBox ID="emailTextBox" runat="server" Width="200px" TabIndex="1" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                <span class="obrigatorio">*</span>Confirma E-mail:
                            </td>
                            <td>
                                <asp:TextBox ID="confirmaEmailTextBox" runat="server" Width="200px" TabIndex="2" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                <span class="obrigatorio">*</span>Senha:
                            </td>
                            <td>
                                <asp:TextBox ID="senhaTextBox" runat="server" Width="200px" TabIndex="3" MaxLength="50" TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                <span class="obrigatorio">*</span>Confirma Senha:
                            </td>
                            <td>
                                <asp:TextBox ID="confirmaSenhaTextBox" runat="server" Width="200px" TabIndex="4" MaxLength="50" TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>                        
                    </table>
                    <br />
                </fieldset>
                <fieldset>
                    <legend>Dados Cadastrais</legend>
                    <table class="Formulario" style="width: 500px; margin: 0 auto;" >
                        <tr>
                            <td class="alinhaDireita">
                                <span class="obrigatorio">*</span>Nome Completo:
                            </td>
                            <td>
                                <asp:TextBox ID="nomeCompletoTextBox1" runat="server" Width="200px" TabIndex="5" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                <span class="obrigatorio">*</span>Telefone:
                            </td>
                            <td>
                                <asp:TextBox ID="telefoneTextBox" runat="server" Width="200px" TabIndex="6" MaxLength="20"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                </fieldset>
                <fieldset>
                    <legend>Configurações de Agenda do Google</legend>
                    <table class="Formulario" style="width: 500px; margin: 0 auto;" >
                        <tr>
                            <td class="alinhaDireita">
                                E-mail do Google:
                            </td>
                            <td>
                                <asp:TextBox ID="emailGoogleTextBox" runat="server" Width="200px" TabIndex="7" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                Senha do E-mail:
                            </td>
                            <td>
                                <asp:TextBox ID="SenhaEmailGoogleTextBox" runat="server" Width="200px" TabIndex="8" MaxLength="100" TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                </fieldset>

                <div class="barraBotoes">
                    <asp:Button ID="cancelarButton" runat="server" Text="Cancelar" 
                        CssClass="botaoCancelar" TabIndex="9" onclick="cancelarButton_Click" />
                    <asp:Button ID="okButton" runat="server" Text="OK" CssClass="botaoSalvar" TabIndex="10" />
                </div>
            </asp:Panel>
            <br />
        </div>
    </div>
</asp:Content>

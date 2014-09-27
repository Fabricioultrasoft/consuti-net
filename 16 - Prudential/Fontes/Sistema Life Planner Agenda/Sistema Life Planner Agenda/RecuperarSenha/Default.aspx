<%@ Page Title="Recuperação de Senha do SisLPA" Language="C#" MasterPageFile="~/Externa.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Sistema_Life_Planner_Agenda.RecuperarSenha.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="recuperarSenha">
        <div class="tituloTela">
            RECUPERAÇÃO DE SENHA
        </div>
        <div class="conteudoTela">
            <asp:Panel ID="loginPanel" runat="server" DefaultButton="okButton">
                <fieldset>
                    <legend>Informação para Recuperação</legend>
                    <br />
                    <table style="width: 400px; margin: 0 auto">
                        <tr>
                            <td class="alinhaDireita">
                                <span class="obrigatorio">*</span>E-mail Cadastrado:
                            </td>
                            <td>
                                <asp:TextBox ID="emailTextBox" runat="server" Width="200px" TabIndex="1" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                </fieldset>
                <div class="barraBotoes">
                    <asp:Button ID="cancelarButton" runat="server" Text="Voltar" CssClass="botaoVoltar"
                        TabIndex="9" OnClick="cancelarButton_Click" />
                    <asp:Button ID="okButton" runat="server" Text="OK" CssClass="botaoSalvar" TabIndex="3"
                        OnClick="okButton_Click" />
                </div>
            </asp:Panel>
            <br />
        </div>
    </div>
    <br />
    <br />
    <br />
</asp:Content>

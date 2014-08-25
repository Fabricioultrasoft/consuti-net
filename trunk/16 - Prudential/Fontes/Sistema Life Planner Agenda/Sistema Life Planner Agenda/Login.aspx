<%@ Page Title="Login Sistema Life Planner Agenda" Language="C#" MasterPageFile="~/Externa.Master"
    AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Sistema_Life_Planner_Agenda.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="login">
        <div class="tituloTela">
            ACESSO AO SISTEMA LPA
        </div>
        <div class="conteudoTela">
            <asp:Panel ID="loginPanel" runat="server" DefaultButton="okButton">
                <fieldset>
                    <legend>Login</legend>
                    <br />
                    <table style="width: 300px; margin: 0 auto">
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
                                &nbsp;
                            </td>
                            <td class="alinhaDireita" style="padding-right: 35px">
                                <asp:LinkButton ID="novoUsuarioLinkButton" runat="server" Font-Size="8pt" TabIndex="4"
                                    OnClick="novoUsuarioLinkButton_Click">Novo Usuário</asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                <span class="obrigatorio">*</span>Senha:
                            </td>
                            <td>
                                <asp:TextBox ID="senhaTextBox" runat="server" Width="200px" TabIndex="2" MaxLength="50"
                                    TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                &nbsp;
                            </td>
                            <td class="alinhaDireita" style="padding-right: 35px">
                                <asp:LinkButton ID="esqueciSenhaLinkButton" runat="server" Font-Size="8pt" TabIndex="5"
                                    OnClick="esqueciSenhaLinkButton_Click">Esquecia a Senha</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <br />
                </fieldset>
                <div class="barraBotoes">
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

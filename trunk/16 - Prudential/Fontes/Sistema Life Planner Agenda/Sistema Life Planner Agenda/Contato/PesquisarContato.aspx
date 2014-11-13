<%@ Page Title="Pesquisar Contatos - SISLPA" Language="C#" MasterPageFile="~/Interna.Master"
    AutoEventWireup="true" CodeBehind="PesquisarContato.aspx.cs" Inherits="Sistema_Life_Planner_Agenda.Contato.PesquisarContato" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
    <li><a href="..\Default.aspx">Home</a></li>
    <li class="selected"><a href="PesquisarContato.aspx">Contatos</a></li>
    <li><a href="..\Agenda\PesquisarAgenda.aspx">Agenda do LP</a></li>
    <li><a href="..\SITPLAN\PesquisarSITPLAN.aspx">SIT PLAN</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="tituloTela">
            PESQUISAR CONTATO
        </div>
        <div class="conteudoTela">
            <asp:Panel ID="PesquisaContatoPanel" runat="server">
                <fieldset>
                    <legend>Filtro</legend>
                    <table class="Formulario">
                        <tr>
                            <td class="alinhaDireita">
                                Nome:
                            </td>
                            <td>
                                <asp:TextBox ID="nomeTextBox" runat="server" Width="400px" TabIndex="1" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                Recomendante:
                            </td>
                            <td>
                                <asp:DropDownList ID="RecomendanteDropDownList" runat="server" Width="400px" TabIndex="2">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                Status:
                            </td>
                            <td>
                                <asp:DropDownList ID="StatusDropDownList" runat="server" Width="200px" TabIndex="2">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                Telefone:
                            </td>
                            <td>
                                <asp:TextBox ID="DDDTelefoneTextBox" runat="server" MaxLength="2" TabIndex="3" Width="16px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="DDDTelefoneTextBox_FilteredTextBoxExtender" runat="server"
                                    Enabled="True" TargetControlID="DDDTelefoneTextBox" ValidChars="1234567890">
                                </cc1:FilteredTextBoxExtender>
                                &nbsp;<asp:TextBox ID="TelefoneTextBox" runat="server" MaxLength="9" TabIndex="3"
                                    Width="65px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="TelefoneTextBox_FilteredTextBoxExtender" runat="server"
                                    Enabled="True" TargetControlID="TelefoneTextBox" ValidChars="1234567890">
                                </cc1:FilteredTextBoxExtender>
                            </td>
                        </tr>
                    </table>
                    <div class="barraBotoes">
                        <asp:Button ID="pesquisarButton" runat="server" Text="   Pesquisar" CssClass="botaoPesquisar"
                            TabIndex="9" OnClick="pesquisarButton_Click" />
                        <asp:Button ID="limparButton" runat="server" Text="Limpar" CssClass="botaoLimpar"
                            TabIndex="10" OnClick="limparButton_Click" />
                        <asp:Button ID="novoButton" runat="server" Text="Novo" CssClass="botaoNovo" TabIndex="11"
                            OnClick="novoButton_Click" />
                        <asp:Button ID="loteButton" runat="server" Text="Lote" CssClass="botaoLote" TabIndex="12"
                            OnClick="loteButton_Click" />
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Resultado</legend>
                    <asp:GridView ID="ContatosGridView" runat="server" CellPadding="4" ForeColor="#333333"
                        GridLines="None" Width="100%" AutoGenerateColumns="False" EnableModelValidation="True"
                        OnRowCommand="ContatosGridView_Click" EmptyDataText="Nenhum resultado encontrado."
                        AllowPaging="True" AllowSorting="True" PageSize="10" BorderColor="#003366" BorderStyle="Solid"
                        BorderWidth="1px" CellSpacing="2" OnPageIndexChanging="ContatosGridView_PageIndexChanging"
                        OnSorting="ContatosGridView_Sorting">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:TemplateField HeaderText="#">
                                <HeaderStyle HorizontalAlign="Center" Width="35px" />
                                <ItemStyle HorizontalAlign="Center" Font-Bold="true" />
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome">
                                <ItemStyle CssClass="espacoTabelas" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Recomendante" DataField="Recomendante" SortExpression="Recomendante">
                                <ItemStyle CssClass="espacoTabelas" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Status" DataField="Status" SortExpression="Status">
                                <ItemStyle CssClass="espacoTabelas" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Telefone Princ." DataField="TelefonePrincipal" SortExpression="TelefonePrincipal">
                                <ItemStyle CssClass="espacoTabelas" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Data do Cadastro" DataField="DataCadastro" SortExpression="DataCadastro">
                                <ItemStyle CssClass="espacoTabelas" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Alterar">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgBtnAlterar" runat="server" CausesValidation="False" CommandArgument='<%# Bind("Id") %>'
                                        CommandName="Alterar" ImageUrl="~/Estilos/Imgs/edit.png"></asp:ImageButton>
                                </ItemTemplate>
                                <ItemStyle Width="50px" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Excluir">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgBtnExcluir" runat="server" CausesValidation="False" CommandArgument='<%# Bind("Id") %>'
                                        CommandName="Excluir" ImageUrl="~/Estilos/Imgs/no.png"></asp:ImageButton>
                                    <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender" runat="server" TargetControlID="imgBtnExcluir"
                                        ConfirmText="Confirma a exclusão do contato?">
                                    </cc1:ConfirmButtonExtender>
                                </ItemTemplate>
                                <ItemStyle Width="50px" HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Height="30px" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <PagerSettings Position="Bottom" Mode="Numeric" />
                    </asp:GridView>
                    <br />
                </fieldset>
            </asp:Panel>
            <br />
        </div>
    </div>
</asp:Content>

<%@ Page Title="Pesquisar na Agenda do LP - SISLPA" Language="C#" MasterPageFile="~/Interna.Master"
    AutoEventWireup="true" CodeBehind="PesquisarAgenda.aspx.cs" Inherits="Sistema_Life_Planner_Agenda.Agenda.PesquisarAgenda" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
    <li><a href="../Default.aspx">Home</a></li>
    <li><a href="../Contato/PesquisarContato.aspx">Contatos</a></li>
    <li class="selected"><a href="PesquisarAgenda.aspx">Agenda do LP</a></li>
    <li><a href="../SITPLAN/PesquisarSITPLAN.aspx">SIT PLAN</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="tituloTela">
            PESQUISAR COMPROMISSO NA AGENDA
        </div>
        <div class="conteudoTela">
            <asp:Panel ID="PesquisaAgendaPanel" runat="server">
                <fieldset>
                    <legend>Filtro</legend>
                    <table class="Formulario">
                        <tr>
                            <td class="alinhaDireita" style="width: 110px">
                                Período De:
                            </td>
                            <td style="width: 115px">
                                <div style="width: 110px;">
                                    <asp:TextBox ID="PeriodoDeTextBox" runat="server" Width="70px" TabIndex="1" MaxLength="10"></asp:TextBox>
                                    <asp:ImageButton ID="deImageButton" runat="server" CausesValidation="False" ImageAlign="Middle"
                                        ImageUrl="~/Estilos/Imgs/Calendar.png" ToolTip="Selecione a data no calendário"
                                        TabIndex="2" />
                                    <cc1:CalendarExtender ID="PeriodoDeTextBox_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="PeriodoDeTextBox" PopupButtonID="deImageButton" TodaysDateFormat=" d MMMM yyyy"
                                        Format="dd/MM/yyyy">
                                    </cc1:CalendarExtender>
                                </div>
                            </td>
                            <td class="alinhaDireita" style="width: 50px">
                                Até:
                            </td>
                            <td>
                                <div style="width: 110px;">
                                    <asp:TextBox ID="PeriodoAteTextBox" runat="server" Width="70px" TabIndex="3" MaxLength="10"></asp:TextBox>
                                    <asp:ImageButton ID="AteImageButton" runat="server" CausesValidation="False" ImageAlign="Middle"
                                        ImageUrl="~/Estilos/Imgs/Calendar.png" ToolTip="Selecione a data no calendário"
                                        TabIndex="4" />
                                    <cc1:CalendarExtender ID="PeriodoAteTextBox_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="PeriodoAteTextBox" PopupButtonID="AteImageButton" TodaysDateFormat=" d MMMM yyyy"
                                        Format="dd/MM/yyyy">
                                    </cc1:CalendarExtender>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <table class="Formulario">
                        <tr>
                            <td class="alinhaDireita" style="width: 110px">
                                Contato:
                            </td>
                            <td>
                                <asp:DropDownList ID="ContatoDropDownList" runat="server" Width="400px" TabIndex="5">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <div class="barraBotoes">
                        <asp:Button ID="pesquisarButton" runat="server" Text="   Pesquisar" CssClass="botaoPesquisar"
                            TabIndex="6" OnClick="pesquisarButton_Click" />
                        <asp:Button ID="limparButton" runat="server" Text="Limpar" CssClass="botaoLimpar"
                            TabIndex="7" OnClick="limparButton_Click" />
                        <asp:Button ID="novoButton" runat="server" Text="Novo" CssClass="botaoNovo" TabIndex="8"
                            OnClick="novoButton_Click" />
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Resultado</legend>
                    <asp:GridView ID="AgendaGridView" runat="server" CellPadding="4" ForeColor="#333333"
                        GridLines="None" Width="100%" AutoGenerateColumns="False" EnableModelValidation="True"
                        OnRowCommand="AgendaGridView_Click" EmptyDataText="Nenhum resultado encontrado."
                        AllowPaging="True" AllowSorting="True" PageSize="10" BorderColor="#003366" BorderStyle="Solid"
                        BorderWidth="1px" CellSpacing="2" OnPageIndexChanging="AgendaGridView_PageIndexChanging"
                        OnSorting="AgendaGridView_Sorting" RowStyle-Height="40px">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:TemplateField HeaderText="#">
                                <HeaderStyle HorizontalAlign="Center" Width="35px" />
                                <ItemStyle HorizontalAlign="Center" Font-Bold="true" />
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Nome" HeaderText="Contato" SortExpression="Nome">
                                <ItemStyle CssClass="espacoTabelas" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Data" HeaderText="Data" SortExpression="Data">
                                <ItemStyle CssClass="espacoTabelas" Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Hora" DataField="Hora" SortExpression="Hora">
                                <ItemStyle CssClass="espacoTabelas" Width="50px" />
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
                                        ConfirmText="Confirma a exclusão do compromisso?">
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

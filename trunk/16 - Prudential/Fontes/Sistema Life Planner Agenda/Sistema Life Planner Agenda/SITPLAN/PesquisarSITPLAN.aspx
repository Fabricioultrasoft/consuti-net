<%@ Page Title="Pesquisar SIT PLAN - SISLPA" Language="C#" MasterPageFile="~/Interna.Master"
    AutoEventWireup="true" CodeBehind="PesquisarSITPLAN.aspx.cs" Inherits="Sistema_Life_Planner_Agenda.SITPLAN.PesquisarSITPLAN" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
    <li><a href="..\Default.aspx">Home</a></li>
    <li><a href="..\Contato\PesquisarContato.aspx">Contatos</a></li>
    <li><a href="..\Agenda\PesquisarAgenda.aspx">Agenda do LP</a></li>
    <li class="selected"><a href="PesquisarSITPLAN.aspx">SIT PLAN</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
        <div class="tituloTela">
            PESQUISAR SIT PLAN
        </div>
        <div class="conteudoTela">
            <asp:Panel ID="PesquisaSITPLANPanel" runat="server">
                <fieldset>
                    <legend>Filtro</legend>
                    <table class="Formulario">
                        <tr>
                            <td class="alinhaDireita" style="width: 90px">
                                Período De:
                            </td>
                            <td style="width: 115px">
                                <div style="width: 110px;">
                                    <asp:TextBox ID="PeriodoDeTextBox" runat="server" Width="70px" TabIndex="1" MaxLength="100"></asp:TextBox>
                                    <cc1:CalendarExtender ID="PeriodoDeTextBox_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="PeriodoDeTextBox" PopupButtonID="deImageButton"
                                        TodaysDateFormat=" d MMMM yyyy" Format="dd/MM/yyyy">
                                    </cc1:CalendarExtender>
                                    <asp:ImageButton ID="deImageButton" runat="server" CausesValidation="False" ImageAlign="Middle"
                                        ImageUrl="~/Estilos/Imgs/Calendar.png" ToolTip="Selecione a data no calendário"
                                        TabIndex="5" />
                                </div>
                            </td>
                            <td class="alinhaDireita" style="width:50px">
                                Até:
                            </td>
                            <td>
                                <div style="width: 110px;">
                                    <asp:TextBox ID="PeriodoAteTextBox" runat="server" Width="70px" TabIndex="1" MaxLength="100"></asp:TextBox>
                                    <cc1:CalendarExtender ID="PeriodoAteTextBox_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="PeriodoAteTextBox" PopupButtonID="AteImageButton"
                                        TodaysDateFormat=" d MMMM yyyy" Format="dd/MM/yyyy">
                                    </cc1:CalendarExtender>
                                    <asp:ImageButton ID="AteImageButton" runat="server" CausesValidation="False" ImageAlign="Middle"
                                        ImageUrl="~/Estilos/Imgs/Calendar.png" ToolTip="Selecione a data no calendário"
                                        TabIndex="5" /></div>
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
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Resultado</legend>
                    <asp:GridView ID="SITPLANGridView" runat="server" CellPadding="4" ForeColor="#333333"
                        GridLines="None" Width="100%" AutoGenerateColumns="False" EnableModelValidation="True"
                        OnRowCommand="SITPLANGridView_Click" EmptyDataText="Nenhum resultado encontrado."
                        AllowPaging="True" AllowSorting="True" PageSize="10" BorderColor="#003366" BorderStyle="Solid"
                        BorderWidth="1px" CellSpacing="2" OnPageIndexChanging="SITPLANGridView_PageIndexChanging"
                        OnSorting="SITPLANGridView_Sorting">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:TemplateField HeaderText="#">
                                <HeaderStyle HorizontalAlign="Center" Width="35px" />
                                <ItemStyle HorizontalAlign="Center" Font-Bold="true" />
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Inicio" HeaderText="Iniciado em" SortExpression="Inicio">
                                <ItemStyle CssClass="espacoTabelas" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Status" DataField="Status" SortExpression="Status">
                                <ItemStyle CssClass="espacoTabelas" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Total Contatos" DataField="TotalContatos" SortExpression="TotalContatos">
                                <ItemStyle CssClass="espacoTabelas" HorizontalAlign="Center" />
                                
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Reiniciar">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgBtnExcluir" runat="server" CausesValidation="False" CommandArgument='<%# Bind("Id") %>'
                                        CommandName="Reiniciar" ImageUrl="~/Estilos/Imgs/play.png"></asp:ImageButton>
                                </ItemTemplate>
                                <ItemStyle Width="70px" HorizontalAlign="Center" />
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

<%@ Page Title="Home - SISLPA" Language="C#" MasterPageFile="Interna.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Sistema_Life_Planner_Agenda.Site.WebForm1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
    <li class="selected"><a href="Default.aspx">Home</a></li>
    <li><a href="Contato\PesquisarContato.aspx">Contatos</a></li>
    <li><a href="Agenda\PesquisarAgenda.aspx">Agenda do LP</a></li>
    <li><a href="SITPLAN\PesquisarSITPLAN.aspx">SIT PLAN</a></li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="home">
        <div class="conteudoTela">
            <asp:Panel ID="Home" runat="server">
                <fieldset>
                    <legend>Atalhos</legend>
                    <br />
                    <table style="width: 400px; margin: 0 auto; text-align: center; height: 200px">
                        <tr>
                            <td style="border-right-style: solid; border-right-width: 1px; border-right-color: #D6D6D6;
                                border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #D6D6D6">
                                <asp:ImageButton ID="NovoContatoImageButton" runat="server" ImageUrl="~/Estilos/Imgs/add_user.png"
                                    OnClick="NovoContatoImageButton_Click" />
                                <br />
                                <asp:LinkButton ID="NovoContatoLinkButton" runat="server" OnClick="NovoContatoLinkButton_Click">Novo Contato</asp:LinkButton>
                                <br />
                                <br />
                            </td>
                            <td style="border-left-style: solid; border-left-width: 1px; border-left-color: #D6D6D6;
                                border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #D6D6D6">
                                <asp:ImageButton ID="CadastrarAgendaImageButton" runat="server" ImageUrl="~/Estilos/Imgs/todo.png"
                                    OnClick="CadastrarAgendaImageButton_Click" />
                                <br />
                                <asp:LinkButton ID="CadastrarAgendaLinkButton" runat="server" OnClick="CadastrarAgendaLinkButton_Click">Cadastrar na Agenda do LP</asp:LinkButton>
                                <br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td style="border-right-style: solid; border-right-width: 1px; border-right-color: #D6D6D6;
                                border-top-style: solid; border-top-width: 1px; border-top-color: #D6D6D6">
                                <br />
                                <asp:ImageButton ID="CadastrarContatoLoteImageButton" runat="server" ImageUrl="~/Estilos/Imgs/add_notes.png"
                                    OnClick="CadastrarContatoLoteImageButton_Click" />
                                <br />
                                <asp:LinkButton ID="CadastrarContatoLoteLinkButton" runat="server" OnClick="CadastrarContatoLoteLinkButton_Click">Cadastrar Lote de Contatos</asp:LinkButton>
                                <br />
                            </td>
                            <td style="border-left-style: solid; border-left-width: 1px; border-left-color: #D6D6D6;
                                border-top-style: solid; border-top-width: 1px; border-top-color: #D6D6D6">
                                <br />
                                <asp:ImageButton ID="CadastrarSITPLANImageButton" runat="server" ImageUrl="~/Estilos/Imgs/call_group.png"
                                    OnClick="CadastrarSITPLANImageButton_Click" />
                                <br />
                                <asp:LinkButton ID="CadastrarSITPLANLinkButton3" runat="server" OnClick="CadastrarSITPLANLinkButton3_Click">Cadastrar SIT PLAN</asp:LinkButton>
                                <br />
                            </td>
                        </tr>
                    </table>
                    <br />
                </fieldset>
                <fieldset>
                    <legend>Compromissos Futuros</legend>
                    <asp:GridView ID="AgendaGridView" runat="server" CellPadding="4" ForeColor="#333333"
                        GridLines="None" Width="100%" AutoGenerateColumns="False" EnableModelValidation="True"
                        OnRowCommand="AgendaGridView_Click" EmptyDataText="Nenhum compromisso nos próximos 7 dias."
                        AllowPaging="True" AllowSorting="True" PageSize="10" BorderColor="#003366" BorderStyle="Solid"
                        BorderWidth="1px" CellSpacing="2" RowStyle-Height="40px" Font-Size="9pt">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:TemplateField HeaderText="#">
                                <HeaderStyle HorizontalAlign="Center" Width="35px" />
                                <ItemStyle HorizontalAlign="Center" Font-Bold="true" />
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Nome" HeaderText="Contato" >
                                <ItemStyle CssClass="espacoTabelas" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Data" HeaderText="Data" >
                                <ItemStyle CssClass="espacoTabelas" Width="70px" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Hora" DataField="Hora" >
                                <ItemStyle CssClass="espacoTabelas" Width="35px" />
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
        </div>
    </div>
    <br />
</asp:Content>

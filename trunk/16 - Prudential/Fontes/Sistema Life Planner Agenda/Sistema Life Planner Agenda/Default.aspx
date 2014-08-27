<%@ Page Title="Home - SISLPA" Language="C#" MasterPageFile="/Interna.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Sistema_Life_Planner_Agenda.Site.WebForm1" %>

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
                                <asp:ImageButton ID="NovoContatoImageButton" runat="server" ImageUrl="~/Estilos/Imgs/add_user.png" />
                                <br />
                                <asp:LinkButton ID="NovoContatoLinkButton" runat="server">Novo Contato</asp:LinkButton>
                                <br />
                                <br />
                            </td>
                            <td style="border-left-style: solid; border-left-width: 1px; border-left-color: #D6D6D6;
                                border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #D6D6D6">
                                <asp:ImageButton ID="CadastrarAgendaImageButton" runat="server" ImageUrl="~/Estilos/Imgs/todo.png" />
                                <br />
                                <asp:LinkButton ID="CadastrarAgendaLinkButton" runat="server">Cadastrar na Agenda do LP</asp:LinkButton>
                                <br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td style="border-right-style: solid; border-right-width: 1px; border-right-color: #D6D6D6;
                                border-top-style: solid; border-top-width: 1px; border-top-color: #D6D6D6">
                                <br />
                                <asp:ImageButton ID="CadastrarContatoLoteImageButton" runat="server" ImageUrl="~/Estilos/Imgs/add_notes.png" />
                                <br />
                                <asp:LinkButton ID="CadastrarContatoLoteLinkButton" runat="server">Cadastrar Lote de Contatos</asp:LinkButton>
                                <br />
                            </td>
                            <td style="border-left-style: solid; border-left-width: 1px; border-left-color: #D6D6D6;
                                border-top-style: solid; border-top-width: 1px; border-top-color: #D6D6D6">
                                <br />
                                <asp:ImageButton ID="CadastrarSITPLANImageButton" runat="server" ImageUrl="~/Estilos/Imgs/call_group.png" />
                                <br />
                                <asp:LinkButton ID="CadastrarSITPLANLinkButton3" runat="server">Cadastrar SIT PLAN</asp:LinkButton>
                                <br />
                            </td>
                        </tr>
                    </table>
                    <br />
                </fieldset>
                <fieldset>
                    <legend>Compromissos Futuros</legend>
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"
                        Width="100%" EmptyDataText="Nenhum compromisso para os próximos 7 dias...">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                    <br />
                    <br />
                </fieldset>
            </asp:Panel>
        </div>
    </div>
    <br />
</asp:Content>

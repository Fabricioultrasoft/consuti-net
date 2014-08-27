<%@ Page Title="Pesquisar Contatos - SISLPA" Language="C#" MasterPageFile="~/Interna.Master"
    AutoEventWireup="true" CodeBehind="PesquisarContato.aspx.cs" Inherits="Sistema_Life_Planner_Agenda.Contato.PesquisarContato" %>

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
                    <table class="Formulario" style="width: 500px; margin: 0 auto;">
                        <tr>
                            <td class="alinhaDireita">
                                Nome:
                            </td>
                            <td>
                                <asp:TextBox ID="emailTextBox" runat="server" Width="400px" TabIndex="1" MaxLength="100"></asp:TextBox>
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
                                Telefone:
                            </td>
                            <td>
                                <asp:TextBox ID="TelefoneTextBox" runat="server" Width="100px" TabIndex="3" MaxLength="50"
                                    TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <div class="barraBotoes">
                        <asp:Button ID="pesquisarButton" runat="server" Text="   Pesquisar" CssClass="botaoPesquisar"
                            TabIndex="9" onclick="pesquisarButton_Click" />
                        <asp:Button ID="limparButton" runat="server" Text="Limpar" 
                            CssClass="botaoLimpar" TabIndex="10" onclick="limparButton_Click" />
                        <asp:Button ID="novoButton" runat="server" Text="Novo" CssClass="botaoNovo" 
                            TabIndex="11" onclick="novoButton_Click" />
                        <asp:Button ID="loteButton" runat="server" Text="Lote" CssClass="botaoLote" 
                            TabIndex="12" onclick="loteButton_Click" />
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Resultado</legend>
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
                </fieldset>
            </asp:Panel>
            <br />
        </div>
    </div>
</asp:Content>

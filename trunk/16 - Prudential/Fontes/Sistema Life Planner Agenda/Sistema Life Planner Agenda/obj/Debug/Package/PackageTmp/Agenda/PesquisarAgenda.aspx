﻿<%@ Page Title="Pesquisar na Agenda do LP - SISLPA" Language="C#" MasterPageFile="~/Interna.Master"
    AutoEventWireup="true" CodeBehind="PesquisarAgenda.aspx.cs" Inherits="Sistema_Life_Planner_Agenda.Agenda.PesquisarAgenda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
    <li><a href="..\Default.aspx">Home</a></li>
    <li><a href="..\Contato\PesquisarContato.aspx">Contatos</a></li>
    <li class="selected"><a href="PesquisarAgenda.aspx">Agenda do LP</a></li>
    <li><a href="..\SITPLAN\PesquisarSITPLAN.aspx">SIT PLAN</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="tituloTela">
            PESQUISAR COMPROMISSO NA AGENDA DO LIFE PLANNER
        </div>
        <div class="conteudoTela">
            <asp:Panel ID="PesquisaAgendaPanel" runat="server">
                <fieldset>
                    <legend>Filtro</legend>
                    <table class="Formulario" >
                        <tr>
                            <td class="alinhaDireita" style="width: 115px">
                                Período De:
                            </td>
                            <td style="width: 115px">
                                <div style="width: 110px;">
                                    <asp:TextBox ID="PeriodoDeTextBox" runat="server" Width="70px" TabIndex="1" MaxLength="10"></asp:TextBox>
                                    <asp:ImageButton ID="deImageButton" runat="server" CausesValidation="False" ImageAlign="Middle"
                                        ImageUrl="~/Estilos/Imgs/Calendar.png" ToolTip="Selecione a data no calendário"
                                        TabIndex="2" />
                                </div>
                            </td>
                            <td class="alinhaDireita" style="width:50px">
                                Até:
                            </td>
                            <td>
                                <div style="width: 110px;">
                                    <asp:TextBox ID="PeriodoAteTextBox" runat="server" Width="70px" TabIndex="3" MaxLength="10"></asp:TextBox>
                                    <asp:ImageButton ID="AteImageButton" runat="server" CausesValidation="False" ImageAlign="Middle"
                                        ImageUrl="~/Estilos/Imgs/Calendar.png" ToolTip="Selecione a data no calendário"
                                        TabIndex="4" /></div>
                            </td>
                        </tr>
                    </table>
                    <table class="Formulario" >
                        <tr>
                            <td class="alinhaDireita" style="width: 115px">
                                Situação:
                            </td>
                            <td style="float: left">
                                <asp:DropDownList ID="RecomendanteDropDownList" runat="server" Width="300px" TabIndex="5">
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
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"
                        Width="100%" EmptyDataText="Nenhum compromisso para os próximos 7 dias...">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView>
                    <br />
                </fieldset>
            </asp:Panel>
            <br />
        </div>
    </div>
</asp:Content>

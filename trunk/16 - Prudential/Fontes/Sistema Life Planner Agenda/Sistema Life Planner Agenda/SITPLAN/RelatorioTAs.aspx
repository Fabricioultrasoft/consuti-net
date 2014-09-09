<%@ Page Title="" Language="C#" MasterPageFile="~/Interna.Master" AutoEventWireup="true" CodeBehind="RelatorioTAs.aspx.cs" Inherits="Sistema_Life_Planner_Agenda.SITPLAN.RelatorioTAs" %>
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
            RESUMO DO TA
        </div>
        <div class="conteudoTela">
            <asp:Panel ID="PesquisaContatoPanel" runat="server">
                
                
            </asp:Panel>
            <br />
            <div class="barraBotoes">
                <asp:Button ID="ImprimirButton" runat="server" Text="Imprimir" CssClass="botaoImprimir"
                    TabIndex="99" onclick="ImprimirButton_Click"  />
            </div>
        </div>
    </div>
</asp:Content>

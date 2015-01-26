<%@ Page Title="Teste PMK - Relatório de Clientes" Language="C#" MasterPageFile="~/Adm/AdmMaster.Master"
    AutoEventWireup="true" CodeBehind="RelatorioClientes.aspx.cs" Inherits="testePMK.com.br.Adm.Relatorios.RelatorioClientes" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="style1">
        Relatórios de Clientes</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="subTitulo">
        Relatório de Clientes Cadastrados no Site<br />
        <br />
        <div style="text-align: left; margin-left: 10px">
            <asp:Panel ID="pnlFiltro" runat="server" DefaultButton="btnPesquisar">
            
            Ordenar por:
            <asp:DropDownList ID="ddlOrdem" runat="server" AutoPostBack="True">
                <asp:ListItem Value="1">ID</asp:ListItem>
                <asp:ListItem Value="2">NOME</asp:ListItem>
                <asp:ListItem Value="3">EMAIL</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Pesquisar:
            <asp:TextBox ID="txbPesquisa" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnPesquisar" runat="server" Text="Pesquisar" OnClick="btnPesquisar_Click" />
            <br />
            </asp:Panel>
        </div>
        <hr style="margin-top: 15px; margin-bottom: 15px" />
        <asp:Panel ID="pnlGrid" runat="server" ScrollBars="Auto" Height="650px">
            <asp:GridView ID="gdvClientes" runat="server" AutoGenerateColumns="False" BackColor="White"
                BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" EmptyDataText="Nenhum resultado encontrado."
                EnableModelValidation="True" GridLines="Horizontal" HorizontalAlign="Center" OnRowCommand="gdvClientes_Click"
                Width="586px" AlternatingRowStyle-BackColor="#f2fff2">
                <AlternatingRowStyle BackColor="#F2FFF2" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID">
                        <ItemStyle BackColor="#e8ffe8" Width="30px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NOME" HeaderText="NOME" />
                    <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" />
                    <asp:BoundField DataField="TEL_FIXO" HeaderText="FIXO">
                        <ItemStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="CELULAR" HeaderText="CELULAR">
                        <ItemStyle Width="100px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="VER">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgBtnVer" runat="server" CausesValidation="False" CommandArgument='<%# Bind("ID") %>'
                                CommandName="verDetalhes" ImageUrl="~/Graficos/Detalhes_32x32.png" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
        </asp:Panel>
    </div>
</asp:Content>

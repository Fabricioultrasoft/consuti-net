<%@ Page Title="Teste PMK - Adm Relatório de Estoque" Language="C#" MasterPageFile="~/Adm/AdmMaster.Master"
    AutoEventWireup="true" CodeBehind="RelatorioEstoque.aspx.cs" Inherits="testePMK.com.br.Adm.Relatorios.RelatorioEstoque" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="style1">
        Relatórios de Estoque</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="subTitulo">
        Relatório de Estoque dos Produtos Cadastrados no Site<br />
        <br />
        <div style="text-align: left; margin-left: 10px">
            <asp:Panel ID="pnlFiltro" runat="server" DefaultButton="btnPesquisar">            
            Ordenar por:
            <asp:DropDownList ID="ddlOrdem" runat="server" AutoPostBack="True">
                <asp:ListItem Value="1">Categoria</asp:ListItem>
                <asp:ListItem Value="2">Maior Preço</asp:ListItem>
                <asp:ListItem Value="3">Menor Preço</asp:ListItem>
                <asp:ListItem Value="4">Nome Produto</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Pesquisar:
            <asp:TextBox ID="txbPesquisa" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnPesquisar" runat="server" Text="Pesquisar" OnClick="btnPesquisar_Click" />
            <br />
            </asp:Panel>
        </div>
        <hr style="margin-top: 15px; margin-bottom: 15px" />
        <asp:Panel ID="pnlGrid" runat="server" ScrollBars="Auto" Height="650px">
            <asp:GridView ID="gdvProdutos" runat="server" AutoGenerateColumns="False" BackColor="White"
                BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" EmptyDataText="Nenhum resultado encontrado."
                EnableModelValidation="True" GridLines="Horizontal" HorizontalAlign="Center" OnRowCommand="gdvClientes_Click"
                Width="586px" AlternatingRowStyle-BackColor="#f2fff2">
                <AlternatingRowStyle BackColor="#F2FFF2" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID">
                        <ItemStyle BackColor="#e8ffe8" Width="30px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NOME" HeaderText="NOME" />
                    <asp:BoundField HeaderText="CATEGORIA" DataField="CATEGORIA" />
                    <asp:BoundField HeaderText="EM ESTOQUE" DataField="QTD_ESTOQUE">
                        <ItemStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="PREÇO" DataField="PRECO_UNIDADE">
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

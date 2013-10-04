<%@ Page Title="Teste PMK - Adm Home" Language="C#" MasterPageFile="~/Adm/AdmMaster.Master"
    AutoEventWireup="true" CodeBehind="AdmHome.aspx.cs" Inherits="testePMK.com.br.Adm.AdmHome" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
        #tituloDiv
        {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="tituloDiv">
        &nbsp;FAVORITOS<br />
        <br />
    </div>
    <asp:Panel ID="Panel1" runat="server">
        
        <table style="width: 550px" cellspacing="20" align="center">
            <tr>
                <td class="style1">
                    <br />
                    <asp:ImageButton ID="ImageButton1" ImageUrl="../Graficos/AtBann.png" runat="server"
                        OnClick="ImageButton1_Click" />
                    <br />
                    <a href="Banners/AtualizaBanners.aspx">Atualizar Banners</a><br />
                </td>
                <td class="style1">
                    <br />
                    <asp:ImageButton ID="ImageButton2" ImageUrl="../Graficos/AtStatusPedido.png" runat="server"
                        OnClick="ImageButton2_Click" />
                    <br />
                    <a href="Pedidos/StatusPedidos.aspx">Alterar Status de Pedidos </a>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <br />
                    <asp:ImageButton ID="ImageButton3" ImageUrl="../Graficos/AlProds.png" runat="server"
                        OnClick="ImageButton3_Click" />
                    <br />
                    <a href="Produtos/EditProdutos.aspx">Alterar Produtos</a>
                    <br />
                </td>
                <td class="style1">
                    <br />
                    <asp:ImageButton ID="ImageButton4" ImageUrl="../Graficos/RelVendas.png" runat="server"
                        OnClick="ImageButton4_Click" />
                    <br />
                    <a href="Relatorios/RelatorioVendas.aspx">Relatório de Vendas</a><br />
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <br />
                    <asp:ImageButton ID="ImageButton6" ImageUrl="../Graficos/RelEstoq.png" runat="server"
                        OnClick="ImageButton6_Click" />
                    <br />
                    <a href="Relatorios/RelatorioEstoque.aspx">Relatório de Estoque</a>
                    <br />
                </td>
                <td class="style1">
                    <br />
                    <asp:ImageButton ID="ImageButton7" runat="server" ImageUrl="../Graficos/RelUser.png"
                        OnClick="ImageButton7_Click" />
                    <br />
                    <a href="Relatorios/RelatorioClientes.aspx">Relatório de Clientes</a>
                    <br />
                </td>
            </tr>
        </table>
        <br />
    </asp:Panel>
    <cc1:RoundedCornersExtender ID="Panel1_RoundedCornersExtender" runat="server" BorderColor="Green"
        Enabled="True" TargetControlID="Panel1">
    </cc1:RoundedCornersExtender>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <asp:Label ID="lblTitulo" runat="server" Text="Home - Painel" Style="text-decoration: underline"></asp:Label>
</asp:Content>

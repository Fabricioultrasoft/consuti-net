<%@ Page Title="Teste PMK - Pedidos" Language="C#" MasterPageFile="~/Master.Master"
    AutoEventWireup="true" CodeBehind="PedidosUserExt.aspx.cs" Inherits="testePMK.com.br.Adm.Usuario.PedidosUserExt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
        Meus Pedidos</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="subTitulo">
        Abaixo todos os pedidos realizados até o momento.<br />
        <br />
        <div style="text-align: left; margin-left: 10px">
            <asp:Panel ID="pnlFiltro" runat="server" >
                Ordenar por:
                <asp:DropDownList ID="ddlOrdem" runat="server" AutoPostBack="True">                    
                    <asp:ListItem Value="1">DATA</asp:ListItem>
                    <asp:ListItem Value="2">PAGAMENTO</asp:ListItem>
                    <asp:ListItem Value="3">STATUS</asp:ListItem>
                </asp:DropDownList>
                <br />
            </asp:Panel>
        </div>
        <hr style="margin-top: 15px; margin-bottom: 15px" />
        <asp:Panel ID="pnlGrid" runat="server" ScrollBars="Auto" Height="650px">
            <asp:GridView ID="gdvPedidos" runat="server" AutoGenerateColumns="False" BackColor="White"
                BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4"
                EmptyDataText="Nenhum resultado encontrado." EnableModelValidation="True" GridLines="Horizontal"
                HorizontalAlign="Center" OnRowCommand="gdvPedidos_Click" Width="586px" AlternatingRowStyle-BackColor="#f2fff2">
                <AlternatingRowStyle BackColor="#F2FFF2" />
                <Columns>
                    <asp:BoundField DataField="TransacaoID" HeaderText="ID TRANSAÇÃO">
                        <ItemStyle BackColor="#e8ffe8" Width="200px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DataTransacao" HeaderText="DATA" />
                    <asp:BoundField DataField="StatusTransacao" HeaderText="STATUS">
                        <ItemStyle Width="100px" />
                    </asp:BoundField>                    
                    <asp:BoundField DataField="TipoPagamento" HeaderText="PAGAMENTO">
                        <ItemStyle Width="70px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="ITENS">
                    <ItemStyle Width="30px" />
                        <ItemTemplate>
                            <asp:ImageButton ID="imgBtnVer" runat="server" CausesValidation="False" CommandArgument='<%# Bind("transacaoID") %>'
                                CommandName="verDetalhes" ImageUrl="~/Graficos/Detalhes_32x32.png" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" Font-Size="Smaller" 
                    HorizontalAlign="Center" VerticalAlign="Middle" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
        </asp:Panel>
    </div>
</asp:Content>

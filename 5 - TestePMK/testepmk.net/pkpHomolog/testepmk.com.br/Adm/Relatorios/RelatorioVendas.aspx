<%@ Page Title="Teste PMK - Adm Relatório de Vendas" Language="C#" MasterPageFile="~/Adm/AdmMaster.Master"
    AutoEventWireup="true" CodeBehind="RelatorioVendas.aspx.cs" Inherits="testePMK.com.br.Adm.Relatorios.RelatorioVendas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="style1">
        Relatórios de Vendas</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="subTitulo">
        Relatório de Vendas Realizadas no Site<br />
        <br />
        <div style="text-align: left; margin-left: 10px">
            <asp:Panel ID="pnlFiltro" runat="server" DefaultButton="btnPesquisar">
                Agrupar por:
                <asp:DropDownList ID="ddlOrdem" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="1">CATEGORIA PRODUTO</asp:ListItem>
                    <asp:ListItem Value="2">CLIENTE</asp:ListItem>
                    <asp:ListItem Value="3">PRODUTO</asp:ListItem>
                    <asp:ListItem Value="4">VALOR VENDA</asp:ListItem>
                </asp:DropDownList>
                &nbsp; &nbsp;&nbsp; Filtrar por Data:
                        <asp:TextBox ID="txbDataNasc" runat="server" TabIndex="4"
                            Width="70px"></asp:TextBox>
                        <ajax:CalendarExtender ID="txbDataNasc_CalendarExtender" runat="server" CssClass="ajax__calendar"
                            Enabled="True" Format="dd/MM/yyyy" PopupButtonID="IbtnDatanasc" TargetControlID="txbDataNasc"
                            TodaysDateFormat=" d MMMM yyyy">
                        </ajax:CalendarExtender>
                        <ajax:MaskedEditExtender ID="txbDataNasc_MaskedEditExtender" runat="server" AutoComplete="False"
                            ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder=""
                            CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                            CultureTimePlaceholder="" Enabled="True" Mask="99/99/9999" MaskType="Date" TargetControlID="txbDataNasc">
                        </ajax:MaskedEditExtender>
                        &nbsp;<asp:ImageButton ID="IbtnDatanasc" runat="server" CausesValidation="False"
                            Height="24px" ImageAlign="Middle" ImageUrl="~/Graficos/calendario_32x32.png" ToolTip="Selecione a data no calendário"
                            Width="24px" TabIndex="5" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnPesquisar" runat="server" Text="Pesquisar" OnClick="btnPesquisar_Click" />
                <br />
            </asp:Panel>
        </div>
        <hr style="margin-top: 15px; margin-bottom: 15px" />
        <asp:Panel ID="pnlGrid" runat="server" ScrollBars="Auto" Height="650px">
            <asp:GridView ID="gdvVendas" runat="server" AutoGenerateColumns="False" BackColor="White"
                BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4"
                EmptyDataText="Nenhum resultado encontrado." EnableModelValidation="True" GridLines="Horizontal"
                HorizontalAlign="Center" OnRowCommand="gdvVendas_Click" Width="586px" AlternatingRowStyle-BackColor="#f2fff2">
                <AlternatingRowStyle BackColor="#F2FFF2" />
                <Columns>
                    <asp:BoundField DataField="ID_VENDA" HeaderText="ID">
                        <ItemStyle BackColor="#e8ffe8" Width="30px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="CATEGORIA" HeaderText="CATEGORIA" />
                    <asp:BoundField DataField="NOME_CLIENTE" HeaderText="CLIENTE" />
                    <asp:BoundField DataField="PRODUTO" HeaderText="PRODUTO">
                        <ItemStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TOTAL_VENDA" HeaderText="TOTAL VENDA">
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

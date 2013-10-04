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
        Relatório de Vendas Realizadas no Site<asp:RequiredFieldValidator ID="rfvDe" 
            runat="server" ControlToValidate="txbDe" Display="None" 
            ErrorMessage="Campo Obrigatório."></asp:RequiredFieldValidator>
        <ajax:ValidatorCalloutExtender ID="rfvDe_ValidatorCalloutExtender" 
            runat="server" Enabled="True" TargetControlID="rfvDe">
        </ajax:ValidatorCalloutExtender>
        <asp:RequiredFieldValidator ID="rfvAte" runat="server" 
            ControlToValidate="txbAte" Display="None" ErrorMessage="Campo Obrigatorio."></asp:RequiredFieldValidator>
        <ajax:ValidatorCalloutExtender ID="rfvAte_ValidatorCalloutExtender" 
            runat="server" Enabled="True" TargetControlID="rfvAte">
        </ajax:ValidatorCalloutExtender>
        <br />
        <br />
        <div style="text-align: left; margin-left: 10px">
            <asp:Panel ID="pnlFiltro" runat="server" DefaultButton="btnPesquisar" 
                style="text-align: center">
                &nbsp;de:
                        <asp:TextBox ID="txbDe" runat="server" TabIndex="4"
                            Width="70px"></asp:TextBox>
                        <ajax:CalendarExtender ID="txbDataNasc_CalendarExtender" runat="server" CssClass="ajax__calendar"
                            Enabled="True" Format="dd/MM/yyyy" PopupButtonID="IbtnDe" TargetControlID="txbDe"
                            TodaysDateFormat=" d MMMM yyyy">
                        </ajax:CalendarExtender>
                        <ajax:MaskedEditExtender ID="txbDataNasc_MaskedEditExtender" runat="server" AutoComplete="False"
                            ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder=""
                            CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                            CultureTimePlaceholder="" Enabled="True" Mask="99/99/9999" MaskType="Date" TargetControlID="txbDe">
                        </ajax:MaskedEditExtender>
                        &nbsp;<asp:ImageButton ID="IbtnDe" runat="server" CausesValidation="False"
                            Height="24px" ImageAlign="Middle" ImageUrl="~/Graficos/calendario_32x32.png" ToolTip="Selecione a data no calendário"
                            Width="24px" TabIndex="5" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;até:
                <asp:TextBox ID="txbAte" runat="server" TabIndex="4" Width="70px"></asp:TextBox>
                <ajax:CalendarExtender ID="txbDataNasc0_CalendarExtender" runat="server" 
                    CssClass="ajax__calendar" Enabled="True" Format="dd/MM/yyyy" 
                    PopupButtonID="IbtnAte" TargetControlID="txbAte" 
                    TodaysDateFormat=" d MMMM yyyy">
                </ajax:CalendarExtender>
                <ajax:MaskedEditExtender ID="txbDataNasc0_MaskedEditExtender" runat="server" 
                    AutoComplete="False" ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                    CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="txbAte">
                </ajax:MaskedEditExtender>
                &nbsp;<asp:ImageButton ID="IbtnAte" runat="server" CausesValidation="False" 
                    Height="24px" ImageAlign="Middle" ImageUrl="~/Graficos/calendario_32x32.png" 
                    TabIndex="5" ToolTip="Selecione a data no calendário" Width="24px" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnPesquisar" runat="server" Text="Pesquisar" OnClick="btnPesquisar_Click" />
                <br />
            </asp:Panel>
        </div>
        <hr style="margin-top: 15px; margin-bottom: 15px" />
        <asp:Panel ID="pnlGrid" runat="server" ScrollBars="Auto" Height="650px">
            <asp:GridView ID="gdvVendas" runat="server" AutoGenerateColumns="False" BackColor="White"
                BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4"
                EmptyDataText="Nenhum resultado encontrado. Selecione um intervalo." EnableModelValidation="True" GridLines="Horizontal"
                HorizontalAlign="Center" Width="586px" AlternatingRowStyle-BackColor="#f2fff2">
                <AlternatingRowStyle BackColor="#F2FFF2" />
                <Columns>
                    <asp:BoundField DataField="ID_VENDA" HeaderText="ID">
                        <ItemStyle BackColor="#e8ffe8" Width="30px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DATA" HeaderText="DATA" />
                    <asp:BoundField DataField="NOME_CLIENTE" HeaderText="CLIENTE" />
                    <asp:BoundField DataField="NOME_PRODUTO" HeaderText="PRODUTO">
                        <ItemStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TOTAL_VENDA" HeaderText="TOTAL VENDA">
                        <ItemStyle Width="100px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="VER">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgBtnVer" runat="server" CausesValidation="False" CommandArgument='<%# Bind("ID_VENDA") %>'
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

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetalhesPedido.aspx.cs"
    Inherits="testePMK.com.br.DetalhesPedido" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
    Namespace="System.Web.UI.WebControls" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Detalhes de Cliente</title>
    <link href="Adm/Relatorios/Detalhes.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
    <div class="tituloRelatorio">
        <br />
        &nbsp;DETALHES DO PEDIDO
        <br />
        <br />
    </div>
    <div>
        <asp:Panel ID="pnlDetalhes" runat="server" BorderStyle="Solid" BorderWidth="5px">
            <br />
            <div class="NomeCliente">
                <asp:DetailsView ID="dvNome" runat="server" AutoGenerateRows="False" EnableModelValidation="True"
                    Width="100%" BorderColor="White" GridLines="None">
                    <Fields>
                        <asp:BoundField DataField="TransacaoID" ItemStyle-Width="100%" ShowHeader="false" />
                        <asp:BoundField DataField="DataTransacao" ItemStyle-Width="100%" ShowHeader="false">
                            <ItemStyle Font-Size="12pt" />
                        </asp:BoundField>
                    </Fields>
                </asp:DetailsView>
            </div>
            <hr />
            <br />
            <div>
                <div id="dadosPessoais1" style="width: 59%">
                    &nbsp;&nbsp; &nbsp; <span class="style1">Dados Pedido: </span>
                    <asp:DetailsView ID="dvDadosPessoais" runat="server" AutoGenerateRows="False" EnableModelValidation="True"
                        Width="100%" BorderColor="White" GridLines="None" CellSpacing="10">
                        <Fields>
                            <asp:BoundField DataField="CliNome" HeaderText="Cliente: " HeaderStyle-Font-Bold="true"
                                ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="120px" />
                            <asp:BoundField DataField="CliCEP" HeaderText="CEP: " HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="CliTelefone" HeaderText="Telefone Fixo: " HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="TransacaoID" HeaderStyle-Font-Bold="true" HeaderText="ID Compra: " />
                        </Fields>
                    </asp:DetailsView>
                </div>
                <div id="dadosPessoais2" style="width: 40%">
                    <br />
                    <asp:DetailsView ID="dvDadosPessoais2" runat="server" AutoGenerateRows="False" EnableModelValidation="True"
                        Width="100%" BorderColor="White" GridLines="None" CellSpacing="10">
                        <Fields>
                            <asp:BoundField DataField="DataUltimaAtualizacao" HeaderText="Última Atualização: "
                                HeaderStyle-Font-Bold="true" HeaderStyle-Width="130px" />
                            <asp:BoundField DataField="StatusTransacao" HeaderText="Status Atual: " HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="TipoPagamento" HeaderStyle-Font-Bold="true" HeaderText="Pagamento: " />
                            <asp:BoundField DataField="DataTransacao" HeaderText="Data da Compra: " HeaderStyle-Font-Bold="true" />
                        </Fields>
                    </asp:DetailsView>
                </div>
                <br />
                <br />
                <div>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <hr />
                    <br />
                    <div>
                        <div id="dadosEndereco1">
                            &nbsp;&nbsp; &nbsp; <span class="style1">Produtos:
                                <br />
                            </span>
                        </div>
                        <div style="width: 100%; text-align: center;">
                            <asp:GridView ID="gdvItensPedido" runat="server" AutoGenerateColumns="False" EnableModelValidation="True"
                                HorizontalAlign="Center" Width="750px" BackColor="White" BorderColor="#336666"
                                BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
                                <Columns>
                                    <asp:BoundField DataField="Descricao" HeaderText="DESCRIÇÃO" />
                                    <asp:BoundField DataField="Codigo" HeaderText="CODIGO" />
                                    <asp:BoundField DataField="Quantidade" HeaderText="QUANTIDADE" ItemStyle-Width="100px">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Valor" HeaderText="VALOR UNITÁRIO (R$)" ItemStyle-Width="150px">
                                        <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                </Columns>
                                <FooterStyle BackColor="White" ForeColor="#333333" />
                                <HeaderStyle BackColor="#336666" Font-Bold="True" Font-Size="Small" ForeColor="White" />
                                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="White" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                            </asp:GridView>
                        </div>
                        <br />
                        <br />
                        <div>
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                        </div>
                    </div>
                    <div class="EmitidoEm">
                        Emitido em:
                        <asp:Literal ID="liDataEmissao" runat="server"></asp:Literal>
                        <br />
                    </div>
                    <div class="rodapeRelatorio">
                        &nbsp;&nbsp; <a href="#" onclick="javascript:window.print()">Imprimir</a><br />
                    </div>
        </asp:Panel>
    </div>
    </form>
</body>
</html>

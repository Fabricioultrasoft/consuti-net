<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetalhesEstoque.aspx.cs"
    Inherits="testePMK.com.br.Adm.Relatorios.DetalhesEstoque" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
    Namespace="System.Web.UI.WebControls" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Detalhes de Estoque</title>
    <link href="Detalhes.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="tituloRelatorio">
        RELATÓRIO DETALHADO DE PRODUTO EM ESTOQUE
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
                        <asp:BoundField DataField="NOME" ItemStyle-Width="100%" ShowHeader="false" />
                        <asp:BoundField DataField="ID" ItemStyle-Width="100%" ShowHeader="false">
                            <ItemStyle Font-Size="12pt" />
                        </asp:BoundField>
                    </Fields>
                </asp:DetailsView>
            </div>
            <hr />
            <br />
            <div>
                <div id="DadosProduto">
                    &nbsp;&nbsp; &nbsp; <span class="style1">Dados do Produto: </span>
                    <asp:DetailsView ID="dvDadosProduto" runat="server" AutoGenerateRows="False" EnableModelValidation="True"
                        Width="100%" BorderColor="White" GridLines="None" CellSpacing="15">
                        <Fields>
                            <asp:BoundField DataField="DESCRICAO" HeaderText="Descrição Breve: " HeaderStyle-Font-Bold="true"
                                ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="170px" />
                            <asp:BoundField DataField="CATEGORIA" HeaderText="Categoria do Produto: " HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="PESO" HeaderText="Peso em Gramas (g): " HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="QTD_ESTOQUE" HeaderText="Quantidade em Estoque: " HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="PRECO_UNIDADE" HeaderText="Preço por Unidade: " HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="DESCRICAO_COMPLETA" HeaderText="Descrição Detalhada: "
                                HeaderStyle-Font-Bold="true" />
                        </Fields>
                    </asp:DetailsView>
                </div>
                <div>
                    <br />
                    <hr />
                    <div>
                        <div>
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

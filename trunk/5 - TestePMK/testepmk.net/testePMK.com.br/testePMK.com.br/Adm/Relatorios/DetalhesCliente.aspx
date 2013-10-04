<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetalhesCliente.aspx.cs"
    Inherits="testePMK.com.br.Adm.Relatorios.DetalhesCliente" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
    Namespace="System.Web.UI.WebControls" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Detalhes de Cliente</title>
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
        RELATÓRIO DETALHADO DE CLIENTE
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
                        <asp:BoundField DataField="EMAIL" ItemStyle-Width="100%" ShowHeader="false">
                            <ItemStyle Font-Size="12pt" />
                        </asp:BoundField>
                    </Fields>
                </asp:DetailsView>
            </div>
            <hr />
            <br />
            <div>
                <div id="dadosPessoais1">
                    &nbsp;&nbsp; &nbsp; <span class="style1">Dados Pessoais: </span>
                    <asp:DetailsView ID="dvDadosPessoais" runat="server" AutoGenerateRows="False" EnableModelValidation="True"
                        Width="100%" BorderColor="White" GridLines="None" CellSpacing="15">
                        <Fields>
                            <asp:BoundField DataField="ID" HeaderText="Código do Cliente: " HeaderStyle-Font-Bold="true"
                                ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="140px" />
                            <asp:BoundField DataField="CPF" HeaderText="CPF/CNPJ: " HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="TEL_FIXO" HeaderText="Telefone Fixo: " HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="DATA_NASC" HeaderText="Data de Nascimento: " HeaderStyle-Font-Bold="true" />
                        </Fields>
                    </asp:DetailsView>
                </div>
                <div id="dadosPessoais2">
                    <br />
                    <asp:DetailsView ID="dvDadosPessoais2" runat="server" AutoGenerateRows="False" EnableModelValidation="True"
                        Width="100%" BorderColor="White" GridLines="None" CellSpacing="15">
                        <Fields>
                            <asp:BoundField DataField="INSCRICAO_ESTADUAL" HeaderText="RG/Inscrição Estadual: "
                                HeaderStyle-Font-Bold="true" HeaderStyle-Width="160px" />
                            <asp:BoundField DataField="SEXO" HeaderText="Sexo: " HeaderStyle-Font-Bold="true" />
                            <asp:BoundField DataField="CELULAR" HeaderStyle-Font-Bold="true" HeaderText="Telefone Celular: " />
                            <asp:BoundField DataField="PROFISSAO" HeaderStyle-Font-Bold="true" HeaderText="Profissão: " />
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
                            &nbsp;&nbsp; &nbsp; <span class="style1">Endereço: </span>
                            <asp:DetailsView ID="dvEndereco1" runat="server" AutoGenerateRows="False" EnableModelValidation="True"
                                Width="100%" BorderColor="White" GridLines="None" CellSpacing="15">
                                <Fields>
                                    <asp:BoundField DataField="RUA" HeaderText="Rua: " HeaderStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="100px" />
                                    <asp:BoundField DataField="BAIRRO" HeaderText="Bairro: " HeaderStyle-Font-Bold="true" />
                                    <asp:BoundField DataField="CIDADE" HeaderText="Cidade: " HeaderStyle-Font-Bold="true" />
                                    <asp:BoundField DataField="COMPLEMENTO" HeaderText="Complemento: " HeaderStyle-Font-Bold="true" />
                                </Fields>
                            </asp:DetailsView>
                        </div>
                        <div id="dadosEndereco2">
                            <br />
                            <asp:DetailsView ID="dvEndereco2" runat="server" AutoGenerateRows="False" EnableModelValidation="True"
                                Width="100%" BorderColor="White" GridLines="None" CellSpacing="15">
                                <Fields>
                                    <asp:BoundField DataField="NUMERO" HeaderText="Numero: " HeaderStyle-Font-Bold="true" HeaderStyle-Width="60px" />
                                    <asp:BoundField DataField="ESTADO" HeaderText="Estado: " HeaderStyle-Font-Bold="true" />
                                    <asp:BoundField DataField="CEP" HeaderStyle-Font-Bold="true" HeaderText="CEP: " />
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
                            <br />
                        </div>
                    </div>
                    <div class="EmitidoEm">
                        Emitido em:
                        <asp:Literal ID="liDataEmissao" runat="server"></asp:Literal>
                        <br />                        
                    </div>
                    <div class="rodapeRelatorio">
                        &nbsp;&nbsp;
        <a href="#" onclick="javascript:window.print()">Imprimir</a><br /> </div>
        </asp:Panel>
    </div>    
    </form>

</body>
</html>

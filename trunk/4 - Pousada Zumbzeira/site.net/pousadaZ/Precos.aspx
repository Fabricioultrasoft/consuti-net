<%@ Page Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Precos.aspx.cs"
    Inherits="pousadaZ.WebForm6" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            text-decoration: underline;
            font-size: small;
        }
        .style2
        {
            font-size: small;
        }
        .style3
        {
            text-decoration: underline;
            width: 90%;
            font-weight: bold;
            font-size: medium;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <p class="style3">
        PREÇOS E PROMOÇÕES</p>
    <div style="font-size: small; width: 100%">
        Conheça a Pousada Zumbzeira e se preocupe apenas em curtir a tranquilidade e a beleza
        de Macacos.</div>
    <p>
        <table style="border: 1px solid #000080; width: 90%; font-size: small; font-style: normal;
            color: #000000; text-align: center;" align="center">
            <tr>
                <td bgcolor="#3366FF" style="border: 1px solid #000080">
                    Item
                </td>
                <td bgcolor="#3366FF" style="border: 1px solid #000080">
                    Valor (R$)
                </td>
            </tr>
            <tr bgcolor="#99CCFF">
                <td style="border: 1px solid #000080;">
                    Hospedagem
                </td>
                <td style="border: 1px solid #000080;">
                    Consulte Pousada
                </td>
            </tr>
            <tr bgcolor="#99CCFF">
                <td style="border: 1px solid #000080;">
                    Petiscos
                </td>
                <td style="border: 1px solid #000080;">
                    A partir de 9,00
                </td>
            </tr>
            <tr bgcolor="#99CCFF">
                <td style="border: 1px solid #000080">
                    Refeição (2 pessoas)
                </td>
                <td bgcolor="#99CCFF" style="border: 1px solid #000080">
                    A partir de 40,00
                </td>
            </tr>
            <tr bgcolor="#99CCFF">
                <td style="border: 1px solid #000080">
                    Café
                </td>
                <td bgcolor="#99CCFF" style="border: 1px solid #000080">
                    Incluso na Hospedagem
                </td>
            </tr>
        </table>
    </p>
    <p>
        Possuimos Promoção de Hospedagem Para 2 Diárias</p>
    <p>
        Consulte nosso <a href="Fideliza.aspx">programa de fidelização</a>.<br />
    </p>
    <br />
    <br />
    <asp:Panel ID="Panel1" runat="server" Width="260px" HorizontalAlign="Center" Style="margin-left: 30%">
        <span class="style1">Aceitamos os cartões:</span><br class="style2" />
        <span class="style2">Visa, Master Card e Rede Card<br />
            &nbsp;&nbsp;<img alt="Visa" src="../Graficos/visa2.png" />&nbsp;&nbsp;&nbsp;            
            <img alt="Master Card" src="../Graficos/master.png" />&nbsp; &nbsp;
            <img alt="Rede Card" src="../Graficos/RedeCard.png" />&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
        </span>
    </asp:Panel>
    <cc1:RoundedCornersExtender ID="Panel1_RoundedCornersExtender" runat="server" BorderColor="167, 204, 231"
        Color="White" Enabled="True" TargetControlID="Panel1">
    </cc1:RoundedCornersExtender>
</asp:Content>

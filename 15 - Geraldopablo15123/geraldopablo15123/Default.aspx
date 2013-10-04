<%@ Page Title="15123 - Geraldo Pablo" Language="C#" MasterPageFile="~/SiteMaster.Master"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="geraldopablo15123.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style8
        {
            text-align: center;
            font-size: xx-large;
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="style8">
            <strong>PEÇO SEU APOIO</strong>
        </div>
        <div>
            <br />
            &nbsp;&nbsp;&nbsp; Para tornar possível todas estas realizações, e <strong>MUITAS</strong>
            outras (muitas mesmo), preciso da sua confiança em votar no número <strong><span
                class="style4">15123</span></strong> para Vereador
            <asp:Image ID="Image2" runat="server" ImageUrl="~/Imagens/confirma.png" />
            , e <strong><span class="style4">15</span></strong> para Prefeito Osvaldo dos Santos
            <asp:Image ID="Image3" runat="server" ImageUrl="~/Imagens/confirma.png" />
            &nbsp;e sua vice Sandra Ruivo.
            <br />
            <br />
            Muito obrigado.
            <br />
            <strong>Geraldo Pablo. </strong>
            <div style="text-align: center">
                <br />
                <table style="width: 450px; margin: 0 auto" cellpadding="10px">
                    <tr>
                        <td style="border-right-style: solid; border-right-width: 1px; border-right-color: #C0C0C0; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #C0C0C0">
                            <asp:ImageButton ID="imgBtnLancamento" runat="server" CausesValidation="false" ImageAlign="Middle"
                                ImageUrl="~/Imagens/candidatura.png" onclick="imgBtnLancamento_Click" />
                            <br />
                            Lançamento da Candidatura
                        </td>
                        <td style="border-left-style: solid; border-left-width: 1px; border-left-color: #C0C0C0; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #C0C0C0">
                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="false" ImageAlign="Middle"
                                ImageUrl="~/Imagens/situacao.png" onclick="ImageButton1_Click" />
                            <br />
                            Atual Realidade da Cidade
                        </td>
                    </tr>
                    <tr>
                        <td style="border-right-style: solid; border-right-width: 1px; border-right-color: #C0C0C0; border-top-style: solid; border-top-width: 1px; border-top-color: #C0C0C0">
                            <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="false" ImageAlign="Middle"
                                ImageUrl="~/Imagens/plano.png" onclick="ImageButton2_Click" />
                            <br />
                            Plano de Ação
                        </td>
                        <td style="border-left-style: solid; border-left-width: 1px; border-left-color: #C0C0C0; border-top-style: solid; border-top-width: 1px; border-top-color: #C0C0C0">
                            <asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="false" ImageAlign="Middle"
                                ImageUrl="~/Imagens/contato.png" onclick="ImageButton3_Click" />
                            <br />
                            Contato com o Candidato
                        </td>
                    </tr>
                </table>
                <br />
                <br />
            </div>
        </div>
    </div>
</asp:Content>

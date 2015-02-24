<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true"
    CodeBehind="Links.aspx.cs" Inherits="testePMK.com.br.Links" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="Subtitulo">
            <br />
            Links Importantes</div>
        <div class="styleJust">
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A seguir alguns links importantes:
            <br />
            <br />
            <div id="listaLinks">
                <a href="Manual clinica.doc">PROCEDIMENTOS PARA ABERTURA DE UMA CLÍNICA</a><br />
                <br />
                <a href="FICHA%20DE%20ENTREVISTA.doc">MODELO DE ENTREVISTA DE ANAMNESE</a><br />
                <br />
                <asp:LinkButton ID="lbtnSedex" runat="server" OnClick="lbtnSedex_Click">RASTREAMENTO SEDEX</asp:LinkButton><br />
                <br />
                <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">RESOLUÇÃO Nº 267 DE 15 DE FEVEREIRO DE 2008</asp:LinkButton><br />
                <br />
                <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">RESOLUÇÃO Nº080/98 - ANEXOS I E II DA RESOLUÇÃO Nº 51/98-CONTRAN</asp:LinkButton><br />
                <br />
                <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click">DETRAN'S DO BRASIL</asp:LinkButton></div>
            <br />
            <br />
        </div>
        <div class="Subtitulo">
            <asp:Image ID="imgLinks" runat="server" ImageUrl="~/Graficos/link.jpg" />
            <br />
            <br />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
        <strong>Links</strong></p>
</asp:Content>

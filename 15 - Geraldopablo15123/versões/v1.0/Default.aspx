<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="geraldopablo15123.WebForm1" %>

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
            outras (muitas mesmo), preciso da sua confiança em votar no número <strong>
            <span class="style4">15123</span></strong>
            para Vereador
            <asp:Image ID="Image2" runat="server" ImageUrl="~/Imagens/confirma.png" />
            , e <strong><span class="style4">15</span></strong> para Prefeito Osvaldo dos Santos 
            <asp:Image ID="Image3" runat="server" ImageUrl="~/Imagens/confirma.png" />
&nbsp;e sua vice
            Sandra Ruivo.
            <br />
            <br />
            Muito obrigado.
            <br />
            <strong>Geraldo Pablo.
            </strong>
            <div style="text-align: center">
            </div>
        </div>
    </div>
</asp:Content>

<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ResultadoBusca.ascx.cs"
    Inherits="TTR.Site.Usercontrols.ResultadoBusca" %>
<link rel="Stylesheet" href="../../Layout/Estilos/ResultadoBusca.css" type="text/css" />
<div class="itemLista">
    <div class="imgResultadoBusca">
        <asp:ImageButton ID="FotoImageButton" runat="server" ImageAlign="Middle" ImageUrl="~/Layout/Imgs/fotos.png" />
    </div>
    <div class="detalhesResultadoBusca">
        <div id="titulo">
            <asp:Label ID="TituloLabel" runat="server" Text="Titulo"></asp:Label></div>
        <div id="descricao">
            <asp:Label ID="DescricaoLabel" runat="server" Text="Descricao"></asp:Label>
        </div>
        <div id="links" style="text-align: right">
            <asp:ImageButton ID="ListaImageButton" runat="server" ImageUrl="~/Layout/Imgs/lista.png"
                ImageAlign="Top" />
            <asp:ImageButton ID="ContatoImageButton" ImageUrl="~/Layout/Imgs/mail.png" runat="server"
                ImageAlign="Bottom" />
        </div>
    </div>
    <br />
</div>
<br />
<hr style="color: #0080C0; width: 70%; border: 1px solid #0080C0; margin: 5px" />

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="listaResultadoBusca.aspx.cs"
    Inherits="TTR.Site.listaResultadoBusca" %>

<%@ Register Src="Usercontrols/ResultadoBusca.ascx" TagName="ResultadoBusca" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="Stylesheet" href="../../Layout/Estilos/ResultadoBusca.css" type="text/css" />
</head>
<body style="width: 790px; background-color: White;">
    <form runat="server">
    <div>
        <div id="lista_itens">
            Ordenar Por:
        </div>
        <uc1:ResultadoBusca ID="ResultadoBusca1" runat="server" />


        <asp:Repeater ID="ResultadoRepeater" runat="server">
            <ItemTemplate>
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
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    </form>
</body>
</html>

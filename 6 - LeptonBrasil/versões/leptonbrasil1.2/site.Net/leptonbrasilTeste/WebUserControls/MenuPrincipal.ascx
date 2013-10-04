<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuPrincipal.ascx.cs"
    Inherits="leptonbrasil.WebUserControls.MenuPrincipal" %>
<style type="text/css">
    a:hover
    {
        color: Orange;
    }
    .style1
    {
        background-color: #FFFFFF;
    }
    .style2
    {
        font-weight: bold;
    }
</style>
<script language="javascript" src="../JavaScripts/MenuPrincipal.js" type="text/javascript"></script>
<div id="menuPrinc">
    <table id="tblMenu" cellpadding="10px" style="font-family: Bradley Hand ITC; font-weight: 500">
        <tr>
            <td class="style1">
                <asp:ImageButton ID="ImgBtnHome" runat="server" ImageUrl="~/Graficos/HomeMenu.png"
                    ImageAlign="Middle" OnClick="ImgBtnHome_Click" CausesValidation="False" />
            </td>
            <td class="style2">
                <asp:LinkButton ID="HlHome" runat="server" OnClick="HlHome_Click" Font-Underline="false"
                    CausesValidation="False">Home</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:ImageButton ID="ImgBtnServicos" runat="server" ImageAlign="Middle" ImageUrl="~/Graficos/ServicosMenu.png"
                    CausesValidation="False" OnClick="ImgBtnServicos_Click" />
            </td>
            <td class="style2">
                <asp:LinkButton ID="hlServicos" runat="server" Font-Underline="false" CausesValidation="False"
                    OnClick="hlServicos_Click">Serviços</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:ImageButton ID="imgBtnContato" runat="server" ImageAlign="Middle" ImageUrl="~/Graficos/ContatoMenu.png"
                    OnClick="imgBtnContato_Click" CausesValidation="False" />
            </td>
            <td class="style2">
                <asp:LinkButton ID="HlContato" runat="server" Font-Underline="false" OnClick="HlContato_Click"
                    CausesValidation="False">Contato</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:ImageButton ID="imgBtnNoticias" runat="server" ImageAlign="Middle" ImageUrl="~/Graficos/NoticiasMenu.png"
                    CausesValidation="False" OnClick="imgBtnNoticias_Click" />
            </td>
            <td class="style2">
                <asp:LinkButton ID="HlNoticias" runat="server" Font-Underline="false" CausesValidation="False"
                    OnClick="HlNoticias_Click">Notícias</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:ImageButton ID="imgBtnInstitucional" runat="server" ImageUrl="~/Graficos/LogoMenu.png"
                    ImageAlign="Middle" CausesValidation="False" OnClick="imgBtnInstitucional_Click" />
            </td>
            <td class="style2">
                <asp:LinkButton ID="HlInstitucional" runat="server" Font-Underline="false" CausesValidation="False"
                    OnClick="HlInstitucional_Click">Institucional</asp:LinkButton>
            </td>
        </tr>
    </table>
</div>
<link rel="Stylesheet" href="~/Estilos/MenuPrincipal.css" type="text/css" />

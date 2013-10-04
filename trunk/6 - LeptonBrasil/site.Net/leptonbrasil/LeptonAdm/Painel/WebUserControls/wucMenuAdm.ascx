<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="wucMenuAdm.ascx.cs"
    Inherits="leptonbrasil.LeptonAdm.Painel.WebUserControls.wucMenuAdm" %>
<div id="menuPrinc">
    <table id="tblMenu" cellpadding="10px" style="font-family: Bradley Hand ITC; font-weight: 500">
        <tr>
            <td class="style1">
                <asp:ImageButton ID="ImgBtnServicos" runat="server" ImageAlign="Middle" ImageUrl="~/Graficos/ServicosMenu.png"
                    CausesValidation="False" OnClick="ImgBtnServicos_Click" />
            </td>
            <td>
                <b>
                <asp:LinkButton ID="hlServicos" runat="server" Font-Underline="false" CausesValidation="False"
                    OnClick="hlServicos_Click">Serviços</asp:LinkButton>
                </b>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:ImageButton ID="imgBtnNoticias" runat="server" ImageAlign="Middle" ImageUrl="~/Graficos/NoticiasMenu.png"
                    CausesValidation="False" OnClick="imgBtnNoticias_Click" />
            </td>
            <td>
                <b>
                <asp:LinkButton ID="HlNoticias" runat="server" Font-Underline="false" CausesValidation="False"
                    OnClick="HlNoticias_Click">Notícias</asp:LinkButton>
                </b>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:ImageButton ID="imgBtnInstitucional" runat="server" ImageUrl="~/Graficos/LogoMenu.png"
                    ImageAlign="Middle" CausesValidation="False" OnClick="imgBtnInstitucional_Click" />
            </td>
            <td>
                <b>
                <asp:LinkButton ID="HlInstitucional" runat="server" Font-Underline="false" CausesValidation="False"
                    OnClick="HlInstitucional_Click">Institucional</asp:LinkButton>
                </b>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:ImageButton ID="ParametrosImageButton" runat="server" 
                    ImageUrl="~/Graficos/params.png" ImageAlign="Middle"
                    CausesValidation="False" onclick="ParametrosImageButton_Click" />
            </td>
            <td>
                <b>
                <asp:LinkButton ID="ParametrosLinkButton" runat="server" Font-Underline="false" 
                    CausesValidation="False" onclick="ParametrosLinkButton_Click">Parâmetros</asp:LinkButton>
                </b>
            </td>
        </tr>
    </table>
</div>
<link rel="Stylesheet" href="~/LeptonAdm/Painel/Estilos/MenuPrincipalAdm.css" type="text/css" />

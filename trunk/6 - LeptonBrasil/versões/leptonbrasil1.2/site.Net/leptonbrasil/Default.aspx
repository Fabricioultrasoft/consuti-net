<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="leptonbrasil.WebForm1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="Stylesheet" href="Estilos/Home.css" type="text/css" />
    <style type="text/css">
        .style5
        {
            background-color: #FFFFFF;
            text-align: justify;
        }
        .style6
        {
            text-align: justify;
        }
        .style18
        {
            background-color: #FFFFFF;
            text-align: justify;
            width: 195px;
        }
        .style19
        {
            width: 195px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="divHome">
        <div id="imagemApresentacao">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Graficos/Pagina_Inicial_do_web_site.jpg"
                Width="690px" BorderWidth="0px" ImageAlign="Middle" Height="300px" />
            <cc1:RoundedCornersExtender ID="Image1_RoundedCornersExtender" runat="server" BorderColor="White"
                Color="White" Enabled="True" TargetControlID="Image1">
            </cc1:RoundedCornersExtender>
        </div>
        <br />
        <div id="menuHome">
            <table id="tblMenuHome" style="width: 96%; font-size: small;">
                <tr>
                    <td class="style5">
                        &nbsp;<asp:ImageButton ID="imgBtnSer" runat="server" ImageUrl="~/Graficos/serv.jpg"
                            ImageAlign="Middle" OnClick="imgBtnSer_Click"></asp:ImageButton>
                    </td>
                    <td class="style18">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="TextoMenuServicosLabel" runat="server" Text=""></asp:Label>
                    </td>
                    <td class="style5">
                        &nbsp;<asp:ImageButton ID="imgBtnCont" runat="server" ImageUrl="~/Graficos/Contact.jpg"
                            ImageAlign="Middle" OnClick="imgBtnCont_Click"></asp:ImageButton>
                    </td>
                    <td class="style5">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="TextoMenuContatoLabel" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        &nbsp;<asp:ImageButton ID="ImgBtnNot" runat="server" ImageUrl="~/Graficos/inf.jpg"
                            ImageAlign="Middle" OnClick="ImgBtnNot_Click"></asp:ImageButton>
                    </td>
                    <td style="text-align: justify" class="style19">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="TextoMenuNoticiasLabel" runat="server" Text=""></asp:Label>
                    </td>
                    <td class="style5">
                        &nbsp;<asp:ImageButton ID="ImgBtnInstit" runat="server" ImageUrl="~/Graficos/Instit.jpg"
                            OnClick="ImgBtnInstit_Click"></asp:ImageButton>
                    </td>
                    <td class="style6">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="TextoMenuInstitucionalLabel" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <br />
    </div>
</asp:Content>

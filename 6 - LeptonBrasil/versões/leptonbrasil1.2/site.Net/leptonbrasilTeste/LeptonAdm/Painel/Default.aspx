<%@ Page Title="" Language="C#" MasterPageFile="~/LeptonAdm/Painel/AdmMaster.Master"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="leptonbrasil.LeptonAdm.Painel.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div style="text-align: center">
        Bem vindo ao painel administrativo!<br />
        Para começar, acesse umas das opções no menu.
    </div>
    <br />
    <br />
    <div>
        <table id="tblMenuHome" 
            style="width: 70%; font-size: small; margin: 0 auto">
            <tr>
                <td class="style5">
                    &nbsp;<asp:ImageButton ID="imgBtnSer" runat="server" ImageUrl="~/Graficos/serv.jpg"
                        ImageAlign="Middle" OnClick="imgBtnSer_Click"></asp:ImageButton>
                </td>
                <td class="style5">
                    &nbsp;&nbsp;&nbsp;&nbsp; Gerencie o conteúdo da sua página de <strong>Serviços</strong>.</td>
            </tr>
            <tr>
                <td class="style5">
                    &nbsp;<asp:ImageButton ID="ImgBtnNot" runat="server" ImageUrl="~/Graficos/inf.jpg"
                        ImageAlign="Middle" OnClick="ImgBtnNot_Click"></asp:ImageButton>
                </td>
                <td style="text-align: justify">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Publique <strong>notícias</strong> no painel de 
                    <strong>notícias</strong> do site acessando o gerenciador de 
                    <strong>notícias</strong>.</td>
            </tr>        
            <tr>
                <td class="style5">
                    &nbsp;<asp:ImageButton ID="ImgBtnInstit" runat="server" ImageUrl="~/Graficos/Instit.jpg"
                        OnClick="ImgBtnInstit_Click"></asp:ImageButton>
                </td>
                <td class="style6">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Gerencie o conteúdo da página <strong>Institucional</strong> do site.</td>
            </tr>
            <tr>
                <td class="style5">
                    &nbsp;<asp:ImageButton ID="ConfigParamsImageButton" runat="server" 
                        ImageUrl="~/Graficos/Param128.png" onclick="ConfigParamsImageButton_Click"
                        ></asp:ImageButton>
                </td>
                <td class="style6">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Configurações dos <strong>parâmetros</strong> do site.</td>
            </tr>
        </table>
    </div>
    <br />
    <br />
    <div style="text-align: right; font-size: x-small">
        Dúvidas ou sugestões basta enviar emails para 
        <a href="mailto:consuti@consuti.net">consuti@consuti.net</a>.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <br />
    </div>
</asp:Content>

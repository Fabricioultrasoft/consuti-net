<%@ Page Title="" Language="C#" MasterPageFile="~/LeptonAdm/Painel/AdmMaster.Master"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="leptonbrasil.LeptonAdm.Painel.AdmInstitucional.Default"
    ValidateRequest="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Estilos/AdmInstitucional.css" type="text/css" rel="Stylesheet" />
    <style type="text/css">
        .style6
        {
            font-size: x-small;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <br />
        <div id="cabecalho">
            <div id="dataHora">
                <strong>Data da Última Modificação:</strong>
                <asp:Label ID="lblDataHora" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <div id="conteudoFuncional">
            <div id="tituloTela">
                <strong>Título da Tela:</strong>
                <br />
                <asp:TextBox ID="txbTituloTela" runat="server" Width="500px"></asp:TextBox>
                <br />
                <br />
                <strong>Imagem Rodapé Tela:<span class="style6"> (Largura máxima 695pixels)</span></strong><br />
                <asp:FileUpload ID="ImagemRodapeInstitucionalFileUpload" runat="server" Width="500px" />
                <br />
                <br />
                <strong>Texto da Tela:</strong>
                <cc1:Editor ID="editTextoTela" runat="server" Height="500px" InitialCleanUp="false"
                    Content="teste" />
                    
                    
                <div id="autor">
                    <asp:Label ID="lblAutor" runat="server" Text=""></asp:Label></div>
                <br />
                <br />
                <div id="botoesTela">
                    <asp:Button ID="btnSalvar" runat="server" Text="Salvar" Width="80px" OnClick="btnSalvar_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="tbnCancelar" runat="server" Text="Cancelar" Width="80px" OnClick="tbnCancelar_Click" />
                    <br />
                    <br />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

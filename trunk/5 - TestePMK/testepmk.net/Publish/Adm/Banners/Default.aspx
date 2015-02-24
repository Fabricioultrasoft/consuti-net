<%@ Page Title="Teste PMK - Adm Banner" Language="C#" MasterPageFile="~/Adm/AdmMaster.Master"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="testePMK.com.br.Adm.Banners.AtualizaBanners" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            text-decoration: underline;
        }
        .style2
        {
            font-size: xx-small;
        }
        .style3
        {
            color: #CC3300;
            font-size: xx-small;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="style1">
        Banners</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="subTitulo">
        Atualizar Banner de Promoções<br />
        <asp:Panel ID="pnlCont" runat="server">
            <div style="text-align: right; font-size: xx-small">
                <br />
                Útima atualização:
                <asp:Label ID="lblUltAtualizacao" runat="server" Style="font-weight: 700"></asp:Label>
                &nbsp;</div>
            <div style="margin-left: 30px; text-align: left;">
                Preencha os campos abaixo para atualizar o banner de promoções.<br />
                <br />
                Título do Banner:<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                    ControlToValidate="txbTituloBan" Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator5_ValidatorCalloutExtender"
                    runat="server" Enabled="True" TargetControlID="RequiredFieldValidator5">
                </cc1:ValidatorCalloutExtender>
                <br />
                <asp:TextBox ID="txbTituloBan" runat="server" Width="500px" MaxLength="50"></asp:TextBox>
                <br />
                <br />
                Mensagem do Banner: <span class="style3">*max 500 caracteres </span>
                <br />
                <cc2:Editor ID="Editor1" runat="server" />
                <br />
                <br />
            </div>
            <div style="margin-left: 30px; text-align: left; width: 500px;">
                <div style="text-align: center">
                    Imagem Atual:<br />
                    <div style="border: 1px solid #008000; text-align: center; width: 300px; height: 300px;
                        margin-left: 100px;">
                        <asp:Image ID="imgBannPromoc" runat="server" ImageAlign="AbsMiddle" 
                            Height="300px" Width="300px" />
                    </div>
                </div>
                <br />
                Imagem: (<span class="style2">recomendado 300x300 e max 500kb</span>)<br />
                <cc1:AsyncFileUpload ID="afuPromoc" runat="server" />
                <br />
            </div>
            <br />            
            <div style="text-align: center">
                <asp:Button ID="btnSalvar" runat="server" Text="Salvar" Width="107px" OnClick="btnSalvar_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnZerabann" runat="server" OnClick="btnZerabann_Click" Text="Banner Zerado" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnLimpar" runat="server" Text="Cancelar" CausesValidation="False"
                    OnClick="btnLimpar_Click" Width="107px" />
            </div>
            <br />
        </asp:Panel>
        <cc1:RoundedCornersExtender ID="pnlCont_RoundedCornersExtender" runat="server" BorderColor="Green"
            Enabled="True" TargetControlID="pnlCont">
        </cc1:RoundedCornersExtender>
    </div>
</asp:Content>

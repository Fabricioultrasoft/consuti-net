<%@ Page Title="Teste PMK - Adm Banner" Language="C#" MasterPageFile="~/Adm/AdmMaster.Master"
    AutoEventWireup="true" CodeBehind="AtualizaBanners.aspx.cs" Inherits="testePMK.com.br.Adm.Banners.AtualizaBanners" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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
    </style>
    <script type="text/javascript">
        //javascript para controlar o tamanho do text box
        var max = 501;
        var ancho = 300;
        function progreso_tecla(obj) {
            var progreso = document.getElementById("progresso");
            if (obj.value.length < max) {
                progreso.style.backgroundColor = "#E8EEF9";
                progreso.style.backgroundImage = "url(textarea.png)";
                progreso.style.color = "#000000";
                var pos = ancho - parseInt((ancho * parseInt(obj.value.length)) / 500);
                progreso.style.backgroundPosition = "-" + pos + "px 0px";
            }
            else {
                progreso.style.backgroundColor = "#CC0000";
                progreso.style.backgroundImage = "url()";
                progreso.style.color = "#E8EEF9";
                obj.value = obj.value.substring(0, max);
            }

            progreso.innerHTML = "(" + obj.value.length + " / " + (max - 1) + ")";
        }
    </script>
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
                Mensagem do Banner:
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txbDescricao"
                    Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator4_ValidatorCalloutExtender"
                    runat="server" Enabled="True" TargetControlID="RequiredFieldValidator4">
                </cc1:ValidatorCalloutExtender>
                <br />
                <asp:TextBox ID="txbDescricao" runat="server" CausesValidation="True" Height="100px"
                    MaxLength="20" onkeyup="progreso_tecla(this)" TextMode="MultiLine" Width="500px"></asp:TextBox>
                <br />
                <div id="progresso">
                    (0 / 500)</div>
                <br />
            </div>
            <div style="margin-left: 30px; text-align: left; width: 500px;">
                <div style="text-align: center">
                    Imagem Atual:<br />
                    <div style="border: 1px solid #008000; text-align: center; width: 300px; height: 300px;
                        margin-left: 100px;">
                        <asp:Image ID="imgBannPromoc" runat="server" ImageAlign="AbsMiddle" />
                    </div>
                </div>
                <br />
                Imagem: (<span class="style2">max 300x300 e 500kb</span>)<br />
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

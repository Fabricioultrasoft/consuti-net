<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImagensProduto.aspx.cs"
    Inherits="testePMK.com.br.Adm.Produtos.ImagensProduto" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Teste PMK - imgsProdutos</title>
    <link href="~/Adm/EstilosAdm.css" rel="stylesheet" type="text/css" />
    <!-- script para trocar a imagem de play e pause-->
    <script type="text/javascript">
        function troca(obj) {
            if (obj.alt == "Pause") {
                document.getElementById("ImgGaleriaPause").src = "../../Graficos/Play.png"
                document.getElementById("ImgGaleriaPause").alt = "Play"
            } else {
                document.getElementById("ImgGaleriaPause").src = "../../Graficos/Pause.png"
                document.getElementById("ImgGaleriaPause").alt = "Pause"
            }
        }

    </script>
    <style type="text/css">
        .style1
        {
            text-decoration: underline;
            font-size: medium;
        }
    </style>
</head>
<body style="background-image: url(); background-color: Black;">
    <div style="background-color: #000000; width: 100%; height: 100%">
        <form id="form1" runat="server" style="background-color: #000000">
        <div class="page" style="background-color: #000000">
            <div style="margin: 20px; text-align: center">
                <asp:Panel ID="Panel1" runat="server" BackColor="Black" HorizontalAlign="Center">
                    <div>
                        <br />
                        <asp:Label ID="LblgaleriaNomeImg" runat="server" Style="font-weight: 700; font-size: large; color: #FFFFFF;"
                            Text="Label"></asp:Label>
                        <br />
                        <asp:ImageButton ID="ImgBtnGaleriaVoltar" runat="server" AlternateText="Voltar" CausesValidation="False"
                            ImageUrl="~/Graficos/Voltar.png" />
                        &nbsp; &nbsp;&nbsp; <a style="border-width: 0px">
                            <img id="ImgGaleriaPause" alt="Pause" src="../../Graficos/Pause.png" onclick="javascript:troca(ImgGaleriaPause);" /></a>&nbsp;&nbsp;
                        &nbsp;
                        <asp:ImageButton ID="ImgBtnGaleriaAvancar" runat="server" AlternateText="Avançar"
                            CausesValidation="False" ImageUrl="~/Graficos/Avancar.png" />
                        <br />
                        <br />
                        <asp:Image ID="ImgGaleriaSlidShow" runat="server" />
                        <br />
                        <cc1:SlideShowExtender ID="ImgGaleriaSlidShow_SlideShowExtender" runat="server" AutoPlay="True"
                            Enabled="True" ImageTitleLabelID="LblgaleriaNomeImg" Loop="True" NextButtonID="ImgBtnGaleriaAvancar"
                            PlayButtonID="ImgGaleriaPause" PlayInterval="3000" PreviousButtonID="ImgBtnGaleriaVoltar"
                            SlideShowServiceMethod="GetSlides" SlideShowServicePath="" TargetControlID="ImgGaleriaSlidShow"
                            UseContextKey="True">
                        </cc1:SlideShowExtender>
                        <br />
                        <br />
                        <span class="style1"><strong style="color: #FFFFFF">Descrição detalhada do produto:</strong></span><br />
                        <div style="width: 740px; text-align: justify; margin-left: 60px">
                            <br />
                            <asp:Label ID="descricaoCompletaProduto" runat="server" Text="" 
                                style="color: #FFFFFF"></asp:Label>
                            <br />
                            <br />
                        </div>
                    </div>
                </asp:Panel>
            </div>
            <cc1:RoundedCornersExtender ID="Panel1_RoundedCornersExtender" runat="server" BorderColor="Green"
                Color="Black" Enabled="True" TargetControlID="Panel1">
            </cc1:RoundedCornersExtender>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        </form>
    </div>
</body>
</html>

<%@ Page Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Acomodacoes.aspx.cs" Inherits="pousadaZ.WebForm4" Title="Untitled Page" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            text-decoration: underline;
        font-size: medium;
        font-weight: 700;
    }
        .style2
        {
            font-size: small;
        }
        </style>
        <!-- script para trocar a imagem de play e pause-->
    <script type="text/javascript">
         function troca(obj){
    if(obj.alt=="Pause"){
        document.getElementById("ImgGaleriaPause").src = "../Graficos/Play.png"
        document.getElementById("ImgGaleriaPause").alt = "Play"
    }else{
    document.getElementById("ImgGaleriaPause").src = "../Graficos/Pause.png"
    document.getElementById("ImgGaleriaPause").alt = "Pause"
    }
}
function troca2(obj) {
    if (obj.alt == "Pause") {
        document.getElementById("ImgGaleriaPause2").src = "../Graficos/Play.png"
        document.getElementById("ImgGaleriaPause2").alt = "Play"
    } else {
        document.getElementById("ImgGaleriaPause2").src = "../Graficos/Pause.png"
        document.getElementById("ImgGaleriaPause2").alt = "Pause"
    }
}
function troca3(obj) {
    if (obj.alt == "Pause") {
        document.getElementById("ImgGaleriaPause3").src = "../Graficos/Play.png"
        document.getElementById("ImgGaleriaPause3").alt = "Play"
    } else {
        document.getElementById("ImgGaleriaPause3").src = "../Graficos/Pause.png"
        document.getElementById("ImgGaleriaPause3").alt = "Pause"
    }
}

         
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div><div id="titulo">
    <br />
    <p class="style1">
        ACOMODAÇÕES DA POUSADA</p>
    <p>
        Suite com varanda privativa</div>
        
        <div style="margin:20px; text-align:center">
        
        <asp:Panel ID="Panel1" runat="server" 
            BackColor="#A7CCE7" Width="624px" HorizontalAlign="Center" >
            <div class="style2">
                <br />
                <asp:Image ID="ImgGaleriaSlidShow" runat="server" />
                <cc1:SlideShowExtender ID="ImgGaleriaSlidShow_SlideShowExtender" runat="server" 
                    AutoPlay="false" Enabled="True" ImageTitleLabelID="LblgaleriaNomeImg" 
                    Loop="true" NextButtonID="ImgBtnGaleriaAvancar" 
                    PlayButtonID="ImgGaleriaPause" PlayInterval="3000" 
                    PreviousButtonID="ImgBtnGaleriaVoltar" SlideShowServiceMethod="GetSlidesVaranda" 
                    SlideShowServicePath="" TargetControlID="ImgGaleriaSlidShow" 
                    UseContextKey="True">
                </cc1:SlideShowExtender>
                <asp:Label ID="LblgaleriaNomeImg" runat="server" Text="Label"></asp:Label>
                <br />
                <br />
                <asp:ImageButton ID="ImgBtnGaleriaVoltar" runat="server" AlternateText="Voltar" 
                    CausesValidation="False" ImageUrl="../Graficos/Voltar.png" />
                &nbsp; &nbsp;&nbsp;
                
                <img id="ImgGaleriaPause" alt="Pause" src="../Graficos/Pause.png" onclick="javascript:troca(ImgGaleriaPause);" />&nbsp;&nbsp; 
                &nbsp; 
               
                <asp:ImageButton ID="ImgBtnGaleriaAvancar" runat="server" 
                    AlternateText="Avançar" CausesValidation="False" 
                    ImageUrl="../Graficos/Avancar.png" />
            </div>
    </asp:Panel>
</div>
<cc1:RoundedCornersExtender ID="Panel1_RoundedCornersExtender" runat="server" 
    BorderColor="Beige" Color="167, 204, 231" Enabled="True" 
    TargetControlID="Panel1" Radius="7">
</cc1:RoundedCornersExtender>
<p>
        &nbsp;</p>
    </div>
    
    <p>
        Chalé<div style="margin:20px; text-align:center">
        
        <asp:Panel ID="Panel2" runat="server" 
            BackColor="#A7CCE7" Width="624px" HorizontalAlign="Center" >
            <div class="style2">
                <br />
                <asp:Image ID="ImgGaleriaSlidShow2" runat="server" />
                <cc1:SlideShowExtender ID="ImgGaleriaSlidShow_SlideShowExtender2" runat="server" 
                    AutoPlay="false" Enabled="True" ImageTitleLabelID="LblgaleriaNomeImg2" 
                    Loop="True" NextButtonID="ImgBtnGaleriaAvancar2" 
                    PlayButtonID="ImgGaleriaPause2" PlayInterval="3000" 
                    PreviousButtonID="ImgBtnGaleriaVoltar2" SlideShowServiceMethod="GetSlidesChale" 
                    SlideShowServicePath="" TargetControlID="ImgGaleriaSlidShow2" 
                    UseContextKey="True">
                </cc1:SlideShowExtender>
                <asp:Label ID="LblgaleriaNomeImg2" runat="server" Text="Label"></asp:Label>
                <br />
                <br />
                <asp:ImageButton ID="ImgBtnGaleriaVoltar2" runat="server" AlternateText="Voltar" 
                    CausesValidation="False" ImageUrl="../Graficos/Voltar.png" />
                &nbsp; &nbsp;&nbsp;
                
                <img id="ImgGaleriaPause2" alt="Pause" src="../Graficos/Pause.png" onclick="javascript:troca2(ImgGaleriaPause2);" />&nbsp;&nbsp; 
                &nbsp; 
               
                <asp:ImageButton ID="ImgBtnGaleriaAvancar2" runat="server" 
                    AlternateText="Avançar" CausesValidation="False" 
                    ImageUrl="../Graficos/Avancar.png" />
            </div>
    </asp:Panel>
</div>
<cc1:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" 
    BorderColor="Beige" Color="167, 204, 231" Enabled="True" 
    TargetControlID="Panel2" Radius="7">
</cc1:RoundedCornersExtender>
<p>
        </p>
    <p>
        Suite king Size</p>
    <div style="margin:20px; text-align:center">
        
        <asp:Panel ID="Panel3" runat="server" 
            BackColor="#A7CCE7" Width="624px" HorizontalAlign="Center" >
            <div class="style2">
                <br />
                <asp:Image ID="ImgGaleriaSlidShow3" runat="server" />
                <cc1:SlideShowExtender ID="SlideShowExtender1" runat="server" 
                    AutoPlay="false" Enabled="True" ImageTitleLabelID="LblgaleriaNomeImg3" 
                    Loop="True" NextButtonID="ImgBtnGaleriaAvancar3" 
                    PlayButtonID="ImgGaleriaPause3" PlayInterval="3000" 
                    PreviousButtonID="ImgBtnGaleriaVoltar3" SlideShowServiceMethod="GetSlidesKing" 
                    SlideShowServicePath="" TargetControlID="ImgGaleriaSlidShow3" 
                    UseContextKey="True">
                </cc1:SlideShowExtender>
                <asp:Label ID="LblgaleriaNomeImg3" runat="server" Text="Label"></asp:Label>
                <br />
                <br />
                <asp:ImageButton ID="ImgBtnGaleriaVoltar3" runat="server" AlternateText="Voltar" 
                    CausesValidation="False" ImageUrl="../Graficos/Voltar.png" />
                &nbsp; &nbsp;&nbsp;
                
                <img id="ImgGaleriaPause3" alt="Pause" src="../Graficos/Pause.png" 
                    onclick="javascript:troca3(ImgGaleriaPause3);" />&nbsp;&nbsp; 
                &nbsp; 
               
                <asp:ImageButton ID="ImgBtnGaleriaAvancar3" runat="server" 
                    AlternateText="Avançar" CausesValidation="False" 
                    ImageUrl="../Graficos/Avancar.png" />
            </div>
    </asp:Panel>
        <cc1:RoundedCornersExtender ID="Panel3_RoundedCornersExtender" runat="server" 
            Enabled="True" TargetControlID="Panel3">
        </cc1:RoundedCornersExtender>
</div>
        &nbsp;</p>
    </div>
</asp:Content>

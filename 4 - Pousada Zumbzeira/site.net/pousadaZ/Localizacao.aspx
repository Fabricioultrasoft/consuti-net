<%@ Page Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Localizacao.aspx.cs" Inherits="pousadaZ.WebForm1" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            text-decoration: underline;
        font-size: medium;
        font-weight: bold;
    }
        .style2
        {
            font-size: small;
        }
        .style3
        {
            width: 604px;
            font-size: small;
            margin-left: 20px;
            text-align: justify;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <p class="style1">
        LOCALIZAÇÃO</p>
<div class="style3">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    A 
    pousada está a 4.5 Km de distância da BR 040, na Estrada do Engenho - São 
    Sebastião das Águas Claras - Macacos - MG. Apenas 14.5 Km de BH Shopping, 21 Km 
    do centro de Belo Horizonte, 20 Km do Bairro Alphaville (Fundação Dom Cabral), 
    80Km de Ouro Preto e 423 Km do Rio de Janeiro. </div>
    <p>
        <img alt="" src="../Graficos/mapaDesenho.jpg" /></p>
    
    <p class="style2">
        Estamos te esperando. Venha desfrutar da tranquilidade da Pousada Zumbzeira!</p>
        <p style="font-size: xx-small">
        <iframe id="I1" frameborder="0" height="500" marginheight="0" marginwidth="0" 
            name="I1" scrolling="no" 
            src="http://maps.google.com.br/maps?f=d&amp;source=s_d&amp;saddr=-19.974135,-43.946407&amp;daddr=Estr.+do+Engenho&amp;hl=pt-BR&amp;geocode=%3BFXkvzv4dc89h_Q&amp;mra=dme&amp;mrcr=0&amp;mrsp=0&amp;sz=16&amp;sll=-19.97476,-43.9413&amp;sspn=0.011898,0.018926&amp;ie=UTF8&amp;ll=-20.00529,-43.940678&amp;spn=0.080652,0.085659&amp;z=13&amp;output=embed" 
            width="500"></iframe>
        <br />
        <small>
        <a href="http://maps.google.com.br/maps?f=d&amp;source=embed&amp;saddr=-19.974135,-43.946407&amp;daddr=Estr.+do+Engenho&amp;hl=pt-BR&amp;geocode=%3BFXkvzv4dc89h_Q&amp;mra=dme&amp;mrcr=0&amp;mrsp=0&amp;sz=16&amp;sll=-19.97476,-43.9413&amp;sspn=0.011898,0.018926&amp;ie=UTF8&amp;ll=-20.00529,-43.940678&amp;spn=0.080652,0.085659&amp;z=13" 
            style="color:#0000FF;text-align:left">Exibir mapa ampliado</a></small></p>
<p style="font-size: xx-small">
        &nbsp;</p>
    
</asp:Content>

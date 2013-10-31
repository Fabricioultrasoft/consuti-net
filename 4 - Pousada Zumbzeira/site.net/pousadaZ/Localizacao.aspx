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
        .style4
        {
            font-size: small;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <p class="style1">
        LOCALIZAÇÃO</p>
<div class="style3">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <p class="style4">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Alguns pontos de referência</p>
                    <ul class="style2" id="referencias">
                        <li><b>3,5km</b> do povoado de Macacos: ponto de encontro que é conhecido pelos bares e restaurantes.</li>
                        <li><b>3,5km</b> da Igrejinha de Macacos que possui mais 280 anos de história.</li>
                        <li><b>4km</b> da Mina Mar Azul, BR040 e do Posto Mutuca.</li>
                        <li><b>7km</b> do bairro Jardim Canadá: que concentra as melhores casas de festas da região.</li>
                        <li><b>14km</b> dos melhores shoppings: BH shopping e Leroy Merlin.</li>
                        <li><b>15km</b> do Hospital Biocor e Clinica de Olhos: Dr. Ricardo Guimarães (referência
                            cirúgia cardiáca e oftalmológica).</li>
                        <li><b>20km</b> de Nova Lima.</li>
                        <li><b>20km</b> de Contagem, polo industrial de Minas Geral.</li>
                        <li><b>22km</b> da Fundação Dom Cabral na Lagoa dos Ingleses, Instituição Brasileira de Ensino Superior.</li>
                        <li><b>23km</b> do Restaurante Topo do Mundo.</li>
                        <li><b>25km</b> centro de BH: Mercado Central, Feira Hippie, Rua do Amendoim.</li>
                        <li><b>30km</b> de Betim, polo industrial de Minas Geral.</li>
                        <li><b>45km</b> de Sabará, cidade histórica.</li>
                        <li><b>60km</b> de Congonhas, cidade histórica.</li>
                        <li><b>67km</b> do Museu Inhotim, maior museu a céu aberto do mundo.</li>
                        <li><b>70km</b> de Ouro Preto, uma das mais belas cidades históricas do mundo.</li>
                        </ul> </div>
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

<%@ Page Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs"
    Inherits="pousadaZ.WebForm8" Title=".:Pousada Zumbzeira:." %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            font-size: medium;
            text-decoration: underline;
            font-weight: bold;
            letter-spacing: 1.1pt;
        }
        .style2
        {
            font-size: small;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- flash -->
    <div >
        <object style="height: 250px;  width: 648px;" id="Object1" >
                    <param name="ban2" value="../Graficos/BanImgs.swf" />
                    <param name="quality" value="high" />
                    <param name="wmode" value="TRANSPARENT" />
                    <embed src="../Graficos/BanImgs.swf" wmode="transparent" quality="high" bgcolor="" height="250px"; width="648px;"/>
    </object>
    </div>
    <!-- fim flash -->
    <div style="background-image: url('../Graficos/FundoPrinc.jpg'); height: 432px; width:99%; text-align: center; margin-left" >
        <p class="style1">
            A PAZ E TRANQUILIDADE PRÓXIMAS DE VOCÊ</p>
        <div style="text-align: left">
            <div align="center" style="width: 434px; text-align: justify; margin-left: 111px;
                margin-bottom: 0px; height: 394px;">
                <p class="style2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A Pousada Zumbzeira está localizada na região
                    metropolitana de Belo Horizonte próximo ao BH Shopping, no povoado de São Sebastião
                    das Águas Claras - Macacos, MG. Cercada de matas e montanhas. Esta beleza natural,
                    associada à estrutra de hospedagem, proporciona à você, sua família e amigos a oportunidade
                    de diversão e relaxamento em um só lugar.</p>
                <p class="style2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A região oferece uma grande variedade de trilhas,
                    penhascos, cachoeiras, rios e estradas históricas que permitem a prática do turismo
                    ecológico e esportes de aventura como o evento Off-Road, que reúne jipeiros, motoqueiros
                    e ciclistas de várias regiões.</p>
                <p class="style2">
                    &nbsp;
                    <object style="height: 105px;  width: 430px;" id="menu" >
                    <param name="ban2" value="../Graficos/flashprinc.swf" />
                    <param name="quality" value="high" />
                    <param name="wmode" />
                    <embed src="../Graficos/flashprinc.swf" quality="high" height="105px"; width="430px;"/>
                </object>
                </p>
                <p class="style2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Acreditamos que o contato com a natureza é
                    a maneira mais eficaz para o seu relaxamento.</p>
            </div>
        </div>
    </div>
</asp:Content>

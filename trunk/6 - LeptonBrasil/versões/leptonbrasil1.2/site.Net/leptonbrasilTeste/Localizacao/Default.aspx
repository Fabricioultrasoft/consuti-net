<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="leptonbrasil.Localizacao.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="Stylesheet" href="../Estilos/Localizacao.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div id="texto">
        </div>
        <div id="mapa">
            <iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0"
                marginwidth="0" src="http://maps.google.com/maps?q=R.+S%C3%A3o+Bento,+1261+-+Sagrada+Fam%C3%ADlia,+Belo+Horizonte+-+MG,+31035-060,+Brasil&amp;sll=-19.902211,-43.918982&amp;hl=pt-BR&amp;sspn=0.006295,0.006295&amp;ie=UTF8&amp;hq=&amp;hnear=R.+S%C3%A3o+Bento,+1261+-+Sagrada+Fam%C3%ADlia,+Belo+Horizonte+-+Minas+Gerais,+31035-060,+Brasil&amp;ll=-19.902224,-43.918737&amp;spn=0.005518,0.004313&amp;t=h&amp;z=14&amp;output=embed">
            </iframe>
            <br />
            <small><a href="http://maps.google.com/maps?q=R.+S%C3%A3o+Bento,+1261+-+Sagrada+Fam%C3%ADlia,+Belo+Horizonte+-+MG,+31035-060,+Brasil&amp;sll=-19.902211,-43.918982&amp;hl=pt-BR&amp;sspn=0.006295,0.006295&amp;ie=UTF8&amp;hq=&amp;hnear=R.+S%C3%A3o+Bento,+1261+-+Sagrada+Fam%C3%ADlia,+Belo+Horizonte+-+Minas+Gerais,+31035-060,+Brasil&amp;ll=-19.902224,-43.918737&amp;spn=0.005518,0.004313&amp;t=h&amp;z=14&amp;source=embed"
                style="color: #0000FF; text-align: left">Exibir mapa ampliado</a></small></div>
    </div>
</asp:Content>

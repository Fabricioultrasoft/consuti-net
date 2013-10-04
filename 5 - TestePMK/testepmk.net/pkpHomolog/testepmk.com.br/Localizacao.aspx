<%@ Page Title="Teste PMK - Localização" Language="C#" MasterPageFile="~/Master.Master"
    AutoEventWireup="true" CodeBehind="Localizacao.aspx.cs" Inherits="testePMK.com.br.Complementos.Localizacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
        Localização</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center">
        <strong>
            <br />
            Endereço<br />
            <br />
        </strong>&nbsp;Rua Sergipe, Nº625 sala 606 - Savassi, Belo Horizonte - Minas Gerais<br />
        <br />
    </div>
    <div style="text-align: center">
        <iframe frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com.br/maps?f=q&amp;source=s_q&amp;hl=pt-BR&amp;geocode=&amp;q=Rua+Sergipe,+625+sala+606++B.+Funcion%C3%A1rios+BHte+MG&amp;sll=-19.932158,-43.936736&amp;sspn=0.001473,0.001717&amp;ie=UTF8&amp;hq=&amp;hnear=R.+Sergipe,+625+-+Savassi,+Belo+Horizonte+-+Minas+Gerais,+30130-170&amp;ll=-19.932835,-43.936928&amp;spn=0.0117,0.013733&amp;z=14&amp;output=embed"
            style="height: 600px; width: 555px"></iframe>
        <br />
        <br />
        <small><a href="http://maps.google.com.br/maps?f=q&amp;source=embed&amp;hl=pt-BR&amp;geocode=&amp;q=Rua+Sergipe,+625+sala+606++B.+Funcion%C3%A1rios+BHte+MG&amp;sll=-19.932158,-43.936736&amp;sspn=0.001473,0.001717&amp;ie=UTF8&amp;hq=&amp;hnear=R.+Sergipe,+625+-+Savassi,+Belo+Horizonte+-+Minas+Gerais,+30130-170&amp;ll=-19.932835,-43.936928&amp;spn=0.0117,0.013733&amp;z=14"
            style="color: #0000FF; text-align: left">Exibir mapa ampliado</a></small></div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="geraldopablo15123.LancamentoCandidatura.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style8
        {
            text-align: center;
            font-size: xx-large;
            text-decoration: underline;
        }
        .style9
        {
            text-align: justify;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="style8">
            <strong>“A MUDANÇA É AGORA!” </strong>
        </div>
        <div class="style9">
            <br />
            <span class="style6"><strong>O Lançamento da Candidatura</strong></span><br />
            <br />
            &nbsp;&nbsp;&nbsp; Apoiado em toda a minha formação e experiência profissional na
            área de Recursos Humanos, atuando em grandes empresas de Minas Gerais nos últimos
            26 anos na gerência, consultoria, cursos e treinamentos, e ainda como professor
            de escolas técnicas nas matérias de segurança e saúde do trabalho, estando sempre
            presente e a disposição dos movimentos voluntários sociais da comunidade, venho
            lançar a minha candidatura de Vereador com o número 15123, na Câmara Municipal de
            Brasilândia de Minas, nestas eleições de 2012.
            <br />
            <br />
            <div style="text-align: center">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Imagens/LancamentoCandidatura.jpg"
                    ImageAlign="Middle" BorderColor="Black" BorderWidth="1px"  />
            </div>
        </div>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="geraldopablo15123.AtualRealidade.Default" %>

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
            <strong>A ATUAL REALIDADE DA CIDADE</strong>
        </div>
        <div class="style9">
            <br />
            &nbsp;&nbsp;&nbsp; Brasilândia de Minas é a cidade que mais cresce hoje no noroeste
            mineiro, com mais de 15 mil habitantes e localização estratégica e privilegiada,
            alto potencial de qualidade de vida, e, garantido desenvolvimento agroindustrial,
            energético e pecuário sustentáveis, porém sofre nos últimos 8 anos com uma administração
            municipal totalmente deficiente e que não atende mais aos interesses de toda a comunidade,
            apenas pequenos grupos, sem ética, transparência e resultados satisfatórios.
            <br />
&nbsp;&nbsp;&nbsp; Na
            questão político-administrativa a cidade praticamente “parou no tempo”, com GRAVES
            PROBLEMAS na área da saúde e atendimento de urgência e emergência; educação de nível
            técnico e superior; apoio as comunidades rurais; lazer e turismo; infraestrutura
            urbana tais como praças, pavimentação e saneamento; preservação ambiental; políticas
            sociais de atendimento a infância, juventude e idosos; e principalmente falta de
            uma reforma administrativa na prefeitura para se adequar ao novo mundo globalizado.
            <br />
            <br />
            <div style="text-align: center">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Imagens/AtualRealidade.jpg"
                    ImageAlign="Middle" BorderColor="Black" BorderWidth="1px" />
            </div>
        </div>
    </div>
</asp:Content>

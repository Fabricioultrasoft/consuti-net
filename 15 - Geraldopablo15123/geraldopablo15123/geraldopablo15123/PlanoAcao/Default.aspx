<%@ Page Title="15123 - Plano de Ação" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="geraldopablo15123.PlanoAcao.Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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
            <strong>“PLANO DE AÇÃO” </strong>
        </div>
        <div class="style9">
            <br />
            &nbsp;&nbsp;&nbsp; Assim, apresento o meu planejamento dentro das competências do
            vereador, que é de fazer as leis da cidade, fiscalizar a prefeitura, apresentar
            requerimentos e pedidos ao prefeito, e se articular com a comunidade e as autoridades
            estaduais e federais, com as 10 prioridades básicas e URGENTES:
            <br />
            <br />
            <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
                <cc1:TabPanel runat="server" ID="TabPanel1">
                    <HeaderTemplate>
                        1.ESCOLAS TÉCNICAS</HeaderTemplate>
                    <ContentTemplate>
                        <b>INSTALAR ESCOLAS TÉCNICAS</b><br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Instalar e por em funcionamento cursos técnicos e
                        profissionalizantes nas áreas de informática, elétrica, mecânica, química, açúcar
                        e álcool, agroindústria, meio ambiente, estética, alimentação, hotelaria, idiomas,
                        artesanatos e outros, através do PRONATEC do Governo Federal, e em parcerias com
                        SENAI - SENAC - SENAR, com apoio e suporte do Fundo de Amparo do Trabalhador – FAT,
                        do Ministério do Trabalho e Emprego.<br />
                        <br />
                        <table>
                            <tr>
                                <td>
                                    <div style="text-align: center">
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Imagens/pronatec1.jpg" ImageAlign="Middle"
                                            BorderColor="Black" BorderWidth="1px" /><br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Conheça mais sobre o PRONATEC, acesse: <a href="http://pronatec.mec.gov.br/">
                                            http://pronatec.mec.gov.br/</a>
                                    </div>
                                </td>
                                <td>
                                    <div style="text-align: center">
                                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Imagens/pronatec2.jpg" ImageAlign="Middle"
                                            BorderColor="Black" BorderWidth="1px" /><br />
                                        Fim das viagens no “Ônibus do Horror” da prefeitura para as Escolas Técnicas nas
                                        cidades vizinhas.
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel runat="server" ID="TabPanel2">
                    <HeaderTemplate>
                        2.SAÚDE</HeaderTemplate>
                    <ContentTemplate>
                        <b>PROPOR MEDIDAS URGENTES PARA SALVAR A SAÚDE</b>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Realizar uma “Audiência Pública” para discutir a
                        calamidade em que se encontra a saúde no município, e propor medidas imediatas que
                        deverão ser adotadas em caráter de emergência. Veja a reportagem completa sobre
                        as péssimas e precárias condições da saúde em Brasilândia de Minas – TV Integração
                        (afiliada Rede Globo de Televisão), com matéria fornecida ao programa “Fantástico”.
                        Pesquise no canal do Youtube.<br />
                        <br />
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <div style="text-align: center">
                                        <asp:Image ID="Image3" runat="server" ImageUrl="~/Imagens/saude1.jpg" ImageAlign="Middle"
                                            BorderColor="Black" BorderWidth="1px" /><br />
                                    </div>
                                </td>
                                <td>
                                    <div style="text-align: center">
                                        <asp:Image ID="Image4" runat="server" ImageUrl="~/Imagens/saude2.jpg" ImageAlign="Middle"
                                            BorderColor="Black" BorderWidth="1px" /><br />
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <div style="text-align: center">
                            <asp:Image ID="Image21" runat="server" ImageUrl="~/Imagens/saude3.jpg" ImageAlign="Middle"
                                BorderColor="Black" BorderWidth="1px" /><br />
                        </div>
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel runat="server" ID="TabPanel3">
                    <HeaderTemplate>
                        3.REGULARIZAÇÃO URBANA</HeaderTemplate>
                    <ContentTemplate>
                        <b>REGULARIZAÇÃO FUNDIÁRIA URBANA</b>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mobilizar a regularização fundiária dos documentos
                        de todos os lotes urbanos com pendências junto a prefeitura, reorganizar o cadastro
                        de imóveis com a assistência de Engenheiros, e isentar o IPTU para as famílias inscritas
                        nos programas sociais do Governo Federal<br />
                        <br />
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <div style="text-align: center">
                                        <asp:Image ID="Image5" runat="server" ImageUrl="~/Imagens/urbana1.jpg" ImageAlign="Middle"
                                            BorderColor="Black" BorderWidth="1px" /><br />
                                    </div>
                                </td>
                                <td>
                                    <div style="text-align: center">
                                        <asp:Image ID="Image6" runat="server" ImageUrl="~/Imagens/urbana2.jpg" ImageAlign="Middle"
                                            BorderColor="Black" BorderWidth="1px" /><br />
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel runat="server" ID="TabPanel4">
                    <HeaderTemplate>
                        4.ASSISTÊNCIA GRATUITA
                    </HeaderTemplate>
                    <ContentTemplate>
                        <b>ASSISTÊNCIA JUDICIÁRIA GRATUITA AOS DE BAIXA RENDA</b>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Contratar Advogados e estagiários do último período
                        do curso superior de Direito para atender na sede da Câmara Municipal, gratuitamente,
                        as pessoas de baixa renda, com processos pendentes na justiça comum ou que precisem
                        entrar com alguma ação judicial pela Defensoria Pública Municipal, ou mesmo simples
                        orientação jurídica e assuntos do PROCON municipal.<br />
                        <br />
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <div style="text-align: center">
                                        <asp:Image ID="Image7" runat="server" ImageUrl="~/Imagens/assistencia1.jpg" ImageAlign="Middle"
                                            BorderColor="Black" BorderWidth="1px" /><br />
                                    </div>
                                </td>
                                <td>
                                    <div style="text-align: center">
                                        <asp:Image ID="Image8" runat="server" ImageUrl="~/Imagens/assistencia2.jpg" ImageAlign="Middle"
                                            BorderColor="Black" BorderWidth="1px" /><br />
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel runat="server" ID="TabPanel5">
                    <HeaderTemplate>
                        5.PARQUE MUNICIPAL
                    </HeaderTemplate>
                    <ContentTemplate>
                        <b>CRIAÇÃO DO PARQUE MUNICIPAL DA SERRA DO BOQUEIRÃO</b>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Criar o “Parque Municipal da Serra do Boqueirão”,
                        transformando as cachoeiras “Extrema” e “Cruzeirinho” em áreas de educação ecológica,
                        lazer e esportes; iluminar toda a ponte sobre o rio Paracatu; e, urbanizar a entrada
                        da cidade e a Praia Dona Dora, com a reforma da estrada, iluminação noturna e policiamento
                        no local.
                        <br />
                        <br />
                        <table style="width: 100%; padding: 5px;">
                            <tr>
                                <td>
                                    <div style="text-align: center">
                                        <asp:Image ID="Image9" runat="server" ImageUrl="~/Imagens/parque1.jpg" ImageAlign="Middle"
                                            BorderColor="Black" BorderWidth="1px" /><br />
                                    </div>
                                </td>
                                <td>
                                    <div style="text-align: center">
                                        <asp:Image ID="Image22" runat="server" ImageUrl="~/Imagens/parque3.jpg" ImageAlign="Middle"
                                            BorderColor="Black" BorderWidth="1px" /><br />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div style="text-align: center">
                                        <asp:Image ID="Image25" runat="server" ImageUrl="~/Imagens/parque6.jpg" ImageAlign="Middle"
                                            BorderColor="Black" BorderWidth="1px" /><br />
                                    </div>
                                </td>
                                <td>
                                    <div style="text-align: center">
                                        <asp:Image ID="Image10" runat="server" ImageUrl="~/Imagens/parque7.jpg" ImageAlign="Middle"
                                            BorderColor="Black" BorderWidth="1px" /><br />
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <div style="width: 100%; text-align: center">
                            Sonhos de luzes que podem se tornar realidade</div>
                        <br />
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel runat="server" ID="TabPanel6">
                    <HeaderTemplate>
                        6.RODOVIÁRIA E CICLOVIA
                    </HeaderTemplate>
                    <ContentTemplate>
                        <b>PARCERIAS PARA CONSTRUÇÃO DA RODOVIÁRIA E CICLOVIA</b>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Viabilizar as parcerias com o comércio e Poder Público,
                        com convênio junto ao Ministério das Cidades, para construir o “Terminal Rodoviário
                        Municipal de Brasilândia de Minas”, e buscar recursos estaduais para pavimentar
                        uma Ciclovia ligando o bairro Bela Vista ao bairro Porto.
                        <br />
                        <br />
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <div style="text-align: center">
                                        <asp:Image ID="Image11" runat="server" ImageUrl="~/Imagens/rodoviaria1.jpg" ImageAlign="Middle"
                                            BorderColor="Black" BorderWidth="1px" /><br />
                                        Triste e atual realidade da “Rodoviária” de Brasilândia de Minas
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <div style="text-align: center">
                                        <asp:Image ID="Image12" runat="server" ImageUrl="~/Imagens/rodoviaria2.jpg" ImageAlign="Middle"
                                            BorderColor="Black" BorderWidth="1px" /><br />
                                    </div>
                                </td>
                                <td>
                                    <div style="text-align: center">
                                        <asp:Image ID="Image23" runat="server" ImageUrl="~/Imagens/rodoviaria3.jpg" ImageAlign="Middle"
                                            BorderColor="Black" BorderWidth="1px" /><br />
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <div style="text-align: center; width: 100%">
                            Futuro que podemos fazer acontecer
                            <br />
                            <br />
                            <span style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Podemos realizar muito
                                mais, dentro do <b>Programa Nacional de Mobilidade Urbana</b>, do Ministério das
                                Cidades, acesse: <a href="http://www.cidades.gov.br/index.php/politica-nacional-de-mobilidade-urbana</span>">
                                http://www.cidades.gov.br/index.php/politica-nacional-de-mobilidade-urbana</span>
                            </a>
                        </div>
                        <br />
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel runat="server" ID="TabPanel7">
                    <HeaderTemplate>
                        7.CENTRAL DO CIDADÃO
                    </HeaderTemplate>
                    <ContentTemplate>
                        <b>INSTALAR O POSTO DA “CENTRAL DO CIDADÃO”</b>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Instalar um posto permanente na Câmara Municipal,
                        para o cidadão fazer a sua Carteira de Identidade, Carteira de Trabalho, CPF, o
                        Alistamento Militar e emitir outros documentos.<br />
                        <br />
                        <table width="100%">
                            <tr>
                                <td>
                                    <div style="text-align: center">
                                        <asp:Image ID="Image13" runat="server" ImageUrl="~/Imagens/cidadao1.jpg" ImageAlign="Middle"
                                            BorderColor="Black" BorderWidth="1px" /><br />
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel runat="server" ID="TabPanel8">
                    <HeaderTemplate>
                        8.ABATEDOURO</HeaderTemplate>
                    <ContentTemplate>
                        <b>APROVAR A CONSTRUÇÃO DO ABATEDOURO MUNICIPAL</b>
                        <br />
                        <br />
                        <div style="width: 100%; text-align: center">
                            <span style="text-decoration: underline; text-align: center">Orgânica do Município de
                                Brasilândia de Minas</span><br />
                        </div>
                        <div style="width: 100%; text-align: center">
                            (Aprovada em 17 de agosto de 2004)
                        </div>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ato das Disposições Transitórias: “Art. 13 – O Poder
                        Executivo, no prazo de vinte e quatro meses após a aprovação da Lei Orgânica, implantará
                        o Matadouro Municipal.”
                        <br />
                        <b>Já se passaram mais de 5 ANOS do prazo da LEI, e até hoje NADA de abatedouro municipal,
                            resultado: </b>
                        <br />
                        <br />
                        <table width="100%">
                            <tr>
                                <td>
                                    <div style="text-align: center">
                                        <asp:Image ID="Image15" runat="server" ImageUrl="~/Imagens/abatedouro1.jpg" ImageAlign="Middle"
                                            BorderColor="Black" BorderWidth="1px" /><br />
                                    </div>
                                </td>
                                <td>
                                    <div style="text-align: center">
                                        <asp:Image ID="Image16" runat="server" ImageUrl="~/Imagens/abatedouro3.jpg" ImageAlign="Middle"
                                            BorderColor="Black" BorderWidth="1px" /><br />
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <div style="text-align: center; width: 100%">
                            <asp:Image ID="Image14" runat="server" ImageUrl="~/Imagens/abatedouro2.jpg" ImageAlign="Middle"
                                BorderColor="Black" BorderWidth="1px" /><br />
                            <br />
                            Os animais são abatidos em locais sem nenhum controle e higiene e as vísceras, ossos
                            e carcaças são abandonados no leito das vias públicas.
                        </div>
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel runat="server" ID="TabPanel9">
                    <HeaderTemplate>
                        9.SAÚDE, OBRAS E POSTURAS
                    </HeaderTemplate>
                    <ContentTemplate>
                        <b>FAZER AS LEIS DOS CÓDIGOS DE SAÚDE, OBRAS E POSTURAS.<br /> 16 ANOS DE EMANCIPAÇÃO E ATÉ
                            HOJE NÃO TEM</b>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lei do Código de Obras Lei do Código de Posturas
                        Lei do Código de Saúde Cidades sem o Código de Obras são assim... Cidades sem o
                        Código de Posturas são assim... Cidades sem o Código de Saúde são assim... Vamos
                        criar estas novas leis, e revisar todas as leis antigas que estiverem em vigor no
                        município.<br />
                        <br />
                        <table width="100%">
                            <tr>
                                <td>
                                    <div style="text-align: center">
                                        <asp:Image ID="Image17" runat="server" ImageUrl="~/Imagens/pronatec1.jpg" ImageAlign="Middle"
                                            BorderColor="Black" BorderWidth="1px" Visible="false" /><br />
                                    </div>
                                </td>
                                <td>
                                    <div style="text-align: center">
                                        <asp:Image ID="Image18" runat="server" ImageUrl="~/Imagens/pronatec2.jpg" ImageAlign="Middle"
                                            BorderColor="Black" BorderWidth="1px" Visible="false" /><br />
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel runat="server" ID="TabPanel10">
                    <HeaderTemplate>
                        10.SERVIDORES PÚBLICOS
                    </HeaderTemplate>
                    <ContentTemplate>
                        <b>PROPOR O PLANO DE CARREIRA DOS SERVIDORES PÚBLICOS</b>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Propor ao prefeito o “Plano de Carreira do Servidor
                        Público Municipal”, como forma de valorizar o desempenho do funcionalismo, e a criação
                        da Cooperativa dos Servidores Municipais, o Clube Recreativo dos Servidores Públicos,
                        e o “convênio-desconto” no comércio e prestadores de serviços de Brasilândia de
                        Minas.<br />
                        <br />
                        <table width="100%">
                            <tr>
                                <td>
                                    <div style="text-align: center">
                                        <asp:Image ID="Image19" runat="server" ImageUrl="~/Imagens/pronatec1.jpg" ImageAlign="Middle"
                                            BorderColor="Black" BorderWidth="1px" Visible="false" /><br />
                                    </div>
                                </td>
                                <td>
                                    <div style="text-align: center">
                                        <asp:Image ID="Image20" runat="server" ImageUrl="~/Imagens/pronatec2.jpg" ImageAlign="Middle"
                                            BorderColor="Black" BorderWidth="1px" Visible="false" /><br />
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </ContentTemplate>
                </cc1:TabPanel>
            </cc1:TabContainer>
        </div>
    </div>
</asp:Content>

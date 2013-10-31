<%@ Page Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Pousada.aspx.cs"
    Inherits="pousadaZ.WebForm5" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            text-decoration: underline;
            font-weight: bold;
            text-align: center;
        }
        .style2
        {
            font-size: small;
        }
        .style3
        {
            text-align: justify;
            width: 90%;
            margin-left: 5%;
        }
        .style4
        {
            text-align: justify;
        }
        .style5
        {
            font-size: medium;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="style3" align="center">
        <br />
        <div class="style1">
            <span class="style5">
                <br />
                A POUSADA</span><br />
            <br />
        </div>
        <div class="style4">
            <div class="style1">
                <img alt="" src="../Graficos/Pousada1.jpg" border="1px" /><br />
            </div>
            <br />
            &nbsp;<span class="style2">&nbsp;&nbsp;&nbsp; Situada em São Sebastião das Águas Claras,
                no povoado de Macacos - MG, a pousada Zumbzeira está localizada em uma grande área
                verde cercada de matas e montanhas.
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp; Esta beleza natural, associada a uma excelente estrutura
                de hospedagem, proporciona a você, sua família e amigos a oportunidade de diversão
                e relaxamente em um só lugar.
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp; A região oferece uma grande variedade de atividades, como
                por exemplo:
                <ul>
                    <li>Passeio ecológico pela Via Ecoturística de Resgate Histórico-cultural e Ambiental,
                        cujo trecho de 30 km se inicia no distrito de Mazagão, em Itabirito, passando pela
                        cidade de Rio Acima e terminando em Honório Bicalho, em Nova Lima. </li>
                    <li>Região perfeita para ecoturismo, com belas trilhas para treking
                        e motocross. </li>
                    <li>Visita da igreja de São Sebastião, uma das primeiras construções de Minas Gerais.</li>
                    <li>Conheça o bairro Quintas dos Ingleses, com residências em estilo inglês delimitadas
                        por cercas vivas, parte delas do século XIX.</li>
                    <li>Passeio surpreendente na Cachoeira das Vinte e Sete Voltas localizada em uma mata homônima.
                        Possui três quedas d’água, sendo a última de aproximadamente 30 metros de altura.
                        O lugar possui uma beleza exuberante. Ate 70km Cidades Históricas de Minas, Sabará,
                        Congonhas Ouro Preto e o museu Natural de Inhotim </li>
                </ul>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp; Venha para a Pousada Zumbzeira! Aqui você encontra paz
                e tranquilidade mais próximos de você.
                <br />
                <br />
            </span>
        </div>
    </div>
    <div class="style1">
        <img alt="" src="../Graficos/Pousada2.jpg" border="1px" /><br />
        <br />
    </div>
</asp:Content>

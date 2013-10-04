<%@ Page Title="Teste PMK - Empresa" Language="C#" MasterPageFile="~/Master.Master"
    AutoEventWireup="true" CodeBehind="Empresa.aspx.cs" Inherits="testePMK.com.br.Empresa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .styleJust
        {
            text-align: justify;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p class="style8">
        <strong>Empresa</strong></p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="Subtitulo">
            <br />
            Quem somos
        </div>
        <div class="styleJust">
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Bem-vindo a loja virtual TESTE PMK, sua loja on-line
            onde você encontra os móveis profissionais que você precisa para aplicação do teste
            PMK - Psicodiagnóstico miocinético.
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A fábrica de móveis <strong>Éber Móveis Profissionais</strong>
            localiza-se em Belo Horizonte, MG. Atendemos vários profissionais em todo o Brasil,
            em centenas de cidades, com rapidez e agilidade, levando a cada um a comodidade
            de comprar pela internet.
            <br />
            <br />
        </div>
        <div class="Subtitulo">
            <br />
            Atendemos todo Brasil</div>
        <div class="styleJust">
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Uma das dúvidas mais comuns entre nossos visitantes
            é se podemos atendê-lo, independente da cidade onde ele esteja. A resposta é Sim,
            atendemos a todo Brasil. E isso é possível porque utilizamos o serviço dos Correios
            e por meio de Sedex, garantimos que nossos móveis cheguem a todos os estados brasileiros
            com rapidez e a custos extremamente vantajosos.
            <br />
            <br />
        </div>
        <div class="Subtitulo">
            <br />
            Respeito ao Meio Ambiente</div>
        <div class="styleJust">
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Necessitamos de uma matéria prima preciosa para realizar
            nosso trabalho, "a madeira," por isso só utilizamos madeiras em que o fornecedor
            emita a nota fiscal , esperando que a sua extração não cause danos maiores ao meio-ambiente
            e sem agredir a natureza.
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A <strong>Éber Móveis Profissionais</strong> quer
            manter um compromisso com a sustentabilidade social e ambiental do planeta, procurando
            fazer o que está ao seu alcance para construir um mundo melhor para todos.
            <br />
            <br />
            <strong>CNPJ:</strong> 11.107.625/0001-73
            <br />
            <strong>Inscr. Estadual:</strong> 001.379.186-0097<br />
            <br />
            <br />
        </div>
        <div class="Subtitulo">
            <asp:Image ID="imgQuemSomos" runat="server" ImageUrl="~/Graficos/fotoMeioAmbiente.jpg" />
            <br />
        </div>
    </div>
</asp:Content>

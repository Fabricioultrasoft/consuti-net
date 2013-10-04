<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="QSO._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link rel="Stylesheet" href="Estilo2.css" media="screen" />
</head>
<body>

<form id="form1" runat="server">
    
<ul id="menu">
	<li><a href="#" class="home">Home<span></span></a></li>
	<li><a href="#" class="about">Links<span></span></a></li>
	<li><a href="#" class="rss">Contato<span></span></a></li>
</ul>
        <br />
        <br />
<div id = "oque" >
        QUERO SABER AONDE POSSUI
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>Academias</asp:ListItem>
            <asp:ListItem>Advogados</asp:ListItem>
            <asp:ListItem>Agências de Turismo</asp:ListItem>
            <asp:ListItem>Agronegócios</asp:ListItem>
            <asp:ListItem>Arquitetos e Engenheiros</asp:ListItem>
            <asp:ListItem>Bancos</asp:ListItem>
            <asp:ListItem>Colégios/Escolas/Cursos/Vestibular</asp:ListItem>
            <asp:ListItem>Condomínios</asp:ListItem>
            <asp:ListItem>Dentistas/Odontologia</asp:ListItem>
            <asp:ListItem>Faculdades e Universidades</asp:ListItem>
            <asp:ListItem>Farmácias e Drogarias</asp:ListItem>
            <asp:ListItem>Floriculturas</asp:ListItem>
            <asp:ListItem>Fotografia</asp:ListItem>
            <asp:ListItem>Hospitais/Clínicas Médicas</asp:ListItem>
            <asp:ListItem>Hotéis</asp:ListItem>
            <asp:ListItem>Igrejas</asp:ListItem>
            <asp:ListItem>Imobiliárias</asp:ListItem>
            <asp:ListItem>Informática - Desenvolvimento de Software</asp:ListItem>
            <asp:ListItem>Jornais/Rádios/Redes de TV</asp:ListItem>
            <asp:ListItem>Lojas</asp:ListItem>
            <asp:ListItem>Médicos</asp:ListItem>
            <asp:ListItem>Motéis</asp:ListItem>
            <asp:ListItem>Postos de Combustíveis</asp:ListItem>
            <asp:ListItem>Restaurantes</asp:ListItem>
            <asp:ListItem>Salões de Beleza</asp:ListItem>
            <asp:ListItem>Supermercados</asp:ListItem>
            <asp:ListItem>Taxi / Moto-taxi</asp:ListItem>
            <asp:ListItem>Telefonia/Celulares</asp:ListItem>
            <asp:ListItem>Transportadoras/Mudanças</asp:ListItem>
            <asp:ListItem>Veículos - Concessionárias</asp:ListItem>
            <asp:ListItem>Videolocadoras</asp:ListItem>
        </asp:DropDownList>
</div>
        <br />
        <br />
<div id = "onde" >
        NO BAIRRO
        <asp:DropDownList ID="DropDownList2" runat="server">
            <asp:ListItem>Aarão Reis (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Afonso Pena (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Alto Barroca (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Alto Vera Cruz (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Alto dos Caiçaras (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Ana Lúcia (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Araguaia (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Bandeirantes (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Barreiro (bairro de Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Barro Preto (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Barroca (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Belvedere (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Betânia (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Boa Vista (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Bom Jesus (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Bonfim (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Buritis (Belo Horizonte)</asp:ListItem>
            <asp:ListItem>Cabana Pai Tomaz (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Cachoeirinha (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Caiçara (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Calafate (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Camargos (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Cardoso (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Carlos Prates (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Castelo (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Cidade Industrial (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Cidade Jardim (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Cidade Nova (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Conjunto Esperança (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Conjunto Estrela d&#39;Alva
            </asp:ListItem>
            <asp:ListItem>Conjunto Novo Aarão Reis (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Copacabana (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Coqueiros (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Coração Eucarístico (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Cruzeiro (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Céu Azul (Belo Horizonte)</asp:ListItem>
            <asp:ListItem>Diamante (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Dom Bosco (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Dom Cabral (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Engenho Nogueira (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Esplanada (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Estoril (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Fernão Dias (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Filadélfia (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Flamengo (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Floramar (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Floresta (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Flávio Marques Lisboa (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Funcionários (Belo Horizonte)</asp:ListItem>
            <asp:ListItem>Gameleira (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Glória (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Grajaú (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Granja de Freitas (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Guarani (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Gutierrez (Belo Horizonte)</asp:ListItem>
            <asp:ListItem>Havaí (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Horto (Belo Horizonte)</asp:ListItem>
            <asp:ListItem>Inconfidência (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Independência (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Ipiranga (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Itaipú (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Itapuã (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Jaraguá (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Jardim Alvorada (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Jardim América (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Jardim Leblon (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Jardim Vitória (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Jatobá (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>João Pinheiro (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Justinópolis (Belo Horizonte)</asp:ListItem>
            <asp:ListItem>Kátia (Belo Horizonte)</asp:ListItem>
            <asp:ListItem>Lagoinha (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Laranjeiras (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Liberdade (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Lindeia (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Lourdes (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Luxemburgo (Belo Horizonte)</asp:ListItem>
            <asp:ListItem>Mangabeiras (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Mantiqueira (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Marilândia (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Milionários (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Minaslândia (Belo Horizonte)</asp:ListItem>
            <asp:ListItem>Mineirão (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Monte Azul (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Morro das Pedras (Belo Horizonte)</asp:ListItem>
            <asp:ListItem>Nova Cachoeirinha (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Nova Esperança (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Nova Suíça (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Novo São Lucas</asp:ListItem>
            <asp:ListItem>Olhos d&#39;Água (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Ouro Preto (Belo Horizonte)</asp:ListItem>
            <asp:ListItem>Padre Eustáquio (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Pampulha (bairro de Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Parque São José (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Pedreira Prado Lopes (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Prado (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Primavera (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Renascença (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Sagrada Família (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Salgado Filho (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Santa Amélia (Belo Horizonte)</asp:ListItem>
            <asp:ListItem>Santa Efigênia (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Santa Inês (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Santa Margarida (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Santa Mônica (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Santo Agostinho (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Savassi
            </asp:ListItem>
            <asp:ListItem>Sol Nascente (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>São Pedro (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Taquaril (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Teixeira Dias (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Tupi (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>União (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Vale do Jatobá (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Vera Cruz (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Vila Antenas (Barreiro)
            </asp:ListItem>
            <asp:ListItem>Vila Antônio Ribeiro de Abreu
            </asp:ListItem>
            <asp:ListItem>Vila Oeste (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Vila Real (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Vila Santa Cruz (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Vila Santana do Cafezal (Belo Horizonte)
            </asp:ListItem>
            <asp:ListItem>Vila Sesc (Belo Horizonte)
            </asp:ListItem>
        </asp:DropDownList>
</div>
        <br />
        <br />
<div id = "funcionamento">
        HORÁRIO FUNCIONAMENTO:<br />
        <br />
        <asp:CheckBoxList ID="CheckBoxList1" runat="server">
            <asp:ListItem Value="HORARIO 1">08:00 - 12:00</asp:ListItem>
            <asp:ListItem Value="HORARIO 2">12:00 - 18:00</asp:ListItem>
            <asp:ListItem Value="HORARIO 3">18:00 - 20:00</asp:ListItem>
            <asp:ListItem Value="HORARIO 4">20:00 - 00:00</asp:ListItem>
            <asp:ListItem Value="HORARIO 5">00:00 - 04:00</asp:ListItem>
            <asp:ListItem Value="HORARIO 6">04:00 - 08:00</asp:ListItem>
        </asp:CheckBoxList>
        <div id = "domferi" >        
            FUNCIONA DOMINGO E FERIADOS:<br />
        <br />
            <asp:CheckBox ID="CheckBox1" runat="server" Text="Sim" />
            
        <br />
            <asp:CheckBox ID="CheckBox2" runat="server" Text="Não" />

</div>
</div>
        <br />
<div id = "site" >        
        POSSUI SITE PARA CONTATO:<br />
        <br />
&nbsp;<asp:CheckBox ID="CheckBox3" runat="server" Text="Sim" />
        <br />
&nbsp;<asp:CheckBox ID="CheckBox4" runat="server" Text="Não" />

</div>
        <br />
        <br />
        <br />
        <br />
        <br />
<div id = "email" >        
        POSSUI EMAIL PARA CONTATO:&nbsp;<br />
&nbsp;<asp:CheckBox ID="CheckBox5" runat="server" Text="Sim" />
        <br />
        &nbsp;<asp:CheckBox ID="CheckBox6" runat="server" Text="Não" />

</div>
<div id = "pagto" >        
        FORMAS DE PAGAMENTO ACEITAS:<br />
        <br />
        <asp:CheckBoxList ID="CheckBoxList2" runat="server" >
            <asp:ListItem Value="PAGAMENTO 1">Dinheiro</asp:ListItem>
            <asp:ListItem Value="PAGAMENTO 2">Cartão de Credito</asp:ListItem>
            <asp:ListItem Value="PAGAMENTO 3">Cartão Debito</asp:ListItem>
            <asp:ListItem Value="PAGAMENTO 4">Cheque</asp:ListItem>
        </asp:CheckBoxList>
</div>        
        <br />
<div id = "buscar" >        
        <asp:Button ID="Button1" runat="server" Text="Buscar" 
            onclick="Button1_Click1" />
</div>       
        <br />
        <br />

</form>
</body>
</html>

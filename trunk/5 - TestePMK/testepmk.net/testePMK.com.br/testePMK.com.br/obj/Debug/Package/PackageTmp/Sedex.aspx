<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sedex.aspx.cs" Inherits="testePMK.com.br.Sedex" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="~/Estilos.css" rel="stylesheet" type="text/css" />
    <title>Simulador Sedex</title>
    <style type="text/css">
        .style1
        {
            height: 15.0pt;
            width: 225pt;
            color: black;
            font-size: 11.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: Calibri, sans-serif;
            text-align: center;
            vertical-align: middle;
            white-space: normal;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
            background: #76933C;
        }
        .style2
        {
            width: 61pt;
            color: black;
            font-size: 11.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: Calibri, sans-serif;
            text-align: center;
            vertical-align: middle;
            white-space: normal;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
            background: #76933C;
        }
        .style3
        {
            width: 59pt;
            color: black;
            font-size: 11.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: Calibri, sans-serif;
            text-align: center;
            vertical-align: middle;
            white-space: normal;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
            background: #76933C;
        }
        .style4
        {
            height: 15.0pt;
            width: 225pt;
            color: black;
            font-size: 11.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: Calibri, sans-serif;
            text-align: left;
            vertical-align: middle;
            white-space: normal;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .style5
        {
            width: 61pt;
            color: black;
            font-size: 11.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: Calibri, sans-serif;
            text-align: center;
            vertical-align: middle;
            white-space: normal;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .style6
        {
            width: 59pt;
            color: black;
            font-size: 11.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: Calibri, sans-serif;
            text-align: center;
            vertical-align: middle;
            white-space: normal;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .style7
        {
            font-size: x-large;
        }
        .style8
        {
            color: Green;
            font-size: small;
            text-align: center;
        }
    </style>
</head>
<body class="page" style="height: 1100px">
    <form id="form1" runat="server">
    <div class="style8">
        <br />
        <span class="style7">CALCULE O VALOR DO FRETE</span></div>
    <div style="margin-left: 40px; margin-right: 40px">
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp; Sua mercadoria será enviada por meio de sedex a cobrar.
        Cada mesa gera um pacote e será cobrado um sedex ou podem ser feitas as combinações
        conforme ilustrações abaixo.
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp; Clique no linck dos correios para simular o valor aproximado
        do sedex a cobrar (frete). Assim que sua mercadoria for postada, você receberá um
        informativo constatando o valor a ser pago aos correios, o número do objeto para
        rastramento e a previsão de chegada na agência dos correios mais próxima do endereço
        fornecido.<br />
        <br />
        <br />
        <div style="text-align: center">
            <img alt="" src="Graficos/SedexDemo.png" style="text-align: center" />
        </div>
        <br />
        <br />
        <div style="text-align: center">
            A tabela abaixo irá ajudar a estimar o valor do frete a ser pago.<br />
            CEP Origem: <strong>30130-171</strong></div>
        <br />
        <table align="center" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse;
            width: 345pt" width="459">
            <colgroup>
                <col style="mso-width-source: userset; mso-width-alt: 10971; width: 225pt" width="300" />
                <col style="mso-width-source: userset; mso-width-alt: 2962; width: 61pt" width="81" />
                <col style="mso-width-source: userset; mso-width-alt: 2852; width: 59pt" width="78" />
            </colgroup>
            <tr height="20" style="height: 15.0pt">
                <td class="style1" height="20" width="300">
                    NOME
                </td>
                <td class="style2" width="81">
                    PREÇO
                </td>
                <td class="style3" width="78">
                    PESO (KG)
                </td>
            </tr>
            <tr height="20" style="height: 15.0pt">
                <td class="style4" height="20" width="300">
                    Mesa Profissional PMK - Com Anteparo
                </td>
                <td class="style5" width="81">
                    <span style="mso-spacerun: yes">&nbsp;</span>R$<span style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;
                    </span>550,00
                </td>
                <td class="style6" width="78">
                    12,5
                </td>
            </tr>
            <tr height="20" style="height: 15.0pt">
                <td class="style4" height="20" width="300">
                    Mesa Profissional PMK - Sem Anteparo
                </td>
                <td class="style5" width="81">
                    <span style="mso-spacerun: yes">&nbsp;</span>R$<span style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;
                    </span>500,00
                </td>
                <td class="style6" width="78">
                    12,5
                </td>
            </tr>
            <tr height="20" style="height: 15.0pt">
                <td class="style4" height="20" width="300">
                    Mesa Portátil PMK
                </td>
                <td class="style5" width="81">
                    <span style="mso-spacerun: yes">&nbsp;</span>R$<span style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;
                    </span>300,00
                </td>
                <td class="style6" width="78">
                    3
                </td>
            </tr>
            <tr height="20" style="height: 15.0pt">
                <td class="style4" height="20" width="300">
                    Cadeira PMK
                </td>
                <td class="style5" width="81">
                    <span style="mso-spacerun: yes">&nbsp;</span>R$<span style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </span>50,00
                </td>
                <td class="style6" width="78">
                    2
                </td>
            </tr>
            <tr height="20" style="height: 15.0pt">
                <td class="style4" height="20" width="300">
                    Anteparo Anatômico
                </td>
                <td class="style5" width="81">
                    <span style="mso-spacerun: yes">&nbsp;</span>R$<span style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </span>50,00
                </td>
                <td class="style6" width="78">
                    0,5
                </td>
            </tr>
            <tr height="20" style="height: 15.0pt">
                <td class="style4" height="20" width="300">
                    Mesa Profissional PMK Desmontável
                </td>
                <td class="style5" width="81">
                    <span style="mso-spacerun: yes">&nbsp;</span>R$<span style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;
                    </span>550,00
                </td>
                <td class="style6" width="78">
                    13
                </td>
            </tr>
        </table>
        <br />
        <br />
        <div style="text-align: center">
            <asp:ImageButton ID="imgBtnSedex" runat="server" ImageUrl="~/Graficos/SedexCobrar.gif"
                OnClick="imgBtnSedex_Click" />&nbsp;<br />
            <a href="http://www.correios.com.br/encomendas/prazo/default.cfm">Clique aqui para acessar
                o site dos correios e simular o frete.</a></div>
        <br />
    </div>
    </form>
    <hr style="margin-bottom: 0px" />
    <div style="background-color: #ccffcc; height: 150px; width:100%">
        <div class="footer">
            <div style="float: left; width: 70%; text-align: left;">
                2010 - 2011&nbsp;<a>Teste PMK</a> &copy - Todos os Direitos Reservados
                <br />
                <br />
                &nbsp;&nbsp;&nbsp; Televendas:<br />
                <strong>(31) 8805-1820<br />
                    (31) 3327-6893</strong><br />
                Éber Móveis Profissionais<br />
                CNPJ 11.107.625/0001-73<br />
                Inscr. Estadual 001.379.186-0097
            </div>
            <div id="developed">
                Desenvolvido por<br />
                <a href="http://www.consuti.net">
                    <img alt="Desenvolvido por ConsuTI.net" src="Graficos/Logomarca.png" style="border-width: 0px" /></a><br />
            </div>
            &nbsp;</div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>
</body>
</html>

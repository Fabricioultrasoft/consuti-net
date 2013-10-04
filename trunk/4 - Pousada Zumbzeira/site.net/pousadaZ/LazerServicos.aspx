<%@ Page Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="LazerServicos.aspx.cs" Inherits="pousadaZ.WebForm7" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .style2
        {
            font-size: small;
            text-align: justify;
            margin-left: 30px;
            margin-top: 0px;
            margin-bottom: 4px;
        }
        .style1
        {
            text-decoration: underline;
            font-size: medium;
            font-weight: 700;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
    <br />
    <p class="style1">
        LAZER E SERVIÇOS DA POUSADA</p>
        <div style="width: 625px">
        
            <p class="style2">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A pousada Zumbzeira dispõe de modernas instalações com detalhes 
                rústicos na decoração, piscina adulto com quiosque-bar, 
                restaurante e bela vista panorâmica da 
                região. Excelente serviço de hospedagem, suítes com camas king Size, trazendo 
                total conforto e comodidade extra para você e para sua família. Além disso, 
                dispõe de salão de jogos.
            </p>
            <p class="style2">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Faça também reservas pelo telefone para festas e eventos em nossa 
                pousada, com tudo isso estamos aptos a atendê-lo da melhor forma possível.</p>
        </div>
        <br />
        <br />
        <iframe style="width:550px; height:450px" src="IframeLazerServ.aspx" ></iframe>
        <br />           
        </div>
        <br />
</asp:Content>

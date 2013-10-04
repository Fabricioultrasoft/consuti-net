<%@ Page Title="Teste PMK - Adm Categorias" Language="C#" MasterPageFile="~/Adm/AdmMaster.Master" AutoEventWireup="true" CodeBehind="AddCategoria.aspx.cs" Inherits="testePMK.com.br.Adm.CategoriasProds.AddCategoria" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
   <style type="text/css">
        .style1
        {
            text-decoration: underline;
        }
        </style>
     <script type="text/javascript">
         //javascript para controlar o tamanho do text box
         var max = 201;
         var ancho = 300;
         function progreso_tecla(obj) {
             var progreso = document.getElementById("progresso");
             if (obj.value.length < max) {
                 progreso.style.backgroundColor = "#E8EEF9";
                 progreso.style.backgroundImage = "url(textarea.png)";
                 progreso.style.color = "#000000";
                 var pos = ancho - parseInt((ancho * parseInt(obj.value.length)) / 250);
                 progreso.style.backgroundPosition = "-" + pos + "px 0px";
             }
             else {
                 progreso.style.backgroundColor = "#CC0000";
                 progreso.style.backgroundImage = "url()";
                 progreso.style.color = "#E8EEF9";
                 obj.value = obj.value.substring(0, max);
             }

             progreso.innerHTML = "(" + obj.value.length + " / " + (max - 1) + ")";
         }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="style1">
        Categorias de Produtos</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
 <div class="subTitulo">
        Cadastrar Categoria de Produto<br />
        <asp:Panel ID="pnlCont" runat="server">
            <br />
            <div style="margin-left: 30px; text-align: left;">
                Preencha os campos abaixo para cadastrar uma
                                categoria de produto.<br />
                <br />
                <br />
                Nome da Categoria:
                                
                                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator5" runat="server" ControlToValidate="txbNomeCat"
                    Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator5_ValidatorCalloutExtender" 
                    runat="server" Enabled="True" TargetControlID="RequiredFieldValidator5">
                </cc1:ValidatorCalloutExtender>
                <br />
                <asp:TextBox ID="txbNomeCat" runat="server" MaxLength="100" Width="500px"></asp:TextBox>
                <br />
                <br />
                <br />
                Descrição da Categoria:
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txbDescricao" Display="None" 
                    ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator4_ValidatorCalloutExtender"
                    runat="server" Enabled="True" TargetControlID="RequiredFieldValidator4">
                </cc1:ValidatorCalloutExtender>
                <br />
                <asp:TextBox ID="txbDescricao" runat="server" CausesValidation="True" Height="100px"
                    MaxLength="20" onkeyup="progreso_tecla(this)" TextMode="MultiLine" 
                    Width="500px"></asp:TextBox>
                <br />
                <div id="progresso">
                    (0 / 200)</div>
                <br />
            </div>
            <br />
            <br />
            <div style="text-align: center">
                <asp:Button ID="btnSalvar" runat="server" Text="Salvar" Width="107px" OnClick="btnSalvar_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnLimpar" runat="server" onclick="btnZerabann_Click" 
                    Text="Limpar Tudo" CausesValidation="False" />
            </div>
            <br />
        </asp:Panel>
        <cc1:RoundedCornersExtender ID="pnlCont_RoundedCornersExtender" runat="server" BorderColor="Green"
            Enabled="True" TargetControlID="pnlCont">
        </cc1:RoundedCornersExtender>
    </div>
</asp:Content>

<%@ Page Title="Teste PMK - Adm Produtos" Language="C#" MasterPageFile="~/Adm/AdmMaster.Master"
    AutoEventWireup="true" CodeBehind="CadastraProduto.aspx.cs" Inherits="testePMK.com.br.Adm.Produtos.CadastraProduto" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            text-decoration: underline;
        }
        .style2
        {
            text-align: right;
            font-size: xx-small;
        }
        #progresso2
        {
            text-align: center;
            height: 14px;
            width: 508px;
        }
        .style4
        {
            font-size: 9pt;
        }
    </style>
    <script type="text/javascript">
        //javascript para controlar o tamanho do text box
        var max = 101;
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

        //javascript para controlar o tamanho do text box
        var max2 = 1001;
        var ancho2 = 300;
        function progreso_tecla2(obj) {
            var progreso2 = document.getElementById("progresso2");
            if (obj.value.length < max2) {
                progreso2.style.backgroundColor = "#E8EEF9";
                progreso2.style.backgroundImage = "url(textarea.png)";
                progreso2.style.color = "#000000";
                var pos = ancho2 - parseInt((ancho2 * parseInt(obj.value.length)) / 1000);
                progreso2.style.backgroundPosition = "-" + pos + "px 0px";
            }
            else {
                progreso2.style.backgroundColor = "#CC0000";
                progreso2.style.backgroundImage = "url()";
                progreso2.style.color = "#E8EEF9";
                obj.value = obj.value.substring(0, max2);
            }

            progreso2.innerHTML = "(" + obj.value.length + " / " + (max2 - 1) + ")";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="style1">
        Produtos</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="subTitulo">
        Cadastro de Produto</div>
    <asp:Panel ID="pnlConteudo" runat="server">
        <div style="margin-left: 30px">
            <br />
            Nome do Produto:
            <br />
            <asp:TextBox ID="txbNomeProd" runat="server" MaxLength="100" Width="500px" AutoPostBack="True"></asp:TextBox>
            &nbsp;<asp:Image ID="imgFail" runat="server" Height="16px" Visible="False" ImageUrl="~/Graficos/FAIL_32x32.png" />
            <asp:Image ID="imgOK" runat="server" ImageUrl="~/Graficos/OK_32x32.png" Visible="False" />
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbNomeProd"
                Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
            <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator1_ValidatorCalloutExtender"
                runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1">
            </cc1:ValidatorCalloutExtender>
            <br />
            Categoria:
            <br />
            <asp:DropDownList ID="ddlCategoria" runat="server">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvCategoria" runat="server" ControlToValidate="ddlCategoria"
                Display="None" ErrorMessage="Campo Obrigatório"></asp:RequiredFieldValidator>
            <cc1:ValidatorCalloutExtender ID="rfvCategoria_ValidatorCalloutExtender" runat="server"
                Enabled="True" TargetControlID="rfvCategoria">
            </cc1:ValidatorCalloutExtender>
            <br />
            <br />
            <div>
                <div style="float: left">
                    Preço/Unidade:
                    <br />
                    R$<asp:TextBox ID="TxbPrecoReal" runat="server" MaxLength="8" Width="80px" 
                        CssClass="alinhaPreco"></asp:TextBox>
                    ,<asp:TextBox ID="txbPrecoCentavos" runat="server" Width="30px" MaxLength="2"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxbPrecoReal"
                        Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                    <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator2_ValidatorCalloutExtender"
                        runat="server" Enabled="True" TargetControlID="RequiredFieldValidator2">
                    </cc1:ValidatorCalloutExtender>
                </div>
                <div style="float: right; width: 70%; margin-left: 0px;">
                    Quantidade em Estoque:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    Peso do Produto: (gramas)<br />
                    <asp:TextBox ID="txbQtdEstoque" runat="server" CausesValidation="True" MaxLength="7"
                        Width="100px"></asp:TextBox>
                    <cc1:FilteredTextBoxExtender ID="txbQtdEstoque_FilteredTextBoxExtender" runat="server"
                        Enabled="True" TargetControlID="txbQtdEstoque" ValidChars="1234567890">
                    </cc1:FilteredTextBoxExtender>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;
                    <asp:TextBox ID="txbPeso" runat="server" CausesValidation="True" MaxLength="7" Width="100px"></asp:TextBox>
                    <cc1:FilteredTextBoxExtender ID="txbPeso_FilteredTextBoxExtender" runat="server"
                        Enabled="True" TargetControlID="txbPeso" ValidChars="0123456789">
                    </cc1:FilteredTextBoxExtender>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txbQtdEstoque"
                        Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                    <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator3_ValidatorCalloutExtender"
                        runat="server" Enabled="True" TargetControlID="RequiredFieldValidator3">
                    </cc1:ValidatorCalloutExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txbPeso"
                        Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                    <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator5_ValidatorCalloutExtender"
                        runat="server" Enabled="True" TargetControlID="RequiredFieldValidator5">
                    </cc1:ValidatorCalloutExtender>
                </div>
            </div>
            <br />
            <br />
            <br />
            Descrição Simplificada do Produto:
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txbDescricao"
                Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
            <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator4_ValidatorCalloutExtender"
                runat="server" Enabled="True" TargetControlID="RequiredFieldValidator4">
            </cc1:ValidatorCalloutExtender>
            <br />
            <asp:TextBox ID="txbDescricao" runat="server" CausesValidation="True" Height="50px"
                MaxLength="20" onkeyup="progreso_tecla(this)" TextMode="MultiLine" Width="500px"></asp:TextBox>
            <br />
            <div id="progresso">
                (0 / 100)</div>
            <br />
            Descrição Completa do Produto:
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txbDescricaoCompleta"
                Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
            <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator6_ValidatorCalloutExtender"
                runat="server" Enabled="True" TargetControlID="RequiredFieldValidator6">
            </cc1:ValidatorCalloutExtender>
            <br />
            <asp:TextBox ID="txbDescricaoCompleta" runat="server" CausesValidation="True" Height="50px"
                MaxLength="1000" onkeyup="progreso_tecla2(this)" TextMode="MultiLine" Width="500px"></asp:TextBox>
            <br />
            <div id="progresso2">
                (0 / 1000)</div>
            <br />
            Link Vídeo:<br />
            <asp:TextBox ID="txbLinkVideo" runat="server" MaxLength="1000" Width="500px"></asp:TextBox>
            <br />
            <br />
            Adicionar Imagens:<br />
            <asp:Panel ID="PnlImgs" runat="server" Width="530px">
                <div style="margin-left: 20px; margin-right: 20px">
                    <br />
                    <cc1:AsyncFileUpload ID="afuImg" runat="server" />
                    <div style="text-align: right">
                        <asp:ImageButton ID="imgBtnAdd" runat="server" CausesValidation="False" 
                            ImageUrl="~/Graficos/ADD_32x32.png" OnClick="imgBtnAdd_Click" 
                            ToolTip="Adicionar Imagem" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:ImageButton ID="ImgBtnExcluir" runat="server" CausesValidation="False" 
                            ImageUrl="~/Graficos/FAIL_32x32.png" OnClick="ImgBtnExcluir_Click" 
                            ToolTip="Excluir Imagem" />
                    </div>
                    <div>
                        <span class="style4">Atenção: A primeira imagem da lista abaixo será a miniatura 
                        do produto.</span><br class="style4" />
                        <asp:ListBox ID="lbImgs" runat="server" SelectionMode="Multiple" Font-Overline="False"
                            Font-Strikeout="False" Width="490px" Rows="5"></asp:ListBox>
                        <br />
                        <div class="style2">
                            *Máximo 20 imagens</div>
                    </div>
                </div>
            </asp:Panel>
            <cc1:RoundedCornersExtender ID="PnlImgs_RoundedCornersExtender" runat="server" BorderColor="Green"
                Enabled="True" TargetControlID="PnlImgs">
            </cc1:RoundedCornersExtender>
        </div>
        <br />
        <div style="text-align: center">
            <asp:Button ID="btnSalvar" runat="server" Text="Salvar" Width="107px" OnClick="btnSalvar_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnLimpar" runat="server" Text="Limpar Tudo" CausesValidation="False"
                OnClick="btnLimpar_Click" Width="107px" />
        </div>
        <br />
    </asp:Panel>
    <cc1:RoundedCornersExtender ID="pnlConteudo_RoundedCornersExtender" runat="server"
        BorderColor="Green" Enabled="True" TargetControlID="pnlConteudo">
    </cc1:RoundedCornersExtender>
</asp:Content>

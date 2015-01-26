<%@ Page Title="Teste PMK - Adm Estoque" Language="C#" MasterPageFile="~/Adm/AdmMaster.Master"
    AutoEventWireup="true" CodeBehind="EstoqueProds.aspx.cs" Inherits="testePMK.com.br.Adm.Produtos.EstoqueProds" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="style3">
        Estoque</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="subTitulo">
        Alteração de Estoque</div>
    <asp:Panel ID="pnlConteudo" runat="server">
        <br />
        <div style="margin-left: 30px">
            Preencha os campos abaixo para alterar o estoque de um produto cadastrado:<br />
            <asp:Panel ID="pnlSeleciona" runat="server">
                <br />
                Selecione o produto:<br />
                <asp:DropDownList ID="ddlProdutos" runat="server" AutoPostBack="True">
                </asp:DropDownList>
                <br />
                <br />
            </asp:Panel>
            <asp:Panel ID="pnlAltProd" runat="server" Visible="False">
                <br />
                Nome do Produto:
                <br />
                <asp:TextBox ID="txbNomeProd" runat="server" MaxLength="100" Width="500px" ReadOnly="true" Enabled="false"></asp:TextBox>
                &nbsp;<br />
                <br />
                <div style="width: 401px; float: left;">
                    Categoria:
                    <br />
                    <asp:DropDownList ID="ddlCategoria" runat="server" Enabled="false">
                    </asp:DropDownList>
                </div>
                <div style="float: right; width: 120px;">
                    Código:<br />
                    <asp:TextBox ID="txbCodProd" runat="server" Enabled="False" Width="50px"></asp:TextBox>
                </div>
                <br />
                <br />
                <br />
                <div>
                    <div style="float: left">
                        Preço/Unidade:
                        <br />
                        <asp:TextBox ID="TxbPreco" runat="server" MaxLength="8" Width="100px" Enabled="false"></asp:TextBox>
                        <cc1:MaskedEditExtender ID="TxbPreco_MaskedEditExtender" runat="server" 
                            CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                            CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                            CultureThousandsPlaceholder="" CultureTimePlaceholder="" DisplayMoney="Left" 
                            Enabled="True" InputDirection="RightToLeft" Mask="999,999.99" MaskType="Number" 
                            TargetControlID="TxbPreco">
                        </cc1:MaskedEditExtender>
                        <br />
                    </div>
                    <div style="float: right; width: 70%; margin-left: 0px;">
                        Quantidade em Estoque:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Peso do Produto: (gramas)<br />
                        <asp:TextBox ID="txbQtdEstoque" runat="server" CausesValidation="True" 
                            MaxLength="7" Width="100px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txbPeso" runat="server" Width="100px" Enabled="false"></asp:TextBox>
                        <cc1:FilteredTextBoxExtender ID="txbPeso_FilteredTextBoxExtender" 
                            runat="server" Enabled="True" TargetControlID="txbPeso" ValidChars="1234567890">
                        </cc1:FilteredTextBoxExtender>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="txbQtdEstoque" Display="None" 
                            ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator3_ValidatorCalloutExtender" 
                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator3">
                        </cc1:ValidatorCalloutExtender>
                    </div>
                </div>
                <br />
                <br />
                <br />
                Descrição Simplificada do Produto:
                <br />
                <asp:TextBox ID="txbDescricao" runat="server" CausesValidation="True" Height="50px"
                    MaxLength="20" onkeyup="progreso_tecla(this)" TextMode="MultiLine" Width="500px" Enabled="false"></asp:TextBox>
                <br />
                <br />
                Descrição Completa do Produto:
                <br />
                <asp:TextBox ID="txbDescricaoCompleta" runat="server" CausesValidation="True" Height="150px"
                    MaxLength="1000" onkeyup="progreso_tecla2(this)" TextMode="MultiLine" Width="500px" Enabled="false"></asp:TextBox>
                <br />
                <br />
                <br />
                <br />
                <div style="text-align: center">
                    <asp:Button ID="btnSalvar" runat="server" Text="Salvar" Width="107px" OnClick="btnSalvar_Click"
                        ToolTip="Salvar Alterações" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnLimpar"
                        runat="server" Text="Cancelar" CausesValidation="False" OnClick="btnLimpar_Click"
                        Width="107px" />
                </div>
                <br />
            </asp:Panel>
        </div>
    </asp:Panel>
    <cc1:RoundedCornersExtender ID="pnlConteudo_RoundedCornersExtender" runat="server"
        BorderColor="Green" Enabled="True" TargetControlID="pnlConteudo">
    </cc1:RoundedCornersExtender>
</asp:Content>

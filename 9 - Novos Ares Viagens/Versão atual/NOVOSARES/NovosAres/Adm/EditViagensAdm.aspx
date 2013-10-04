<%@ Page Title="" Language="C#" MasterPageFile="~/Adm/Interna.Master" AutoEventWireup="true"
    CodeBehind="EditViagensAdm.aspx.cs" Inherits="NovosAres.Adm.EditViagensAdm" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="novosares" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src='<%=ResolveClientUrl("~/") %>Scripts/jquery-1.5.2.js'></script>
    <script type="text/javascript" src='<%=ResolveClientUrl("~/") %>Scripts/jquery.selectboxes.min.js'></script>
    <script type="text/javascript">
        $(document).ready(function () {
            debugger;
            $('#ContentPlaceHolder1_ddlContinente').change(function () {
                getPaises();
            });
        });
        function getPaises() {
            debugger;
            $.ajax({
                type: "POST",
                url: 'Service/Destinos.asmx/GetPaisesByContinente',
                data: "{'idContinente: '" + $('#ddlContinente').val() + "}",
                dataType: "json",
                success: function (jsonResult) {
                }
            });
        }        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlConteudo" runat="server">
        <asp:Panel ID="pnlSelecionaDestino" runat="server">
            <br />
            Selecione o destino:<br />
            <asp:DropDownList ID="ddlDestinos" runat="server" DataTextField="Nome" DataValueField="ID"
                AutoPostBack="True" OnSelectedIndexChanged="ddlDestinos_SelectedIndexChanged">
            </asp:DropDownList>
        </asp:Panel>
        <asp:Panel ID="pnlAlteraDestino" runat="server" Visible="False">
            Nome do Pacote:<br />
            <asp:TextBox ID="txtNomeDoPacote" runat="server" MaxLength="100" AutoPostBack="true" />
            <asp:RequiredFieldValidator ID="RfvtxtNomeDoPacote" runat="server" ControlToValidate="txtNomeDoPacote"
                Display="None" ErrorMessage="Campo Obrigatório."></asp:RequiredFieldValidator>
            <novosares:ValidatorCalloutExtender ID="RfvtxtNomeDoPacote_ValidatorCalloutExtender"
                runat="server" Enabled="true" TargetControlID="RfvtxtNomeDoPacote">
            </novosares:ValidatorCalloutExtender>
            <div id="localizacao">
                Selecione um continente:
                <br />
                <asp:DropDownList ID="ddlContinente" runat="server" DataTextField="Nome" DataValueField="ID"
                    AutoPostBack="true" OnSelectedIndexChanged="ddlContinente_SelectedIndexChanged" />
                <asp:RequiredFieldValidator ID="RfvddlContinente" runat="server" ControlToValidate="ddlContinente"
                    Display="None" ErrorMessage="Campo Obrigatório."></asp:RequiredFieldValidator>
                <novosares:ValidatorCalloutExtender ID="RfvddlContinente_ValidatorCalloutExtender"
                    runat="server" Enabled="true" TargetControlID="RfvddlContinente">
                </novosares:ValidatorCalloutExtender>
                <br />
                Selecione um país:
                <br />
                <asp:DropDownList ID="ddlPais" runat="server" DataTextField="Nome" DataValueField="ID"
                    AutoPostBack="true" OnSelectedIndexChanged="ddlPais_SelectedIndexChanged" />
                <asp:RequiredFieldValidator ID="RfvddlPais" runat="server" ControlToValidate="ddlPais"
                    Display="None" ErrorMessage="Campo Obrigatório."></asp:RequiredFieldValidator>
                <novosares:ValidatorCalloutExtender ID="RfvddlPais_ValidatorCalloutExtender" runat="server"
                    Enabled="true" TargetControlID="RfvddlPais">
                </novosares:ValidatorCalloutExtender>
                <br />
                Selecione uma cidade:
                <br />
                <asp:DropDownList ID="ddlCidade" runat="server" DataTextField="Nome" DataValueField="ID" />
                <asp:RequiredFieldValidator ID="RfvddlCidade" runat="server" ControlToValidate="ddlCidade"
                    Display="None" ErrorMessage="Campo Obrigatório."></asp:RequiredFieldValidator>
                <novosares:ValidatorCalloutExtender ID="RfvddlCidade_ValidatorCalloutExtender" runat="server"
                    Enabled="true" TargetControlID="RfvddlCidade">
                </novosares:ValidatorCalloutExtender>
            </div>
            <div id="InfoComplementares">
                <novosares:wucTxtDescricao ID="wucTxtDescricao" runat="server"></novosares:wucTxtDescricao>
                <br />
                Link Post blog:<br />
                <asp:TextBox ID="txtLinkPostBlog" runat="server" />
                <br />
                Link para google maps:<br />
                <asp:TextBox ID="txtLinkGoogleMaps" runat="server" MaxLength="500" />
                <br />
                <br />
            </div>
            <div id="Imagens">
                <asp:Panel ID="PnlImgs" runat="server" Width="530px">
                    <div>
                        <br />
                        <novosares:AsyncFileUpload ID="afuImg" runat="server" ClientIDMode="AutoID" />
                        <div style="text-align: right">
                            <asp:ImageButton ID="imgBtnAdd" runat="server" CausesValidation="False" ImageUrl="~/Graficos/ADD_32x32.png"
                                OnClick="imgBtnAdd_Click" ToolTip="Adicionar Imagem" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:ImageButton ID="ImgBtnExcluir" runat="server" CausesValidation="False" ImageUrl="~/Graficos/FAIL_32x32.png"
                                OnClick="ImgBtnExcluir_Click" ToolTip="Excluir Imagem" />
                        </div>
                        <div>
                            <asp:ListBox ID="lbImgs" runat="server" SelectionMode="Multiple" Font-Overline="False"
                                Font-Strikeout="False" Width="490px" Rows="5"></asp:ListBox>
                            <br />
                            <div class="style2">
                                *Máximo 5 imagens</div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
            <asp:Button ID="btnAlterarDestino" runat="server" Text="Alterar" OnClick="BtnAlterarDestino_Click" />
            <asp:Button ID="btnExcluirDestino" runat="server" Text="Excluir" OnClick="BtnExcluirDestino_Click" />
        </asp:Panel>
    </asp:Panel>
</asp:Content>

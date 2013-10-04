<%@ Page Title="" Language="C#" MasterPageFile="~/LeptonAdm/Painel/AdmMaster.Master" ValidateRequest="false"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="leptonbrasil.LeptonAdm.Painel.AdmNoticias.Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Estilos/AdmNoticias.css" type="text/css" rel="Stylesheet" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlSelectNoticia" runat="server">
        <div>
            <div id="cadastraNoticia">
                <br />
                Cadastre uma nova Notícia ou modifique uma Notícia existente.<br />
                <br />
                <asp:ImageButton ID="imgBtnNovaNoticia" runat="server" ImageUrl="~/Graficos/Add_64x64.png"
                    ImageAlign="Middle" onclick="imgBtnNovaNoticia_Click" 
                    CausesValidation="False" />
                &nbsp;<br />
                <asp:LinkButton ID="lbNovaNoticia" runat="server" onclick="lbNovaNoticia_Click" 
                    CausesValidation="False">Nova Notícia</asp:LinkButton>
                <br />
            </div>
            <hr style="width: 99%" />
            <div id="listaNoticias">
                <asp:Panel ID="pnlListaPosts" runat="server">
                    <br />
                    &nbsp;Notícias Cadastradas:<br />
                    <asp:GridView ID="gvNoticias" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        EnableModelValidation="True" ForeColor="#333333" GridLines="None" Width="99%"
                        HorizontalAlign="Center" Font-Size="Small" EmptyDataText="Não existem registros disponíveis no momento."
                        OnPageIndexChanging="gvNoticias_PageIndexChanging" OnRowDataBound="gvNoticias_RowDataBound"
                        OnRowDeleting="gvNoticias_RowDeleting" OnRowCommand="gvNoticias_Click" >
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="data" HeaderText="Data" />
                            <asp:BoundField DataField="titulo" HeaderText="Título" />
                            <asp:BoundField DataField="autor" HeaderText="Autor" />
                            <asp:BoundField DataField="id" HeaderText="Cod" ItemStyle-Width="20px" >
                            <ItemStyle Width="20px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Alterar" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgBtnAlterar" runat="server" CausesValidation="False" CommandArgument='<%# Bind("id") %>'
                        CommandName="Alterar" ImageUrl="~/Graficos/Alterar32.png" ></asp:ImageButton>
                        </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Graficos/Excluir32.png" 
                                DeleteText="Excluir" HeaderStyle-Width="50px" HeaderText="Excluir" 
                                ItemStyle-HorizontalAlign="Center" ShowDeleteButton="True">
                            <HeaderStyle Width="50px" />
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="GrayText" ForeColor="Aquamarine" HorizontalAlign="Center" />
                    </asp:GridView>
                </asp:Panel>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlFormCadastro" runat="server">
    
    <div>
        <br />
        <div id="cabecalho">
            <div id="dataHora">
                <strong>
                    <asp:Literal ID="liDataUltMod" runat="server" Text="Data da Última Modificação:"></asp:Literal></strong>
                <asp:Label ID="lblDataHora" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <div id="conteudoFuncional">
            <div id="tituloTela">
                <strong>Título da Tela:</strong>
                <asp:RequiredFieldValidator ID="rfvTitulo" runat="server" 
                    ControlToValidate="txbTituloTela" Display="None" 
                    ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                <cc2:ValidatorCalloutExtender ID="rfvTitulo_ValidatorCalloutExtender" 
                    runat="server" Enabled="True" TargetControlID="rfvTitulo">
                </cc2:ValidatorCalloutExtender>
                <br />
                <asp:TextBox ID="txbTituloTela" runat="server" Width="650px" MaxLength="100"></asp:TextBox>
                <br />
                <br />
                <strong>Texto da Tela: *</strong><span class="style4">Limite aproximado de 20.000 caracteres
                </span>
                <cc1:Editor ID="editTextoTela" runat="server" Height="300px" InitialCleanUp="false" Onkeyup="progreso_tecla(this)"
                    Content="" />                    
                <div id="autor">
                    <asp:Label ID="lblAutor" runat="server" Text=""></asp:Label></div>
                <br />
                <br />
                <div id="botoesTela">
                    <asp:Button ID="btnSalvar" runat="server" Text="Salvar" Width="80px" OnClick="btnSalvar_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="tbnCancelar" runat="server" Text="Cancelar" Width="80px" 
                        OnClick="tbnCancelar_Click" CausesValidation="False" />
                    <br />
                    <br />
                </div>
            </div>
        </div>
    </div>
    </asp:Panel>
</asp:Content>

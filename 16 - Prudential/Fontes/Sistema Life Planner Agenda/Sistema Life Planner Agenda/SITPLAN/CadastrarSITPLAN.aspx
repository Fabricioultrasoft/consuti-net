<%@ Page Title="" Language="C#" MasterPageFile="~/Interna.Master" AutoEventWireup="true"
    CodeBehind="CadastrarSITPLAN.aspx.cs" Inherits="Sistema_Life_Planner_Agenda.SITPLAN.CadastrarSITPLAN" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 125px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
    <li><a href="..\Default.aspx">Home</a></li>
    <li><a href="..\Contato\PesquisarContato.aspx">Contatos</a></li>
    <li><a href="..\Agenda\PesquisarAgenda.aspx">Agenda do LP</a></li>
    <li class="selected"><a href="PesquisarSITPLAN.aspx">SIT PLAN</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="tituloTela">
            CADASTRAR SITPLAN
        </div>
        <div class="conteudoTela">
            <asp:Panel ID="PesquisaContatoPanel" runat="server">
                <fieldset>
                    <legend>Filtro para Seleção de Contatos</legend>
                    <table class="Formulario">
                        <tr>
                            <td class="alinhaDireita">
                                Recomendante:
                            </td>
                            <td>
                                <asp:DropDownList ID="RecomendanteDropDownList" runat="server" Width="400px" TabIndex="1">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                Status:
                            </td>
                            <td>
                                <asp:DropDownList ID="StatusDropDownList" runat="server" TabIndex="2" Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <table class="Formulario">
                        <tr>
                            <td class="alinhaDireita" style="width: 140px">
                                Data Cadastro De:
                            </td>
                            <td class="style1">
                                <div style="width: 110px;">
                                    <asp:TextBox ID="PeriodoDeTextBox" runat="server" Width="70px" TabIndex="3" MaxLength="10"></asp:TextBox>
                                    <cc1:CalendarExtender ID="PeriodoDeTextBox_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="PeriodoDeTextBox" PopupButtonID="deImageButton" TodaysDateFormat=" d MMMM yyyy"
                                        Format="dd/MM/yyyy">
                                    </cc1:CalendarExtender>
                                    <asp:ImageButton ID="deImageButton" runat="server" CausesValidation="False" ImageAlign="Middle"
                                        ImageUrl="~/Estilos/Imgs/Calendar.png" ToolTip="Selecione a data no calendário"
                                        TabIndex="4" />
                                </div>
                            </td>
                            <td class="alinhaDireita" style="width: 50px">
                                Até:
                            </td>
                            <td>
                                <div style="width: 110px;">
                                    <asp:TextBox ID="PeriodoAteTextBox" runat="server" Width="70px" TabIndex="4" MaxLength="10"></asp:TextBox>
                                    <cc1:CalendarExtender ID="PeriodoAteTextBox_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="PeriodoAteTextBox" PopupButtonID="AteImageButton" TodaysDateFormat=" d MMMM yyyy"
                                        Format="dd/MM/yyyy">
                                    </cc1:CalendarExtender>
                                    <asp:ImageButton ID="AteImageButton" runat="server" CausesValidation="False" ImageAlign="Middle"
                                        ImageUrl="~/Estilos/Imgs/Calendar.png" ToolTip="Selecione a data no calendário"
                                        TabIndex="5" /></div>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                Sexo:
                            </td>
                            <td class="style1">
                                <asp:DropDownList ID="SexoDropDownList" runat="server">
                                    <asp:ListItem Text="< Todos >" Value=""></asp:ListItem>
                                    <asp:ListItem Text="Masculino" Value="M"></asp:ListItem>
                                    <asp:ListItem Text="Feminino" Value="F"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <div class="barraBotoes">
                        <asp:Button ID="pesquisarButton" runat="server" Text="   Pesquisar" CssClass="botaoPesquisar"
                            TabIndex="19" OnClick="pesquisarButton_Click" />
                        <asp:Button ID="limparButton" runat="server" Text="Limpar" CssClass="botaoLimpar"
                            TabIndex="20" OnClick="limparButton_Click" />
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Resultado</legend>
                    <asp:GridView ID="ContatosGridView" runat="server" CellPadding="4" ForeColor="#333333"
                        GridLines="None" Width="100%" AutoGenerateColumns="False" EnableModelValidation="True"
                        OnRowCommand="ContatosGridView_Click" EmptyDataText="Nenhum resultado encontrado."
                        AllowPaging="True" AllowSorting="True" PageSize="100" BorderColor="#003366" BorderStyle="Solid"
                        BorderWidth="1px" CellSpacing="2" OnPageIndexChanging="ContatosGridView_PageIndexChanging"
                        OnSorting="ContatosGridView_Sorting" RowStyle-Height="40px">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:TemplateField HeaderText="#">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Font-Bold="true" />
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome">
                                <ItemStyle CssClass="espacoTabelas" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Recomendante" DataField="Recomendante" SortExpression="Recomendante">
                                <ItemStyle CssClass="espacoTabelas" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Status" DataField="Status" SortExpression="Status">
                                <ItemStyle CssClass="espacoTabelas" Width="95px" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Telefone Princ." DataField="TelefonePrincipal" SortExpression="TelefonePrincipal">
                                <ItemStyle CssClass="espacoTabelas" Width="110px" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Data do Cadastro" DataField="DataCadastro" SortExpression="DataCadastro">
                                <ItemStyle CssClass="espacoTabelas" Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Sexo" DataField="Sexo" SortExpression="Sexo">
                                <ItemStyle CssClass="espacoTabelas" HorizontalAlign="Center" Width="50px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Detalhe">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgBtnVisualizar" runat="server" CausesValidation="False" CommandArgument='<%# Bind("Id") %>'
                                        CommandName="Visualizar" ImageUrl="~/Estilos/Imgs/search.png"></asp:ImageButton>
                                </ItemTemplate>
                                <ItemStyle Width="60px" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:CheckBox ID="IncluirContatoCheckBox" runat="server" />
                                </ItemTemplate>
                                <ItemStyle Width="30px" HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Height="30px" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <PagerSettings Position="Bottom" Mode="Numeric" />
                    </asp:GridView>
                    <br />
                </fieldset>
            </asp:Panel>
            <br />
            <div class="barraBotoes">
                <asp:Button ID="SalvarButton" runat="server" Text="Salvar e Iniciar" CssClass="botaoSalvarIniciar"
                    TabIndex="99" OnClick="SalvarButton_Click" />
            </div>
        </div>
    </div>
</asp:Content>

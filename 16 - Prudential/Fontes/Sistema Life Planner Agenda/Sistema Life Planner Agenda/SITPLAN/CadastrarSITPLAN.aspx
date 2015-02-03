<%@ Page Title="SISLPA" Language="C#" MasterPageFile="~/Interna.Master" AutoEventWireup="true"
    CodeBehind="CadastrarSITPLAN.aspx.cs" Inherits="Sistema_Life_Planner_Agenda.SITPLAN.CadastrarSITPLAN" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100px;
        }
        .noprint
        {
            display: none;
        }
    </style>
    <script type="text/javascript" language="javascript">
        function SelecionaTodosChecks(spanChk) {
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ?
spanChk : spanChk.children.item[0];
            xState = theBox.checked;
            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" &&
elm[i].id != theBox.id) {
                    if (elm[i].checked != xState)
                        elm[i].click();
                }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
    <li><a href="../Default.aspx">Home</a></li>
    <li><a href="../Contato/PesquisarContato.aspx">Contatos</a></li>
    <li><a href="../Agenda/PesquisarAgenda.aspx">Agenda do LP</a></li>
    <li class="selected"><a href="PesquisarSITPLAN.aspx">SIT PLAN</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="tituloTela">
            CADASTRAR SITPLAN
        </div>
        <div class="conteudoTela">
            <asp:Panel ID="CadastroSitPlanPanel" runat="server">
                <fieldset>
                    <legend>Cadastro do SITPLAN</legend>
                    <table class="Formulario">
                        <tr>
                            <td class="alinhaDireita">
                                Nome do SITPLAN:
                            </td>
                            <td>
                                <asp:TextBox ID="NomeSitPlanTextBox" runat="server" MaxLength="100" Width="500px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </asp:Panel>
            <br />
            <asp:Panel ID="PesquisaContatoPanel" runat="server">
                <fieldset>
                    <legend>Filtro para Seleção de Contatos</legend>
                    <asp:UpdatePanel ID="FiltroContatoUpdatePanel" runat="server">
                        <ContentTemplate>
                            <table class="Formulario">
                                <tr>
                                    <td class="alinhaDireita">
                                        Recomendantes:
                                    </td>
                                    <td>
                                        <asp:ListBox ID="RecomendanteListBox" runat="server" Width="400px" SelectionMode="Multiple"
                                            TabIndex="1" Rows="5"></asp:ListBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="alinhaDireita">
                                        Status:
                                    </td>
                                    <td>
                                        <asp:ListBox ID="StatusListBox" runat="server" TabIndex="2" Rows="5" Width="200px"
                                            SelectionMode="Multiple"></asp:ListBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="alinhaDireita">
                                        UF:
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="UFDropDownList" runat="server" Width="200px" TabIndex="14"
                                            OnSelectedIndexChanged="UFDropDownList_SelectedIndexChanged" AutoPostBack="true">
                                            <asp:ListItem Text="< Selecione >" Value=""></asp:ListItem>
                                            <asp:ListItem Text="Acre" Value="AC"></asp:ListItem>
                                            <asp:ListItem Text="Alagoas" Value="AL"></asp:ListItem>
                                            <asp:ListItem Text="Amapá" Value="AP"></asp:ListItem>
                                            <asp:ListItem Text="Amazonas" Value="AM"></asp:ListItem>
                                            <asp:ListItem Text="Bahia" Value="BA"></asp:ListItem>
                                            <asp:ListItem Text="Ceará" Value="CE"></asp:ListItem>
                                            <asp:ListItem Text="Distrito Federal" Value="DF"></asp:ListItem>
                                            <asp:ListItem Text="Espírito Santo" Value="ES"></asp:ListItem>
                                            <asp:ListItem Text="Goiás" Value="GO"></asp:ListItem>
                                            <asp:ListItem Text="Maranhão" Value="MA"></asp:ListItem>
                                            <asp:ListItem Text="Mato Grosso" Value="MT"></asp:ListItem>
                                            <asp:ListItem Text="Mato Grosso do Sul" Value="MS"></asp:ListItem>
                                            <asp:ListItem Text="Minas Gerais" Value="MG"></asp:ListItem>
                                            <asp:ListItem Text="Pará" Value="PA"></asp:ListItem>
                                            <asp:ListItem Text="Paraíba" Value="PB"></asp:ListItem>
                                            <asp:ListItem Text="Paraná" Value="PR"></asp:ListItem>
                                            <asp:ListItem Text="Pernambuco" Value="PE"></asp:ListItem>
                                            <asp:ListItem Text="Piauí" Value="PI"></asp:ListItem>
                                            <asp:ListItem Text="Rio de Janeiro" Value="RJ"></asp:ListItem>
                                            <asp:ListItem Text="Rio Grande do Norte" Value="RN"></asp:ListItem>
                                            <asp:ListItem Text="Rio Grande do Sul" Value="RS"></asp:ListItem>
                                            <asp:ListItem Text="Rondônia" Value="RO"></asp:ListItem>
                                            <asp:ListItem Text="Santa Catarina" Value="SC"></asp:ListItem>
                                            <asp:ListItem Text="Roraima" Value="RR"></asp:ListItem>
                                            <asp:ListItem Text="São Paulo" Value="SP"></asp:ListItem>
                                            <asp:ListItem Text="Sergipe" Value="SE"></asp:ListItem>
                                            <asp:ListItem Text="Tocantins" Value="TO"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="alinhaDireita" style="width: 100px">
                                        Cidades:
                                    </td>
                                    <td>
                                        <asp:ListBox ID="CidadesListBox" runat="server" TabIndex="15" Width="400px" SelectionMode="Multiple"
                                            Rows="5"></asp:ListBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="alinhaDireita">
                                        Profissão:
                                    </td>
                                    <td class="style1">
                                        <asp:TextBox ID="ProfissaoTextBox" runat="server" Width="400px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <table class="Formulario">
                        <tr>
                            <td class="alinhaDireita" style="width: 144px">
                                Data Cadastro De:
                            </td>
                            <td class="style1">
                                <div style="width: 100px;">
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
                            <td class="alinhaDireita" style="width: 30px">
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
                            <td class="alinhaDireita" style="width: 144px">
                                Idade De:
                            </td>
                            <td class="style1">
                                <div style="width: 100px;">
                                    <asp:TextBox ID="IdadeDeTextBox" runat="server" Width="50px" TabIndex="3" MaxLength="3"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="IdadeDeTextBoxFilteredTextBoxExtender" runat="server"
                                        Enabled="True" FilterType="Numbers" TargetControlID="IdadeDeTextBox" ValidChars="0987654321">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                            </td>
                            <td class="alinhaDireita" style="width: 30px">
                                Até:
                            </td>
                            <td>
                                <div style="width: 110px;">
                                    <asp:TextBox ID="IdadeAteTextBox" runat="server" Width="50px" TabIndex="4" MaxLength="3"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="IdadeAteTextBoxFilteredTextBoxExtender" runat="server"
                                        Enabled="True" FilterType="Numbers" TargetControlID="IdadeAteTextBox" ValidChars="0987654321">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita" style="width: 144px">
                                Filhos De:
                            </td>
                            <td class="style1">
                                <div style="width: 100px;">
                                    <asp:TextBox ID="filhosTextBoxDe" runat="server" Width="50px" TabIndex="3" MaxLength="3"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="filhosTextBoxDeFilteredTextBoxExtender" runat="server"
                                        Enabled="True" FilterType="Numbers" TargetControlID="filhosTextBoxDe" ValidChars="0987654321">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                            </td>
                            <td class="alinhaDireita" style="width: 30px">
                                Até:
                            </td>
                            <td>
                                <div style="width: 110px;">
                                    <asp:TextBox ID="filhosTextBoxAte" runat="server" Width="50px" TabIndex="4" MaxLength="3"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="filhosTextBoxAteFilteredTextBoxExtender" runat="server"
                                        Enabled="True" FilterType="Numbers" TargetControlID="filhosTextBoxAte" ValidChars="0987654321">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
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
                    <asp:Panel ID="Panel1" runat="server" Width="820px" ScrollBars="Horizontal">
                        <br />
                        <asp:GridView ID="ContatosGridView" runat="server" CellPadding="4" ForeColor="#333333"
                            GridLines="None" Width="150%" AutoGenerateColumns="False" EnableModelValidation="True"
                            OnRowCommand="ContatosGridView_Click" EmptyDataText="Nenhum resultado encontrado."
                            AllowPaging="True" AllowSorting="True" PageSize="1000" BorderColor="#003366"
                            BorderStyle="Solid" BorderWidth="1px" CellSpacing="2" OnPageIndexChanging="ContatosGridView_PageIndexChanging"
                            OnSorting="ContatosGridView_Sorting" RowStyle-Height="40px" Font-Size="10pt">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="ID">
                                    <ItemStyle CssClass="noprint" />
                                    <HeaderStyle CssClass="noprint" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Selecionar Todos">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="IncluirContatoCheckBox" runat="server" />
                                    </ItemTemplate>
                                    <HeaderTemplate>
                                        <input id="chkAll" onclick="javascript:SelecionaTodosChecks(this);" runat="server"
                                            type="checkbox" />
                                    </HeaderTemplate>
                                    <ItemStyle Width="30px" HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="#">
                                    <HeaderStyle HorizontalAlign="Center" Width="30px" />
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
                                <asp:BoundField HeaderText="Profissão" DataField="Profissao" SortExpression="Profissao">
                                    <ItemStyle CssClass="espacoTabelas" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Idade" DataField="Idade" SortExpression="Idade">
                                    <ItemStyle CssClass="espacoTabelas" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Filhos" DataField="Filhos" SortExpression="Filhos">
                                    <ItemStyle CssClass="espacoTabelas" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Telefone Princ." DataField="TelefonePrincipal" SortExpression="TelefonePrincipal">
                                    <ItemStyle CssClass="espacoTabelas" Width="110px" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="UF" DataField="UF" SortExpression="UF">
                                    <ItemStyle CssClass="espacoTabelas" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Cidade" DataField="Cidade" SortExpression="Cidade">
                                    <ItemStyle CssClass="espacoTabelas" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Data do Cadastro" DataField="DataCadastro" SortExpression="DataCadastro">
                                    <ItemStyle CssClass="espacoTabelas" Width="80px" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Detalhe">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgBtnVisualizar" runat="server" CausesValidation="False" CommandArgument='<%# Bind("Id") %>'
                                            CommandName="Visualizar" ImageUrl="~/Estilos/Imgs/search.png"></asp:ImageButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="60px" HorizontalAlign="Center" />
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
                    </asp:Panel>
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

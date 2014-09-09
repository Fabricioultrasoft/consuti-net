<%@ Page Title="" Language="C#" MasterPageFile="~/Interna.Master" AutoEventWireup="true"
    CodeBehind="CadastrarSITPLAN.aspx.cs" Inherits="Sistema_Life_Planner_Agenda.SITPLAN.CadastrarSITPLAN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                                Tipo:
                            </td>
                            <td>
                                <asp:DropDownList ID="TipoContatoDropDownList" runat="server" TabIndex="2" Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                UF:
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList3" runat="server" TabIndex="3" Width="100px">
                                </asp:DropDownList>
                                &nbsp;<asp:DropDownList ID="DropDownList4" runat="server" TabIndex="4" Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <table class="Formulario">
                        
                        <tr>
                            <td class="alinhaDireita" style="width: 140px">
                                Data Cadastro De:
                            </td>
                            <td style="width: 115px">
                                <div style="width: 110px;">
                                    <asp:TextBox ID="PeriodoDeTextBox" runat="server" Width="70px" TabIndex="7" MaxLength="10"></asp:TextBox>
                                    <asp:ImageButton ID="deImageButton" runat="server" CausesValidation="False" ImageAlign="Middle"
                                        ImageUrl="~/Estilos/Imgs/Calendar.png" ToolTip="Selecione a data no calendário"
                                        TabIndex="8" />
                                </div>
                            </td>
                            <td class="alinhaDireita" style="width: 50px">
                                Até:
                            </td>
                            <td>
                                <div style="width: 110px;">
                                    <asp:TextBox ID="PeriodoAteTextBox" runat="server" Width="70px" TabIndex="9" MaxLength="10"></asp:TextBox>
                                    <asp:ImageButton ID="AteImageButton" runat="server" CausesValidation="False" ImageAlign="Middle"
                                        ImageUrl="~/Estilos/Imgs/Calendar.png" ToolTip="Selecione a data no calendário"
                                        TabIndex="10" /></div>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                Sexo:
                            </td>
                            <td style="width: 166px !important">
                                <asp:RadioButtonList ID="SexoRadioButtonList" runat="server" RepeatDirection="Horizontal"
                                    TabIndex="15">
                                    <asp:ListItem>Masculino</asp:ListItem>
                                    <asp:ListItem>Feminino</asp:ListItem>
                                </asp:RadioButtonList>
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
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"
                        Width="100%" EmptyDataText="Nenhum compromisso para os próximos 7 dias...">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
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

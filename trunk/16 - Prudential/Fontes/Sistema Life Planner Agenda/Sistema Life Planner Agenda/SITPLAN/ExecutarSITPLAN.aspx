<%@ Page Title="" Language="C#" MasterPageFile="~/Interna.Master" AutoEventWireup="true"
    CodeBehind="ExecutarSITPLAN.aspx.cs" Inherits="Sistema_Life_Planner_Agenda.SITPLAN.ExecutarSITPLAN" %>

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
            EXECUTAR SIT PLAN
        </div>
        <div class="conteudoTela">
            <asp:Panel ID="cadastroContatoLotePanel" runat="server">
                <fieldset>
                    <legend>Lista de TA's do SIT PLAN</legend>
                    <table id="ExecutarTasTable" class="CadastroContatoLote" style="text-align: center;">
                        <tr style="font-weight: bold; background-color: #CCCCCC;">
                            <td style="width: 30px">
                                ID
                            </td>
                            <td style="width: 300px">
                                Contato
                            </td>
                            <td style="width: 130px">
                                Tefone Principal
                            </td>
                            <td style="width: 120px">
                                Status Atual
                            </td>
                            <td style="width: 140px">
                                Novo Status
                            </td>
                            <td style="width: 60px">
                                Agenda
                            </td>
                        </tr>
                    </table>
                    <asp:Repeater ID="listaTasRepeater" runat="server" OnItemCommand="listaTasRepeater_ItemCommand">
                        <ItemTemplate>
                            <table id="CamposTasTable" class="CadastroContatoLote" style="text-align: center;">
                                <tr>
                                    <td style="width: 30px">
                                        <asp:Label ID="ContadorTasLabel" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                    </td>
                                    <td style="width: 300px">
                                        <asp:TextBox ID="NomeContatoTextBox" runat="server" Enabled="false" Width="250px"
                                            Text='<%# Eval("NOME") %>'></asp:TextBox>
                                        &nbsp<asp:ImageButton ID="PesquisarContatoImageButton" runat="server" ImageUrl="~/Estilos/Imgs/search.png"
                                            ImageAlign="Top" CommandArgument='<%# Bind("ID") %>' CommandName="DetalhesContato" />
                                    </td>
                                    <td style="width: 120px">
                                        <asp:TextBox ID="DDDTelefoneTextBox" runat="server" Width="20px" Enabled="false"
                                            Text='<%# Eval("DDD_TELEFONE_CONTATO") %>'></asp:TextBox>
                                        <asp:TextBox ID="TelefoneTextBox" runat="server" Width="70px" Enabled="false" Text='<%# Eval("TELEFONE_CONTATO") %>'></asp:TextBox>
                                    </td>
                                    <td style="width: 130px">
                                        <asp:TextBox ID="StatusAtualTextBox" runat="server" Width="100px" Enabled="false"
                                            Text='<%# Eval("STATUS_PRE_TA") %>'></asp:TextBox>
                                    </td>
                                    <td style="width: 140px">
                                        <asp:DropDownList ID="StatusDropDownList" runat="server" Width="120px" OnSelectedIndexChanged="StatusDropDownList_SelectedIndexChanged"
                                            AutoPostBack="true"  >
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 60px">
                                        <asp:ImageButton ID="AgendamentoImageButton" runat="server" ImageUrl="~/Estilos/Imgs/Calendar.png"
                                            CommandArgument='<%# Bind("ID")%>' CommandName="AgendamentoContato" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:Repeater>
                </fieldset>
                <div class="barraBotoes">
                    <asp:Button ID="cancelarButton" runat="server" Text="Cancelar" CssClass="botaoCancelar"
                        TabIndex="39" OnClick="cancelarButton_Click" OnClientClick="return confirm('Confirma cancelamento? Os dados não salvos serão perdidos.');" />
                    <asp:Button ID="salvarButton" runat="server" Text="Concluir" CssClass="botaoSalvar"
                        TabIndex="40" OnClick="salvarButton_Click" />
                </div>
            </asp:Panel>
            <br />
        </div>
    </div>
</asp:Content>

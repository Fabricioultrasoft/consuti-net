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
                                TA
                            </td>
                            <td style="width: 300px">
                                Contato
                            </td>
                            <td style="width: 120px">
                                Tefone Principal
                            </td>
                            <td style="width: 100px">
                                Status Atual
                            </td>
                            <td style="width: 120px">
                                Novo Status
                            </td>
                            <td style="width: 100px">
                                Agendamento
                            </td>
                        </tr>
                    </table>
                    <asp:Repeater ID="listaTasRepeater" runat="server">
                        <ItemTemplate>
                            <table id="CamposTasTable" class="CadastroContatoLote" style="text-align: center;">
                                <tr>
                                    <td style="width: 30px">
                                        <asp:Label ID="ContadorTasLabel" runat="server" Text="1"></asp:Label>
                                    </td>
                                    <td style="width: 300px">
                                        <asp:TextBox ID="NomeContatoTextBox" runat="server" Enabled="false" Width="250px"></asp:TextBox>&nbsp<asp:ImageButton
                                            ID="PesquisarContatoImageButton" runat="server" ImageUrl="~/Estilos/Imgs/search.png" ImageAlign="Top" />
                                    </td>
                                    <td style="width: 120px">
                                        <asp:TextBox ID="TelefoneTextBox" runat="server" Width="110px"></asp:TextBox>
                                    </td>
                                    <td style="width: 100px">
                                        <asp:TextBox ID="StatusAtualTextBox" runat="server" Width="90px"></asp:TextBox>
                                    </td>
                                    <td style="width: 120px">
                                        <asp:DropDownList ID="StatusDropDownList" runat="server" Width="110px" >
                                </asp:DropDownList>
                                    </td>
                                    <td style="width: 100px">
                                        <asp:ImageButton ID="AgendamentoImageButton" runat="server" ImageUrl="~/Estilos/Imgs/Calendar.png"/>
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

<%@ Page Title="SISLPA" Language="C#" MasterPageFile="~/Interna.Master" AutoEventWireup="true"
    CodeBehind="RelatorioTAs.aspx.cs" Inherits="Sistema_Life_Planner_Agenda.SITPLAN.RelatorioTAs" %>

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
        <div id="tituloTelaRelatorio" class="tituloTela">
            RESUMO DO TA
        </div>
        <div class="conteudoTela">
            <div id="logoRelatorio">
                <div style="float: right">
                    <img alt="" src="../Estilos/Imgs/LogoSisLPA_100.png" />
                </div>
                <div style="text-align: center; font-size: 20pt">
                    Relatório Resumo do TA
                </div>
            </div>
            <asp:Panel ID="RelatorioTAsPanel" runat="server">
                <div id="cabecalhoRelatorioTAs">
                    <table class="Formulario">
                        <tr style="font-size: 15pt">
                            <td class="alinhaDireita" style="width: 200px">
                                Life Planner:
                            </td>
                            <td>
                                <asp:Label ID="NomeLPLabel" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                Data e Hora de Início:
                            </td>
                            <td>
                                <asp:Label ID="DataHoraInicioLabel" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                Data e Hora de Término:
                            </td>
                            <td>
                                <asp:Label ID="DataHoraTerminoLabel" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
                <br />
                <hr />
                <br />
                <div id="resultadoRelatorioTAs">
                <div class="TituloSITPLAN">
                    <asp:Label ID="NomeSITPLANLabel" runat="server" Text=""></asp:Label>
                    <br />
                    <br />
                </div>
                    <table class="Formulario">
                        <tr style="font-size: 15pt; text-decoration: underline">
                            <td class="alinhaDireita" style="width: 200px">
                                Ligações Planejadas:
                            </td>
                            <td>
                                <asp:Label ID="LigacoesRealizadasLabel" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr style="font-size: 15pt;">
                            <td class="alinhaDireita" style="width: 300px">
                                Contatos Atualizados:
                            </td>
                            <td>
                                <asp:Label ID="ContatosAtualizadosLabel" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                Não Atendeu:
                            </td>
                            <td>
                                <asp:Label ID="NaoAtendeuLabel" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                Já é cliente:
                            </td>
                            <td>
                                <asp:Label ID="JaEhClienteLabel" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                Não Quer:
                            </td>
                            <td>
                                <asp:Label ID="NaoQuerLabel" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                Agendou OI:
                            </td>
                            <td>
                                <asp:Label ID="AgendouOiLabel" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                Agendou P/C:
                            </td>
                            <td>
                                <asp:Label ID="AgendouCLabel" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                Ligação Futura:
                            </td>
                            <td>
                                <asp:Label ID="LigacaoFuturaLabel" runat="server" Text=""></asp:Label>
                            </td>
                            </tr>
                            <tr>
                                <td class="alinhaDireita">
                                    Nenhum Status:
                                </td>
                                <td>
                                    <asp:Label ID="NenhumLabel" runat="server" Text=""></asp:Label>
                                </td>
                        </tr>
                        <tr>
                                <td class="alinhaDireita">
                                    Meu Cliente:
                                </td>
                                <td>
                                    <asp:Label ID="MeuClienteLabel" runat="server" Text=""></asp:Label>
                                </td>
                        </tr>
                    </table>
                </div>
                <br />
                <hr />
                <br />
            </asp:Panel>
            <br />
            <div id="barraBotoesRelatorioTas" class="barraBotoes">
                <asp:Button ID="ImprimirButton" runat="server" Text="Imprimir" CssClass="botaoImprimir"
                    TabIndex="99" OnClientClick="javascript:window.print()" />
            </div>
        </div>
    </div>
</asp:Content>

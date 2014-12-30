<%@ Page Title="SISLPA" Language="C#" MasterPageFile="~/Interna.Master" AutoEventWireup="true"
    CodeBehind="RelatorioTAs.aspx.cs" Inherits="Sistema_Life_Planner_Agenda.SITPLAN.RelatorioTAs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
    <li><a href="../Default.aspx">Home</a></li>
    <li><a href="../Contato/PesquisarContato.aspx">Contatos</a></li>
    <li><a href="../Agenda/PesquisarAgenda.aspx">Agenda do LP</a></li>
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
                                TA NÃO ATENDEU:
                            </td>
                            <td>
                                <asp:Label ID="TaNaoAtendeuLabel" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                TA NÃO QUER:
                            </td>
                            <td>
                                <asp:Label ID="TaNaoQuerLabel" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                TA LIGAÇÃO FUTURA:
                            </td>
                            <td>
                                <asp:Label ID="TaLigacaoFuturaLabel" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                TA JÁ É CLIENTE:
                            </td>
                            <td>
                                <asp:Label ID="TaJaEhClientLabel" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                TA OI AGENDADO:
                            </td>
                            <td>
                                <asp:Label ID="TaOiAgendadoLabel" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                OI DELAY:
                            </td>
                            <td>
                                <asp:Label ID="OiDelayLabel" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                OI REALIZADO:
                            </td>
                            <td>
                                <asp:Label ID="OiRealizadoLabel" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                PC LIGAÇÃO FUTURA:
                            </td>
                            <td>
                                <asp:Label ID="PcLigacaoFuturaLabel" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                PC DELAY:
                            </td>
                            <td>
                                <asp:Label ID="PcDelayLabel" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                PC N:
                            </td>
                            <td>
                                <asp:Label ID="PcNLabel" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                PC C2:
                            </td>
                            <td>
                                <asp:Label ID="PcC2Label" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                MEU CLIENTE:
                            </td>
                            <td>
                                <asp:Label ID="MeuClienteLabel" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                NENHUM:
                            </td>
                            <td>
                                <asp:Label ID="NenhumLabel" runat="server" Text=""></asp:Label>
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

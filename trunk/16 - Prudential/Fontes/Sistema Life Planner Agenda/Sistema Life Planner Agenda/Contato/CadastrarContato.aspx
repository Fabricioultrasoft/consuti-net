<%@ Page Title="" Language="C#" MasterPageFile="~/Interna.Master" AutoEventWireup="true"
    CodeBehind="CadastrarContato.aspx.cs" Inherits="Sistema_Life_Planner_Agenda.Contato.CadastrarContato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
    <li><a href="..\Default.aspx">Home</a></li>
    <li class="selected"><a href="PesquisarContato.aspx">Contatos</a></li>
    <li><a href="..\Agenda\PesquisarAgenda.aspx">Agenda do LP</a></li>
    <li><a href="..\SITPLAN\PesquisarSITPLAN.aspx">SIT PLAN</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="tituloTela">
            CADASTRO DE CONTATO
        </div>
        <div class="conteudoTela">
            <asp:Panel ID="cadastroContatoPanel" runat="server">
                <fieldset>
                    <legend>Dados básicos</legend>
                    <div style="float: right; width: 300px; margin-top: -20px; text-align: right; font-size: 8pt">
                        <strong>Data do Cadastro:</strong>
                        <asp:Label ID="DataCadastroLabel" runat="server" Text=""></asp:Label>&nbsp;</div>
                    <table class="Formulario">
                        <tr>
                            <td class="alinhaDireita" style="font-size: 13pt">
                                <span class="obrigatorio">*</span>Recomendante:
                            </td>
                            <td>
                                <asp:DropDownList ID="RecomendanteDropDownList" runat="server" Width="500px" TabIndex="1"
                                    Font-Size="13pt">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita" style="font-size: 13pt">
                                <span class="obrigatorio">*</span>Nome Completo:
                            </td>
                            <td>
                                <asp:TextBox ID="nomeCompletoTextBox" runat="server" MaxLength="100" TabIndex="1"
                                    TextMode="SingleLine" Width="500px" Font-Size="13pt"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita" style="font-size: 13pt">
                                <span class="obrigatorio">*</span>Status:
                            </td>
                            <td>
                                <asp:DropDownList ID="StatusDropDownList" runat="server" TabIndex="2" Width="300px"
                                    Font-Size="13pt">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita" style="font-size: 13pt">
                                Telefone Principal:
                            </td>
                            <td>
                                <asp:TextBox ID="TelefoneTextBox" runat="server" Width="150px" MaxLength="20" Font-Size="13pt" TabIndex="3"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                Sexo:
                            </td>
                            <td>
                                <asp:RadioButtonList ID="SexoRadioButtonList" runat="server" RepeatDirection="Horizontal" TabIndex="4">
                                    <asp:ListItem>Masculino</asp:ListItem>
                                    <asp:ListItem>Feminino</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                Outras Informações:
                            </td>
                            <td>
                                <asp:TextBox ID="outrasInformacoesTextBox" runat="server" TabIndex="5" TextMode="MultiLine"
                                    Width="500px" Rows="5"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                </fieldset>
                <fieldset>
                    <legend>Contatos realizados</legend>
                    <table class="Formulario" style="background-color: #DEDEDE; margin: 0 auto">
                        <tr>
                            <td class="alinhaDireita">
                                Data:
                            </td>
                            <td>
                                <asp:TextBox ID="DataContatoTextBox" runat="server" MaxLength="10" TabIndex="6" TextMode="SingleLine"
                                    Width="70px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                Hora:
                            </td>
                            <td>
                                <asp:TextBox ID="HoraContatoTextBox" runat="server" Width="36px" MaxLength="5" TabIndex="6"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                Observação:
                            </td>
                            <td>
                                <asp:TextBox ID="ObservacaoTextBox" runat="server" TabIndex="7" TextMode="MultiLine" Width="500px"
                                    Rows="5"></asp:TextBox>
                                <br />
                                <div style="text-align: right">
                                    <asp:Button ID="incluirContatoButton" runat="server" Text="Incluir" CssClass="botaoNovo"
                                        TabIndex="8" OnClick="incluirHistoricoContato_Click" /></div>
                            </td>
                        </tr>
                    </table>
                    <div style="width: 90%; margin: 0 auto">
                        <fieldset>
                            <legend>Histórico</legend>
                            <asp:Panel runat="server" ID="historicoContatosPanel" ScrollBars="Vertical">
                                <asp:Label ID="NenhumLabel" runat="server" Text="Nenhum até o momento..." Font-Italic="true"></asp:Label>
                            </asp:Panel>
                        </fieldset>
                        <br />
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Dados Complementares</legend>
                    <table class="Formulario">
                        <tr>
                            <td class="alinhaDireita">
                                Idade:
                            </td>
                            <td>
                                <asp:TextBox ID="idadeTextBox" runat="server" MaxLength="3" TabIndex="9" Width="30px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                Profissão:
                            </td>
                            <td>
                                <asp:TextBox ID="profissaoTextBox" runat="server" Width="500px" TabIndex="10" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                Estado Civil:
                            </td>
                            <td>
                                <asp:DropDownList ID="EstadoCivilDropDownList" runat="server" Width="100px" TabIndex="11">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                Filhos:
                            </td>
                            <td>
                                <asp:TextBox ID="filhosSenhaTextBox" runat="server" Width="30px" TabIndex="12" MaxLength="2"
                                    TextMode="SingleLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                Tipo:
                            </td>
                            <td>
                                <asp:DropDownList ID="TipoDropDownList" runat="server" Width="100px" TabIndex="13">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                UF:
                            </td>
                            <td>
                                <asp:DropDownList ID="UFDropDownList" runat="server" Width="150px" TabIndex="14">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                Cidade:
                            </td>
                            <td>
                                <asp:TextBox ID="cidadeTextBox" runat="server" Enabled="false" TextMode="Password"
                                    Width="300px" TabIndex="15"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                E-mail:
                            </td>
                            <td>
                                <asp:TextBox ID="emailTextBox" runat="server" MaxLength="100" TabIndex="16" Width="300px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                Telefone Alternativo 1:
                            </td>
                            <td>
                                <asp:TextBox ID="telefoneAlternativo1TextBox" runat="server" MaxLength="20" TabIndex="17"
                                    Width="100px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                Telefone Alternativo 2:
                            </td>
                            <td>
                                <asp:TextBox ID="telefoneAlternativo2TextBox" runat="server" MaxLength="20" TabIndex="18"
                                    Width="100px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                </fieldset>
                <div class="barraBotoes">
                    <asp:Button ID="cancelarButton" runat="server" Text="Cancelar" CssClass="botaoCancelar"
                        TabIndex="19" OnClick="cancelarButton_Click" OnClientClick="return confirm('Confirma cancelamento? Os dados não salvos serão perdidos.');" />
                    <asp:Button ID="salvarButton" runat="server" Text="Salvar" CssClass="botaoSalvar"
                        TabIndex="20" OnClick="salvarButton_Click" />
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

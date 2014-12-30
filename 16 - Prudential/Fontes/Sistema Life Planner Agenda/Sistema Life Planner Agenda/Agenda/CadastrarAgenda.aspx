<%@ Page Title="SISLPA" Language="C#" MasterPageFile="~/Interna.Master" AutoEventWireup="true"
    CodeBehind="CadastrarAgenda.aspx.cs" Inherits="Sistema_Life_Planner_Agenda.Agenda.CadastrarAgenda" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
    <li><a href="../Default.aspx">Home</a></li>
    <li><a href="../Contato/PesquisarContato.aspx">Contatos</a></li>
    <li class="selected"><a href="PesquisarAgenda.aspx">Agenda do LP</a></li>
    <li><a href="../SITPLAN/PesquisarSITPLAN.aspx">SIT PLAN</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="tituloTela">
            CADASTRAR COMPROMISSO NA AGENDA DO LIFE PLANNER
        </div>
        <div class="conteudoTela">
            <asp:Panel ID="cadastroAgendaPanel" runat="server">
                <fieldset>
                    <legend>Dados do Agendamento</legend>
                    <div>
                        <div style="float: left; width: 30%; background-color: #F0F0F0; height: 290px">
                            <div style="padding: 10px">
                                <asp:UpdatePanel runat="server" ID="calendarioUpdatePanel">
                                    <ContentTemplate>
                                        <asp:Calendar ID="DiaCompromissoCalendar" runat="server" BackColor="White" BorderColor="#3366CC"
                                            BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana"
                                            TabIndex="3" Font-Underline="false" Font-Size="8pt" ForeColor="#003399" Height="200px"
                                            Width="224px">
                                            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                            <OtherMonthDayStyle ForeColor="#999999" />
                                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True"
                                                Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                            <WeekendDayStyle BackColor="#CCCCFF" />
                                        </asp:Calendar>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div style="text-align: center">
                                <span class="obrigatorio">*</span>Horario:
                                <asp:TextBox ID="HoraTextBox" runat="server" Width="20px" TabIndex="4" MaxLength="2"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="HoraTextBox_FilteredTextBoxExtender" runat="server"
                                    Enabled="True" FilterType="Numbers" TargetControlID="HoraTextBox" ValidChars="1234567890">
                                </cc1:FilteredTextBoxExtender>
                                :<asp:TextBox ID="MinutosTextBox" runat="server" Width="20px" TabIndex="5" MaxLength="2"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="MinutosTextBox_FilteredTextBoxExtender" runat="server"
                                    Enabled="True" TargetControlID="MinutosTextBox" FilterType="Numbers" ValidChars="1234567890">
                                </cc1:FilteredTextBoxExtender>
                                <span class="obrigatorio">
                                    <asp:RequiredFieldValidator ID="HoraTextBoxRequiredFieldValidator" runat="server"
                                        ControlToValidate="HoraTextBox" Display="Dynamic" ErrorMessage="*" CssClass="obrigatorio"
                                        ToolTip="Campo Obrigatório!"></asp:RequiredFieldValidator></span><span class="obrigatorio">
                                            <asp:RequiredFieldValidator ID="MinutosTextBoxRequiredFieldValidator" runat="server"
                                                ControlToValidate="MinutosTextBox" Display="Dynamic" ErrorMessage="*" CssClass="obrigatorio"
                                                ToolTip="Campo Obrigatório!"></asp:RequiredFieldValidator></span>
                                <br />
                                <br />
                                <asp:RadioButtonList ID="PeriodoRadioButtonList" runat="server" RepeatDirection="Horizontal"
                                    Width="100%" TabIndex="6">
                                    <asp:ListItem>Manhã</asp:ListItem>
                                    <asp:ListItem>Tarde</asp:ListItem>
                                    <asp:ListItem>Noite</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div style="float: right; width: 68%; height: 300px; padding: 5px">
                            <table class="Formulario">
                                <tr>
                                    <td class="alinhaDireita">
                                        <span class="obrigatorio">*</span>Contato:
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ContatoDropDownList" runat="server" Width="380px" TabIndex="1"
                                            AutoPostBack="true" OnSelectedIndexChanged="CarregaContato_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <span class="obrigatorio">
                                    <asp:RequiredFieldValidator ID="ContatoDropDownListRequiredFieldValidator" runat="server"
                                        ControlToValidate="ContatoDropDownList" Display="Dynamic" ErrorMessage="*"
                                        CssClass="obrigatorio" ToolTip="Campo Obrigatório!"></asp:RequiredFieldValidator></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="alinhaDireita">
                                        Recomendante:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="RecomendanteTextBox" runat="server" Enabled="false" TabIndex="2"
                                            TextMode="SingleLine" Width="400px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <fieldset>
                                <legend>Dados para Contato</legend>
                                <table class="Formulario" style="margin-top: -10px">
                                    <tr>
                                        <td class="alinhaDireita">
                                        </td>
                                        <td>
                                        </td>
                                        <td class="style1">
                                            Preferencial
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="alinhaDireita">
                                            Telefone Principal:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="DDDTelefonePrincipalTextBox" runat="server" MaxLength="2" TabIndex="7"
                                                Width="20px" Enabled="false"></asp:TextBox>
                                            &nbsp;<asp:TextBox ID="TelefonePrincipalTextBox" runat="server" MaxLength="9"
                                                TabIndex="7" Width="70px" Enabled="false"></asp:TextBox>
                                        </td>
                                        <td class="style1">
                                            <asp:CheckBox ID="TelefonePrincipalCheckBox" runat="server" Text=" " TabIndex="8" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="alinhaDireita">
                                            Telefone Alternativo 1:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="DDDtelefoneAlternativo1TextBox" runat="server" MaxLength="2" TabIndex="9"
                                                Width="20px" Enabled="false"></asp:TextBox>
                                            &nbsp;<asp:TextBox ID="telefoneAlternativo1TextBox" runat="server" MaxLength="9"
                                                TabIndex="9" Width="70px" Enabled="false"></asp:TextBox>
                                        </td>
                                        <td class="style1">
                                            <asp:CheckBox ID="TelefoneAlternativo1CheckBox" runat="server" Text=" " TabIndex="10" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="alinhaDireita">
                                            Telefone Alternativo 2:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="DDDtelefoneAlternativo2TextBox" runat="server" MaxLength="2" TabIndex="10"
                                                Width="20px" Enabled="false"></asp:TextBox>
                                            &nbsp;<asp:TextBox ID="telefoneAlternativo2TextBox" runat="server" MaxLength="9"
                                                TabIndex="10" Width="70px" Enabled="false"></asp:TextBox>
                                        </td>
                                        <td class="style1">
                                            <asp:CheckBox ID="TelefoneAlternativo2CheckBox" runat="server" Text=" " TabIndex="12" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="alinhaDireita">
                                            E-mail:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="emailTextBox" runat="server" Enabled="false" TabIndex="13" Width="220px"></asp:TextBox>
                                        </td>
                                        <td class="style1">
                                            <asp:CheckBox ID="emailCheckBox" runat="server" Text=" " TabIndex="14" />
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </div>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Mais Informações</legend>
                    <div style="padding: 10px">
                        <asp:TextBox ID="MaisInformaciesTextBox" runat="server" TextMode="SingleLine" Width="100%" TabIndex="15" MaxLength="300"></asp:TextBox>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Compromisso na Agenda do E-mail</legend>
                    <div style="margin: 10px;">
                        <asp:CheckBox ID="CriarAgendaGoogleCheckBox" runat="server" Text=" Enviar compromisso na agenda do e-mail quando salvar"
                            Checked="true" TabIndex="16" />
                        <br />
                    </div>
                </fieldset>
                <div class="barraBotoes">
                <asp:Button ID="VoltarButton" runat="server" Text="SITPLAN" CssClass="botaoVoltar"
                        TabIndex="19" CausesValidation="False" Visible="false" 
                        onclick="VoltarButton_Click" />
                    <asp:Button ID="cancelarButton" runat="server" Text="Cancelar" CssClass="botaoCancelar"
                        TabIndex="19" OnClick="cancelarButton_Click" OnClientClick="return confirm('Confirma cancelamento? Os dados não salvos serão perdidos.');" />
                    <asp:Button ID="salvarButton" runat="server" Text="Salvar" CssClass="botaoSalvar"
                        TabIndex="20" OnClick="salvarButton_Click" />
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

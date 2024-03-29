﻿<%@ Page Title="SISLPA" Language="C#" MasterPageFile="~/Interna.Master" AutoEventWireup="true"
    ValidateRequest="false" CodeBehind="CadastrarContato.aspx.cs" Inherits="Sistema_Life_Planner_Agenda.Contato.CadastrarContato" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
    <li><a href="../Default.aspx">Home</a></li>
    <li class="selected"><a href="PesquisarContato.aspx">Contatos</a></li>
    <li><a href="../Agenda/PesquisarAgenda.aspx">Agenda do LP</a></li>
    <li><a href="../SITPLAN/PesquisarSITPLAN.aspx">SIT PLAN</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="tituloTela">
            CADASTRO DE CONTATO
        </div>
        <div class="conteudoTela">
            <asp:Panel ID="cadastroContatoPanel" runat="server">
                <fieldset>
                    <legend>Dados Básicos</legend>
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
                                <span class="obrigatorio">
                                    <asp:RequiredFieldValidator ID="RecomendanteDropDownListRequiredFieldValidator" runat="server"
                                        ControlToValidate="RecomendanteDropDownList" Display="Dynamic" ErrorMessage="*"
                                        CssClass="obrigatorio" ToolTip="Campo Obrigatório!"></asp:RequiredFieldValidator></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita" style="font-size: 13pt">
                                <span class="obrigatorio">*</span>Nome Completo:
                            </td>
                            <td>
                                <asp:TextBox ID="nomeCompletoTextBox" runat="server" MaxLength="100" TabIndex="1"
                                    TextMode="SingleLine" Width="500px" Font-Size="13pt"></asp:TextBox>
                                <span class="obrigatorio">
                                    <asp:RequiredFieldValidator ID="nomeCompletoTextBoxRequiredFieldValidator" runat="server"
                                        ControlToValidate="nomeCompletoTextBox" Display="Dynamic" ErrorMessage="*" CssClass="obrigatorio"
                                        ToolTip="Campo Obrigatório!"></asp:RequiredFieldValidator></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita" style="font-size: 13pt">
                                <span class="obrigatorio">*</span>Telefone Principal:
                            </td>
                            <td>
                                <asp:TextBox ID="DDDTelefoneTextBox" runat="server" MaxLength="2" TabIndex="3" Font-Size="13pt"
                                    Width="20px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="DDDTelefoneTextBox_FilteredTextBoxExtender" runat="server"
                                    Enabled="True" TargetControlID="DDDTelefoneTextBox" ValidChars="1234567890">
                                </cc1:FilteredTextBoxExtender>
                                &nbsp;<asp:TextBox ID="TelefoneTextBox" runat="server" MaxLength="9" TabIndex="4"
                                    Font-Size="13pt" Width="90px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="TelefoneTextBox_FilteredTextBoxExtender" runat="server"
                                    Enabled="True" TargetControlID="TelefoneTextBox" ValidChars="1234567890">
                                </cc1:FilteredTextBoxExtender>
                                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                    ControlToValidate="DDDTelefoneTextBox" Display="Dynamic" ErrorMessage="*" ToolTip="DDD Inválido"
                                    ValidationExpression="\d{2}"></asp:RegularExpressionValidator>
                                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                                    ControlToValidate="TelefoneTextBox" Display="Dynamic" ErrorMessage="*" ToolTip="Telefone Inválido"
                                    ValidationExpression="\d{8,9}"></asp:RegularExpressionValidator>
                                &nbsp;<asp:RequiredFieldValidator ID="DDDTelefoneTextBoxRequiredFieldValidator" runat="server"
                                    ControlToValidate="DDDTelefoneTextBox" CssClass="obrigatorio" Display="Dynamic"
                                    ErrorMessage="*" ToolTip="Campo Obrigatório!"> </asp:RequiredFieldValidator>
                                &nbsp;<asp:RequiredFieldValidator ID="TelefoneTextBoxRequiredFieldValidator" runat="server"
                                    ControlToValidate="TelefoneTextBox" CssClass="obrigatorio" Display="Dynamic"
                                    ErrorMessage="*" ToolTip="Campo Obrigatório!"> </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita" style="font-size: 13pt">
                                Status:
                            </td>
                            <td>
                                <asp:DropDownList ID="StatusDropDownList" runat="server" TabIndex="5" Width="200px"
                                    Font-Size="13pt">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                Sexo:
                            </td>
                            <td>
                                <asp:RadioButtonList ID="SexoRadioButtonList" runat="server" RepeatDirection="Horizontal"
                                    TabIndex="6">
                                    <asp:ListItem Text="Masculino" Value="M" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Feminino" Value="F"></asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="alinhaDireita">
                                &nbsp;Informações:
                            </td>
                            <td>
                                <asp:TextBox ID="outrasInformacoesTextBox" runat="server" TabIndex="5" TextMode="MultiLine"
                                    Width="500px" Rows="7"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                </fieldset>
                <fieldset>
                    <legend>Dados Complementares</legend>
                    <asp:UpdatePanel ID="ComplementoContatoUpdatePanel" runat="server">
                        <ContentTemplate>
                            <table class="Formulario">
                                <tr>
                                    <td class="alinhaDireita">
                                        Idade:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="idadeTextBox" runat="server" MaxLength="3" TabIndex="9" Width="30px"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="idadeTextBox_FilteredTextBoxExtender" runat="server"
                                            Enabled="True" FilterType="Numbers" TargetControlID="idadeTextBox" ValidChars="0987654321">
                                        </cc1:FilteredTextBoxExtender>
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
                                            <asp:ListItem Text="< Selecione >" Value=""></asp:ListItem>
                                            <asp:ListItem Text="Solteiro(a)" Value="Solteiro(a)"></asp:ListItem>
                                            <asp:ListItem Text="Casado(a)" Value="Casado(a)"></asp:ListItem>
                                            <asp:ListItem Text="Divorciado(a)" Value="Divorciado(a)"></asp:ListItem>
                                            <asp:ListItem Text="Viúvo(a)" Value="Viúvo(a)"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="alinhaDireita">
                                        Filhos:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="filhosTextBox" runat="server" Width="20px" TabIndex="12" MaxLength="2"
                                            TextMode="SingleLine"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" Enabled="True"
                                            FilterType="Numbers" TargetControlID="filhosTextBox" ValidChars="0987654321">
                                        </cc1:FilteredTextBoxExtender>
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
                                        <asp:DropDownList ID="UFDropDownList" runat="server" Width="150px" TabIndex="14"
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
                                    <td class="alinhaDireita">
                                        Cidade:
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="CidadesDropDownList" runat="server" TabIndex="15">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="alinhaDireita">
                                        E-mail:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="emailTextBox" runat="server" Width="300px" TabIndex="16" MaxLength="100"></asp:TextBox>
                                        &nbsp;<asp:RegularExpressionValidator ID="EmailTextBoxRegularExpressionValidator"
                                            runat="server" Display="Dynamic" ErrorMessage="*" ToolTip="Email Inválido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                            ControlToValidate="emailTextBox"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="alinhaDireita">
                                        Telefone Alternativo 1:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="DDDtelefoneAlternativo1TextBox" runat="server" MaxLength="2" TabIndex="17"
                                            Width="20px"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="DDDtelefoneAlternativo1TextBox_FilteredTextBoxExtender"
                                            runat="server" Enabled="True" TargetControlID="DDDtelefoneAlternativo1TextBox"
                                            ValidChars="1234567890">
                                        </cc1:FilteredTextBoxExtender>
                                        &nbsp;<asp:TextBox ID="telefoneAlternativo1TextBox" runat="server" MaxLength="9"
                                            TabIndex="18" Width="70px"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="telefoneAlternativo1TextBox_FilteredTextBoxExtender"
                                            runat="server" Enabled="True" TargetControlID="telefoneAlternativo1TextBox" ValidChars="1234567890">
                                        </cc1:FilteredTextBoxExtender>
                                        &nbsp;<asp:RegularExpressionValidator ID="EmailTextBoxRegularExpressionValidator1"
                                            runat="server" ControlToValidate="DDDtelefoneAlternativo1TextBox" Display="Dynamic"
                                            ErrorMessage="*" ToolTip="DDD Inválido" ValidationExpression="\d{2}"></asp:RegularExpressionValidator>
                                        &nbsp;<asp:RegularExpressionValidator ID="EmailTextBoxRegularExpressionValidator2"
                                            runat="server" ControlToValidate="telefoneAlternativo1TextBox" Display="Dynamic"
                                            ErrorMessage="*" ToolTip="Telefone Inválido" ValidationExpression="\d{8,9}"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="alinhaDireita">
                                        Telefone Alternativo 2:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="DDDtelefoneAlternativo2TextBox" runat="server" MaxLength="2" TabIndex="19"
                                            Width="20px"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="DDDtelefoneAlternativo2TextBox_FilteredTextBoxExtender"
                                            runat="server" Enabled="True" TargetControlID="DDDtelefoneAlternativo2TextBox"
                                            ValidChars="1234567890">
                                        </cc1:FilteredTextBoxExtender>
                                        &nbsp;<asp:TextBox ID="telefoneAlternativo2TextBox" runat="server" MaxLength="9"
                                            TabIndex="20" Width="70px"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="telefoneAlternativo2TextBox_FilteredTextBoxExtender"
                                            runat="server" Enabled="True" TargetControlID="telefoneAlternativo2TextBox" ValidChars="1234567890">
                                        </cc1:FilteredTextBoxExtender>
                                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                            ControlToValidate="DDDtelefoneAlternativo2TextBox" Display="Dynamic" ErrorMessage="*"
                                            ToolTip="DDD Inválido" ValidationExpression="\d{2}"></asp:RegularExpressionValidator>
                                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                            ControlToValidate="telefoneAlternativo2TextBox" Display="Dynamic" ErrorMessage="*"
                                            ToolTip="Telefone Inválido" ValidationExpression="\d{8,9}"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <br />
                </fieldset>
                <asp:Panel ID="HistoricoPanel" runat="server" Visible="false">
                    <fieldset>
                        <legend>Contatos Realizados</legend>
                        <asp:UpdatePanel ID="HistoricoUpdatePanel" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <table class="Formulario" style="background-color: #DEDEDE; margin: 0 auto">
                                    <tr>
                                        <td class="alinhaDireita">
                                            Data:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="DataContatoTextBox" runat="server" Width="70px" TabIndex="1" MaxLength="10"
                                                ValidationGroup="historico"></asp:TextBox>
                                            &nbsp;
                                            <asp:RequiredFieldValidator ID="DataContatoTextBoxRequiredFieldValidator" runat="server"
                                                ControlToValidate="DataContatoTextBox" CssClass="obrigatorio" Display="Dynamic"
                                                ErrorMessage="*" ToolTip="Campo Obrigatório!" ValidationGroup="historico"></asp:RequiredFieldValidator>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="alinhaDireita">
                                            Hora:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="HoraTextBox" runat="server" Width="20px" TabIndex="4" MaxLength="2"
                                                ValidationGroup="historico"></asp:TextBox>
                                            :<asp:TextBox ID="MinutosTextBox" runat="server" Width="20px" TabIndex="5" MaxLength="2"
                                                ValidationGroup="historico"></asp:TextBox>
                                            <span class="obrigatorio">
                                                <asp:RequiredFieldValidator ID="HoraTextBoxRequiredFieldValidator" runat="server"
                                                    ControlToValidate="HoraTextBox" Display="Dynamic" ErrorMessage="*" CssClass="obrigatorio"
                                                    ToolTip="Campo Obrigatório!" ValidationGroup="historico"></asp:RequiredFieldValidator>
                                            </span><span class="obrigatorio">
                                                <asp:RequiredFieldValidator ID="MinutosTextBoxRequiredFieldValidator" runat="server"
                                                    ControlToValidate="MinutosTextBox" Display="Dynamic" ErrorMessage="*" CssClass="obrigatorio"
                                                    ToolTip="Campo Obrigatório!" ValidationGroup="historico"></asp:RequiredFieldValidator></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="alinhaDireita">
                                            Observação:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ObservacaoTextBox" runat="server" TabIndex="7" TextMode="MultiLine"
                                                Width="500px" Rows="5" ValidationGroup="historico"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="ObservacaoTextBoxRequiredFieldValidator" runat="server"
                                                ControlToValidate="ObservacaoTextBox" Display="Dynamic" ErrorMessage="*" CssClass="obrigatorio"
                                                ToolTip="Campo Obrigatório!" ValidationGroup="historico"></asp:RequiredFieldValidator></span>
                                            <br />
                                            <div style="text-align: right">
                                                <div style="width: 400px; text-align: left; color: Red">
                                                    <asp:Label ID="MsgHistoricoLabel" runat="server" Text=""></asp:Label></div>
                                                <asp:Button ID="incluirContatoButton" runat="server" Text="Incluir" CssClass="botaoNovo"
                                                    TabIndex="8" OnClientClick="return true;" OnClick="incluirHistoricoContato_Click"
                                                    ValidationGroup="historico" CausesValidation="true" UseSubmitBehavior="true" /></div>
                                        </td>
                                    </tr>
                                </table>
                                <div style="width: 90%; margin: 0 auto">
                                    <fieldset>
                                        <legend>Histórico</legend>
                                        <asp:Panel runat="server" ID="historicoContatosPanel">
                                            <asp:GridView ID="HistoricoGridView" runat="server" CellPadding="4" ForeColor="#333333"
                                                GridLines="None" Width="100%" AutoGenerateColumns="False" EnableModelValidation="True"
                                                EmptyDataText="Nenhum até o momento..." AllowPaging="True" PageSize="10" BorderColor="#003366"
                                                BorderStyle="Solid" BorderWidth="1px" CellSpacing="2" RowStyle-Height="40px"
                                                Font-Size="9pt" OnPageIndexChanging="HistoricoGridView_PageIndexChanging">
                                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="#">
                                                        <HeaderStyle HorizontalAlign="Center" Width="35px" />
                                                        <ItemStyle HorizontalAlign="Center" Font-Bold="true" />
                                                        <ItemTemplate>
                                                            <%# Container.DataItemIndex + 1 %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="Historico" HeaderText="Histórico">
                                                        <ItemStyle CssClass="espacoTabelas" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Data" HeaderText="Data e Hora">
                                                        <ItemStyle CssClass="espacoTabelas" Width="100px" />
                                                    </asp:BoundField>
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
                                    <br />
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </fieldset>
                </asp:Panel>
                <div class="barraBotoes">
                    <asp:Button ID="pesquisarButton" runat="server" Text="   Pesquisar" CssClass="botaoPesquisar"
                        TabIndex="28" OnClick="pesquisarButton_Click" Visible="false" CausesValidation="false" />
                    <asp:Button ID="cancelarButton" runat="server" Text="Cancelar" CssClass="botaoCancelar"
                        TabIndex="29" OnClick="cancelarButton_Click" OnClientClick="return confirm('Confirma cancelamento? Os dados não salvos serão perdidos.');" />
                    <asp:Button ID="VoltarButton" runat="server" Text="Voltar" CssClass="botaoVoltar"
                        TabIndex="39" CausesValidation="False" Visible="false" OnClick="VoltarButton_Click" />
                    <asp:Button ID="salvarButton" runat="server" Text="Salvar" CssClass="botaoSalvar"
                        TabIndex="30" OnClick="salvarButton_Click" />
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

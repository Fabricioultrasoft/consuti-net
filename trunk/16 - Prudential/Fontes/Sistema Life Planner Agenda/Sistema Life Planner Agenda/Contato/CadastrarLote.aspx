<%@ Page Title="SISLPA" Language="C#" MasterPageFile="~/Interna.Master" AutoEventWireup="true"
    CodeBehind="CadastrarLote.aspx.cs" Inherits="Sistema_Life_Planner_Agenda.Contato.CadastrarLote" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            text-align: center;
            font-weight: bold;
        }
    </style>
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
            CADASTRO DE CONTATO EM LOTE
        </div>
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
        </table>
        <div class="conteudoTela">
            <asp:Panel ID="cadastroContatoLotePanel" runat="server">
                <fieldset>
                    <legend>Dados básicos de cadastro</legend>
                    <table id="CadastroContatoLoteTable" class="CadastroContatoLote" style="text-align: center;">
                        <tr style="font-weight: bold; background-color: #CCCCCC;">
                            <td style="width: 30px">
                                Nº
                            </td>
                            <td style="width: 300px">
                                <span class="obrigatorio">*</span>Nome Completo
                            </td>
                            <td style="width: 140px">
                                Tefone
                            </td>
                            <td style="width: 80px">
                                Sexo
                            </td>
                            <td style="width: 220px">
                                Outras Informações
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                1
                            </td>
                            <td>
                                <asp:TextBox ID="NomeTextBox1" runat="server" Width="240px" MaxLength="100" TabIndex="2"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="DDDTelefoneTextBox1" runat="server" MaxLength="2" TabIndex="3" Width="16px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="DDDTelefoneTextBox1_FilteredTextBoxExtender" runat="server"
                                    Enabled="True" TargetControlID="DDDTelefoneTextBox1" ValidChars="1234567890">
                                </cc1:FilteredTextBoxExtender>
                                <asp:TextBox ID="TelefoneTextBox1" runat="server" MaxLength="9" TabIndex="3" Width="65px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="TelefoneTextBox1_FilteredTextBoxExtender" runat="server"
                                    Enabled="True" TargetControlID="TelefoneTextBox1" ValidChars="1234567890">
                                </cc1:FilteredTextBoxExtender>
                                <asp:RegularExpressionValidator ID="DDDTelefoneTextBox1_RegularExpressionValidator"
                                    runat="server" ControlToValidate="DDDTelefoneTextBox1" Display="Dynamic" ErrorMessage="*"
                                    ToolTip="DDD Inválido" ValidationExpression="\d{2}"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="TelefoneTextBox1_RegularExpressionValidator"
                                    runat="server" ControlToValidate="TelefoneTextBox1" Display="Dynamic" ErrorMessage="*"
                                    ToolTip="Telefone Inválido" ValidationExpression="\d{8,9}"></asp:RegularExpressionValidator>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="SexoRadioButtonList1" runat="server" RepeatDirection="Horizontal"
                                    Width="70px" TabIndex="4">
                                    <asp:ListItem Selected="True">M</asp:ListItem>
                                    <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td style="width: 260px">
                                <asp:TextBox ID="OutrasInfoTextBox1" runat="server" Width="240px" TextMode="MultiLine"
                                    Rows="3" TabIndex="5"></asp:TextBox>
                            </td>
                        </tr>
                        <tr style="background-color: #EBEBEB">
                            <td class="style1">
                                2
                            </td>
                            <td>
                                <asp:TextBox ID="NomeTextBox2" runat="server" MaxLength="100" Width="240px" TabIndex="6"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="DDDTelefoneTextBox2" runat="server" MaxLength="2" TabIndex="7" Width="16px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="DDDTelefoneTextBox2_FilteredTextBoxExtender" runat="server"
                                    Enabled="True" TargetControlID="DDDTelefoneTextBox2" ValidChars="1234567890">
                                </cc1:FilteredTextBoxExtender>
                                <asp:TextBox ID="TelefoneTextBox2" runat="server" MaxLength="9" TabIndex="8" Width="65px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="TelefoneTextBox2_FilteredTextBoxExtender" runat="server"
                                    Enabled="True" TargetControlID="TelefoneTextBox2" ValidChars="1234567890">
                                </cc1:FilteredTextBoxExtender>
                                <asp:RegularExpressionValidator ID="DDDTelefoneTextBox2_RegularExpressionValidator"
                                    runat="server" ControlToValidate="DDDTelefoneTextBox2" Display="Dynamic" ErrorMessage="*"
                                    ToolTip="DDD Inválido" ValidationExpression="\d{2}"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="TelefoneTextBox2_RegularExpressionValidator"
                                    runat="server" ControlToValidate="TelefoneTextBox2" Display="Dynamic" ErrorMessage="*"
                                    ToolTip="Telefone Inválido" ValidationExpression="\d{8,9}"></asp:RegularExpressionValidator>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="SexoRadioButtonList2" runat="server" RepeatDirection="Horizontal"
                                    Width="70px" TabIndex="9">
                                    <asp:ListItem Selected="True">M</asp:ListItem>
                                    <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:TextBox ID="OutrasInfoTextBox2" runat="server" Rows="3" TextMode="MultiLine"
                                    Width="240px" TabIndex="10"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                3
                            </td>
                            <td>
                                <asp:TextBox ID="NomeTextBox3" runat="server" Width="240px" MaxLength="100" TabIndex="11"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="DDDTelefoneTextBox3" runat="server" MaxLength="2" TabIndex="12" Width="16px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="DDDTelefoneTextBox3_FilteredTextBoxExtender" runat="server"
                                    Enabled="True" TargetControlID="DDDTelefoneTextBox3" ValidChars="1234567890">
                                </cc1:FilteredTextBoxExtender>
                                <asp:TextBox ID="TelefoneTextBox3" runat="server" MaxLength="9" TabIndex="13" Width="65px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="TelefoneTextBox3_FilteredTextBoxExtender" runat="server"
                                    Enabled="True" TargetControlID="TelefoneTextBox3" ValidChars="1234567890">
                                </cc1:FilteredTextBoxExtender>
                                <asp:RegularExpressionValidator ID="DDDTelefoneTextBox3_RegularExpressionValidator"
                                    runat="server" ControlToValidate="DDDTelefoneTextBox3" Display="Dynamic" ErrorMessage="*"
                                    ToolTip="DDD Inválido" ValidationExpression="\d{2}"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="TelefoneTextBox3_RegularExpressionValidator"
                                    runat="server" ControlToValidate="TelefoneTextBox3" Display="Dynamic" ErrorMessage="*"
                                    ToolTip="Telefone Inválido" ValidationExpression="\d{8,9}"></asp:RegularExpressionValidator>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="SexoRadioButtonList3" runat="server" RepeatDirection="Horizontal"
                                    Width="70px" TabIndex="14">
                                    <asp:ListItem Selected="True">M</asp:ListItem>
                                    <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td style="width: 260px">
                                <asp:TextBox ID="OutrasInfoTextBox3" runat="server" Width="240px" TextMode="MultiLine"
                                    Rows="3" TabIndex="15"></asp:TextBox>
                            </td>
                        </tr>
                        <tr style="background-color: #EBEBEB">
                            <td class="style1">
                                4
                            </td>
                            <td>
                                <asp:TextBox ID="NomeTextBox4" runat="server" MaxLength="100" Width="240px" TabIndex="16"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="DDDTelefoneTextBox4" runat="server" MaxLength="2" TabIndex="17" Width="16px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="DDDTelefoneTextBox4_FilteredTextBoxExtender" runat="server"
                                    Enabled="True" TargetControlID="DDDTelefoneTextBox4" ValidChars="1234567890">
                                </cc1:FilteredTextBoxExtender>
                                <asp:TextBox ID="TelefoneTextBox4" runat="server" MaxLength="9" TabIndex="18" Width="65px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="TelefoneTextBox4_FilteredTextBoxExtender" runat="server"
                                    Enabled="True" TargetControlID="TelefoneTextBox4" ValidChars="1234567890">
                                </cc1:FilteredTextBoxExtender>
                                <asp:RegularExpressionValidator ID="DDDTelefoneTextBox4_RegularExpressionValidator"
                                    runat="server" ControlToValidate="DDDTelefoneTextBox4" Display="Dynamic" ErrorMessage="*"
                                    ToolTip="DDD Inválido" ValidationExpression="\d{2}"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="TelefoneTextBox4_RegularExpressionValidator"
                                    runat="server" ControlToValidate="TelefoneTextBox4" Display="Dynamic" ErrorMessage="*"
                                    ToolTip="Telefone Inválido" ValidationExpression="\d{8,9}"></asp:RegularExpressionValidator>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="SexoRadioButtonList4" runat="server" RepeatDirection="Horizontal"
                                    Width="70px" TabIndex="19">
                                    <asp:ListItem Selected="True">M</asp:ListItem>
                                    <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:TextBox ID="OutrasInfoTextBox4" runat="server" Rows="3" TextMode="MultiLine" TabIndex="20"
                                    Width="240px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                5
                            </td>
                            <td>
                                <asp:TextBox ID="NomeTextBox5" runat="server" Width="240px" MaxLength="100" TabIndex="21"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="DDDTelefoneTextBox5" runat="server" MaxLength="2" TabIndex="22" Width="16px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="DDDTelefoneTextBox5_FilteredTextBoxExtender" runat="server"
                                    Enabled="True" TargetControlID="DDDTelefoneTextBox5" ValidChars="1234567890">
                                </cc1:FilteredTextBoxExtender>
                                <asp:TextBox ID="TelefoneTextBox5" runat="server" MaxLength="9" TabIndex="23" Width="65px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="TelefoneTextBox5_FilteredTextBoxExtender" runat="server"
                                    Enabled="True" TargetControlID="TelefoneTextBox5" ValidChars="1234567890">
                                </cc1:FilteredTextBoxExtender>
                                <asp:RegularExpressionValidator ID="DDDTelefoneTextBox5_RegularExpressionValidator"
                                    runat="server" ControlToValidate="DDDTelefoneTextBox5" Display="Dynamic" ErrorMessage="*"
                                    ToolTip="DDD Inválido" ValidationExpression="\d{2}"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="TelefoneTextBox5_RegularExpressionValidator"
                                    runat="server" ControlToValidate="TelefoneTextBox5" Display="Dynamic" ErrorMessage="*"
                                    ToolTip="Telefone Inválido" ValidationExpression="\d{8,9}"></asp:RegularExpressionValidator>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="SexoRadioButtonList5" runat="server" RepeatDirection="Horizontal"
                                    Width="70px" TabIndex="24" >
                                    <asp:ListItem Selected="True">M</asp:ListItem>
                                    <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td style="width: 260px">
                                <asp:TextBox ID="OutrasInfoTextBox5" runat="server" Width="240px" TextMode="MultiLine"
                                    Rows="3" TabIndex="25"></asp:TextBox>
                            </td>
                        </tr>
                        <tr style="background-color: #EBEBEB">
                            <td class="style1">
                                6
                            </td>
                            <td>
                                <asp:TextBox ID="NomeTextBox6" runat="server" MaxLength="100" Width="240px" 
                                    TabIndex="26"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="DDDTelefoneTextBox6" runat="server" MaxLength="2" TabIndex="27" Width="16px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="DDDTelefoneTextBox6_FilteredTextBoxExtender" runat="server"
                                    Enabled="True" TargetControlID="DDDTelefoneTextBox6" ValidChars="1234567890">
                                </cc1:FilteredTextBoxExtender>
                                <asp:TextBox ID="TelefoneTextBox6" runat="server" MaxLength="9" TabIndex="28" Width="65px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="TelefoneTextBox6_FilteredTextBoxExtender" runat="server"
                                    Enabled="True" TargetControlID="TelefoneTextBox6" ValidChars="1234567890">
                                </cc1:FilteredTextBoxExtender>
                                <asp:RegularExpressionValidator ID="DDDTelefoneTextBox6_RegularExpressionValidator"
                                    runat="server" ControlToValidate="DDDTelefoneTextBox6" Display="Dynamic" ErrorMessage="*"
                                    ToolTip="DDD Inválido" ValidationExpression="\d{2}"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="TelefoneTextBox6_RegularExpressionValidator"
                                    runat="server" ControlToValidate="TelefoneTextBox6" Display="Dynamic" ErrorMessage="*"
                                    ToolTip="Telefone Inválido" ValidationExpression="\d{8,9}"></asp:RegularExpressionValidator>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="SexoRadioButtonList6" runat="server" RepeatDirection="Horizontal"
                                    Width="70px" TabIndex="29">
                                    <asp:ListItem Selected="True">M</asp:ListItem>
                                    <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:TextBox ID="OutrasInfoTextBox6" runat="server" Rows="3" TextMode="MultiLine"
                                    Width="240px" TabIndex="30"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                7
                            </td>
                            <td>
                                <asp:TextBox ID="NomeTextBox7" runat="server" Width="240px" MaxLength="100" 
                                    TabIndex="31"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="DDDTelefoneTextBox7" runat="server" MaxLength="2" TabIndex="32" Width="16px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="DDDTelefoneTextBox7_FilteredTextBoxExtender" runat="server"
                                    Enabled="True" TargetControlID="DDDTelefoneTextBox7" ValidChars="1234567890">
                                </cc1:FilteredTextBoxExtender>
                                <asp:TextBox ID="TelefoneTextBox7" runat="server" MaxLength="9" TabIndex="33" Width="65px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="TelefoneTextBox7_FilteredTextBoxExtender" runat="server"
                                    Enabled="True" TargetControlID="TelefoneTextBox7" ValidChars="1234567890">
                                </cc1:FilteredTextBoxExtender>
                                <asp:RegularExpressionValidator ID="DDDTelefoneTextBox7_RegularExpressionValidator"
                                    runat="server" ControlToValidate="DDDTelefoneTextBox7" Display="Dynamic" ErrorMessage="*"
                                    ToolTip="DDD Inválido" ValidationExpression="\d{2}"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="TelefoneTextBox7_RegularExpressionValidator"
                                    runat="server" ControlToValidate="TelefoneTextBox7" Display="Dynamic" ErrorMessage="*"
                                    ToolTip="Telefone Inválido" ValidationExpression="\d{8,9}"></asp:RegularExpressionValidator>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="SexoRadioButtonList7" runat="server" RepeatDirection="Horizontal"
                                    Width="70px" TabIndex="34">
                                    <asp:ListItem Selected="True">M</asp:ListItem>
                                    <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td style="width: 260px">
                                <asp:TextBox ID="OutrasInfoTextBox7" runat="server" Width="240px" TextMode="MultiLine"
                                    Rows="3" TabIndex="35"></asp:TextBox>
                            </td>
                        </tr>
                        <tr style="background-color: #EBEBEB">
                            <td class="style1">
                                8
                            </td>
                            <td>
                                <asp:TextBox ID="NomeTextBox8" runat="server" MaxLength="100" Width="240px" 
                                    TabIndex="36"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="DDDTelefoneTextBox8" runat="server" MaxLength="2" TabIndex="37" Width="16px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="DDDTelefoneTextBox8_FilteredTextBoxExtender" runat="server"
                                    Enabled="True" TargetControlID="DDDTelefoneTextBox8" ValidChars="1234567890">
                                </cc1:FilteredTextBoxExtender>
                                <asp:TextBox ID="TelefoneTextBox8" runat="server" MaxLength="9" TabIndex="38" Width="65px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="TelefoneTextBox8_FilteredTextBoxExtender" runat="server"
                                    Enabled="True" TargetControlID="TelefoneTextBox8" ValidChars="1234567890">
                                </cc1:FilteredTextBoxExtender>
                                <asp:RegularExpressionValidator ID="DDDTelefoneTextBox8_RegularExpressionValidator"
                                    runat="server" ControlToValidate="DDDTelefoneTextBox8" Display="Dynamic" ErrorMessage="*"
                                    ToolTip="DDD Inválido" ValidationExpression="\d{2}"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="TelefoneTextBox8_RegularExpressionValidator"
                                    runat="server" ControlToValidate="TelefoneTextBox8" Display="Dynamic" ErrorMessage="*"
                                    ToolTip="Telefone Inválido" ValidationExpression="\d{8,9}"></asp:RegularExpressionValidator>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="SexoRadioButtonList8" runat="server" RepeatDirection="Horizontal"
                                    Width="70px" TabIndex="39">
                                    <asp:ListItem Selected="True">M</asp:ListItem>
                                    <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:TextBox ID="OutrasInfoTextBox8" runat="server" Rows="3" TextMode="MultiLine"
                                    Width="240px" TabIndex="40"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                9
                            </td>
                            <td>
                                <asp:TextBox ID="NomeTextBox9" runat="server" Width="240px" MaxLength="100" 
                                    TabIndex="41"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="DDDTelefoneTextBox9" runat="server" MaxLength="2" TabIndex="42" Width="16px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="DDDTelefoneTextBox9_FilteredTextBoxExtender" runat="server"
                                    Enabled="True" TargetControlID="DDDTelefoneTextBox9" ValidChars="1234567890">
                                </cc1:FilteredTextBoxExtender>
                                <asp:TextBox ID="TelefoneTextBox9" runat="server" MaxLength="9" TabIndex="43" Width="65px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="TelefoneTextBox9_FilteredTextBoxExtender" runat="server"
                                    Enabled="True" TargetControlID="TelefoneTextBox9" ValidChars="1234567890">
                                </cc1:FilteredTextBoxExtender>
                                <asp:RegularExpressionValidator ID="DDDTelefoneTextBox9_RegularExpressionValidator"
                                    runat="server" ControlToValidate="DDDTelefoneTextBox9" Display="Dynamic" ErrorMessage="*"
                                    ToolTip="DDD Inválido" ValidationExpression="\d{2}"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="TelefoneTextBox9_RegularExpressionValidator"
                                    runat="server" ControlToValidate="TelefoneTextBox9" Display="Dynamic" ErrorMessage="*"
                                    ToolTip="Telefone Inválido" ValidationExpression="\d{8,9}"></asp:RegularExpressionValidator>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="SexoRadioButtonList9" runat="server" RepeatDirection="Horizontal"
                                    Width="70px" TabIndex="44">
                                    <asp:ListItem Selected="True">M</asp:ListItem>
                                    <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td style="width: 260px">
                                <asp:TextBox ID="OutrasInfoTextBox9" runat="server" Width="240px" TextMode="MultiLine"
                                    Rows="3" TabIndex="45"></asp:TextBox>
                            </td>
                        </tr>
                        <tr style="background-color: #EBEBEB">
                            <td class="style1">
                                10
                            </td>
                            <td>
                                <asp:TextBox ID="NomeTextBox10" runat="server" MaxLength="100" Width="240px" 
                                    TabIndex="46"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="DDDTelefoneTextBox10" runat="server" MaxLength="2" TabIndex="47"
                                    Width="16px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="DDDTelefoneTextBox10_FilteredTextBoxExtender" runat="server"
                                    Enabled="True" TargetControlID="DDDTelefoneTextBox10" ValidChars="1234567890">
                                </cc1:FilteredTextBoxExtender>
                                <asp:TextBox ID="TelefoneTextBox10" runat="server" MaxLength="9" TabIndex="48" Width="65px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="TelefoneTextBox10_FilteredTextBoxExtender" runat="server"
                                    Enabled="True" TargetControlID="TelefoneTextBox10" ValidChars="1234567890">
                                </cc1:FilteredTextBoxExtender>
                                <asp:RegularExpressionValidator ID="DDDTelefoneTextBox10_RegularExpressionValidator"
                                    runat="server" ControlToValidate="DDDTelefoneTextBox10" Display="Dynamic" ErrorMessage="*"
                                    ToolTip="DDD Inválido" ValidationExpression="\d{2}"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="TelefoneTextBox10_RegularExpressionValidator"
                                    runat="server" ControlToValidate="TelefoneTextBox10" Display="Dynamic" ErrorMessage="*"
                                    ToolTip="Telefone Inválido" ValidationExpression="\d{8,9}"></asp:RegularExpressionValidator>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="SexoRadioButtonList10" runat="server" RepeatDirection="Horizontal"
                                    Width="70px" TabIndex="49">
                                    <asp:ListItem Selected="True">M</asp:ListItem>
                                    <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:TextBox ID="OutrasInfoTextBox10" runat="server" Rows="3" TextMode="MultiLine"
                                    Width="240px" TabIndex="50"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <div class="barraBotoes">
                    <asp:Button ID="cancelarButton" runat="server" Text="Cancelar" CssClass="botaoCancelar"
                        TabIndex="139" OnClick="cancelarButton_Click" OnClientClick="return confirm('Confirma cancelamento? Os dados não salvos serão perdidos.');" />
                    <asp:Button ID="salvarButton" runat="server" Text="Salvar" CssClass="botaoSalvar"
                        TabIndex="140" OnClick="salvarButton_Click" />
                </div>
            </asp:Panel>
            <br />
        </div>
    </div>
</asp:Content>

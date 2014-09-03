<%@ Page Title="" Language="C#" MasterPageFile="~/Interna.Master" AutoEventWireup="true"
    CodeBehind="CadastrarLote.aspx.cs" Inherits="Sistema_Life_Planner_Agenda.Contato.CadastrarLote" %>

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
        <div style="width: 90%; margin: 10px 0 10px 30px">
            <span class="obrigatorio">*</span>Recomendante:
            <asp:DropDownList ID="RecomendanteDropDownList" runat="server" Width="400px" TabIndex="0">
            </asp:DropDownList>
        </div>
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
                                <span class="obrigatorio">*</span>Nome
                            </td>
                            <td style="width: 120px">
                                Tefone
                            </td>
                            <td style="width: 100px">
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
                                <asp:TextBox ID="NomeTextBox1" runat="server" Width="240px" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TelefoneTextBox1" runat="server" Width="100px" MaxLength="20"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="SexoRadioButtonList1" runat="server" 
                                    RepeatDirection="Horizontal" Width="80px">
                                <asp:ListItem>M</asp:ListItem>
                                <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td style="width: 260px">
                                <asp:TextBox ID="OutrasInfoTextBox1" runat="server" Width="240px" TextMode="MultiLine" 
                                    Rows="3"></asp:TextBox>
                            </td>
                        </tr>                        
                        <tr style="background-color: #EBEBEB">
                            <td class="style1" >
                                2
                            </td>
                            <td>
                                <asp:TextBox ID="NomeTextBox2" runat="server" MaxLength="100" Width="240px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TelefoneTextBox2" runat="server" MaxLength="20" Width="100px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="SexoRadioButtonList2" runat="server" 
                                    RepeatDirection="Horizontal" Width="80px">
                                    <asp:ListItem>M</asp:ListItem>
                                    <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:TextBox ID="OutrasInfoTextBox2" runat="server" Rows="3" TextMode="MultiLine" 
                                    Width="240px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                3
                            </td>
                            <td>
                                <asp:TextBox ID="NomeTextBox3" runat="server" Width="240px" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TelefoneTextBox3" runat="server" Width="100px" MaxLength="20"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="SexoRadioButtonList3" runat="server" 
                                    RepeatDirection="Horizontal" Width="80px">
                                <asp:ListItem>M</asp:ListItem>
                                <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td style="width: 260px">
                                <asp:TextBox ID="OutrasInfoTextBox3" runat="server" Width="240px" TextMode="MultiLine" 
                                    Rows="3"></asp:TextBox>
                            </td>
                        </tr>                        
                        <tr style="background-color: #EBEBEB">
                            <td class="style1" >
                                4
                            </td>
                            <td>
                                <asp:TextBox ID="NomeTextBox4" runat="server" MaxLength="100" Width="240px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TelefoneTextBox4" runat="server" MaxLength="20" Width="100px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="SexoRadioButtonList4" runat="server" 
                                    RepeatDirection="Horizontal" Width="80px">
                                    <asp:ListItem>M</asp:ListItem>
                                    <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:TextBox ID="OutrasInfoTextBox4" runat="server" Rows="3" TextMode="MultiLine" 
                                    Width="240px"></asp:TextBox>
                            </td>
                        </tr><tr>
                            <td class="style1">
                                5
                            </td>
                            <td>
                                <asp:TextBox ID="NomeTextBox5" runat="server" Width="240px" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TelefoneTextBox5" runat="server" Width="100px" MaxLength="20"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="SexoRadioButtonList5" runat="server" 
                                    RepeatDirection="Horizontal" Width="80px">
                                <asp:ListItem>M</asp:ListItem>
                                <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td style="width: 260px">
                                <asp:TextBox ID="OutrasInfoTextBox5" runat="server" Width="240px" TextMode="MultiLine" 
                                    Rows="3"></asp:TextBox>
                            </td>
                        </tr>                        
                        <tr style="background-color: #EBEBEB">
                            <td class="style1" >
                                6
                            </td>
                            <td>
                                <asp:TextBox ID="NomeTextBox6" runat="server" MaxLength="100" Width="240px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TelefoneTextBox6" runat="server" MaxLength="20" Width="100px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="SexoRadioButtonList6" runat="server" 
                                    RepeatDirection="Horizontal" Width="80px">
                                    <asp:ListItem>M</asp:ListItem>
                                    <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:TextBox ID="OutrasInfoTextBox6" runat="server" Rows="3" TextMode="MultiLine" 
                                    Width="240px"></asp:TextBox>
                            </td>
                        </tr><tr>
                            <td class="style1">
                                7
                            </td>
                            <td>
                                <asp:TextBox ID="NomeTextBox7" runat="server" Width="240px" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TelefoneTextBox7" runat="server" Width="100px" MaxLength="20"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="SexoRadioButtonList7" runat="server" 
                                    RepeatDirection="Horizontal" Width="80px">
                                <asp:ListItem>M</asp:ListItem>
                                <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td style="width: 260px">
                                <asp:TextBox ID="OutrasInfoTextBox7" runat="server" Width="240px" TextMode="MultiLine" 
                                    Rows="3"></asp:TextBox>
                            </td>
                        </tr>                        
                        <tr style="background-color: #EBEBEB">
                            <td class="style1" >
                                8
                            </td>
                            <td>
                                <asp:TextBox ID="NomeTextBox8" runat="server" MaxLength="100" Width="240px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TelefoneTextBox8" runat="server" MaxLength="20" Width="100px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="SexoRadioButtonList8" runat="server" 
                                    RepeatDirection="Horizontal" Width="80px">
                                    <asp:ListItem>M</asp:ListItem>
                                    <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:TextBox ID="OutrasInfoTextBox8" runat="server" Rows="3" TextMode="MultiLine" 
                                    Width="240px"></asp:TextBox>
                            </td>
                        </tr><tr>
                            <td class="style1">
                                9
                            </td>
                            <td>
                                <asp:TextBox ID="NomeTextBox9" runat="server" Width="240px" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TelefoneTextBox9" runat="server" Width="100px" MaxLength="20"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="SexoRadioButtonList9" runat="server" 
                                    RepeatDirection="Horizontal" Width="80px">
                                <asp:ListItem>M</asp:ListItem>
                                <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td style="width: 260px">
                                <asp:TextBox ID="OutrasInfoTextBox9" runat="server" Width="240px" TextMode="MultiLine" 
                                    Rows="3"></asp:TextBox>
                            </td>
                        </tr>                        
                        <tr style="background-color: #EBEBEB">
                            <td class="style1" >
                                10
                            </td>
                            <td>
                                <asp:TextBox ID="NomeTextBox10" runat="server" MaxLength="100" Width="240px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TelefoneTextBox10" runat="server" MaxLength="20" Width="100px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="SexoRadioButtonList10" runat="server" 
                                    RepeatDirection="Horizontal" Width="80px">
                                    <asp:ListItem>M</asp:ListItem>
                                    <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:TextBox ID="OutrasInfoTextBox10" runat="server" Rows="3" TextMode="MultiLine" 
                                    Width="240px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </fieldset> 
                <div class="barraBotoes">
                    <asp:Button ID="cancelarButton" runat="server" Text="Cancelar" 
                        CssClass="botaoCancelar" TabIndex="39" onclick="cancelarButton_Click" OnClientClick="return confirm('Confirma cancelamento? Os dados não salvos serão perdidos.');" />
                    <asp:Button ID="salvarButton" runat="server" Text="Salvar" CssClass="botaoSalvar" 
                        TabIndex="40" onclick="salvarButton_Click" />
                </div>               
            </asp:Panel>
            <br />
        </div>
    </div>
</asp:Content>

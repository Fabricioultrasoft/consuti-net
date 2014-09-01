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
            <asp:DropDownList ID="RecomendanteDropDownList" runat="server" Width="400px">
            </asp:DropDownList>
        </div>
        <div class="conteudoTela">
            <asp:Panel ID="cadastroUsuarioPanel" runat="server">
                <fieldset>
                    <legend>Dados de Acesso</legend>
                    <table id="CadastroContatoLoteTable" class="CadastroContatoLote" style="text-align: center;">
                        <tr style="font-weight: bold; background-color: #CCCCCC;">
                            <td style="width: 30px">
                                <span class="obrigatorio">*</span>Nº
                            </td>
                            <td style="width: 300px">
                                Nome
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
                                <asp:TextBox ID="TextBox4" runat="server" Width="240px" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox5" runat="server" Width="100px" MaxLength="20"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RadioButtonList2" runat="server" 
                                    RepeatDirection="Horizontal" Width="80px">
                                <asp:ListItem>M</asp:ListItem>
                                <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td style="width: 260px">
                                <asp:TextBox ID="TextBox6" runat="server" Width="240px" TextMode="MultiLine" 
                                    Rows="3"></asp:TextBox>
                            </td>
                        </tr>                        
                        <tr style="background-color: #EBEBEB">
                            <td class="style1" >
                                2
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" MaxLength="100" Width="240px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox2" runat="server" MaxLength="20" Width="100px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                                    RepeatDirection="Horizontal" Width="80px">
                                    <asp:ListItem>M</asp:ListItem>
                                    <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox3" runat="server" Rows="3" TextMode="MultiLine" 
                                    Width="240px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                3
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox7" runat="server" Width="240px" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox8" runat="server" Width="100px" MaxLength="20"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RadioButtonList3" runat="server" 
                                    RepeatDirection="Horizontal" Width="80px">
                                <asp:ListItem>M</asp:ListItem>
                                <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td style="width: 260px">
                                <asp:TextBox ID="TextBox9" runat="server" Width="240px" TextMode="MultiLine" 
                                    Rows="3"></asp:TextBox>
                            </td>
                        </tr>                        
                        <tr style="background-color: #EBEBEB">
                            <td class="style1" >
                                4
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox10" runat="server" MaxLength="100" Width="240px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox11" runat="server" MaxLength="20" Width="100px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RadioButtonList4" runat="server" 
                                    RepeatDirection="Horizontal" Width="80px">
                                    <asp:ListItem>M</asp:ListItem>
                                    <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox12" runat="server" Rows="3" TextMode="MultiLine" 
                                    Width="240px"></asp:TextBox>
                            </td>
                        </tr><tr>
                            <td class="style1">
                                5
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox13" runat="server" Width="240px" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox14" runat="server" Width="100px" MaxLength="20"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RadioButtonList5" runat="server" 
                                    RepeatDirection="Horizontal" Width="80px">
                                <asp:ListItem>M</asp:ListItem>
                                <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td style="width: 260px">
                                <asp:TextBox ID="TextBox15" runat="server" Width="240px" TextMode="MultiLine" 
                                    Rows="3"></asp:TextBox>
                            </td>
                        </tr>                        
                        <tr style="background-color: #EBEBEB">
                            <td class="style1" >
                                6
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox16" runat="server" MaxLength="100" Width="240px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox17" runat="server" MaxLength="20" Width="100px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RadioButtonList6" runat="server" 
                                    RepeatDirection="Horizontal" Width="80px">
                                    <asp:ListItem>M</asp:ListItem>
                                    <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox18" runat="server" Rows="3" TextMode="MultiLine" 
                                    Width="240px"></asp:TextBox>
                            </td>
                        </tr><tr>
                            <td class="style1">
                                7
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox19" runat="server" Width="240px" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox20" runat="server" Width="100px" MaxLength="20"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RadioButtonList7" runat="server" 
                                    RepeatDirection="Horizontal" Width="80px">
                                <asp:ListItem>M</asp:ListItem>
                                <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td style="width: 260px">
                                <asp:TextBox ID="TextBox21" runat="server" Width="240px" TextMode="MultiLine" 
                                    Rows="3"></asp:TextBox>
                            </td>
                        </tr>                        
                        <tr style="background-color: #EBEBEB">
                            <td class="style1" >
                                8
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox22" runat="server" MaxLength="100" Width="240px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox23" runat="server" MaxLength="20" Width="100px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RadioButtonList8" runat="server" 
                                    RepeatDirection="Horizontal" Width="80px">
                                    <asp:ListItem>M</asp:ListItem>
                                    <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox24" runat="server" Rows="3" TextMode="MultiLine" 
                                    Width="240px"></asp:TextBox>
                            </td>
                        </tr><tr>
                            <td class="style1">
                                9
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox25" runat="server" Width="240px" MaxLength="100"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox26" runat="server" Width="100px" MaxLength="20"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RadioButtonList9" runat="server" 
                                    RepeatDirection="Horizontal" Width="80px">
                                <asp:ListItem>M</asp:ListItem>
                                <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td style="width: 260px">
                                <asp:TextBox ID="TextBox27" runat="server" Width="240px" TextMode="MultiLine" 
                                    Rows="3"></asp:TextBox>
                            </td>
                        </tr>                        
                        <tr style="background-color: #EBEBEB">
                            <td class="style1" >
                                10
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox28" runat="server" MaxLength="100" Width="240px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox29" runat="server" MaxLength="20" Width="100px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RadioButtonList10" runat="server" 
                                    RepeatDirection="Horizontal" Width="80px">
                                    <asp:ListItem>M</asp:ListItem>
                                    <asp:ListItem>F</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox30" runat="server" Rows="3" TextMode="MultiLine" 
                                    Width="240px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </fieldset>                
            </asp:Panel>
            <br />
        </div>
    </div>
</asp:Content>

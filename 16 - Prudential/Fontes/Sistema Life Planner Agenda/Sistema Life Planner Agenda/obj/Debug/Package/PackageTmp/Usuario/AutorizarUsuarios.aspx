<%@ Page Title="" Language="C#" MasterPageFile="~/Interna.Master" AutoEventWireup="true"
    CodeBehind="AutorizarUsuarios.aspx.cs" Inherits="Sistema_Life_Planner_Agenda.Usuario.AutorizarUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
    <li><a href="..\Default.aspx">Home</a></li>
    <li><a href="..\Contato\PesquisarContato.aspx">Contatos</a></li>
    <li><a href="..\Agenda\PesquisarAgenda.aspx">Agenda do LP</a></li>
    <li><a href="..\SITPLAN\PesquisarSITPLAN.aspx">SIT PLAN</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="tituloTela">
            ADMINISTRAÇÃO DE E-MAILS AUTORIZADOS
        </div>
        <div class="conteudoTela">
            <asp:Panel ID="adminEmailsUsuarioPanel" runat="server">
                <fieldset>
                    <legend>Manter Usuários Autorizados</legend>
                    <br />
                    <div style="text-align: center;">
                        <span class="obrigatorio">*</span>E-mail:
                        <asp:TextBox ID="emailTextBox" runat="server" MaxLength="100" TabIndex="1" Width="300px"></asp:TextBox>
                        &nbsp;<asp:CheckBox ID="AdminCheckBox" runat="server" Text="Admin?"  TabIndex="2"/>
                        &nbsp;
                        <asp:Button ID="IncluirButton" runat="server" Text="OK" CssClass="botaoNovo" TabIndex="3"
                            OnClick="IncluirButton_Click" />
                    </div>
                    <br />
                </fieldset>
                <fieldset>
                    <legend>Lista de E-maisl Autorizados no Sistema</legend>
                    <asp:GridView ID="UsuariosAutorizadosGridView" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"
                        Width="100%" EmptyDataText="Nenhum compromisso para os próximos 7 dias...">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView>
                    <br />

                </fieldset>
            </asp:Panel>
            <br />
        </div>
    </div>
</asp:Content>

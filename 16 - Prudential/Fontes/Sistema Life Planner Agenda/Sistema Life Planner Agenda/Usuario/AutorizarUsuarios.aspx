<%@ Page Title="SISLPA" Language="C#" MasterPageFile="~/Interna.Master"
    CodeBehind="AutorizarUsuarios.aspx.cs" Inherits="Sistema_Life_Planner_Agenda.Usuario.AutorizarUsuarios" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="emailTextBox"
                            Display="Dynamic" ErrorMessage="*" ToolTip="Campo Obrigatório!"></asp:RequiredFieldValidator>
                        &nbsp;<asp:RegularExpressionValidator ID="EmailTextBoxRegularExpressionValidator"
                            runat="server" Display="Dynamic" ErrorMessage="*" ToolTip="Email Inválido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ControlToValidate="emailTextBox"></asp:RegularExpressionValidator>
                        &nbsp;
                        <asp:CheckBox ID="AdminCheckBox" runat="server" Text="Admin?" TabIndex="2" />
                        &nbsp;
                        <asp:Button ID="IncluirButton" runat="server" Text="OK" CssClass="botaoNovo" TabIndex="3"
                            CausesValidation="true" OnClick="IncluirButton_Click" />
                    </div>
                    <br />
                </fieldset>
                <fieldset>
                    <legend>Lista de E-maisl Autorizados no Sistema</legend>
                    <asp:GridView ID="UsuariosAutorizadosGridView" runat="server" CellPadding="4" ForeColor="#333333"
                        GridLines="None" Width="100%" AutoGenerateColumns="False" EnableModelValidation="True"
                        OnRowCommand="UsuariosAutorizadosGridView_Click" EmptyDataText="Não Existem usuários autorizados no momento."
                        AllowPaging="True" AllowSorting="True" PageSize="10" BorderColor="#003366" BorderStyle="Solid"
                        BorderWidth="1px" CellSpacing="2" OnPageIndexChanging="UsuariosAutorizadosGridView_PageIndexChanging"
                        OnSorting="UsuariosAutorizadosGridView_Sorting" RowStyle-Height="40px">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:TemplateField HeaderText="#" >
                                <HeaderStyle HorizontalAlign="Center" Width="35px" />
                                <ItemStyle HorizontalAlign="Center" Font-Bold="true" />
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Email" HeaderText="E-mail autorizado" SortExpression="Email">
                                <ItemStyle CssClass="espacoTabelas" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Administrador?" DataField="Admin" SortExpression="Admin">
                                <ItemStyle HorizontalAlign="Center" Width="120px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Alterar">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgBtnAlterar" runat="server" CausesValidation="False" CommandArgument='<%# Bind("email") %>'
                                        CommandName="Alterar" ImageUrl="~/Estilos/Imgs/edit.png"></asp:ImageButton>
                                </ItemTemplate>
                                <ItemStyle Width="50px" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Excluir">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgBtnExcluir" runat="server" CausesValidation="False" CommandArgument='<%# Bind("email") %>'
                                        CommandName="Excluir" ImageUrl="~/Estilos/Imgs/no.png"></asp:ImageButton>
                                    <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender" runat="server" TargetControlID="imgBtnExcluir"
                                        ConfirmText="Confirma a exclusão do e-mail?">
                                    </cc1:ConfirmButtonExtender>
                                </ItemTemplate>
                                <ItemStyle Width="50px" HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Height="30px" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <PagerSettings Position="Bottom" Mode="Numeric" />
                    </asp:GridView>
                </fieldset>
            </asp:Panel>
            <br />
        </div>
    </div>
</asp:Content>

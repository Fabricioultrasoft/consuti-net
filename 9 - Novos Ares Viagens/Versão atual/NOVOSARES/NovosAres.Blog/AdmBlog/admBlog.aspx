<%@ Page Title=".: Cadastro de Post :." Language="C#" MasterPageFile="~/AdmBlog/MasterAdmBlog.Master" AutoEventWireup="true"
    CodeBehind="admBlog.aspx.cs" Inherits="NovosAres.Blog.AdmBlog.admBlog" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register assembly="CKEditor.NET" namespace="CKEditor.NET" tagprefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="Stylesheet" href="EstiloAdmBlog.css" type="text/css" />    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="formCadastroPost">
        <div class="tituloForm">
            Preencha os campos abaixo para cadastrar um novo post no Blog.<br />
            <br />
        </div>
        <div>
            <div style="float: left; width: 50%">
                <strong>Categoria:
                <asp:RequiredFieldValidator ID="rfvCategoria" runat="server" 
                    ControlToValidate="ddlCategorias" Display="None" 
                    ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="rfvCategoria_ValidatorCalloutExtender" 
                    runat="server" Enabled="True" TargetControlID="rfvCategoria">
                </cc1:ValidatorCalloutExtender>
                <br />
                    <asp:DropDownList ID="ddlCategorias" runat="server" CssClass="estiloTxb">
                    </asp:DropDownList>
                </strong>
            </div>
            <div>
                <div style="float: right; width: 29%">
                    <strong>Data do Post:</strong>
                    <br />
                    <asp:Label ID="lblData" runat="server" Text="Label"></asp:Label></div>
                <br />
                <br />
                <strong>
                    <br />
                    Local: 
                <asp:RequiredFieldValidator ID="rfvLocal" runat="server" 
                    ControlToValidate="TxbLocal" Display="None" 
                    ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="rfvLocal_ValidatorCalloutExtender" 
                    runat="server" Enabled="True" TargetControlID="rfvLocal">
                </cc1:ValidatorCalloutExtender>
                </strong>
                <br />
                <asp:TextBox ID="TxbLocal" runat="server" CssClass="estiloTxb" MaxLength="20"></asp:TextBox>
                <br />
                <br />
                <strong>Título do Post:
                <asp:RequiredFieldValidator ID="rfvTitulo" runat="server" 
                    ControlToValidate="txbTitulo" Display="None" 
                    ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="rfvTitulo_ValidatorCalloutExtender" 
                    runat="server" Enabled="True" TargetControlID="rfvTitulo">
                </cc1:ValidatorCalloutExtender>
                </strong><br />
                <asp:TextBox ID="txbTitulo" runat="server" CssClass="estiloTxb" MaxLength="50"></asp:TextBox>
                <br />
                <br />
                <strong>Texto Post:</strong>
                &nbsp;<strong><asp:RequiredFieldValidator ID="rfvTexto" runat="server" 
                    ControlToValidate="fckEditor" Display="None" 
                    ErrorMessage="Texto para Post Obrigatório!"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="rfvTexto_ValidatorCalloutExtender" 
                    runat="server" Enabled="True" TargetControlID="rfvTexto">
                </cc1:ValidatorCalloutExtender>
                </strong>
                <CKEditor:CKEditorControl ID="fckEditor" runat="server" Width="617px"></CKEditor:CKEditorControl>
                <br /><div id="btns">
                    <asp:Button ID="BtnSalvar" runat="server" Text="Salvar Post" 
                        onclick="BtnSalvar_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnLimparTudo" runat="server" Text="Limpar Tudo" 
                        onclick="btnLimparTudo_Click" CausesValidation="False" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

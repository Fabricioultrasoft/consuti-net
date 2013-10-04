<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="leptonbrasil.Noticias.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="Stylesheet" href="../Estilos/Noticias.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>

    <asp:Repeater ID="rptrPosts" runat="server" >
        <ItemTemplate>
            <div id="tituloPost">
                <br />
                <div id="textoTitulo">
                    
                    <asp:LinkButton ID="lblTextoTitulo" runat="server" Font-Underline="False" ForeColor="#1E6F99"><%# Eval("titulo") %></asp:LinkButton>
                    &nbsp;&nbsp;
                </div>
                <div id="localPost">
                    &nbsp;&nbsp;
                    <asp:Label ID="lblData" runat="server" Text='<%# Eval("data") %>'></asp:Label><br />
                    &nbsp;&nbsp;
                    <asp:Label ID="lblLocal" runat="server" Text='<%# Eval("autor") %>'></asp:Label>
                </div>
            </div>
            <br />
            <br />
            <div id="textoPost">
                <br />
                <%# Eval("texto") %>
            </div>
            <br />
            <hr style="color: #1E6F99; width: 90%;" />
        </ItemTemplate>
    </asp:Repeater>

        <div id="titulo">
        </div>
        <div id="data">
        </div>
        <div id="mensagem">
        </div>
    </div>
</asp:Content>

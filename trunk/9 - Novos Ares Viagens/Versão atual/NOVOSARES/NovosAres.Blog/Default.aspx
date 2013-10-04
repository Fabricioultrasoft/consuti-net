<%@ Page Title=".: Blog Novos Ares Viagens :." Language="C#" MasterPageFile="~/Master.Master"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NovosAres.Blog.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Estilos/EstiloBlog.css" rel="Stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="rptrPosts" runat="server" OnItemCommand="rptrPosts_ItemCommand">
        <ItemTemplate>
            <div id="tituloPost">
                <br />
                <div id="textoTitulo">
                    <br />
                    <asp:LinkButton ID="lblTextoTitulo" runat="server" CommandArgument='<%# Bind("ID") %>'
                        CommandName="exibePost" Font-Underline="False" ForeColor="#0080FF"><%# Eval("TituloPost") %></asp:LinkButton>
                    &nbsp;&nbsp;
                </div>
                <div id="localPost">
                    &nbsp;&nbsp;
                    <asp:Label ID="lblData" runat="server" Text='<%# Eval("DataPost") %>'>></asp:Label><br />
                    &nbsp;&nbsp;
                    <asp:Label ID="lblLocal" runat="server" Text='<%# Eval("LocalPost") %>'></asp:Label>
                </div>
            </div>
            <br />
            <br />
            <div id="textoPost">
                <br />
                <%# Eval("TextoPost") %>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <div id="rodapeIntegracao">
        <div id="integraFace">
            
                    <iframe style="border: currentColor; width: 550px; height: 25px; overflow: hidden;"
                        src="http://www.facebook.com/plugins/like.php?href=www.consuti.net/novosares.com.br/blog/&;layout=standard&show_faces=false&width=380&action=like&colorscheme=light&height=25&locale=pt_BR"
                        frameborder="0" allowtransparency="true" scrolling="no"></iframe> 
                </div>
                <div id="integraTwitter">
                    <a href="http://twitter.com/share" class="twitter-share-button" data-count="horizontal"
                        data-via="Novos_Ares" data-related="DANILOMANNA">Tweet</a><script type="text/javascript"
                            src="http://platform.twitter.com/widgets.js"></script>
        </div>
    </div>
</asp:Content>

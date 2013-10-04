<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="IntegraFaceBook.ascx.cs"
    Inherits="NovosAres.WebUserControl.IntegraFaceBook" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<link rel="Stylesheet" type="text/css" href="../Estilos/integraFacebook.css" />
<asp:Panel ID="pnlIntegraFace" runat="server" BackColor="White" Width="700px" Height="65px">
    <div id="imgTopoFace">
        <asp:ImageButton ID="imgBtnGoTwitter" runat="server" ImageUrl="~/Graficos/facebook.png" /></div>
    <div id="likeFace">
        <iframe style="width: 620px; height: 55px; overflow: hidden;"
            src="http://www.facebook.com/plugins/like.php?href=www.consuti.net/novosares.com.br/blog/&;layout=standard&show_faces=false&width=380&action=like&colorscheme=light&height=25&locale=pt_BR"
            frameborder="0" scrolling="no"></iframe>
    </div>
</asp:Panel>
<cc1:RoundedCornersExtender ID="pnlIntegraFace_RoundedCornersExtender" runat="server"
    Color="White" Corners="Top" Enabled="True" TargetControlID="pnlIntegraFace" Radius="10">
</cc1:RoundedCornersExtender>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NovosAres.Blog.AdmBlog.Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>.:: Blog Novos Ares - Login Administrador</title>
    <link href="EstiloAdmBlog.css" rel="Stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="fundoSite">
        <div class="corpoSite">
            <div class="lateralEsquerda">
                <br />
                <br />
                <br />
            </div>
            <div class="abaVoltarSite">
                <asp:Panel ID="pnlAbaVoltarSite" runat="server" BackColor="#0080FF">
                    <asp:ImageButton ID="imgBtnVoltarSite" ImageUrl="~/Graficos/GoBack.png" ImageAlign="Top"
                        runat="server" CausesValidation="False" OnClick="imgBtnVoltarSite_Click" />
                    <asp:LinkButton ID="lbtnVoltarSite" Height="40px" CssClass="linkAbaVoltarSite" Font-Underline="false"
                        runat="server" CausesValidation="False" OnClick="lbtnVoltarSite_Click">Voltar para o Blog Novos Ares</asp:LinkButton>
                </asp:Panel>
                <cc1:RoundedCornersExtender ID="pnlAbaVoltarSite_RoundedCornersExtender" runat="server"
                    Enabled="True" TargetControlID="pnlAbaVoltarSite" BorderColor="38, 186, 255"
                    Radius="7">
                </cc1:RoundedCornersExtender>
            </div>
            <div class="conteudoBlog">
                <asp:Panel ID="pnlConteudo" runat="server" Width="100%" Height="319px" BackColor="White"
                    DefaultButton="imgBtnEntrar">
                    <br />
                    <br />
                    <hr style="width: 596px; margin-top: 0px;" />
                    <br />
                    <div class="loginAdmBlog">
                        Informe seus dados para acessar a Administração do Blog:<br />
                        <br />
                        Login:<asp:RequiredFieldValidator ID="rfvLogin" runat="server" ControlToValidate="txbLogin"
                            Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="rfvLogin_ValidatorCalloutExtender" runat="server"
                            Enabled="True" TargetControlID="rfvLogin">
                        </cc1:ValidatorCalloutExtender>
                        <br />
                        <asp:TextBox ID="txbLogin" runat="server" TabIndex="1"></asp:TextBox>
                        <div style="float: right; width: 220px; margin-bottom: 0px; margin-top: 10px;">
                            <asp:ImageButton ID="imgBtnEntrar" runat="server" ImageUrl="~/Graficos/Entrar.png"
                                TabIndex="3" OnClick="imgBtnEntrar_Click" />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:ImageButton ID="imgBtnEsqueciSenha" runat="server" AlternateText="Esqueci a Senha"
                                ToolTip="Esqueci a Senha" ImageUrl="~/Graficos/Ajuda.png" OnClick="imgBtnEsqueciSenha_Click"
                                TabIndex="4" CausesValidation="False" />
                        </div>
                        <br />
                        <br />
                        Senha:<asp:RequiredFieldValidator ID="rfvSenha" runat="server" ControlToValidate="txbSenha"
                            Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="rfvSenha_ValidatorCalloutExtender" runat="server"
                            Enabled="True" TargetControlID="rfvSenha">
                        </cc1:ValidatorCalloutExtender>
                        <br />
                        <asp:TextBox ID="txbSenha" runat="server" TabIndex="2" TextMode="Password"></asp:TextBox>
                        <br />
                    </div>
                    <hr style="width: 596px; margin-top: 20px;" />
                </asp:Panel>
                <cc1:RoundedCornersExtender ID="pnlConteudo_RoundedCornersExtender" runat="server"
                    Enabled="True" TargetControlID="pnlConteudo" BorderColor="Gray" Radius="9">
                </cc1:RoundedCornersExtender>
            </div>
            <div class="lateralDireita">
                <div id="logo">
                    <asp:Image ID="imgLogoNovosAres" runat="server" ImageUrl="~/Graficos/logo.png" />
                </div>
            </div>
            <br />
            <br />
        </div>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    </form>
</body>
</html>

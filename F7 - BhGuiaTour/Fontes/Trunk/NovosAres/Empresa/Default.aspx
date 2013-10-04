<%@ Page Title="" Language="C#" MasterPageFile="~/Externa.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NovosAres.Empresa" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="Stylesheet" href="../Estilos/Institucional.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="telaContato">
    <br /><br />
        <div id="formContato">
            <asp:Panel ID="PnlContatoFormulario" runat="server" HorizontalAlign="Center" Style="text-align: left"
                Width="100%" Height="700px" DefaultButton="btnVoltar" BackImageUrl="~/Graficos/BackOrangeTransparent.png">
                <div id="tituloPag">
                    <br />
                    <h2>
                    <%--<%# Eval("Titulo") %>--%>
                        Seja Bem Vindo à Novos Ares Viagens!
                    </h2>
                    <hr class="telaContato" style="width: 90%" />
                </div>
                <div id="textoInstitucional">
                <%--<%# Eval("Descricao") %>--%>
                    #####################################################texto#######################<br />############################<br />
                    
                    ##################################################texto#########################################<br />##########<br />
                    
                    ##############################################texto############################################<br /> 
                    ######<br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </div>
                <div style="text-align: center">
                    <asp:Button ID="btnVoltar" runat="server" CausesValidation="False" 
                    Text="Voltar" Width="100px" Height="30px" TabIndex="7" CssClass="btnContato" 
                        onclick="btnVoltar_Click" />
                </div>
                <br />
                <br />
            </asp:Panel>            
        </div>
    </div>
</asp:Content>

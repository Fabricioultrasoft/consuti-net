<%@ Page Title="" Language="C#" MasterPageFile="~/Externa.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Sistema_Life_Planner_Agenda.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Login ID="Login1" runat="server" onauthenticate="Login1_Authenticate">
    </asp:Login>
</asp:Content>

http://www.mundoasp.net/login-asp-dot-net/
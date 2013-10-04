<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CadastroUsuarioExterna.aspx.cs"
    Inherits="XTimate.Externas.CadastroUsuarioExterna" %>

<%@ Register Src="../UserControls/FormularioCadastroUsuario.ascx" TagName="FormularioCadastroUsuario"
    TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Cadastro de usuário</title>
    <link rel="Stylesheet" href="../App_Themes/Estilos/XTimate.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin: 100px auto; width: 600px; background-color: White; padding: 10px">
        <fieldset>
            <legend>Cadastro de Usuário</legend>
            <br />
            <uc1:FormularioCadastroUsuario ID="ucFormularioCadastroUsuario" runat="server" />
            <br />
            <div style="width: 90%; text-align: right; padding: 5px">
                <asp:Button ID="SalvarButton" runat="server" Text="Salvar" OnClick="SalvarButton_Click" />
                <asp:Button ID="CancelarButton" runat="server" Text="Cancelar" CausesValidation="False"
                    OnClick="CancelarButton_Click" />
            </div>
        </fieldset>
    </div>
    </form>
</body>
</html>

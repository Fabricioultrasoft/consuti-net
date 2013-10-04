<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="wucDescricao.ascx.cs"
    Inherits="NovosAres.WebUserControl.wucDescricao" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="novosares" %>

<p>
    <span style="color: Red;">*</span> Informe uma descrição:
</p>
<asp:TextBox ID="txtDescricao" runat="server" MaxLength="1000" TextMode="MultiLine"
    onkeyup="Contador(this)" Height="172px" Width="693px"></asp:TextBox>
<asp:RequiredFieldValidator ID="RfvTxtDescricao" runat="server" ControlToValidate="txtDescricao"
    Display="None" ErrorMessage="Campo Obrigatório."></asp:RequiredFieldValidator>
<novosares:ValidatorCalloutExtender ID="RfvTxtDescricao_ValidatorCalloutExtender"
    runat="server" Enabled="true" TargetControlID="RfvTxtDescricao">
</novosares:ValidatorCalloutExtender>
<div id="contador" style="width: 691px;">Limite de <b>1000</b> caracteres | Restam: <b>1000</b></div>

<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>

<script type="text/javascript">
    var max = 1000;
    function Contador(obj) {
        var progreso = document.getElementById("contador");

        if (obj.value.length > max) {
            obj.value = obj.value.substring(0, max);
        }

        progreso.innerHTML = " Limite de <b>" + max + "</b> caracteres | Restam: <b>" + (max - obj.value.length) + "</b>";
    }
</script>

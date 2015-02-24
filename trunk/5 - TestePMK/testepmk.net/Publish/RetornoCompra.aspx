<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RetornoCompra.aspx.cs" Inherits="testePMK.com.br.RetornoCompra" %>

<%@ Register Assembly="UOL.PagSeguro" Namespace="UOL.PagSeguro" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head2" runat="server">
<title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <!-- redirecionamento automático -->
    <meta http-equiv="refresh" content="10;url=http://www.testepmk.com.br" />
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
    </style>
</head>
<body style="margin: 20 auto 0 auto;">
    <form id="form1" runat="server">
    <div>
        <div style="margin: 20 auto 0 auto; width: 900px; background-image: url('Graficos/testePmkLogo.jpg');
            background-repeat: no-repeat; height: 375px;">
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <div style="margin-left: 450px" class="style1">
                <asp:Image ID="OK" runat="server" ImageUrl="~/Graficos/OK.png" ImageAlign="Middle"
                    Style="text-align: center" />
                &nbsp;OBRIGADO!<br />
                <span class="Apple-style-span" style="border-collapse: separate; color: rgb(0, 0, 0);
                    font-family: 'Times New Roman'; font-style: normal; font-variant: normal; font-weight: normal;
                    letter-spacing: normal; line-height: normal; orphans: 2; text-align: -webkit-auto;
                    text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;
                    -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px;
                    -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                    font-size: medium;"><span class="Apple-style-span" style="font-family: arial, georgia, sans-serif;
                        font-size: 13px; line-height: 20px;">Seu pagamento foi concluído com sucesso!<br />
                        Uma mensagem com os detalhes desta transação será enviada em breve para o seu e-mail.
                        Você também poderá acessar sua conta PagSeguro no endereço <a href="https://pagseguro.uol.com.br">
                            https://pagseguro.uol.com.br</a>&nbsp; para mais informações.</span></span></div>
            <div style="text-align: center">
                <br />
                <asp:ImageButton ID="imgBtnVoltar" runat="server" ImageUrl="~/Graficos/Voltar_32x32.png"
                    OnClick="imgBtnVoltar_Click" />
                &nbsp;<br />
                <a href="Default.aspx">Voltar ao Site</a></div>
            <div style="font-size: xx-small">
                <asp:Image ID="time" runat="server" ImageUrl="~/Graficos/time.gif" ImageAlign="Middle" />Você
                será redirecionado em 10 segundos...<br />
                <br />
                <asp:Label ID="lblerro" runat="server" Text="Label"></asp:Label>
            </div>
        </div>
    </div>

    <cc1:RetornoPagSeguro ID="RetornoPagSeguro1" runat="server" 
        OnVendaEfetuada="RetornoPagSeguro1_VendaEfetuada" 
        onfalhaprocessarretorno="RetornoPagSeguro1_FalhaProcessarRetorno" 
        onvendanaoautenticada="RetornoPagSeguro1_VendaNaoAutenticada">
    </cc1:RetornoPagSeguro>

    </form>
</body>
</html>
    

<%--
<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.HttpMethod == "POST")
        {
            //o método POST indica que a requisição é o retorno da validação NPI.

            string Token = "667D7FBD53F64E73836E592D189635B1";
            string Pagina = "https://pagseguro.uol.com.br/pagseguro-ws/checkout/NPI.jhtml";
            string Dados = HttpContext.Current.Request.Form.ToString() + "&Comando=validar" + "&Token=" + Token;

            System.Net.HttpWebRequest req = (System.Net.HttpWebRequest)System.Net.WebRequest.Create(Pagina);

            req.Method = "POST";
            req.ContentLength = Dados.Length;
            req.ContentType = "application/x-www-form-urlencoded";

            System.IO.StreamWriter stOut = new System.IO.StreamWriter(req.GetRequestStream(), System.Text.Encoding.GetEncoding("ISO-8859-1"));
            stOut.Write(Dados);
            stOut.Close();

            System.IO.StreamReader stIn = new System.IO.StreamReader(req.GetResponse().GetResponseStream(), System.Text.Encoding.GetEncoding("ISO-8859-1"));
            string Result = stIn.ReadToEnd();
            stIn.Close();

            if (Result == "VERIFICADO")
            {
                //o post foi validado
            }
            else if (Result == "FALSO")
            {
                //o post nao foi validado
            }
            else
            {
                //erro na integração com PagSeguro.
            }
        }
        else if (Request.HttpMethod == "GET")
        {
            //o método GET indica que a requisição é o retorno do Checkout PagSeguro para o site vendedor.
            //no término do checkout o usuário é redirecionado para este bloco.
            var getDadosPagSeguro = new testePMK.com.br.Banco.BdRetorno();
            try
            {
                getDadosPagSeguro.Incluir(
                    Request.Form["VendedorEmail"].ToString(),
                    Request.Form["TransacaoID"].ToString(),
                    Request.Form["Referencia"].ToString(),
                    Request.Form["TipoFrete"].ToString(),
                    Request.Form["Anotacao"].ToString(),
                    Request.Form["TipoPagamento"].ToString(),
                    Request.Form["StatusTransacao"].ToString(),
                    Request.Form["CliNome"].ToString(),
                    Request.Form["CliEmail"].ToString(),
                    Request.Form["CliEndereco"].ToString(),
                    Request.Form["CliNumero"].ToString(),
                    Request.Form["CliComplemento"].ToString(),
                    Request.Form["CliBairro"].ToString(),
                    Request.Form["CliCidade"].ToString(),
                    Request.Form["CliEstado"].ToString(),
                    Request.Form["CliCEP"].ToString(),
                    Request.Form["CliTelefone"].ToString(),
                    Request.Form["ProdID_x"].ToString(),
                    Request.Form["ProdDescricao_x"].ToString(),
                    Convert.ToInt32(Request.Form["ProdQuantidade_x"].ToString()),
                    Convert.ToInt32(Request.Form["NumItens"].ToString()),
                    Convert.ToInt32(Request.Form["Parcelas"].ToString()),
                    float.Parse(Request.Form["Extras"].ToString()),
                    float.Parse(Request.Form["ValorFrete"].ToString()),
                    float.Parse(Request.Form["ProdValor_x"].ToString()),
                    float.Parse(Request.Form["ProdFrete_x"].ToString()),
                    Convert.ToDateTime(Request.Form["DataTransacao"].ToString()));
            }
            catch (Exception ex)
            {
                lblerro.Text = ex.ToString();
            }
            finally
            {
                getDadosPagSeguro.Dispose();
            }
        }
    }

    protected void imgBtnVoltar_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <!-- redirecionamento automático -->
    <meta http-equiv="refresh" content="10;url=http://www.testepmk.com.br" />
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
    </style>
</head>
<body style="margin: 20 auto 0 auto;">
    <form id="form1" runat="server">
    <div>
        <div style="margin: 20 auto 0 auto; width: 900px; background-image: url('Graficos/testePmkLogo.jpg');
            background-repeat: no-repeat; height: 375px;">
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <div style="margin-left: 450px" class="style1">
                <asp:Image ID="OK" runat="server" ImageUrl="~/Graficos/OK.png" ImageAlign="Middle"
                    Style="text-align: center" />
                &nbsp;OBRIGADO!<br />
                <span class="Apple-style-span" style="border-collapse: separate; color: rgb(0, 0, 0);
                    font-family: 'Times New Roman'; font-style: normal; font-variant: normal; font-weight: normal;
                    letter-spacing: normal; line-height: normal; orphans: 2; text-align: -webkit-auto;
                    text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;
                    -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px;
                    -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
                    font-size: medium;"><span class="Apple-style-span" style="font-family: arial, georgia, sans-serif;
                        font-size: 13px; line-height: 20px;">Seu pagamento foi concluído com sucesso!<br />
                        Uma mensagem com os detalhes desta transação será enviada em breve para o seu e-mail.
                        Você também poderá acessar sua conta PagSeguro no endereço <a href="https://pagseguro.uol.com.br">
                            https://pagseguro.uol.com.br</a>&nbsp; para mais informações.</span></span></div>
            <div style="text-align: center">
                <br />
                <asp:ImageButton ID="imgBtnVoltar" runat="server" ImageUrl="~/Graficos/Voltar_32x32.png"
                    OnClick="imgBtnVoltar_Click" />
                &nbsp;<br />
                <a href="Default.aspx">Voltar ao Site</a></div>
            <div style="font-size: xx-small">
                <asp:Image ID="time" runat="server" ImageUrl="~/Graficos/time.gif" ImageAlign="Middle" />Você
                será redirecionado em 10 segundos...<br />
                <br />
                <asp:Label ID="lblerro" runat="server" Text="Label"></asp:Label>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
--%>
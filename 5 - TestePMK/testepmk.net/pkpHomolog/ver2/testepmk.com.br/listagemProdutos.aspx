<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="listagemProdutos.aspx.cs"
    Inherits="testePMK.com.br.listagemProdutos" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <link href="~/Estilos.css" rel="stylesheet" type="text/css" />
</head>
<body style="width: 590px; background-color: White;">
    <form runat="server">
    <div>
        <div id="lista_itens">
            Ordenar Por:
            <asp:DropDownList ID="ddlOrdem" runat="server" AutoPostBack="True">
                <asp:ListItem Value="1">Categoria</asp:ListItem>
                <asp:ListItem Value="2">Maior Preço</asp:ListItem>
                <asp:ListItem Value="3">Menor Preço</asp:ListItem>
                <asp:ListItem Value="4">Nome Produto</asp:ListItem>
            </asp:DropDownList>
        </div>
        <asp:Repeater ID="drProdutos" runat="server" OnItemCommand="drProdutos_ItemCommand">
            <ItemTemplate>
                <hr />
                <br />
                <div>
                    <div id="imgProd" style="width: 160px; height: 200px; float: left">
                        <asp:Image ID="imgBtnFotos" runat="server" ImageUrl='<%# Eval("CAMINHO_MINIATURA") %>'
                            AlternateText="Ver imagens deste produto" Width="150px" Height="160px" CausesValidation="false">
                        </asp:Image>
                        <br />
                        <div style="text-align: center">
                            <asp:LinkButton ID="LbtnVerImags" runat="server" Font-Size="XX-Small" CommandArgument='<%# Bind("ID") %>'
                                AlternateText="Ver imagens deste produto" CommandName="verImgs">Ver Imagens e Detalhes</asp:LinkButton>
                            <br />
                            <div id="linkVideo">
                                <br />
                                <asp:Image ID="Image1" runat="server" ImageAlign="Middle" ImageUrl="~/Graficos/YouTube.png" />
                                <asp:LinkButton ID="imgBtnLinkVIdeo" runat="server" Font-Size="XX-Small" CommandArgument='<%# Bind("ID") %>'
                                    CommandName="verVideo" AlternateText="Vídeo do produto" CausesValidation="false">
                                Ver Vídeo</asp:LinkButton>
                            </div>
                            <br />
                        </div>
                        <div class="PrecoProduto">
                            R$
                            <asp:Label ID="lblPreco" runat="server" Text='<%# Eval("PRECO_UNIDADE") %>' />
                        </div>
                    </div>
                    <div id="item">
                        <div style="text-align: center;">
                            <asp:Label ID="lblNomeProd" runat="server" Text='<%# Eval("NOME") %>' Font-Bold="True"
                                CssClass="NomeProduto" />
                            <span class="CodProduto">- cod.
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Eval("ID") %>' /></span>
                        </div>
                        <br />
                        <div class="DescProduto">
                            &nbsp&nbsp&nbsp <span class="categoria">
                                <asp:Label ID="lblCategoria" runat="server" Text='<%# Eval("CATEGORIA") %>' /></span>
                            -
                            <asp:Label ID="lbldescricao" runat="server" Text='<%# Eval("DESCRICAO") %>' />
                        </div>
                        <br />
                        <div>   
                        <!-- para o repeater não apagar o primeiro form -->
                        <form name="enviaDados" action="https://pagseguro.uol.com.br/checkout/checkout.jhtml"
                            target="pagseguro" method="post"></form>   
                            
                            <!-- inicio do form para o pagseguro -->                      
                            <form name="enviaDados" action="https://pagseguro.uol.com.br/checkout/checkout.jhtml"
                            target="pagseguro" method="post">                            
                            <input type="hidden" name="email_cobranca" value="mesapmk@gmail.com" />
                            <input type="hidden" name="tipo" value="CBR" />
                            <input type="hidden" name="moeda" value="BRL" />
                            <input type="hidden" name="item_id" value="<%# Eval("ID") %>" />
                            <input type="hidden" name="item_descr" value="<%# Eval("DESCRICAO") %>" />
                            Quantidade Disponível:
                            <asp:Label ID="lblEstoque" runat="server" Text='<%# Eval("QTD_ESTOQUE") %>' Font-Bold="True" />
                            <br />
                            <div style="text-align: left;">
                                Quantidade desejada:
                                <input type="text" name="item_quant" value="1" class="txbQtd" maxlength="2" />
                                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                <input type="image" name="submit"  src="https://p.simg.uol.com.br/out/pagseguro/i/botoes/pagamentos/120x53-comprar.gif"
                                    alt="Pague com PagSeguro - é rápido, grátis e seguro!" /></div>
                            <input type="hidden" name="item_valor" value="<%# Eval("PRECO_UNIDADE") %>" />
                            <input type="hidden" name="peso" value="<%# Eval("PESO") %>" />
                            </form>
                            
                            <!-- FINAL FORMULARIO BOTAO PAGSEGURO -->
                            <br />
                        </div>
                        <br />
                        <br />
                        <br />
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    </form>
</body>
</html>

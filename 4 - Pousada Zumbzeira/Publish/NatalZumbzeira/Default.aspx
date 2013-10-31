<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="pousadaZ.NatalZumbzeira.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.pack.js"></script>
    <script type="text/javascript">

        window.onload = (function (e) {
            //Cancel the link behavior
            e.preventDefault();

            //Get the A tag
            var id = $('a[name=modal]').attr('href');

            //Get the screen height and width
            var maskHeight = $(document).height();
            var maskWidth = $(window).width();

            //Set heigth and width to mask to fill up the whole screen
            $('#mask').css({ 'width': maskWidth, 'height': maskHeight });

            //transition effect		
            $('#mask').fadeIn(1000);
            $('#mask').fadeTo("slow", 0.8);

            //Get the window height and width
            var winH = $(window).height();
            var winW = $(window).width();

            //Set the popup window to center
            $(id).css('top', winH / 2 - $(id).height() / 2);
            $(id).css('left', winW / 2 - $(id).width() / 2);

            //transition effect
            $(id).fadeIn(2000);

            //if close button is clicked
            $('.window .close').click(function (e) {
                //Cancel the link behavior
                e.preventDefault();

                $('#mask').hide();
                $('.window').hide();
                var url = "../";
                $(location).attr('href', url);
            });

            //if mask is clicked
            $('#mask').click(function () {
                $(this).hide();
                $('.window').hide();
                var url = "../";
                $(location).attr('href', url);
            });

        });

    </script>
    <style type="text/css">
        #mask
        {
            position: absolute;
            left: 0;
            top: 0;
            z-index: 9000;
            background-color: #FFFFFF;
            display: none;            
        }
        
        #boxes .window
        {
            position: absolute;
            left: 0;
            top: 0;
            width: 444px;
            height: 700px;
            display: none;
            z-index: 9999;
            padding: 20px;
        }
        
        #boxes #dialog
        {
            width: 424px;
            height: 680px;
            padding: 10px;
            background-color: #ffffff;
        }
        #dialog
        {
            background-image: url('FundoNatal2.png');
            background-repeat: no-repeat;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <a href="#dialog" name="modal"></a>
    <div id="boxes">
        <div id="dialog" class="window">
            <div style="text-align: right">                
                <br />
                <a href="#" class="close"></a></div>
                <div id="MacacoNoel" style="margin-top: 560px; margin-left: -60px;">
                    <asp:Image ID="MacacoNoelImage" runat="server" ImageUrl="~/NatalZumbzeira/MacacoNoel.gif" /></div>
        </div>
        <!-- Mask to cover the whole screen -->
        <div id="mask">
        </div>
    </div>
    </form>
</body>
</html>

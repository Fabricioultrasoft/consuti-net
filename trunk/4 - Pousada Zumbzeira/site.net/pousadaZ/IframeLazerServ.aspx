<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IframeLazerServ.aspx.cs" Inherits="pousadaZ.WebForm12" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<title>Imagens Lazer & Serviços</title>
<meta http-equiv="imagetoolbar" content="no">
<style type="text/css"> 
	html {
		overflow: hidden;
	}
	body {
		position: absolute;
		margin: 0px;
		padding: 0px;
		background: #D0DFEC;
		width: 100%;
		height: 100%;
	}
	#border {
		position:absolute;
		width:440px;
		height:340px;
		margin-left:-220px;
		margin-top:-170px;
		left:50%;
		top:50%;
		background:#fff;
		border:#aaa solid 1px;
	}
	#caption {
		position:absolute;
		width:440px;
		height:60px;
		left:50%;
		top:50%;
		margin-left:-220px;
		margin-top:175px;
	}
	#screen {
		position:absolute;
		width:400px;
		height:300px;
		margin-left:-200px;
		margin-top:-150px;
		left:50%;
		top:50%;
		background:#fff;
	}
	#screen span {
		position:absolute;
		overflow:hidden;
		border:#aaa solid 1px;
		background:#fff;
	}
	#screen img{
		position:absolute;
		left:-32px;
		top:-32px;
		cursor: pointer;
		filter: alpha(opacity=100);
	}
	#caption {
		color: #666;
		font-family: georgia, 'times new roman', times, veronica, serif;
		font-size: 1em;
		text-align: center;
	}
	#caption b {
		font-size: 2em;
	}
 
</style>
 
<script type="text/javascript"> 
 
var siM = function () {
	/* ---- private vars ---- */
	var obj = [], scr, spa, cap, img, W, Wi, Hi, wi, hi, Sx, Sy, M;
	var xb = 0, yb = 0, ob =  - 1;
	//////////////////////////////////////////////////////////
	var Nx = 4; //size grid x
	var Ny = 4; //size grid y
	var Tx = 3; // image width
	var Ty = 3; // image height
	var Mg = 10; // margin
	var SP = 1; // speed
	//////////////////////////////////////////////////////////
	var Cobj = function (o, x, y) {
		this.o = o;
		this.ix = Math.min(Nx - Tx, Math.max(0, Math.round(x - (Tx / 2))));
		this.iy = Math.min(Ny - Ty, Math.max(0, Math.round(y - (Ty / 2))));
		this.li = ((this.ix * M + this.ix * Sx) - (x * M + x * Sx)) / SP;
		this.ti = ((this.iy * M + this.iy * Sy) - (y * M + y * Sy)) / SP;
		this.x = x;
		this.y = y;
		this.l = 0;
		this.t = 0;
		this.w = 0;
		this.h = 0;
		this.s = -1;
		this.spa = spa[o].style;
		this.img = img[o];
		this.txt = img[o].alt;
		this.img.alt = "";
		/* center image */
		this.img.center = function () {
			this.style.left = Math.round( -(this.width - Wi) / 2) + "px";
			this.style.top  = Math.round( -(this.height - Hi) / 2) + "px";
		}
		/* events */
		this.img.onclick = function () {
			obj[o].click();
		}
		this.img.onload = function () {
			this.center();
		}
		/* initial display */
		this.zoom();
	}
	/* zooming loop */
	Cobj.prototype.zoom = function() {
		this.f = false;
		this.l += this.li * this.s;
		this.t += this.ti * this.s;
		this.w += wi * this.s;
		this.h += hi * this.s;
		if ((this.s > 0 && this.w < Wi) || (this.s < 0 && this.w > Sx)) {
			/* loop */
			var o = this.o;
			setTimeout(function() {
				obj[o].zoom();
			}, 16);
		} else {
			/* finished */
			if (this.s > 0) {
				this.l = this.ix * M + this.ix * Sx;
				this.t = this.iy * M + this.iy * Sy;
				this.w = Wi;
				this.h = Hi;
			} else {
				this.l = this.x * M + this.x * Sx;
				this.t = this.y * M + this.y * Sy;
				this.w = Sx;
				this.h = Sy;
			}
		}
		/* html animation */
		this.spa.left   = Math.round(this.l) + "px";
		this.spa.top    = Math.round(this.t) + "px";
		this.spa.width  = Math.round(this.w) + "px";
		this.spa.height = Math.round(this.h) + "px";
		this.spa.zIndex = Math.round(this.w);
	}
 
	Cobj.prototype.click = function() {
		this.img.center();
		/* zooming logic */
		if (this.s > 0) {
			this.s = -1;
			this.zoom();
			cap.innerHTML = this.txt;
		} else if (this.s < 0) {
			if (ob >= 0) {
				obj[ob].s =  - 1;
				obj[ob].zoom();
			}
			ob = this.o;
			this.s = 1;
			this.zoom();
			cap.innerHTML = this.txt;
		}
	}
	/* ====== init script ====== */
	var init = function () {
		/* html elements */
		scr = document.getElementById("screen");
		spa = scr.getElementsByTagName("span");
		img = scr.getElementsByTagName("img");
		cap = document.getElementById("caption");
		
		/* variables */
		W = scr.offsetWidth;
		H = scr.offsetHeight;
		M = W / 40;
		Sx = (W - (Nx - 1) * M) / Nx;
		Sy = (H - (Ny - 1) * M) / Ny;
		Wi = Tx * Sx + (Tx - 1) * M;
		Hi = Ty * Sy + (Ty - 1) * M;
		SP = M * Tx * SP;
		wi = (Wi - Sx) / SP;
		hi = (Hi - Sy) / SP;
	
		/* create objects */
		for (var k = 0, i = 0; i < Nx; i++) {
			for (var j = 0; j < Ny; j++)
				obj[k] = new Cobj(k++, i, j);
		}
	}
	return {
		init : init
	}
}();
 
</script>
</head>
 
<body>
 
 
	<div id="border"></div>
	<div id="screen">
		<span><img src="../Graficos/Ser1.jpg" border="1px" alt="Piscina ampla de adulto com quiosque-bar"></span>
		<span><img src="../Graficos/Ser2.jpg" border="1px" alt="Churrasqueira para você mesmo organizar sua festa"></span>
		<span><img src="../Graficos/Ser3.jpg"  alt="Salão de jogos com sinuca"></span>
		<span><img src="../Graficos/Ser4.jpg" alt="Estacionamento próprio"></span>
		<span><img src="../Graficos/Ser7.jpg" border="1px" alt="Sala de TV"></span>
		<span><img src="../Graficos/Ser6.jpg" border="1px"  alt="Café da manhã"></span>
		<span><img src="../Graficos/Ser5.jpg" border="1px" alt="Fogão a lenha"></span>
		<span><img src="../Graficos/Ser8.jpg" border="1px" alt="Piscina ampla de adulto com quiosque-bar"></span>
		<span><img src="../Graficos/Ser9.jpg" border="1px" alt="Natureza mais proxima de você."></span>
		<span><img src="../Graficos/Ser10.jpg" border="1px" alt="Acomodações confortáveis e higienizadas."></span>
		<span><img src="../Graficos/Ser11.jpg" border="1px" alt="Café da manhã."></span>
		<span><img src="../Graficos/Ser12.jpg" border="1px" alt="Paz e Tranquilidade a perder de vista."></span>
		<span><img src="../Graficos/Ser13.jpg" border="1px" alt="Ambiente agradável para refeições."></span>
		<span><img src="../Graficos/Ser14.jpg" border="1px" alt="Ambiente agradável para refeições."></span>
		<span><img src="../Graficos/Ser15.jpg" border="1px" alt="Piscina ampla de adulto com quiosque-bar."></span>
		<span><img src="../Graficos/Ser16.jpg" border="1px" alt="Muito contato com a natureza."></span>
		
	</div>
	<div id="caption">- Clique na imagem para ampliar - </div>
 
 
<script type="text/javascript"> 
// starter
siM.init();
</script>
 
</body>
</html>
 


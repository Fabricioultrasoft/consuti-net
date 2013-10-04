<%@ Page Title="" Language="C#" MasterPageFile="~/MasterGaleria.Master" AutoEventWireup="true" CodeBehind="Galeria2.aspx.cs" Inherits="pousadaZ.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> <!-- agradecimentos especias à jojo -->
    <style type="text/css">
                
    .style2
    {
        font-size: medium;
        font-weight: bold;
            text-decoration: underline;
        }
       
       #screen {
		position: absolute;
		left: 5px;
		top: 5px;
		bottom: 5px;
		right: 5px;
		width: 100%;
		height: 100%;
		background: #D0DFEC;
	}
	#screen img { 
		position: absolute;
		cursor: pointer;
		visibility: hidden;
		width: 0px;
		height: 0px;
		-ms-interpolation-mode:nearest-neighbor;
	}
	#screen .tvover {
		border: solid #fff;
	}
	#screen .tvout {
		border: solid #222;
	}
	#bankImages {
		display: none;
	} 
    </style>
    
    <script type="text/javascript">
    
    /* JS do efeito */
    
 
/* ==== library ==== */
var Library = {};
Library.ease = function () {
	this.target = 0;
	this.position = 0;
	this.move = function (target, speed)
	{
		this.position += (target - this.position) * speed;
	}
}
 
var tv = {
	/* ==== variables ==== */
	O : [],
	screen : {},
	grid : {
		sizeX      : 4,  // 4x4 grid
		sizeY      : 4,
		borderSize : 6,  // borders size
		zoomed     : false
	},
	angle : {
		x : new Library.ease(),
		y : new Library.ease()
	},
	camera : {
		x    : new Library.ease(),
		y    : new Library.ease(),
		zoom : new Library.ease(),
		focalLength : 750 // camera Focal Length
	},
	
	/* ==== init script ==== */
	init : function ()
	{
		this.screen.obj = document.getElementById('screen');
		var img = document.getElementById('bankImages').getElementsByTagName('img');
		this.screen.obj.onselectstart = function () { return false; }
		this.screen.obj.ondrag        = function () { return false; }
		/* ==== create images grid ==== */
		var ni = 0;
		var nx = (tv.grid.sizeX / 2) - .5;
		var ny = (tv.grid.sizeY / 2) - .5;
		for (var y = -ny; y <= ny; y++)
		{
			for (var x = -nx; x <= nx; x++)
			{
				/* ==== create HTML image element ==== */
				var o = document.createElement('img');
				var i = img[(ni++) % img.length];
				o.className = 'tvout';
				o.src = i.src;
				tv.screen.obj.appendChild(o);
				
				/* ==== 3D coordinates ==== */
				o.point3D = {
					x  : x,
					y  : y,
					z  : new Library.ease()
				};
				
				/* ==== push object ==== */
				o.point2D = {};
				o.ratioImage = 1;
				tv.O.push(o);
				
				/* ==== on mouse over event ==== */
				o.onmouseover = function ()
				{
					if (!tv.grid.zoomed)
					{
						if (tv.o)
						{
							/* ==== mouse out ==== */
							tv.o.point3D.z.target = 0;
							tv.o.className = 'tvout';
						}
						
						/* ==== mouse over ==== */
						this.className = 'tvover';
						this.point3D.z.target = -.5;
						tv.o = this;
					}
				}
				
				/* ==== on click event ==== */
				o.onclick = function ()
				{
					if (!tv.grid.zoomed)
					{
						/* ==== zoom in ==== */
						tv.camera.x.target = this.point3D.x;
						tv.camera.y.target = this.point3D.y;
						tv.camera.zoom.target = tv.screen.w * 1.1;
						tv.grid.zoomed = this;
					} else {
						if (this == tv.grid.zoomed){
						
							/* ==== zoom out ==== */
							tv.camera.x.target = 0;
							tv.camera.y.target = 0;
							tv.camera.zoom.target = tv.screen.w / (tv.grid.sizeX + .1);
							tv.grid.zoomed = false;
						}
					}
				}
				
				/* ==== 3D transform function ==== */
				o.calc = function ()
				{
					/* ==== ease mouseover ==== */
					this.point3D.z.move(this.point3D.z.target, .5);
					
					/* ==== assign 3D coords ==== */
					var x = (this.point3D.x - tv.camera.x.position) * tv.camera.zoom.position;
					var y = (this.point3D.y - tv.camera.y.position) * tv.camera.zoom.position;
					var z = this.point3D.z.position * tv.camera.zoom.position;
					
					/* ==== perform rotations ==== */
					var xy = tv.angle.cx * y  - tv.angle.sx * z;
					var xz = tv.angle.sx * y  + tv.angle.cx * z;
					var yz = tv.angle.cy * xz - tv.angle.sy * x;
					var yx = tv.angle.sy * xz + tv.angle.cy * x;
					
					/* ==== 2D transformation ==== */
					this.point2D.scale = tv.camera.focalLength / (tv.camera.focalLength + yz);
					this.point2D.x = yx * this.point2D.scale;
					this.point2D.y = xy * this.point2D.scale;
					this.point2D.w = Math.round(
					                   Math.max(
					                     0, 
					                     this.point2D.scale * tv.camera.zoom.position * .8
					                   )
					                 );
					                 
					/* ==== image size ratio ==== */
					if (this.ratioImage > 1)
						this.point2D.h = Math.round(this.point2D.w / this.ratioImage);
					else
					{
						this.point2D.h = this.point2D.w;
						this.point2D.w = Math.round(this.point2D.h * this.ratioImage);
					}
				}
				
				/* ==== rendering ==== */
				o.draw = function ()
				{
					if (this.complete)
					{
						/* ==== paranoid image load ==== */
						if (!this.loaded)
						{
							if (!this.img)
							{
								/* ==== create internal image ==== */
								this.img = new Image();
								this.img.src = this.src;
							}
							if (this.img.complete)
							{
								/* ==== get width / height ratio ==== */
								this.style.visibility = 'visible';
								this.ratioImage = this.img.width / this.img.height;
								this.loaded = true;
								this.img = false;
							}
						}
						
						/* ==== HTML rendering ==== */
						this.style.left = Math.round(
						                    this.point2D.x * this.point2D.scale + 
						                    tv.screen.w - this.point2D.w * .5
						                  ) + 'px';
						this.style.top  = Math.round(
						                    this.point2D.y * this.point2D.scale + 
						                    tv.screen.h - this.point2D.h * .5
						                  ) + 'px';  
						this.style.width  = this.point2D.w + 'px';
						this.style.height = this.point2D.h + 'px';
						this.style.borderWidth = Math.round(
						                           Math.max(
						                             this.point2D.w, 
						                             this.point2D.h
						                           ) * tv.grid.borderSize * .01
						                         ) + 'px'; 
						this.style.zIndex = Math.floor(this.point2D.scale * 100);
					}
				}
			}
		}
		
		/* ==== start script ==== */
		tv.resize();
		mouse.y = tv.screen.y + tv.screen.h;
		mouse.x = tv.screen.x + tv.screen.w;
		tv.run();
	},
	
	/* ==== resize window ==== */
	resize : function ()
	{
		var o = tv.screen.obj;
		tv.screen.w = o.offsetWidth / 2;
		tv.screen.h = o.offsetHeight / 2;
		tv.camera.zoom.target = tv.screen.w / (tv.grid.sizeX + .1);
		for (tv.screen.x = 0, tv.screen.y = 0; o != null; o = o.offsetParent)
		{
			tv.screen.x += o.offsetLeft;
			tv.screen.y += o.offsetTop;
		}
	},
 
	/* ==== main loop ==== */
	run : function ()
	{
		/* ==== motion ease ==== */
		tv.angle.x.move(-(mouse.y - tv.screen.h - tv.screen.y) * .0025, .1);
		tv.angle.y.move( (mouse.x - tv.screen.w - tv.screen.x) * .0025, .1);
		tv.camera.x.move(tv.camera.x.target, tv.grid.zoomed ? .25 : .025);
		tv.camera.y.move(tv.camera.y.target, tv.grid.zoomed ? .25 : .025);
		tv.camera.zoom.move(tv.camera.zoom.target, .05);
		
		/* ==== angles sin and cos ==== */ 
		tv.angle.cx = Math.cos(tv.angle.x.position);
		tv.angle.sx = Math.sin(tv.angle.x.position);
		tv.angle.cy = Math.cos(tv.angle.y.position);
		tv.angle.sy = Math.sin(tv.angle.y.position);
		
		/* ==== loop through all images ==== */
		for (var i = 0, o; o = tv.O[i]; i++)
		{
			o.calc();
			o.draw();
		}
		
		/* ==== loop ==== */
		setTimeout(tv.run, 32);
	}
}
 
/* ==== global mouse position ==== */
var mouse = {
	x : 0,
	y : 0
}
document.onmousemove = function(e)
{
	if (window.event) e = window.event;
	mouse.x = e.clientX;
	mouse.y = e.clientY;
	return false;
}

//<!-- fim do Js para efeito -->
    
    
    
    //<!-- script para trocar a imagem de play e pause-->

         function troca(obj){
    if(obj.alt=="Pause"){
        document.getElementById("ImgGaleriaPause").src = "../Graficos/Play.png"
        document.getElementById("ImgGaleriaPause").alt = "Play"
    }else{
    document.getElementById("ImgGaleriaPause").src = "../Graficos/Pause.png"
    document.getElementById("ImgGaleriaPause").alt = "Pause"
    }
         }
  </script>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contGaleria" align="center">
    
        <!-- efeito 3d zoom  -->
        <div id="screen">
        <div style="text-align:right; margin-right:10%" >
            <asp:ImageButton ID="ImgBtnVoltar" runat="server" 
                src="../Graficos/Voltar_32x32.png" CausesValidation="False" 
                onclick="ImgBtnVoltar_Click" />
                
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                
                <asp:ImageButton ID="ImgBtnMasterHome" runat="server" src="../Graficos/Home32x32.png" 
                onclick="ImgBtnMasterHome_Click" CausesValidation="False" />
                
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                
                <asp:ImageButton ID="ImgBtnMasterAvanc" runat="server" src="../Graficos/GaleriaAvan.png" 
                onclick="ImgBtnMasterAvanc_Click" CausesValidation="False" />
                
                &nbsp;&nbsp;&nbsp;
                
                <br />
                Voltar&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Home&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pagina3
            </div>
            <div>            
        <span class="style2">GALERIA DE FOTOS DA POUSADA ZUMBZEIRA</span>
        </div>
        <div align="center">
        <div style="background-image: url(../Graficos/ZumbFundo.png);
        width:700px; height:417px" align="center">                        
            </div>
            </div>
        </div>
 
<div id="bankImages">
	<img alt="" src="../Graficos/Fotos/Galeria/17.jpg">
	<img alt="" src="../Graficos/Fotos/Galeria/18.jpg">
	<img alt="" src="../Graficos/Fotos/Galeria/19.jpg">
	<img alt="" src="../Graficos/Fotos/Galeria/20.jpg">
	<img alt="" src="../Graficos/Fotos/Galeria/21.jpg">
	<img alt="" src="../Graficos/Fotos/Galeria/22.jpg">
	<img alt="" src="../Graficos/Fotos/Galeria/23.jpg">
	<img alt="" src="../Graficos/Fotos/Galeria/24.jpg">
	<img alt="" src="../Graficos/Fotos/Galeria/25.jpg">
	<img alt="" src="../Graficos/Fotos/Galeria/26.jpg">
	<img alt="" src="../Graficos/Fotos/Galeria/27.jpg">
	<img alt="" src="../Graficos/Fotos/Galeria/28.jpg">
	<img alt="" src="../Graficos/Fotos/Galeria/29.jpg">
	<img alt="" src="../Graficos/Fotos/Galeria/30.jpg">
	<img alt="" src="../Graficos/Fotos/Galeria/31.jpg">	
	<img alt="" src="../Graficos/Fotos/Galeria/32.jpg">	
</div>
 
<script type="text/javascript">
    /* ==== start script ==== */
    onresize = tv.resize;
    tv.init();
</script>

<!-- efeito 3d zoom  -->
        
        <div style="margin-left:15%">
        
            </div>
<p>
        &nbsp;</p>
        </div>
</asp:Content>

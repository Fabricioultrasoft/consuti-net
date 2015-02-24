<%@ Page Title="" Language="C#" MasterPageFile="Master.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="CursosTI.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- navigation -->
    <nav id="navigation">
					<a href="Default.aspx" class="nav-btn">Home<span class="arr"></span></a>
					<ul>
						<li class="active"><a href="Default.aspx">Home</a></li>
						<li><a href="Requisitos.aspx">Análise de Requisitos</a></li>
						<li><a href="Programacao.aspx">Lógica e Programação</a></li>
						<li><a href="Testes.aspx">Testes de Sistemas</a></li>
                        <li><a href="Localizacao.aspx">Localização</a></li>
                        <li><a href="Contato.aspx">Contato</a></li>
					</ul>
				</nav>
    <!-- end of navigation -->
    <!-- slider -->
    <div class="m-slider">
        <div class="slider-holder">
            <span class="slider-shadow"></span><span class="slider-b"></span>
            <div class="slider flexslider">
                <ul class="slides">
                    <li>
                        <div class="img-holder">
                            <img src="css/images/slide-img1.png" alt="" />
                        </div>
                        <div class="slide-cnt">
                            <h2>
                                Invista em sua carreira</h2>
                            <div class="box-cnt">
                                <p>
                                    Escolha uma nova direção na sua carreira e começe a decolar. Estudando mais suas
                                    possibilididades se multiplicam. O mercado de T.I. possui milhares de oportunidades.
                                    Uma delas será sua!</p>
                            </div>
                            <a href="#" class="grey-btn">Oportunidades</a>
                        </div>
                    </li>
                    <li>
                        <div class="img-holder">
                            <img src="css/images/slide-img2.png" alt="" />
                        </div>
                        <div class="slide-cnt">
                            <h2>
                                Melhores preços do mercado</h2>
                            <div class="box-cnt">
                                <p>
                                    Ofereçemos cursos com a maior carga horária do mercado e preços que cabem no seu
                                    bolso. Parcelas a partir de R$187,00. Um investimento que lhe trará retorno instantâneo.
                                    Parcelamos em até 4 vezes no cartão. Oferecemos 7% de desconto para pagamento à
                                    vista.</p>
                            </div>
                            <a href="#" class="grey-btn">request a demo</a>
                        </div>
                    </li>
                    <li>
                        <div class="img-holder">
                            <img src="css/images/slide-img1.png" alt="" />
                        </div>
                        <div class="slide-cnt">
                            <h2>
                                Conteúdo, Dinâmica e Excelência</h2>
                            <div class="box-cnt">
                                <p>
                                    O conteúdo dos cursos possui enfoque na excelência do aluno. Foi estudado e preparado
                                    com O mercado para profissionais bem preparados é cada vez mais amplo. Nossos professores
                                    são diferenciais do mercado atual.</p>
                            </div>
                            <a href="#" class="grey-btn">request a demo</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- end of slider -->
    <!-- main -->
    <div class="main">
        <a href="#" class="m-btn-grey grey-btn">request a demo</a>
        <section class="cols">
						<div class="col">
							<img src="css/images/col-img1.png" alt="" />
							<div class="col-cnt">
								<h2>Análise de Requisitos</h2>
								<p>Técnicas de levantamento e gestão de requisitos mais eficientes e de maior procura no mercado.</p>
								<a href="Requisitos.aspx" class="more">Saiba mais</a>
							</div>
						</div>
						<div class="col">
							<img src="css/images/col-img2.png" alt="" />
							<div class="col-cnt">
								<h2>Lógica e Programação</h2>
								<p>Aprenda a desenvolver um sistema ou site, seja para recolocação profissional ou para seu negócio próprio.</p>
								<a href="#" class="more">Saiba mais</a>
							</div>
						</div>
						<div class="col">
							<img src="css/images/col-img3.png" alt="" />
							<div class="col-cnt">
								<h2>Testes de Sistemas</h2>
								<p>Estude e pratique a qualidade de software, hoje uma das principais portas de entrada no mercado de Tecnologia.</p>
								<a href="#" class="more">Saiba mais</a>
							</div>
						</div>
						<div class="cl">&nbsp;</div>
					</section>
        <section class="post">
						<div class="video-holder">
							<img src="css/images/video-img.png" alt="" />
						</div>

						<div class="post-cnt">
							<h2>Uma parceria da ConsuTI com o Yázigi</h2>
							<p>A parceria firmada entre a ConsuTI - Empresa especializada no ramo de tecnologia da informação e o Yázigi Cras molestie condimentum consequat. Nam leo libero, scelerisque tincidunt amet nsectetur adipiscing elit. Cras molestie condimentum nsectetur adipiscing elit. Cras molestie condimentum consequat pretium donec dictum mattis elit, nec:</p>

							<ul>
								<li><a href="#">jQuery Fader</a></li>
								<li><a href="#">Various column options</a></li>
								<li><a href="#">Valid XHTML and CSS tableless Design</a></li>
								<li><a href="#">Tested on Mac &amp; PC</a></li>
							</ul>
						</div>
						<div class="cl">&nbsp;</div>
					</section>
        <section class="testimonial">
						<h2>Nossa Motivação é Fruto do Nosso Desafio</h2>

						<p><strong class="quote">“</strong>Esta cada vez mais difícil encontrar bons profissionais no mercado. Cansei de procurá-los por aí. Vamos produzí-los!”</p>

						<p class="author">Cristian Gomes, <strong>ConsuTI - Consultoria e Soluções em Tecnologia da Informação</strong></p>
					</section>
    </div>
    <!-- end of main -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <ul>
        <li class="active"><a href="Default.aspx">Home</a></li>
        <li><a href="Requisitos.aspx">Análise de Requisitos</a></li>
        <li><a href="Programacao.aspx">Lógica e Programação</a></li>
        <li><a href="Testes.aspx">Testes de Sistemas</a></li>
        <li><a href="Localizacao.aspx">Localização</a></li>
        <li><a href="Contato.aspx">Contato</a></li>
    </ul>
</asp:Content>

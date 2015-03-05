<%@ Page Title="" Language="C#" MasterPageFile="Master.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="CursosTI.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            text-align: justify;
        }
    </style>
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
                            <img src="css/images/slide-img2.png" alt="" />
                        </div>
                        <div class="slide-cnt">
                            <h2>
                                Melhores Preços
                            </h2>
                            <div class="box-cnt">
                                <p>
                                    Maior carga horária do mercado e preços acessíveis. Parcelas a partir de <b>R$187,00</b>
                                    em até 4 vezes. Descontos para pagamento à vista e indicações de novos alunos. Isenção
                                    de Matrícula no 2º curso.</p>
                            </div>
                            <%--<a href="#" class="grey-btn">request a demo</a>--%>
                        </div>
                    </li>
                    <li>
                        <div class="img-holder">
                            <img src="css/images/slide-img3.png" alt="" />
                        </div>
                        <div class="slide-cnt">
                            <h2>
                                Ensino Inovador</h2>
                            <div class="box-cnt">
                                <p>
                                    Teoria e prática combinadas em um abiente que simula o dia a dia de uma empresa
                                    de Tecnologia da Informação. O aluno será preparado tanto para a entrevista de emprego
                                    quanto para o trabalho.</p>
                            </div>
                            <%--<a href="#" class="grey-btn">request a demo</a>--%>
                        </div>
                    </li>
                    <li>
                        <div class="img-holder">
                            <img src="css/images/slide-img1.png" alt="" />
                        </div>
                        <div class="slide-cnt">
                            <h2>
                                Turbine sua Carreira</h2>
                            <div class="box-cnt">
                                <p>
                                    Faça um dos nossos cursos e aumente seus conhecimentos e sucesso no trabalho. Estudando
                                    mais suas possibilididades se multiplicam. O mercado de T.I. possui milhares de
                                    oportunidades, uma delas pode ser sua.
                                </p>
                            </div>
                            <%--<a href="#" class="grey-btn">Oportunidades</a>--%>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- end of slider -->
    <!-- main -->
    <div class="main">
        <%--<a href="#" class="m-btn-grey grey-btn">request a demo</a>--%>
        <section class="cols">
						<div class="col">
                        
							<img src="css/images/col-img1.jpg" alt="" />
							<div class="col-cnt">
								<h2>Análise de Requisitos</h2>
								<p class="style1">Técnicas de levantamento e gestão de requisitos mais eficientes e de maior procura no mercado.</p>
								<a href="Requisitos.aspx" class="more">Saiba mais</a>
							</div>
						</div>
						<div class="col">
							<img src="css/images/col-img2.jpg" alt="" />
							<div class="col-cnt">
								<h2>Lógica e Programação</h2>
								<p class="style1">Aprenda a desenvolver sistemas e sites, seja para recolocação profissional ou para seu negócio próprio.</p>
								<a href="Programacao.aspx" class="more">Saiba mais</a>
							</div>
						</div>
						<div class="col">
							<img src="css/images/col-img3.jpg" alt="" />
							<div class="col-cnt">
								<h2>Testes de Sistemas</h2>
								<p class="style1">Estude e pratique a qualidade de software, hoje uma das principais portas de entrada no mercado de Tecnologia.</p>
								<a href="Testes.aspx" class="more">Saiba mais</a>
							</div>
						</div>
						<div class="cl">&nbsp;</div>
					</section>
        <section class="post">
						<div class="video-holder">
							<img src="css/images/Parceria.jpg" alt="" />
						</div>

						<div class="post-cnt">
							<h2>Uma parceria da ConsuTI com o Yázigi</h2>
							<p class="style1">A parceria firmada entre a ConsuTI - empresa especializada no ramo de tecnologia da informação - 
                            e o Yázigi - empresa tradicional em ensino de línguas do país -, oferece um novo modelo de preparação profissional 
                            para Belo Horizonte e região. São cursos voltados para a prática correta e eficiente do trabalho, aplicando o conteúdo 
                            mais exigido pelo mercado brasileiro de tecnologia da informação. Além disso, uma série de benefícios também são oferecidos 
                            aos alunos como, por exemplo, a isenção de matrícula em qualquer um dos modelos de curso de inglês do Yázigi ou mesmo no 
                            segundo curso de TI. Conheça mais sobre os cursos e entre em contato conosco. Não espere mais por um futuro melhor, faça acontecer!</p>

							<%--<ul>
								<li><a href="Requisitos.aspx">Análise de Requisitos </a></li>
								<li><a href="Programacao.aspx">Lógica e Programação</a></li>
								<li><a href="Testes.aspx">Testes de Sistemas</a></li>
								
							</ul>--%>
						</div>
						<div class="cl">&nbsp;</div>
					</section>
        <section class="testimonial">
						<h2>Nossa Motivação é Fruto do Nosso Desafio</h2>

						<p><strong>&quot;</strong>Esta cada vez mais difícil encontrar bons profissionais no mercado. Cansei de procurá-los por aí. Vamos formá-los!  <strong>&quot;</strong></p>

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

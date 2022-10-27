<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="components/common_css_js.jsp"%>
<meta charset="ISO-8859-1">
<title>MyCart-About</title>
</head>
<body>
	<%@include file="components/navbar.jsp"%>



	<div classs="container fluid mt-4">



		<!-- ======= About Section ======= -->
		<section id="about" class="about">
			<div class="container mt-5">

				<div class="row justify-content-between">
					<div
						class="col-lg-5 d-flex align-items-center justify-content-center about-img">
						<img src="img/team.png" class="img-fluid" alt="Team image"
							data-aos="zoom-in">
					</div>
					<div class="col-lg-6 pt-5 pt-lg-0">
						<section class="home" id="home">

							<h3>HI THERE !</h3>
							<h1>
								I'M <span>abhimanyu singh</span>
							</h1>
							<p>Over 5 years of working experience in developing
								responsive User Interface (UI) for web applications using HTML5,
								CSS3, and JavaScript. Worked with JavaScript frameworks and
								libraries such as, Vue.js and jQuery. Experience in producing
								and consuming RESTful APIs using NodeJS and ExpressJS. Worked
								with both relational (Oracle, MySQL) and document based
								(MongoDB) database systems. Expertise in building automation
								framework using Selenium Web Driver (Java/JUnit4) for various
								applications in retail, revenue protection and credit risk
								spaces. Experience in practicing Agile methodologies.</p>
							<a href="#about"><button class="btn">
									about me <i class="fas fa-user"></i>
								</button></a>

						</section>
						<div class="row">
							<div class="col-md-6" data-aos="fade-up" data-aos-delay="100">
								<i class="bx bx-receipt"></i>
								<h4>Corporis voluptates sit</h4>
								<p>Consequuntur sunt aut quasi enim aliquam quae harum
									pariatur laboris nisi ut aliquip</p>
							</div>
							<div class="col-md-6" data-aos="fade-up" data-aos-delay="200">
								<i class="bx bx-cube-alt"></i>
								<h4>Ullamco laboris nisi</h4>
								<p>Excepteur sint occaecat cupidatat non proident, sunt in
									culpa qui officia deserunt</p>
							</div>
						</div>
					</div>
				</div>

			</div>
		</section>
		<!-- End About Section -->






	</div>



















	<%@include file="components/common_modals.jsp"%>

</body>
</html>
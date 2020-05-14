<<<<<<< HEAD
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
>>>>>>> d852b529a1cbad2c21c853476357c70a875e5522
<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Home</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="" />
  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="assets2/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="assets2/css/icomoon.css">
	<!-- Themify Icons-->
	<link rel="stylesheet" href="assets2/css/themify-icons.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="assets2/css/bootstrap.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="assets2/css/magnific-popup.css">

	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="assets2/css/owl.carousel.min.css">
	<link rel="stylesheet" href="assets2/css/owl.theme.default.min.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="assets2/css/style.css">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
<<<<<<< HEAD
=======
	<script type="text/javascript" src="js/sweetalert2.all.min.js"></script>
>>>>>>> d852b529a1cbad2c21c853476357c70a875e5522
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
		<style>
		.row-mt-15em{
			margin-top: 5em;
		}
	</style>

	</head>
	<body>
		
	<div class="gtco-loader"></div>
	
	<div id="page">

	
	<div class="page-inner">
	
	<header id="gtco-header" class="gtco-cover" role="banner" style="background-image: url(assets2/images/img_4.jpg)">
		<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12 col-md-offset-0 text-left">
					

					<div class="row row-mt-15em">
						<div class="col-md-7 mt-text animate-box" data-animate-effect="fadeInUp">
							<span class="intro-text-small">Welcome to Webstore</span>
						</div>
						<div class="col-md-4 col-md-push-1 animate-box" data-animate-effect="fadeInRight">
							<div class="form-wrap">
								<div class="tab">
									<ul class="tab-menu">
										<li class=" active gtco-first"><a href="#" data-tab="login">Login</a></li>
										<li class=" gtco-second"><a href="#" data-tab="signup">Sign up</a></li>

									</ul>

									<div class="tab-content">
										<div class="tab-content-inner active" data-content="login">
											<form action="UserLoginServlet" method="post">
												<div class="row form-group">
													<div class="col-md-12">
<<<<<<< HEAD
														<label for="number">number</label>
														<input type="text" class="form-control" name="number">
=======
														<label for="id">id</label>
														<input type="text" class="form-control" name="id" value="${username}">
>>>>>>> d852b529a1cbad2c21c853476357c70a875e5522
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<label for="password">Password</label>
														<input type="password" class="form-control" name="password">
													</div>
												</div>

												<div class="row form-group">
													<div class="col-md-12">
<<<<<<< HEAD
														<input type="submit" class="btn btn-primary" value="Login">
														<%--														<input type="text" class="btn btn-primary" value="Login">--%>
														<a href="forget.jsp" class="btn btn-primary" style="display: inline-block;margin-left: 50px;color:#FFFFFF" value="Forget">Forget</a>
=======
														<input type="submit" class="btn btn-primary col-sm-5" value="Login">
														<%--														<input type="text" class="btn btn-primary" value="Login">--%>
														<a href="forget.jsp" class="btn btn-primary col-sm-5 col-sm-push-2" style="display: inline-block;color:#FFFFFF" value="Forget">Forget</a>
>>>>>>> d852b529a1cbad2c21c853476357c70a875e5522

													</div>
												</div>
											</form>
										</div>
										<div class="tab-content-inner" data-content="signup">
											<form action="UserRegisterServlet" method="post">
												<div class="row form-group">
													<div class="col-md-12">
<<<<<<< HEAD
=======
														<label for="id">id</label>
														<input type="text" class="form-control" name="id">
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
>>>>>>> d852b529a1cbad2c21c853476357c70a875e5522
														<label >UserName</label>
														<input type="text" class="form-control" name="username">
													</div>
												</div>
												
												<div class="row form-group">
													<div class="col-md-12">
														<label >SelfDescn</label>
														<input type="text" class="form-control" name="selfdescn">
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
<<<<<<< HEAD
														<label >Number</label>
=======
														<label >Phonenumber</label>
>>>>>>> d852b529a1cbad2c21c853476357c70a875e5522
														<input type="text" class="form-control" name="Phonenumber">
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<label for="password">Password</label>
														<input type="password" class="form-control" name="password">
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<label for="password2">Repeat Password</label>
														<input type="password" class="form-control" name="password2">
													</div>
												</div>
<<<<<<< HEAD
                                                <div class="row form-group">
                                                    <div class="col-md-12">
                                                        <label for="backPassTip">Back Password Tip</label>
                                                        <input type="text" class="form-control" name="backPassTip">
                                                    </div>
                                                </div>

												<div class="row form-group">
													<div class="col-md-12">
														<input type="submit" class="btn btn-primary" value="Sign up">
=======

												<div class="row form-group">
													<div class="col-md-12">
														<input type="submit" class="btn btn-primary col-sm-12" value="Sign up">
>>>>>>> d852b529a1cbad2c21c853476357c70a875e5522
													</div>
												</div>
											</form>	
										</div>



									</div>
								</div>
							</div>
						</div>
					</div>
							
					
				</div>
			</div>
		</div>
	</header>

	</div>

	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
	<!-- jQuery -->
	<script src="assets2/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="assets2/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="assets2/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="assets2/js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="assets2/js/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="assets2/js/jquery.countTo.js"></script>
	<!-- Magnific Popup -->
	<script src="assets2/js/jquery.magnific-popup.min.js"></script>
	<script src="assets2/js/magnific-popup-options.js"></script>
	<!-- Main -->
	<script src="assets2/js/main.js"></script>
<<<<<<< HEAD
=======
	<script type="text/javascript">
		if(${error == 1})
		Swal.fire({
			type:"error",
			title:"账号或密码错误",
			confirmButtonColor:"#007bff",
			confirmButtonText:"确认"
		})
	</script>

>>>>>>> d852b529a1cbad2c21c853476357c70a875e5522

	</body>
</html>


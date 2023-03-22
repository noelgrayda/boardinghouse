<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Grayda's Boarding House</title>
</head>
<body>
<div class="bg-img" style="background-image: url('img/wall-gfd5b265de_1920.jpg');
	height: 100%vh;
	background-size: cover;
	background-repeat: no-repeat;
  ">
  	<section class="container-md p-3 ">
	<div class="container-md">
		<nav>
		  <div class="nav nav-tabs bg-white" id="nav-tab" role="tablist">
		    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Home</button>
		    <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">About Us</button>
		    <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Contact</button>
			<form action="/login">
				<input class="btn btn-outline-white text-primary" type="submit" value="Login">
			</form>
			<form action="/logBoarder">
				<input class="btn btn-outline-white text-primary" type="submit" value="Login Boarder">
			</form>
		  </div>
		</nav>
		<h1 class="text-white fw-bold">Grayda's Boardinghouse</h1>
		<div class="tab-content" id="nav-tabContent">
		  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
	<!-- ==================================== CAROUSEL ======================================= -->
		  	<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel"> 
			  <div class="carousel-inner" role="listbox" style="width:100%; height: 450px !important;">
			    <div class="carousel-item active">
			      <img src="img/boardinghouse1.jpg" class="d-block w-100" alt="boardinghouses image">
			    </div>
			    <div class="carousel-item">
			      <img src="img/students1.jpg" class="d-block w-100 pb-10" alt="students image">
			    </div>
			    <div class="carousel-item">
			      <img src="img/living-room1.jpg" class="d-block w-100" alt="living room image">
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
		  </div>
		  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">
		  <!-- ============================ ABOUT US ============================================ -->	
		  	<div class="container-md bg-light p-5">
				<h3 class="text-primary">About Us</h3>
				<p>	Our boarding house is a comfortable and affordable place to stay for those seeking temporary or long-term accommodation. We offer a home away from home for students, professionals, and travelers. Our mission is to provide a safe, clean, and friendly environment where our guests can relax and focus on their studies or work.
					Our boarding house features a variety of rooms, including single, double, and shared rooms. Each room is equipped with comfortable beds, linens, and storage space for your belongings. Our shared rooms are perfect for those looking to socialize and meet new people, while our single and double rooms provide a quiet and private space for individuals or couples.
					We understand the importance of a balanced diet, which is why we provide nutritious and delicious meals three times a day. Our kitchen staff prepares fresh meals every day using locally sourced ingredients whenever possible. We cater to different dietary requirements, including vegetarian and vegan options.
					Our boarding house is conveniently located near public transportation, making it easy to explore the surrounding area. We are within walking distance of restaurants, cafes, and shops. For those who prefer to stay in, we have a common area where guests can relax, read a book, or watch TV.
					At our boarding house, we prioritize the safety and well-being of our guests. Our building is equipped with security cameras, and our staff is available 24/7 to assist with any needs or concerns. We also have regular cleaning schedules to ensure a hygienic and comfortable environment.
					Thank you for considering our boarding house as your home away from home. We look forward to welcoming you soon!
				</p>
		  	</div>
		  </div>
		  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">
		  <!-- ============================ CONTACT US ========================================== -->
		  <section class="text-center py-2" style="background-color: #005e20;">
		  <h3 class="text-white">Contact us</h3>
		
		  <div class="row m-5">
		    <div class="col-lg-5">
		      <iframe
		        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1023.1724016685037!2d123.91221099842006!3d10.338443077139374!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x33a998e148bd630b%3A0xa61842073d7f7d80!2s8WQ7%2B82W%2C%20Sitio%20Univille%2C%20Cebu%20City%2C%206000%20Cebu!5e0!3m2!1sen!2sph!4v1678357167248!5m2!1sen!2sph%22%20width=%22600%22%20height=%22450%22%20style=%22border:0;%22%20allowfullscreen=%22%22%20loading=%22lazy%22%20referrerpolicy=%22no-referrer-when-downgrade%22"
		        class="h-100 w-100" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
		    </div>
		
		    <div class="col-lg-7">
		      <form method="post" action="/sendEmail">
		        <div class="row">
		          <div class="col-md-9">
		            <div class="row mb-4">
		              <div class="col-md-6 mb-4 mb-md-0">
		                <div class="form-outline">		              
		                  <input type="text" id="form3Example1" class="form-control" name="potentialRenter"/>
		                  <input hidden="true" type="text" name="toEmail" value="noelgrayda@gmail.com"/>
		                  <label class="form-label text-white" for="form3Example1">Your Name</label>		              
		                </div>
		              </div>
		              <div class="col-md-6">
		                <div class="form-outline">
		                  <input type="email" id="form3Example2" class="form-control" name="fromEmail"/>
		                  <label class="form-label text-white" for="form3Example2">Your Email Address</label>
		                </div>
		              </div>
		            </div>
		            <div class="form-outline mb-4">
		              <input type="text" id="form3Example3" class="form-control" name="subject"/>
		              <label class="form-label text-white" for="form3Example3">Subject</label>
		            </div>
		            <div class="form-outline mb-4">
		              <textarea class="form-control" id="form4Example3" rows="4" name="messageBody"></textarea>
		              <label class="form-label text-white" for="form4Example3">Message</label>
		            </div>
		            <div class="text-center text-md-start">
		              <button type="submit" class="btn btn-secondary mb-5 mb-md-0">
		                Send
		              </button>
		            </div>
		          </div>
		          <div class="col-md-3">
		            <ul class="list-unstyled">
		              <li>
		                <i class="fas fa-map-marker-alt fa-2x text-primary"></i>
		                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pin-map text-white" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M3.1 11.2a.5.5 0 0 1 .4-.2H6a.5.5 0 0 1 0 1H3.75L1.5 15h13l-2.25-3H10a.5.5 0 0 1 0-1h2.5a.5.5 0 0 1 .4.2l3 4a.5.5 0 0 1-.4.8H.5a.5.5 0 0 1-.4-.8l3-4z"/>
						  <path fill-rule="evenodd" d="M8 1a3 3 0 1 0 0 6 3 3 0 0 0 0-6zM4 4a4 4 0 1 1 4.5 3.969V13.5a.5.5 0 0 1-1 0V7.97A4 4 0 0 1 4 3.999z"/>
						</svg>
		                <p class="text-white"><small>Cebu, CEB 6000, PHL</small></p>
		              </li>
		              <li>
		                <i class="fas fa-phone fa-2x text-primary"></i>
		                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-telephone-fill text-white" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
						</svg>
		                <p class="text-white"><small>(032) 255-1234</small></p>
		              </li>
		              <li>
		                <i class="fas fa-envelope fa-2x text-primary"></i>
		                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-envelope text-white" viewBox="0 0 16 16">
						  <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
						</svg>
		                <p class="text-white"><small>gbhouse@gmail.com</small></p>
		              </li>
		            </ul>
		          </div>
		        </div>
		      </form>
		
		    </div>
		  	</div>
			</section>
		  </div>
		</div>
	</div>

<!-- ========================== FOOTER DESIGN =============================================== -->
		 <!-- Remove the container if you want to extend the Footer to full width. -->
		<div class="container my-5">
		  <!-- Footer -->
		  <footer
		          class="text-center text-lg-start text-dark"
		          style="background-color: #ECEFF1"
		          >
		    <!-- Section: Social media -->
		    <section
		             class="d-flex justify-content-between p-4 text-white"
		             style="background-color: #005e20;"
		             >
		      <!-- Left -->
		      <div class="me-5">
		        <span style="font-weight: bold; color: white;">Get connected with us on social networks:</span>
		      </div>
		      <!-- Left -->
		
		      <!-- Right -->
		      <div>
		        <a href="" class="text-white me-4">
		          <i class="fab fa-facebook-f"></i>
		          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
				  	<path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"/>
				  </svg>
		        </a>
		        <a href="" class="text-white me-4">
		          <i class="fab fa-twitter"></i>
		          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-twitter" viewBox="0 0 16 16">
				  	<path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z"/>
				  </svg>
		        </a>
		        <a href="" class="text-white me-4">
		          <i class="fab fa-google"></i>
		          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-google" viewBox="0 0 16 16">
				  	<path d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z"/>
				  </svg>
		        </a>
		        <a href="" class="text-white me-4">
		          <i class="fab fa-instagram"></i>
		          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-instagram" viewBox="0 0 16 16">
				 	<path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"/>
				  </svg>
		        </a>
		        <a href="" class="text-white me-4">
		          <i class="fab fa-linkedin"></i>
				  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-linkedin" viewBox="0 0 16 16">
				  	<path d="M0 1.146C0 .513.526 0 1.175 0h13.65C15.474 0 16 .513 16 1.146v13.708c0 .633-.526 1.146-1.175 1.146H1.175C.526 16 0 15.487 0 14.854V1.146zm4.943 12.248V6.169H2.542v7.225h2.401zm-1.2-8.212c.837 0 1.358-.554 1.358-1.248-.015-.709-.52-1.248-1.342-1.248-.822 0-1.359.54-1.359 1.248 0 .694.521 1.248 1.327 1.248h.016zm4.908 8.212V9.359c0-.216.016-.432.08-.586.173-.431.568-.878 1.232-.878.869 0 1.216.662 1.216 1.634v3.865h2.401V9.25c0-2.22-1.184-3.252-2.764-3.252-1.274 0-1.845.7-2.165 1.193v.025h-.016a5.54 5.54 0 0 1 .016-.025V6.169h-2.4c.03.678 0 7.225 0 7.225h2.4z"/>
				  </svg>
		        </a>
		        <a href="" class="text-white me-4">
		          <i class="fab fa-github"></i>
		          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-github" viewBox="0 0 16 16">
				  	<path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z"/>
				  </svg>
		        </a>
		      </div>
		      <!-- Right -->
		    </section>
		    <!-- Section: Social media -->
		
		    <!-- Section: Links  -->
		    <section class="">
		      <div class="container text-center text-md-start mt-5">
		        <!-- Grid row -->
		        <div class="row mt-3">
		          <!-- Grid column -->
		          <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
		            <!-- Content -->
		            <h6 class="text-uppercase fw-bold">Grayda's Boardinghouse</h6>
		            <hr
		                class="mb-4 mt-0 d-inline-block mx-auto"
		                style="width: 60px; background-color: #7c4dff; height: 2px"
		                />
		            <p>
		              A house that can feel you safe, happy, and feels like home even you're 
		              away abode.
		            </p>
		          </div>
		          <!-- Grid column -->
		
		          <!-- Grid column -->
		          <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
		            <!-- Links -->
		            <h6 class="text-uppercase fw-bold">Rooms</h6>
		            <hr
		                class="mb-4 mt-0 d-inline-block mx-auto"
		                style="width: 60px; background-color: #7c4dff; height: 2px"
		                />
		            <p>
		              <a href="#!" class="text-dark">Deluxe Room</a>
		            </p>
		            <p>
		              <a href="#!" class="text-dark">Bedspacer Rooms</a>
		            </p>
		            <p>
		              <a href="#!" class="text-dark">Attic</a>
		            </p>
		            <p>
		              <a href="#!" class="text-dark">Ordinary Rooms</a>
		            </p>
		          </div>
		          <!-- Grid column -->
		
		          <!-- Grid column -->
		          <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
		            <!-- Links -->
		            <h6 class="text-uppercase fw-bold">Useful links</h6>
		            <hr
		                class="mb-4 mt-0 d-inline-block mx-auto"
		                style="width: 60px; background-color: #7c4dff; height: 2px"
		                />
		            <p>
		              <a href="#!" class="text-dark">Your Account</a>
		            </p>
		            <p>
		              <a href="#!" class="text-dark">Become an Affiliate</a>
		            </p>
		            <p>
		              <a href="#!" class="text-dark">Shipping Rates</a>
		            </p>
		            <p>
		              <a href="#!" class="text-dark">Help</a>
		            </p>
		          </div>
		          <!-- Grid column -->
		
		          <!-- Grid column -->
		          <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
		            <!-- Links -->
		            <h6 class="text-uppercase fw-bold">Contact</h6>
		            <hr
		                class="mb-4 mt-0 d-inline-block mx-auto"
		                style="width: 60px; background-color: #7c4dff; height: 2px"
		                />
		            <p><i class="fas fa-home mr-3"></i> Cebu City, Cebu 6000, PH</p>
		            <p><i class="fas fa-envelope mr-3"></i> gbhouse@gmail.com</p>
		            <p><i class="fas fa-phone mr-3"></i> + 032 255 1234</p>
		            <p><i class="fas fa-print mr-3"></i> + 032 234 5678</p>
		          </div>
		          <!-- Grid column -->
		        </div>
		        <!-- Grid row -->
		      </div>
		    </section>
		    <!-- Section: Links  -->
		
		    <!-- Copyright -->
		    <div
		         class="text-center p-3"
		         style="background-color: rgba(0, 0, 0, 0.2)"
		         >
		      © 2020 Copyright:
		      <a class="text-dark" href="https://mdbootstrap.com/"
		         >MDBootstrap.com</a
		        >
		    </div>
		    <!-- Copyright -->
		  </footer>
		  <!-- Footer -->
		</div>
		<!-- End of .container -->
	    </section>

</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
</body>
</html>
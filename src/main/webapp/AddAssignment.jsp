<%@page import="java.util.ArrayList"%>
<%@page import="com.engisphere.entity.assignment"%>
<%@page import="com.engisphere.dao.assignmentDao"%>
<%@page import="com.engisphere.entity.course"%>
<%@page import="com.engisphere.dao.DatabaseConnection"%>
<%@page import="com.engisphere.dao.courseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>




<%
/* course c = (course) request.getAttribute("course"); */

/* String SId =  (String)session.getAttribute("id");

int Id = Integer.parseInt(SId); */

int sessionId = (Integer) session.getAttribute("id");

//Get ID from request parameter (if available)
String paramId = request.getParameter("id");

int Id = -1; // Default invalid ID

//Use the request parameter first, else fallback to session ID
if (paramId != null) {
	Id = Integer.parseInt(paramId);
	// Store in session for future use
} else if (sessionId != 0) {
	Id = (sessionId);
}

courseDao cdao = new courseDao(DatabaseConnection.connect());

course c1 = cdao.getCourseById(Id);




assignmentDao aDao = new assignmentDao(DatabaseConnection.connect());


ArrayList<assignment> assignmentList = aDao.getAllAssignment();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>course</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap"
	rel="stylesheet">

<script defer
	src="https://cdn.jsdelivr.net/npm/@coreui/coreui-pro@5.10.0/dist/js/coreui.bundle.min.js"></script>

<!-- <script src="script.js"></script> -->
<script src="script.js"></script>


<style>
.roboto-100 {
	font-family: "Roboto", sans-serif;
	font-optical-sizing: auto;
	font-weight: 100;
	font-style: normal;
	font-variation-settings: "wdth" 100;
}

.roboto-300 {
	font-family: "Roboto", sans-serif;
	font-optical-sizing: auto;
	font-weight: 300;
	font-style: normal;
	font-variation-settings: "wdth" 100;
}

.roboto-400 {
	font-family: "Roboto", sans-serif;
	font-optical-sizing: auto;
	font-weight: 400;
	font-style: normal;
	font-variation-settings: "wdth" 100;
}

.roboto-200 {
	font-family: "Roboto", sans-serif;
	font-optical-sizing: auto;
	font-weight: 200;
	font-style: normal;
	font-variation-settings: "wdth" 100;
}
 .navbar-brand:hover svg {
  fill: #007bff; /* Change color on hover */
        transform: scale(1.5); /* Slightly increase size */
        transition: fill 0.3s ease-in-out, transform 0.3s ease-in-out;
    }
</style>
</head>
<body class="  mx-4 mt-3 pt-5">


	<%
	String successMessage = (String) session.getAttribute("Assignment");
	String errorMessage = (String) session.getAttribute("error");
	%>




	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="TeacherDashboard.jsp">Home</a></li>
			<li class="breadcrumb-item"><a
				href="CourseDisplay.jsp?id=<%=c1.getId()%>">Course <%=c1.getCourseName()%>(
					<%=c1.getCourseCode()%>)
			</a></li>
			<%-- <li class="breadcrumb-item active" aria-current="page">Course <%=c1.getCourseName()%>(
				<%=c1.getCourseCode()%>)
			</li>  --%>
			<li class="breadcrumb-item active" aria-current="page">Add
				Assignment</li>


		</ol>
	</nav>



	<nav class="navbar bg-body-tertiary fixed-top p-1">
		<div class="container-fluid justify-content-between">
			<div class="d-flex mx-2">
				<button class="navbar-toggler  fixed-left" type="button"
					data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
					aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class=" mx-3 ">
					<h2>Engisphere</h2>
				</div>
			</div>
			<div class="">
				<a class="navbar-brand " href="#"><svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="000000"><path d="M160-200v-80h80v-280q0-83 50-147.5T420-792v-28q0-25 17.5-42.5T480-880q25 0 42.5 17.5T540-820v28q80 20 130 84.5T720-560v280h80v80H160Zm320-300Zm0 420q-33 0-56.5-23.5T400-160h160q0 33-23.5 56.5T480-80ZM320-280h320v-280q0-66-47-113t-113-47q-66 0-113 47t-47 113v280Z"/></svg></a>
			</div>



			<div class="offcanvas offcanvas-start" tabindex="-1"
				id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
				<div class="offcanvas-header">
					<h5 class="offcanvas-title" id="offcanvasNavbarLabel">Engisphere</h5>
					<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
						aria-label="Close"></button>
				</div>
				<div class="offcanvas-body">
					<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Announcements</a>
						</li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> Dropdown </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">Action</a></li>
								<li><a class="dropdown-item" href="#">Another action</a></li>
								<li>
									<hr class="dropdown-divider">
								</li>
								<li><a class="dropdown-item" href="#">Something else
										here</a></li>
							</ul></li>
					</ul>
					<form class="d-flex mt-3" role="search">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</div>
			</div>
		</div>
	</nav>






	<!-- vision mission and date  -->
	<div class="container-fluid  pb-3">
		<div class="row">
			<div class=" container d-flex col-12 col-md-9">




				<div class="border w-100 border-light-subtle p-3">



					<p class="roboto-400 fs-1">
						<%=c1.getCourseName()%></p>

					<p class="roboto-100 fs-2"><%=c1.getCourseCode()%></p>

					<hr>


					<p class="roboto-400 fs-1">Add Assignment</p>


					<form id="courseForm" action="AddAssignmentController"
						method="post">
						<input type="hidden" name="id" value="<%=c1.getId()%>">

						<div class="mb-3">
							<label for="title" class="form-label">Title</label> <input
								type="text" class="form-control" name="title">
						</div>

						<div class="mb-3">
							<label for="description" class="form-label">Description</label> <input
								type="url" class="form-control" name="description"
								placeholder="Enter Assignment description document URL" required>
						</div>

						<div class="mb-3">
							<label for="dueDateTime" class="form-label">Due Date &
								Time</label> <input type="datetime-local" class="form-control"
								name="dueDateTime" required>
						</div>

						<!-- Buttons -->
						<div class="mb-3">
							<button type="submit" class="btn btn-primary">Submit</button>
							<button type="reset" class="btn btn-secondary" id="resetBtn"
								onclick="resetForm()">Reset</button>

							<%
							if (successMessage != null) {
							%>
							<div class="mt-3" style="color: green;" role="alert">
								<%=successMessage%>
							</div>
							<%
							session.removeAttribute("Assignment"); // Remove success message after displaying
							%>
							<%
							}
							%>

							<%
							if (errorMessage != null) {
							%>
							<div class=" mt-3" style="color: red;" role="alert">
								<%=errorMessage%>
							</div>
							<%
							session.removeAttribute("error");
							%>
							<%
							}
							%>
							<p></p>
						</div>
					</form>












					</p>





				</div>
				<%-- <div>
            <div class="container mt-4 ">
 
    
    

    <h2>Course Details</h2>
    <p><strong>ID:</strong> <%= c1.getId() %></p>
    <p><strong>Course Code:</strong> <%= c1.getCourseCode() %></p>
    <p><strong>Course Name:</strong> <%= c1.getCourseName() %></p>
    <p><strong>Syllabus:</strong> <%= c1.getSyllabus() %></p>

   

    
</div>
                   

                </div> --%>
			</div>
			<div
				class=" d-sm-none  d-md-block  d-lg-block d-xl-block d-xxl-block  col-md-3">

				<div class=" border border-light-subtle pt-4 pb-4 container ">
					<div class=" text-center">
						<div class="card-body">
							<h5 class="card-title">Current Date & Time</h5>
							<p class="card-text" id="currentDateTime"></p>
						</div>

						<hr class=" pt-2">

						<!-- Simple To-Do List -->
						<div>
							<h6 class="text-center">To-Do List</h6>
							<input type="text" id="todoInput" class="form-control mb-2"
								placeholder="Add new task">
							<button class="btn btn-primary btn-sm w-100" onclick="addTask()">Add
								Task</button>
							<ul id="todoList" class="list-group mt-2"></ul>
						</div>
					</div>
				</div>


			</div>
		</div>

	</div>
	<!--end  vision mission and date  -->

<div class="container-fluid pt-4 ">

		<div class="border border-light-subtle p-3">



				<div class="d-flex px-5 justify-content-between">
				<p class="col roboto-400 fs-3">
					<u>Assignments </u>
				</p>
				
				<!-- Button to Open Modal -->
				
			</div>


			<hr>
			<% 
			for (assignment temp : assignmentList) {
							
							
						%>
						
						
						
						
					<%-- <a class="nav-link active" aria-current="page"  href="AssignmentDisplay.jsp?id=<%=temp.getAssignid() %>">Assignment - <%=temp.getTitle()  %></a>  --%>
					
						<div>
				<div class="container mt-4">


					<div class=" pt-4">
						<div >

							<p class="roboto-400 fs-4" >Assignment Number <%=temp.getAssignid() %></p>
							<p> <a>Assignment Name :- <%=temp.getTitle() %></a></p>
							
							
							
							<a href="<%=temp.getDescription()%>"> <svg
							xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="50"
							height="50" viewBox="0,0,256,256">
                        <g fill="#00a0ff" fill-rule="nonzero"
								stroke="none" stroke-width="1" stroke-linecap="butt"
								stroke-linejoin="miter" stroke-miterlimit="10"
								stroke-dasharray="" stroke-dashoffset="0" font-family="none"
								font-weight="none" font-size="none" text-anchor="none"
								style="mix-blend-mode: normal">
							<g transform="scale(5.12,5.12)">
							<path
								d="M12.5,11c-1.93,0 -3.5,1.57 -3.5,3.5v21c0,0.537 0.13066,1.03914 0.34766,1.49414l4.01367,-12.89062c0.578,-1.856 2.2738,-3.10352 4.2168,-3.10352h22.90039c0.179,0 0.34848,0.03455 0.52148,0.06055v-3.56055c0,-1.93 -1.57,-3.5 -3.5,-3.5h-15c-0.538,0 -1.071,-0.178 -1.5,-0.5l-2.40039,-1.80078c-0.601,-0.451 -1.34661,-0.69922 -2.09961,-0.69922zM17.57813,22c-1.503,0 -2.81277,0.96439 -3.25977,2.40039l-4.24023,13.61523c0.629,0.606 1.48087,0.98438 2.42188,0.98438h23.51172c1.376,0 2.59011,-0.79181 3.16211,-2.00781l3.67773,-11.76172c0.239,-0.764 0.10486,-1.5718 -0.36914,-2.2168c-0.226,-0.308 -0.88591,-1.01367 -2.00391,-1.01367z"></path></g></g>
                        </svg>
                        Assignment description

					</a>
					
					<%
					
					 String storedDueDate = "2025-03-28 23:59:59"; // Example stored date
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMM yyyy, hh:mm a");
					 
    LocalDateTime dueDate = LocalDateTime.parse(storedDueDate, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    String formattedDate = dueDate.format(formatter);
					 
    

					%>
					
					<p>Due Date: <strong><%= formattedDate %></strong></p>
					
					<button type="button" class="btn btn-outline-primary"
					>view Submissions</button>
					
					<hr>
						</div>
					</div>



				</div>





			</div>
					
					
					
					<%
						}
						%>

		






		</div>

		<div>
			<p></p>
		</div>


	</div> 

	<!-- Modal -->
	<div class="modal fade" id="courseModal" tabindex="-1"
		aria-labelledby="courseModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="courseModalLabel">Create
						Assignment</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- Course Creation Form -->
					<form id="courseForm" action="AddAssignmentController"
						method="post">

						<%-- 	<input type="hidden" name="id"
							value="<%=c1.getId() %>"> --%>

						<div class="mb-3">
							<label for="title" class="form-label">Title</label> <input
								type="text" class="form-control" name="title">
						</div>



						<div class="mb-3">
							<label for="description" class="form-label">Description</label> <input
								type="url" class="form-control" name="description"
								placeholder="Enter Assignment description document URL" required>
						</div>


						<div class="mb-3">
							<label for="dueDateTime" class="form-label">Due Date &
								Time</label> <input type="datetime-local" class="form-control"
								name="dueDateTime" required>
						</div>

					</form>
				</div>
				<div class="modal-footer">

					<button type="close" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>

					<button type="reset" class="btn btn-secondary" id="resetBtn"
						onclick="resetForm()">Reset</button>
					<button type="submit" class="btn btn-primary" form="courseForm">Save
						Course</button>

				</div>
			</div>
		</div>
	</div>




















	<!-- Footer -->
	<footer
		class="text-center text-lg-start bg-body-tertiary text-muted p-1">
		<!-- Section: Social media -->
		<!-- <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
      <!-- Left -->
		<!--      
       -->

		<!-- Right -->
		<!-- <div>
        <a href="" class="me-4 text-reset">
          <i class="fab fa-facebook-f"></i>
        </a>
        <a href="" class="me-4 text-reset">
          <i class="fab fa-twitter"></i>
        </a>
        <a href="" class="me-4 text-reset">
          <i class="fab fa-google"></i>
        </a>
        <a href="" class="me-4 text-reset">
          <i class="fab fa-instagram"></i>
        </a>
        <a href="" class="me-4 text-reset">
          <i class="fab fa-linkedin"></i>
        </a>
        <a href="" class="me-4 text-reset">
          <i class="fab fa-github"></i>
        </a>
      </div>
      <!-- Right -->
		<!-- </section-->
		<!-- Section: Social media -->

		<!-- Section: Links  -->
		<section class=" ">
			<div class="container text-center text-md-start mt-5">
				<!-- Grid row -->
				<div class="row mt-3">
					<!-- Grid column -->
					<div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
						<!-- Content -->
						<h6 class="text-uppercase fw-bold mb-4">
							<i class="fas fa-gem me-3"></i>Engisphere
						</h6>
						<p>Engisphere simplifies college management with efficient
							assignment tracking and student engagement tools.</p>
					</div>
					<!-- Grid column -->

					<!-- Grid column -->
					<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
						<!-- Links -->
						<h6 class="text-uppercase fw-bold mb-4">Products</h6>
						<p>
							<a href="#!" class="text-reset">Angular</a>
						</p>
						<!-- <p>
              <a href="#!" class="text-reset">React</a>
            </p>
            <p>
              <a href="#!" class="text-reset">Vue</a>
            </p>
            <p>
              <a href="#!" class="text-reset">Laravel</a>
            </p> -->
					</div>
					<!-- Grid column -->

					<!-- Grid column -->
					<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
						<!-- Links -->
						<h6 class="text-uppercase fw-bold mb-4">Useful links</h6>
						<p>
							<a href="#!" class="text-reset">Pricing</a>
						</p>
						<!-- <p>
              <a href="#!" class="text-reset">Settings</a>
            </p>
            <p>
              <a href="#!" class="text-reset">Orders</a>
            </p>
            <p>
              <a href="#!" class="text-reset">Help</a>
            </p> -->
					</div>
					<!-- Grid column -->

					<!-- Grid column -->
					<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
						<!-- Links -->
						<h6 class="text-uppercase fw-bold mb-4">Contact</h6>
						<p>
							<i class="fas fa-home me-3"></i> Pune, Maharastra, India
						</p>
						<p>
							<i class="fas fa-envelope me-3"></i> engisphere@example.com
						</p>
						<p>
							<i class="fas fa-phone me-3"></i> + 01 234 567 88
						</p>
						<p>
							<i class="fas fa-print me-3"></i> + 01 234 567 89
						</p>
					</div>
					<!-- Grid column -->
				</div>
				<!-- Grid row -->
			</div>
		</section>
		<!-- Section: Links  -->

		<!-- Copyright -->
		<div class="text-center p-4"
			style="background-color: rgba(0, 0, 0, 0.05);">
			© 2025 Copyright: <a class="text-reset fw-bold"
				href="https://mdbootstrap.com/">Engisphere.com</a>
		</div>
		<!-- Copyright -->
	</footer>
	<!-- Footer -->


</body>
</html>
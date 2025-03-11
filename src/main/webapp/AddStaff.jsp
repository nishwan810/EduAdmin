<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Staff Entry Form</title>
    <%-- <%@include file="bootstrapSupport.jsp"%> --%>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        .form-container {
            max-width: 700px;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
            margin: auto;
            margin-top: 50px;
        }
        .header-box {
            background-color: #28a745;
            color: white;
            text-align: center;
            padding: 10px;
            border-radius: 5px;
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .btn-submit {
            background-color: blue;
            color: white;
        }
        .btn-reset {
            background-color: red;
            color: white;
        }
    </style>
</head>
<body class="bg-light">

<%@include file="AdminNavBar.jsp" %>

<div class="container">
    <div class="form-container">
        <div class="header-box">Staff Entries</div>
        
        <form action="AddStaffController" method="post">
            <div class="row g-3">
                <div class="col-md-6">
                    <label class="form-label">First Name</label>
                    <input type="text" class="form-control" name="firstName" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Last Name</label>
                    <input type="text" class="form-control" name="lastName" required>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Contact</label>
                    <input type="text" class="form-control" name="contact" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Address</label>
                    <input type="text" class="form-control" name="address" required>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Email</label>
                    <input type="email" class="form-control" name="email" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Password</label>
                    <input type="password" class="form-control" name="password" required>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Joining Date</label>
                    <input type="date" class="form-control" name="joiningDate" required>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Job Profession</label>
                    <select class="form-control" name="course" id="course" onchange="updateWorkField()" required>
                        <option value="">Select Course</option>
                        <option value="Accountant">Accountant</option>
                        <option value="Teacher">Teacher</option>
                        <option value="Other">Other</option>
                    </select>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Salary</label>
                    <input type="text" class="form-control" name="salary" required>
                </div>

                <div class="col-md-6" id="workField">
                    <label class="form-label">Work</label>
                    <input type="text" class="form-control" name="work" id="workInput">
                </div>
            </div>
            
            <div>
            <%
				String successMessage = (String) session.getAttribute("success");
				String errorMessage = (String) session.getAttribute("error");
				%>
				<div id="messageBox">

					<%
					if (successMessage != null) {
					%>
					<div class="mt-3" style="color: green;" role="alert">
						<%=successMessage%>
					</div>
					<%
					session.removeAttribute("success"); // Remove success message after displaying
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
            
            </div>
            	<script>
					setTimeout(function() {
						var messageBox = document.getElementById("messageBox");
						if (messageBox) {
							messageBox.style.display = "none";
						}
					}, 4000);
				</script>
            

            <div class="d-flex justify-content-between mt-4">
                <button type="submit" class="btn btn-primary px-4">Submit</button>
                <button type="reset" class="btn btn-danger px-4">Reset</button>
            </div>
        </form>
    </div>
    
				
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>




<script>


    function updateWorkField() {
        var course = document.getElementById("course").value;
        var workField = document.getElementById("workField");
        var workInput = document.getElementById("workInput");

        if (course === "Teacher") {
            workInput.placeholder = "Enter Subject Name";
            workInput.type = "text";
        } else if (course === "Accountant") {
            workInput.type = "text";
            workInput.placeholder = "Enter Accountant Role (e.g. Payroll, Audit)";
        } else {
            workInput.type = "text";
            workInput.placeholder = "Enter Work Details";
        }
    }
</script>

</body>
</html>

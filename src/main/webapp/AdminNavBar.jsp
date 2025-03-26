<!-- Bootstrap Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark py-3">
    <div class="container">
        <!-- Brand with Logo -->
        <a class="navbar-brand fw-bold" href="#">
            EngiSphere
        </a>

        <!-- Navbar Toggler -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navbar Content -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <!-- Left-Aligned Links -->
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link active" href="AdminDashboard.jsp">Home</a></li>

                <!-- Student Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="studentDropdown" role="button" data-bs-toggle="dropdown">Student</a>
                    <ul class="dropdown-menu" aria-labelledby="studentDropdown">
                        <li><a class="dropdown-item" href="AddStudent.jsp">Add Student</a></li>
                        <li><a class="dropdown-item" href="DisplayStudent.jsp">Display Student</a></li>
                    </ul>
                </li>

                <!-- Staff Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="staffDropdown" role="button" data-bs-toggle="dropdown">Staff</a>
                    <ul class="dropdown-menu" aria-labelledby="staffDropdown">
                        <li><a class="dropdown-item" href="AddStaff.jsp">Add Staff</a></li>
                        <li><a class="dropdown-item" href="DisplayStaff.jsp">Display Staff</a></li>
                    </ul>
                </li>


				<li class="nav-item"><a class="nav-link"
					href="SendNotification.jsp"> <i class="fas fa-bell"></i>
						Notifications
				</a></li>
			</ul>


            <!-- Search Bar (Right-Aligned) -->
            <form class="d-flex ms-auto me-3">
                <input class="form-control me-2" type="search" placeholder="Search">
                <button class="btn btn-outline-light" type="submit">Search</button>
            </form>

            <!-- Logout Button (Right-Aligned) -->
            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#logoutModal">Logout</button>
        </div>
    </div>
</nav>

<!-- Logout Confirmation Modal -->
<div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title " id="logoutModalLabel">Confirm Logout</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Are you sure you want to logout?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <a href="LoginPage.jsp" class="btn btn-danger">Logout</a>
            </div>
        </div>
    </div>
</div>


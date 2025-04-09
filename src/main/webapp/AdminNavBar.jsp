<!-- Bootstrap Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-black py-2 shadow-sm">
    <div class="container">
        <!-- Brand with Logo -->
        <a class="navbar-brand d-flex align-items-center" href="AdminDashboard.jsp">
            <i class="fas fa-graduation-cap fa-xl text-white me-2"></i>
            <span class="fw-bold fs-4 text-white">EngiSphere</span>
        </a>

        <!-- Navbar Toggler -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navbar Content -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <!-- Left-Aligned Links -->
            <ul class="navbar-nav me-auto">
             
                <!-- Student Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle d-flex align-items-center text-white" href="#" id="studentDropdown"
                        role="button" data-bs-toggle="dropdown">
                        <i class="fas fa-user-graduate me-1"></i> Student
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="studentDropdown">
                        <li><a class="dropdown-item" href="AddStudent.jsp">
                            <i class="fas fa-user-plus me-2"></i>Add Student
                        </a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="DisplayStudent.jsp">
                            <i class="fas fa-list me-2"></i>Display Students
                        </a></li>
                    </ul>
                </li>

                <!-- Staff Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle d-flex align-items-center text-white" href="#" id="staffDropdown"
                        role="button" data-bs-toggle="dropdown">
                        <i class="fas fa-chalkboard-teacher me-1"></i> Staff
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="staffDropdown">
                        <li><a class="dropdown-item" href="AddStaff.jsp">
                            <i class="fas fa-user-plus me-2"></i>Add Staff
                        </a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="DisplayStaff.jsp">
                            <i class="fas fa-list me-2"></i>Display Staff
                        </a></li>
                    </ul>
                </li>

                <li class="nav-item">
                    <a class="nav-link d-flex align-items-center text-white" href="SendNotification.jsp">
                        <i class="fas fa-bell me-1"></i> Notifications
                  
                    </a>
                </li>
            </ul>

            <!-- Logout Button -->
            <button type="button" class="btn btn-outline-light" data-bs-toggle="modal"
                data-bs-target="#logoutModal">
                <i class="fas fa-sign-out-alt me-1"></i> Logout
            </button>
        </div>
    </div>
</nav>

<!-- Logout Confirmation Modal -->
<div class="modal fade" id="logoutModal" tabindex="-1"
    aria-labelledby="logoutModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-black text-white">
                <h5 class="modal-title" id="logoutModalLabel">
                    <i class="fas fa-sign-out-alt me-2"></i> Confirm Logout
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                    aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to logout of your account?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                    <i class="fas fa-times me-1"></i> Cancel
                </button>
                <a href="LoginPage.jsp" class="btn btn-danger">
                    <i class="fas fa-sign-out-alt me-1"></i> Logout
                </a>
            </div>
        </div>
    </div>
</div>
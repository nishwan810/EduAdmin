<!-- Bootstrap Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark py-3">
    <div class="container">
        <!-- Brand -->
        <a class="navbar-brand fw-bold" href="#">EngiSphere</a>

        <!-- Navbar Toggler -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navbar Content -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <!-- Left-Aligned Links -->
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link active" href="#">Home</a></li>

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
            </ul>

            <!-- Search Bar (Right-Aligned) -->
            <form class="d-flex ms-auto">
                <input class="form-control me-2" type="search" placeholder="Search">
                <button class="btn btn-outline-light" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>

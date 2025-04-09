<%@page import="com.engisphere.dao.DatabaseConnection"%>
<%@page import="com.engisphere.dao.StaffDao"%>
<%@page import="com.engisphere.entity.StaffEntities"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Teacher Details</title>
    <%@include file="bootstrapSupport.jsp"%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --accent-color: #4895ef;
            --light-color: #f8f9fa;
            --dark-color: #212529;
        }

        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            font-family: 'Roboto', sans-serif;
        }

        .profile-card {
            max-width: 700px;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            border: none;
            background: white;
            margin: 0 auto;
        }

        .profile-header {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            padding: 2rem;
            color: white;
            text-align: center;
        }

        .profile-pic {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            border: 5px solid white;
            object-fit: cover;
            margin-bottom: 1rem;
        }

        .teacher-name {
            font-weight: 700;
            margin-bottom: 0.5rem;
            font-size: 1.8rem;
        }

        .teacher-id {
            font-weight: 300;
            opacity: 0.9;
            font-size: 1.1rem;
        }

        .divider {
            height: 2px;
            background: linear-gradient(90deg, transparent 0%, rgba(255,255,255,0.5) 50%, transparent 100%);
            margin: 1rem 0;
        }

        .details-section {
            padding: 2rem;
        }

        .detail-item {
            margin-bottom: 1.2rem;
            display: flex;
            align-items: flex-start;
        }

        .detail-icon {
            width: 40px;
            height: 40px;
            background: var(--light-color);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            color: var(--primary-color);
            font-size: 1.1rem;
            flex-shrink: 0;
        }

        .detail-label {
            font-weight: 600;
            color: var(--dark-color);
            margin-bottom: 0.2rem;
        }

        .detail-value {
            color: #555;
            font-weight: 400;
        }

        .attendance-badge {
            background: linear-gradient(135deg, #4cc9f0 0%, #4895ef 100%);
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 50px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            box-shadow: 0 4px 10px rgba(72, 149, 239, 0.3);
        }

        .attendance-icon {
            margin-right: 0.5rem;
            font-size: 1.2rem;
        }

        .btn-back {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            border: none;
            padding: 0.8rem 2rem;
            border-radius: 50px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(67, 97, 238, 0.3);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-decoration: none;
        }

        .btn-back:hover {
            transform: translateY(-2px);
            box-shadow: 0 7px 20px rgba(67, 97, 238, 0.4);
        }

        .btn-back i {
            margin-right: 0.5rem;
        }

        .not-found-card {
            max-width: 500px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            background: white;
        }

        /* Align all detail items to left */
        .details-section .row > div {
            text-align: left;
        }
    </style>
</head>
<body>
    <%@include file="AdminNavBar.jsp"%>

    <%
    StaffDao sdao = new StaffDao(DatabaseConnection.connect());
    int staffId = Integer.parseInt(request.getParameter("id"));
    double attendancePercentage = sdao.getStaffAttendancePercentage(staffId);
    StaffEntities teacher = (StaffEntities) request.getAttribute("teacher");
    %>

    <div class="container py-5">
        <div class="row justify-content-center align-items-center text-center">
            <% if (teacher == null) { %>
            <div class="col-md-8">
                <div class="not-found-card p-4 text-center">
                    <div class="p-4">
                        <i class="fas fa-user-slash text-danger mb-3" style="font-size: 3rem;"></i>
                        <h3 class="fw-bold mb-3">Teacher Not Found</h3>
                        <p class="mb-4">The requested teacher record could not be found in our database.</p>
                        <a href="DisplayStaff.jsp" class="btn-back">
                            <i class="fas fa-arrow-left"></i> Back to Staff List
                        </a>
                    </div>
                </div>
            </div>
            <% } else { %>
            <div class="col-12 col-sm-10 col-md-8 col-lg-6">
                <div class="profile-card">
                    <div class="profile-header">
                        <img src="images/staff-illustration.png" alt="Teacher" class="profile-pic">
                        <h1 class="teacher-name"><%= teacher.getFirstName() %> <%= teacher.getLastName() %></h1>
                        <p class="teacher-id">Staff ID: <%= teacher.getId() %></p>
                        <div class="divider"></div>
                        <div class="attendance-badge">
                            <i class="fas fa-calendar-check attendance-icon"></i>
                            Attendance: <%= String.format("%.2f", attendancePercentage) %>% 
                        </div>
                    </div>

                    <div class="details-section">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="detail-item">
                                    <div class="detail-icon"><i class="fas fa-id-card"></i></div>
                                    <div>
                                        <p class="detail-label">Contact</p>
                                        <p class="detail-value"><%= teacher.getContact() %></p>
                                    </div>
                                </div>

                                <div class="detail-item">
                                    <div class="detail-icon"><i class="fas fa-envelope"></i></div>
                                    <div>
                                        <p class="detail-label">Email</p>
                                        <p class="detail-value"><%= teacher.getEmail() %></p>
                                    </div>
                                </div>

                                <div class="detail-item">
                                    <div class="detail-icon"><i class="fas fa-map-marker-alt"></i></div>
                                    <div>
                                        <p class="detail-label">Address</p>
                                        <p class="detail-value"><%= teacher.getAddress() %></p>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="detail-item">
                                    <div class="detail-icon"><i class="fas fa-calendar-day"></i></div>
                                    <div>
                                        <p class="detail-label">Joining Date</p>
                                        <p class="detail-value"><%= teacher.getJoiningDate() %></p>
                                    </div>
                                </div>

                                <div class="detail-item">
                                    <div class="detail-icon"><i class="fas fa-user-tie"></i></div>
                                    <div>
                                        <p class="detail-label">Job Profession</p>
                                        <p class="detail-value"><%= teacher.getJobProfession() %></p>
                                    </div>
                                </div>

                                <div class="detail-item">
                                    <div class="detail-icon"><i class="fas fa-briefcase"></i></div>
                                    <div>
                                        <p class="detail-label">Work</p>
                                        <p class="detail-value"><%= teacher.getWork() %></p>
                                    </div>
                                </div>

                                <div class="detail-item">
                                    <div class="detail-icon"><i class="fas fa-money-bill"></i></div>
                                    <div>
                                        <p class="detail-label">Salary</p>
                                        <p class="detail-value"><%= teacher.getSalary() %> $</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="text-center mt-4">
                            <a href="DisplayStaff.jsp" class="btn-back">
                                <i class="fas fa-arrow-left"></i> Back to Staff List
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
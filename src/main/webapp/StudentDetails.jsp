<%@page import="com.engisphere.dao.DatabaseConnection"%>
<%@page import="com.engisphere.dao.StudentDao"%>
<%@page import="com.engisphere.entity.StudentsEntities"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Details | Engisphere</title>
    <%@include file="bootstrapSupport.jsp"%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .profile-card {
            max-width: 700px;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            border: none;
            transition: transform 0.3s ease;
            background: white;
        }
        
        .profile-card:hover {
            transform: translateY(-5px);
        }
        
        .profile-header {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            padding: 2rem;
            color: white;
            text-align: center;
            position: relative;
        }
        
        .profile-pic {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            border: 5px solid white;
            object-fit: cover;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            margin-bottom: 1rem;
            transition: all 0.3s ease;
        }
        
        .profile-pic:hover {
            transform: scale(1.05);
        }
        
        .student-name {
            font-weight: 700;
            margin-bottom: 0.5rem;
            font-size: 1.8rem;
        }
        
        .student-id {
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
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            background: white;
        }
    </style>
</head>
<body>
    <%@include file="AdminNavBar.jsp"%>
    
    <%
    StudentDao sdao = new StudentDao(DatabaseConnection.connect());
    int studentId = Integer.parseInt(request.getParameter("id"));
    double attendancePercentage = sdao.getStudentAttendancePercentage(studentId);
    StudentsEntities student = (StudentsEntities) request.getAttribute("student");
    %>
    
    <div class="container py-5">
        <div class="row justify-content-center">
            <% if (student == null) { %>
            <div class="col-md-8">
                <div class="not-found-card p-4 text-center">
                    <div class="p-4">
                        <i class="fas fa-user-slash text-danger mb-3" style="font-size: 3rem;"></i>
                        <h3 class="fw-bold mb-3">Student Not Found</h3>
                        <p class="mb-4">The requested student record could not be found in our database.</p>
                        <a href="StudentTable.jsp" class="btn-back text-white text-decoration-none">
                            <i class="fas fa-arrow-left"></i> Back to Student List
                        </a>
                    </div>
                </div>
            </div>
            <% } else { %>
            <div class="col-md-10 col-lg-8">
                <div class="profile-card">
                    <div class="profile-header">
                        <img src="images/student-illustration.png" alt="Student" class="profile-pic">
                        <h1 class="student-name"><%= student.getFirstName() %> <%= student.getLastName() %></h1>
                        <p class="student-id">Student ID: <%= student.getId() %></p>
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
                                    <div class="detail-icon">
                                        <i class="fas fa-id-card"></i>
                                    </div>
                                    <div>
                                        <p class="detail-label">Student ID</p>
                                        <p class="detail-value"><%= student.getId() %></p>
                                    </div>
                                </div>
                                
                                <div class="detail-item">
                                    <div class="detail-icon">
                                        <i class="fas fa-phone"></i>
                                    </div>
                                    <div>
                                        <p class="detail-label">Contact</p>
                                        <p class="detail-value"><%= student.getContact() %></p>
                                    </div>
                                </div>
                                
                                <div class="detail-item">
                                    <div class="detail-icon">
                                        <i class="fas fa-envelope"></i>
                                    </div>
                                    <div>
                                        <p class="detail-label">Email</p>
                                        <p class="detail-value"><%= student.getEmail() %></p>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <div class="detail-item">
                                    <div class="detail-icon">
                                        <i class="fas fa-map-marker-alt"></i>
                                    </div>
                                    <div>
                                        <p class="detail-label">Address</p>
                                        <p class="detail-value"><%= student.getAddress() %></p>
                                    </div>
                                </div>
                                
                                <div class="detail-item">
                                    <div class="detail-icon">
                                        <i class="fas fa-calendar-day"></i>
                                    </div>
                                    <div>
                                        <p class="detail-label">Joining Date</p>
                                        <p class="detail-value"><%= student.getJoiningDate() %></p>
                                    </div>
                                </div>
                                
                                <div class="detail-item">
                                    <div class="detail-icon">
                                        <i class="fas fa-graduation-cap"></i>
                                    </div>
                                    <div>
                                        <p class="detail-label">Course</p>
                                        <p class="detail-value"><%= student.getCourse() %></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="text-center mt-4">
                            <a href="DisplayStudent.jsp" class="btn-back text-white text-decoration-none">
                                <i class="fas fa-arrow-left"></i> Back to Student List
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%@page import="com.engisphere.entity.StudentsEntities"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.engisphere.dao.DatabaseConnection"%>
<%@page import="com.engisphere.dao.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Management | Engisphere</title>
    <%@include file="bootstrapSupport.jsp"%>
</head>
<body class="bg-light">
    <%@include file="AdminNavBar.jsp"%>
    
    <div class="container py-4">
        <!-- Header and Search -->
        <div class="d-flex flex-column flex-md-row justify-content-between align-items-center mb-4">
            <h2 class="mb-3 mb-md-0">
                <i class="fas fa-users me-2 text-primary"></i>Student Management
            </h2>
            <div class="d-flex">
                <div class="input-group me-2" style="width: 250px;">
                    <input type="text" class="form-control" placeholder="Search students...">
                    <button class="btn btn-primary" type="button">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
                <button class="btn btn-success">
                    <i class="fas fa-plus me-2"></i>Add Student
                </button>
            </div>
        </div>
        
        <!-- Student Table -->
        <div class="card shadow-sm border-0">
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0">
                        <thead class="table-primary">
                            <tr>
                                <th class="ps-3">ID</th>
                                <th>Student</th>
                                <th>Contact</th>
                                <th>Email</th>
                                <th>Course</th>
                                <th>Join Date</th>
                                <th class="text-end pe-3">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            StudentDao sdao = new StudentDao(DatabaseConnection.connect());
                            ArrayList<StudentsEntities> studentList = sdao.getAllStudent();
                            for (StudentsEntities s : studentList) {
                            %>
                            <tr>
                                <td class="ps-3"><%=s.getId()%></td>
                                <td>
                                    <a href="<%=request.getContextPath()%>/StudentDetailsController?id=<%=s.getId()%>" 
                                       class="text-decoration-none text-primary fw-medium">
                                        <%=s.getFirstName()%> <%=s.getLastName()%>
                                    </a>
                                </td>
                                <td><%=s.getContact()%></td>
                                <td><%=s.getEmail()%></td>
                                <td><%=s.getCourse()%></td>
                                <td><%=s.getJoiningDate()%></td>
                                <td class="text-end pe-3">
                                    <div class="d-flex justify-content-end gap-2">
                                        <a href="EditStudent.jsp?id=<%=s.getId()%>" 
                                           class="btn btn-sm btn-outline-primary px-3">
                                            <i class="fas fa-edit me-1"></i>Edit
                                        </a>
                                        <a href="DeleteStudentController?id=<%=s.getId()%>" 
                                           class="btn btn-sm btn-outline-danger px-3">
                                            <i class="fas fa-trash-alt me-1"></i>Delete
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <%
                            }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
        <!-- Footer Actions -->
        <div class="d-flex justify-content-center mt-4">
            <button class="btn btn-outline-danger px-4">
                <i class="fas fa-trash-alt me-2"></i>Delete Table
            </button>
        </div>
    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
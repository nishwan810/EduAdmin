<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Profile</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f7f6;
        }
        .profile-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            max-width: 800px;
            margin: 2rem auto;
        }
        .profile-header {
            background: linear-gradient(135deg, #2c3e50, #3498db);
            color: white;
            padding: 2rem;
            text-align: center;
        }
        .profile-picture {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            border: 4px solid white;
            margin-bottom: 1rem;
        }
        .profile-details {
            padding: 2rem;
        }
        .profile-details h5 {
            color: #2c3e50;
            margin-bottom: 1.5rem;
            font-weight: 500;
        }
        .profile-details p {
            color: #555;
            font-size: 1rem;
            margin-bottom: 1rem;
        }
        .profile-footer {
            background: #ecf0f1;
            padding: 1.5rem;
            text-align: center;
            color: #2c3e50;
            font-weight: 500;
        }
        .section-title {
            color: #3498db;
            font-weight: 500;
            margin-bottom: 1rem;
            font-size: 1.25rem;
        }
    </style>
</head>
<body>
    <div class="profile-card">
        <div class="profile-header">
            <img src="https://via.placeholder.com/120" alt="Profile Picture" class="profile-picture">
            <h2>Abhishekh Sharma</h2>
            <p>+91 9989969696</p>
        </div>
        <div class="profile-details">
            <div class="row">
                <div class="col-md-6">
                    <div class="section-title">Contact Information</div>
                    <p><strong>Email:</strong> abhisharma@gmail.com</p>
                    <p><strong>Address:</strong> Shiru Pune</p>
                </div>
                <div class="col-md-6">
                    <div class="section-title">Academic Information</div>
                    <p><strong>Course:</strong> IT</p>
                    <p><strong>Joining Date:</strong> 2025-03-20</p>
                    <p><strong>Overall Attendance:</strong> 67.20%</p>
                </div>
            </div>
        </div>
        <div class="profile-footer">
            <strong>Branch Name</strong>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
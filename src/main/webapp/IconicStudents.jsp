<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iconic Students</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f7f6;
            padding: 2rem;
        }
        .iconic-students {
            max-width: 1200px;
            margin: 0 auto;
        }
        .student-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            margin-bottom: 2rem;
            display: flex;
            align-items: center;
            padding: 1.5rem;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .student-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .student-picture {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            border: 4px solid #3498db;
            margin-right: 1.5rem;
        }
        .student-info {
            flex: 1;
        }
        .student-name {
            color: #2c3e50;
            font-size: 1.5rem;
            font-weight: 500;
            margin-bottom: 0.5rem;
        }
        .student-department {
            color: #3498db;
            font-size: 1.1rem;
            font-weight: 400;
            margin-bottom: 0.5rem;
        }
        .student-achievement {
            color: #555;
            font-size: 1rem;
            font-weight: 400;
        }
        .iconic-header {
            text-align: center;
            margin-bottom: 2rem;
            color: #2c3e50;
            font-size: 2.5rem;
            font-weight: 700;
        }
    </style>
</head>
<body>
    <div class="iconic-students">
        <div class="iconic-header">
            ICONIC Students
        </div>
        <div class="student-card">
            <img src="https://via.placeholder.com/100" alt="Abhishekh Sharma" class="student-picture">
            <div class="student-info">
                <div class="student-name">Abhishekh Sharma</div>
                <div class="student-department">E & TC</div>
                <div class="student-achievement">He achieved 100% in His 7th sem</div>
            </div>
        </div>
        <div class="student-card">
            <img src="https://via.placeholder.com/100" alt="Pratap Singh" class="student-picture">
            <div class="student-info">
                <div class="student-name">Pratap Singh</div>
                <div class="student-department">Computer</div>
                <div class="student-achievement">He achieved Gold Medal in Football</div>
            </div>
        </div>
        <div class="student-card">
            <img src="https://via.placeholder.com/100" alt="Anurag Deshpande" class="student-picture">
            <div class="student-info">
                <div class="student-name">Anurag Deshpande</div>
                <div class="student-department">Mechanical</div>
                <div class="student-achievement">He achieved Best Academic Project</div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
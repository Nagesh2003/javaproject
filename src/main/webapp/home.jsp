<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&family=Open+Sans:wght@300&display=swap" rel="stylesheet">
    <style>
        /* Marquee styles */
        .marquee {
            background-color: #0D1117;
            color: #58A6FF;
            padding: 10px 0;
            font-size: 18px;
            position: sticky;
            top: 0; /* Stick to the top */
            z-index: 1000; /* Ensure it stays above other content */
            width: 100%;
            
            box-sizing: border-box; /* Ensure padding is included in width calculation */
            overflow: hidden; /* Prevent overflow issues */
        }

        /* Navbar styles */
        .navbar {
            background-color: #0D1117;
            width: 100%;
            margin-top:0px;
            position: sticky;
            top: 40px; /* Adjust top value to be just below the marquee */
            z-index: 900; /* Ensure it stays below the marquee */
            display: flex;
            align-items: center;
            padding: 0 20px;
            justify-content: space-between;
            box-sizing: border-box;
            white-space: nowrap;
        }

        .navbar .logo {
            font-size: 24px;
            color: #C9D1D9;
            border-radius: 50%;
            padding: 10px;
            background-color: #161B22;
        }

        .navbar .nav-links {
            display: flex;
            align-items: center;
            flex-grow: 1;
            justify-content: flex-start;
        }

        .navbar .nav-links a, .navbar .dropdown .dropbtn {
            display: flex;
            align-items: center;
            color: #C9D1D9;
            padding: 14px 20px;
            text-decoration: none;
        }

        .navbar .nav-links a i, .navbar .dropdown .dropbtn i {
            margin-right: 8px;
        }

        .navbar .nav-links a:hover, .navbar .dropdown .dropbtn:hover {
            background-color: #21262D;
            color: #58A6FF;
        }

        .navbar .logout-link {
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
            background: none;
            border: none;
            cursor: pointer;
        }

        .navbar .logout-link i {
            margin-right: 8px;
        }

        .navbar .logout-link:hover {
            background-color: #21262D;
            color: #58A6FF;
        }

        .navbar .dropdown {
            position: relative;
            display: inline-block;
        }

        .navbar .dropbtn {
            background-color: #0D1117;
            color: #C9D1D9;
            border: none;
            padding: 14px 20px;
            font-size: 16px;
            cursor: pointer;
        }

        .navbar .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 200px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 7000;
            right: 0;
            top: 100%;
        }

        .navbar .dropdown-content a {
            color: #0D1117;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .navbar .dropdown-content a:hover {
            background-color: #ddd;
            color: #58A6FF;
        }

        .navbar .dropdown:hover .dropdown-content {
            display: block;
        }

        .navbar .dropdown:hover .dropbtn {
            background-color: #21262D;
        }

        /* Background styles */
        body {
            margin: 0;
            font-family: 'Open Sans', sans-serif;
            color: #0D1117;
            background: url('images/background.jpg') no-repeat center center fixed;
            background-size: cover;
            animation: animateBackground 30s linear infinite;
        }

        /* Container styles */
        .container {
            padding: 20px;
            position: relative;
            max-width: 100%;
            margin: 0 auto;
            min-height: calc(100vh - 60px); /* Ensure content area fits above the footer */
            box-sizing: border-box; /* Ensure padding is included in width calculation */
            overflow: hidden; /* Hide overflow to prevent scrolling */
        }

        @keyframes animateBackground {
            0% {background-position: 0 0;}
            50% {background-position: 100% 0;}
            100% {background-position: 0 0;}
        }

        .welcome-message {
            font-family: 'Roboto', sans-serif;
            font-size: 32px;
            font-weight: bold;
            margin: 20px 0;
            color: red;
            text-align: center;
            display: inline-block;
            position: relative;
        }

        .welcome-message span {
            display: inline-block;
            opacity: 1; /* Ensure letters are always visible */
            animation: fadeIn 1s forwards;
            transition: transform 0.3s ease;
        }

        @keyframes fadeIn {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }

        @keyframes bubble {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        .welcome-message span:hover {
            animation: bubble 0.6s infinite;
        }

        .welcome-message span:nth-of-type(even) {
            margin-right: 5px; /* Add space between letters (optional) */
        }

        /* Paragraph box styles */
        .paragraph-box {
            width: 350px;
            background-color: #0A0F0F;
            color: #00FF41;
            margin-left: 60px;
            padding: 20px; /* Adjust padding for height */
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 255, 65, 0.3);
            display: flex;
            flex-direction: column; /* Stack content vertically */
            align-items: center;
            justify-content: center;
            text-align: center;
            text-decoration: none; /* Remove underlining */
            transition: transform 0.3s ease, box-shadow 0.3s ease; /* Add transition for hover effects */
            height: 250px; /* Fixed height for boxes */
            box-sizing: border-box; /* Ensure padding is included in height calculation */
        }

        /* Hover effect for paragraph boxes */
        .paragraph-box:hover {
            transform: translateY(-5px); /* Slightly lift the box */
            box-shadow: 0 4px 20px rgba(0, 255, 65, 0.5); /* Increase shadow effect on hover */
        }

        /* Grid layout for paragraph boxes */
        .paragraph-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr); /* 2 boxes per row */
            gap: 20px; /* Space between boxes */
            justify-content: center;
            margin: 20px 0;
        }

        /* Footer styles */
        .footer {
            background-color: #0D1117;
            color: #C9D1D9;
            text-align: center;
            padding: 10px;
            width: 100%;
            box-sizing: border-box;
            box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.3); /* Add shadow effect */
            position: relative; /* Ensure footer is below the content */
        }
    </style>
</head>
<body>
    <!-- Marquee for placement activities announcement -->
    <marquee behavior="scroll" direction="left" class="marquee">
        Placement activities are ongoing! Register your students now.
    </marquee>

    <div class="navbar">
        <div class="logo">
            <i class="fas fa-graduation-cap"></i>
        </div>
        <div class="nav-links">
            <a href="home.jsp">
                <i class="fas fa-home"></i> Home
            </a>
            <a href="add_company.jsp">
                <i class="fas fa-plus"></i> Add Company
            </a>
            <a href="manage_students.jsp">
                <i class="fas fa-users"></i> Manage Students
            </a>
            <a href="schedule_interview.jsp">
                <i class="fas fa-calendar-plus"></i> Schedule Interviews
            </a>
            <div class="dropdown">
                <button class="dropbtn">
                    <i class="fas fa-bars"></i> Menu <i class="fas fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="home.jsp">
                        <i class="fas fa-home"></i> Home
                    </a>
                    <a href="company_results.jsp">
                        <i class="fas fa-building"></i> Company Details
                    </a>
                    <a href="ManageStudentsServlet">
                        <i class="fas fa-user-graduate"></i> Student Details
                    </a>
                    <a href="ScheduleInterviewServlet">
                        <i class="fas fa-calendar-alt"></i> Interview Details
                    </a>
                </div>
            </div>
        </div>
        
        <button class="logout-link" onclick="location.href='logout.jsp'">
    <i class="fas fa-sign-out-alt"></i> Logout
</button>

    </div>

    <div class="container">
        <!-- Welcome message with animation -->
        <div class="welcome-message">
            <span>Welcome</span>
            <span>to</span>
            <span>the</span>
            <span>Placement</span>
            <span>Management</span>
            <span>Portal</span>
        </div>

        <div class="paragraph-grid">
            <a href="placement_analysis.jsp" class="paragraph-box">
                <i  class="fas fa-chart-line"></i>
                <p style="color: #1E90FF;">Placement Analysis</p>
                <p>Our Placement Analysis tool provides comprehensive insights into placement trends and company performance. It helps students and placement officers to make informed decisions based on real-time data and historical trends.</p>
            </a>
            <a href="student_analysis.jsp" class="paragraph-box">
                <i class="fas fa-user"></i>
                 <p style="color: #1E90FF;"> Student analysis</p>
                <p>Student Profiles allow you to view detailed information about students, including their placement status, academic achievements, and personal details.</p>
            </a>
            <a href="interview_analysis.jsp" class="paragraph-box">
                <i  class="fas fa-briefcase"></i>
                 <p style="color: #1E90FF;">Interview Analysis</p>
                <p>Interview Analysis helps in evaluating the effectiveness of interviews, including candidate performance and interviewer feedback.</p>
            </a>
            <a href="company_analysis.jsp" class="paragraph-box">
                <i  class="fas fa-building"></i>
<p style="color: #1E90FF;">Company Analysis</p>
                <p>Company Profiles provide information about various companies participating in the placement process, including their hiring trends and requirements.</p>
            </a>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; <span id="year"></span> All rights reserved by  Sigmas.</p>
    </div>

    <script>
        // Update the year in the footer
        document.getElementById('year').textContent = new Date().getFullYear();
    </script>
</body>
</html>

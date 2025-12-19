<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Library Management System</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: #1e293b;
            color: white;
        }

        /* Navbar */
        .navbar {
            position: sticky;
            top: 0;
            background: #0f172a;
            padding: 16px 80px;
            width: 80%;
            height: 100px;
            font-size: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.9);
            box-shadow: inset 0 0 10px rgba(255, 255, 255, 0.5);
            margin: auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 100;
        }

        .logo {
            font-size: 30px;
            font-weight: 800;
            color: #fbbf24;
        }

        .nav-links a {
            margin-left: 24px;
            text-decoration: none;
            color: #e5e7eb;
            font-weight: 500;
            font-size: 22px;
            transition: color 0.3s;
        }

        .nav-links a:hover {
            color: #fbbf24;
            text-shadow: 0px 0px 30px #fbbf24;
        }

        /* Hero Section */
        .hero {
            display: flex;
            min-height: 90vh;
            padding: 60px 40px;
            width: 90%;
            margin: auto;
            align-items: center;
            gap: 40px;
        }

        .hero-left {
            flex: 6;
            font-size: 25px;
        }

        .hero-left h1 {
            font-size: 48px;
            font-weight: 800;
            line-height: 1.2;
            margin-bottom: 20px;
        }

        .highlight {
            color: #fbbf24;
        }

        .hero-left p {
            color: #cbd5f5;
            max-width: 520px;
            margin-bottom: 30px;
        }

        .cta-buttons a {
            display: inline-block;
            margin-right: 15px;
            padding: 12px 26px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: 600;
            background: #fbbf24;
            color: black;
            transition: transform 0.3s;
        }

        .cta-buttons a:hover {
            transform: translateY(-3px);
        }

        /* Right Section */
        .hero-right {
            flex: 4;
            display: flex;
            justify-content: center;
        }

        .blob {
            width: 780px;
            height: 680px;
            background: #fbbf24;
            border-radius: 60% 40% 30% 70% / 60% 30% 70% 40%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: black;
            font-weight: 700;
            font-size: 20px;
        }

        .student-img {
            width: 700px;
        }

        .book-img {
            position: absolute;
            width: 250px;
            top: 100px;
            right: 50px;
        }        

        /* Responsive */
        @media (max-width: 900px) {
            .hero {
                flex-direction: column;
                text-align: center;
            }

            .cta-buttons a {
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <div class="logo">LibrarySys</div>
    <div class="nav-links">
        <a href="index.jsp">Home</a>
        <a href="addBook.jsp">Add Book</a>
        <a href="issueBook.jsp">Issue Book</a>
        <a href="returnBook.jsp">Return Book</a>
    </div>
</div>

<!-- Hero Section -->
<div class="hero">
    <div class="hero-left">
        <h1>
            Smart <span class="highlight">Library</span><br>
            Management System
        </h1>

        <p>
            Manage books, issue and return records efficiently using a modern
            Java Maven + Tomcat based Library Management System.
        </p>

        <div class="cta-buttons">
            <a href="addBook.jsp">Add Book</a>
            <a href="issueBook.jsp">Issue Book</a>
            <a href="returnBook.jsp">Return Book</a>
        </div>
    </div>

    <div class="hero-right">
        <div class="blob">
        
            <img src="assest/student.png" alt="Student Image" class="student-img">

        </div>
    </div>
</div>

</body>
</html>

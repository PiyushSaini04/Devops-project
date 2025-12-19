<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.library.util.FileStorage" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Book | Library Management System</title>

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
            background: linear-gradient(
                135deg,
                #081127ff 0%,
                #1d2838ff 45%,
                #425c88ff 100%
            );
            color: #ffffff;
        }

        /* Navbar (SAME AS HOME) */
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

        /* Page Section */
        .page {
            min-height: 80vh;
            width: 90%;
            margin: auto;
            
            align-items: center;
            justify-content: center;
            padding: 10px 40px;
        }

        /* Card */
        .card {
            background: #0f172a;
            width: 650px;
            margin: 40px auto;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.6);
        }

        .card h2 {
            text-align: center;
            font-size: 32px;
            font-weight: 800;
            margin-bottom: 30px;
        }

        .highlight {
            color: #fbbf24;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-size: 16px;
            color: #cbd5f5;
        }

        input {
            width: 100%;
            padding: 14px;
            margin-bottom: 22px;
            border-radius: 10px;
            border: none;
            font-size: 16px;
            outline: none;
        }

        button {
            width: 100%;
            padding: 14px;
            border-radius: 30px;
            border: none;
            background: #fbbf24;
            color: black;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        button:hover {
            transform: translateY(-3px);
            box-shadow: 0 0 25px #fbbf24;
        }

        /* Responsive */
        @media (max-width: 900px) {
            .navbar {
                width: 95%;
                padding: 16px 30px;
            }

            .page {
                padding: 40px 20px;
            }
        }

       .page > h2{
        font-size: 48px;
       }

        .books-grid {
            display: flex;
            flex-wrap: wrap;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 20px;
            margin-top: 40px;
        }

        .book-card {
            background: #0f172a;
            width: 320px;
            padding: 20px;
            border-radius: 14px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.6);
        }

        .book-card h3 {
            margin-bottom: 10px;
            font-size: 18px;
        }

        .book-id {
            color: #cbd5f5;
            font-size: 14px;
        }

        .status {
            margin-top: 12px;
            display: inline-block;
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
        }

        .AVAILABLE {
            background: #22c55e;
            color: black;
        }

        .ISSUED {
            background: #ef4444;
            color: white;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <div class="logo">LibrarySys</div>
    <div class="nav-links">
        <a href="index.jsp">Home</a>
        <a href="addBook.jsp" style="color:#fbbf24;">Add Book</a>
        <a href="issueBook.jsp">Issue Book</a>
        <a href="returnBook.jsp">Return Book</a>
    </div>
</div>

<!-- Add Book Section -->
<div class="page">
    <div class="card">
        <h2>Add <span class="highlight">New Book</span></h2>

        <form action="addBook" method="post">
            <label>Book ID</label>
            <input type="text" name="id" placeholder="Enter Book ID" required>

            <label>Book Name</label>
            <input type="text" name="name" placeholder="Enter Book Name" required>

            <button type="submit">Add Book</button>
        </form>
    </div>

    <h2><span class="highlight"> Existing Books </span></h2>

    <div class="books-grid">
        <%
List<Map<String, String>> books =
        FileStorage.getAllBooks(application);
            for (Map<String, String> book : books) {
        %>
        <div class="book-card">
            <h3><%= book.get("name") %></h3>
            <div class="book-id">ID: <%= book.get("id") %></div>

            <div class="status <%= book.get("status") %>">
                <%= book.get("status") %>
            </div>
        </div>
        <%
            }
        %>
    </div>
</div>
</body>
</html>

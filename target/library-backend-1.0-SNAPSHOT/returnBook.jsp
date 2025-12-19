<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Return Book | Library Management System</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">

    <style>
        body {
            background-color: #1e293b;
            color: white;
            font-family: 'Poppins', sans-serif;
        }

        .navbar {
            position: sticky;
            top: 0;
            background: #0f172a;
            padding: 16px 80px;
            width: 80%;
            height: 100px;
            font-size: 20px;
            border-radius: 12px;
            box-shadow: inset 0 0 10px rgba(255,255,255,0.5);
            margin: auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 30px;
            font-weight: 800;
            color: #fbbf24;
        }

        .nav-links a {
            margin-left: 24px;
            color: #e5e7eb;
            text-decoration: none;
            font-size: 22px;
        }

        .nav-links a:hover {
            color: #fbbf24;
            text-shadow: 0 0 30px #fbbf24;

        }

        .page {
            width: 90%;
            margin: auto;
            padding: 60px 40px;
        }

        .card {
            background: #0f172a;
            font-size: 20px;
            width: 480px;
            margin: auto;
            padding: 40px;
            border-radius: 20px;
        }

        .card h2 {
            font-size: 32px;
        }

        input {
            width: 90%;
            padding: 14px;
            font-size: 18px;
            margin-bottom: 20px;
            border-radius: 10px;
            border: none;
        }

        button {
            background: #fbbf24;
            height: 50px;
            border-radius: 10px;
            color: black;
            font-size: 16px;
            width: 50%;
            margin: auto;
            font-weight: 600;
            cursor: pointer;
        }

        .books-grid {
            margin-top: 50px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 20px;
        }

        .book-card {
            background: #0f172a;
            padding: 20px;
            border-radius: 14px;
        }

        .popup {
            position: fixed;
            top: 30px;
            right: 30px;
            background: #22c55e;
            color: black;
            padding: 16px 24px;
            border-radius: 12px;
            display: none;
            font-weight: 600;
        }
    </style>
</head>
<body>

<div class="navbar">
    <div class="logo">LibrarySys</div>
    <div class="nav-links">
        <a href="index.jsp">Home</a>
        <a href="addBook.jsp">Add Book</a>
        <a href="issueBook.jsp">Issue Book</a>
        <a href="returnBook.jsp" style="color:#fbbf24;">Return Book</a>
    </div>
</div>

<div id="successPopup" class="popup">
    ✅ Book returned successfully!
</div>

<div class="page">

    <!-- Search Form -->
    <div class="card">
        <h2>Return Book</h2>

        <form method="get" action="returnBook.jsp">
            <input type="text" name="student" placeholder="Student Name" required>
            <input type="text" name="regNo" placeholder="Admission Number" required>
            <button type="submit">Search Issued Books</button>
        </form>
    </div>

    <!-- Issued Books -->
    <%
        String student = request.getParameter("student");
        String regNo = request.getParameter("regNo");

        if (student != null && regNo != null) {
            String filePath = application.getRealPath("/WEB-INF/library-data.txt");
            BufferedReader br = new BufferedReader(new FileReader(filePath));
            String line;
    %>

    <h2 style="margin-top:40px;">📚 Issued Books</h2>

    <div class="books-grid">
        <%
            while ((line = br.readLine()) != null) {
                if (line.startsWith("ISSUE") &&
                    line.contains("student=" + student) &&
                    line.contains("regNo=" + regNo)) {

                    String bookId = line.split("\\|")[1].split("=")[1].trim();
        %>
        <div class="book-card">
            <p><strong>Book ID:</strong> <%= bookId %></p>

            <form action="returnBook" method="post">
                <input type="hidden" name="bookId" value="<%= bookId %>">
                <input type="hidden" name="student" value="<%= student %>">
                <input type="hidden" name="regNo" value="<%= regNo %>">
                <button type="submit">Return Book</button>
            </form>
        </div>
        <%
                }
            }
            br.close();
        %>
    </div>
    <%
        }
    %>

</div>

<script>
    const params = new URLSearchParams(window.location.search);
    if (params.get("success") === "true") {
        const popup = document.getElementById("successPopup");
        popup.style.display = "block";
        setTimeout(() => {
            popup.style.display = "none";
            window.history.replaceState({}, document.title, "returnBook.jsp");
        }, 3000);
    }
</script>

</body>
</html>

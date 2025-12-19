<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.library.util.FileStorage" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Issue Book | Library Management System</title>

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
            text-decoration: none;
            color: #e5e7eb;
            font-size: 22px;
        }

        .nav-links a:hover {
            color: #fbbf24;
            text-shadow: 0 0 30px #fbbf24;
        }

        /* Page */
        .page {
            width: 90%;
            margin: auto;
            padding: 60px 40px;
        }

        /* Card */
        .card {
            background: #0f172a;
            width: 480px;
            margin: auto;
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

        input, select {
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

        /* Book Grid */
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
            box-shadow: 0 8px 20px rgba(0,0,0,0.6);
        }

        .book-card h3 {
            font-size: 18px;
            margin-bottom: 10px;
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
            background: #22c55e;
            color: black;
        }

        @media (max-width: 900px) {
            .navbar {
                width: 95%;
                padding: 16px 30px;
            }
        }

        /* Success Popup */
        .popup {
            position: fixed;
            top: 30px;
            right: 30px;
            background: #22c55e;
            color: black;
            padding: 16px 24px;
            border-radius: 12px;
            font-weight: 600;
            box-shadow: 0 10px 30px rgba(0,0,0,0.4);
            display: none;
            z-index: 999;
        }

    </style>
</head>
<body>

<div id="successPopup" class="popup">
    ✅ Book issued successfully!
</div>

<!-- Navbar -->
<div class="navbar">
    <div class="logo">LibrarySys</div>
    <div class="nav-links">
        <a href="index.jsp">Home</a>
        <a href="addBook.jsp">Add Book</a>
        <a href="issueBook.jsp" style="color:#fbbf24;">Issue Book</a>
        <a href="returnBook.jsp">Return Book</a>
    </div>
</div>

<div class="page">

    <!-- Issue Book Form -->
    <div class="card">
        <h2>Issue <span class="highlight">Book</span></h2>

        <form action="issueBook" method="post">

            <label>Select Book</label>
            <select name="bookId" required>
                <option value="">-- Select Available Book --</option>
                <%
                    List<Map<String,String>> books =
                            FileStorage.getAllBooks(application);

                    for (Map<String,String> book : books) {
                        if ("AVAILABLE".equals(book.get("status"))) {
                %>
                    <option value="<%= book.get("id") %>">
                        <%= book.get("id") %> - <%= book.get("name") %>
                    </option>
                <%
                        }
                    }
                %>
            </select>

            <label>Student Name</label>
            <input type="text" name="student" placeholder="Enter Student Name" required>

            <label>Registration Number</label>
            <input type="text" name="regNo" placeholder="Enter Registration No" required>

            <button type="submit">Issue Book</button>
        </form>
    </div>

    <!-- Available Books -->
    <h2 style="margin-top:60px;">📚 Available Books</h2>

    <div class="books-grid">
        <%
            for (Map<String,String> book : books) {
                if ("AVAILABLE".equals(book.get("status"))) {
        %>
        <div class="book-card">
            <h3><%= book.get("name") %></h3>
            <div class="book-id">ID: <%= book.get("id") %></div>
            <div class="status">AVAILABLE</div>
        </div>
        <%
                }
            }
        %>
    </div>

</div>

</body>
<script>
    const params = new URLSearchParams(window.location.search);
    if (params.get("success") === "true") {
        const popup = document.getElementById("successPopup");
        popup.style.display = "block";

        // Hide after 3 seconds
        setTimeout(() => {
            popup.style.display = "none";

            // Remove query param to avoid popup on refresh
            window.history.replaceState({}, document.title, "issueBook.jsp");
        }, 3000);
    }
</script>


</html>

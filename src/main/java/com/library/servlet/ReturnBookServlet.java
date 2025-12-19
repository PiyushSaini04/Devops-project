package com.library.servlet;

import com.library.util.FileStorage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/returnBook")
public class ReturnBookServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Get form parameters
        String bookId = req.getParameter("bookId");
        String student = req.getParameter("student");
        String regNo = req.getParameter("regNo");

        // 1️⃣ Delete ISSUE record (remove issued entry)
        FileStorage.deleteIssueRecord(
                getServletContext(),
                bookId,
                student,
                regNo
        );

        // 2️⃣ Update BOOK status to AVAILABLE
        FileStorage.updateBookStatus(
                getServletContext(),
                bookId,
                "AVAILABLE"
        );

        // 3️⃣ Save RETURN record (audit/history)
        String record =
                "RETURN | bookId=" + bookId +
                " | student=" + student +
                " | regNo=" + regNo +
                " | date=" + LocalDate.now();

        FileStorage.save(getServletContext(), record);

        // 4️⃣ Redirect back with success flag (PRG pattern)
        resp.sendRedirect(
                "returnBook.jsp?success=true&student=" + student + "&regNo=" + regNo
        );
    }
}

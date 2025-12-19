package com.library.servlet;

import com.library.util.FileStorage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/issueBook")
public class IssueBookServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String bookId = req.getParameter("bookId");
        String student = req.getParameter("student");
        String regNo = req.getParameter("regNo");

        String record =
                "ISSUE | bookId=" + bookId +
                " | student=" + student +
                " | regNo=" + regNo +
                " | date=" + LocalDate.now();

        FileStorage.save(getServletContext(), record);
        FileStorage.updateBookStatus(getServletContext(), bookId, "ISSUED");

        resp.sendRedirect("issueBook.jsp?success=true");
       
        resp.getWriter().print("Book Issued Successfully");
    }
}

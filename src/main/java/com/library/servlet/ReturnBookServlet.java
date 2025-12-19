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

        String bookId = req.getParameter("bookId");

        String record =
                "RETURN | bookId=" + bookId +
                " | date=" + LocalDate.now();

        FileStorage.save(getServletContext(), record);

        resp.getWriter().print("Book Returned Successfully");
    }
}

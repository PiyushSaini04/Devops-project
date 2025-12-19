package com.library.servlet;

import com.library.util.FileStorage;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/addBook")
public class AddBookServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        String id = req.getParameter("id");
        String name = req.getParameter("name");

        String record = "BOOK | id=" + id +
                        " | name=" + name +
                        " | status=AVAILABLE";

        FileStorage.save(record);

        resp.getWriter().print("Book Added Successfully");
    }
}

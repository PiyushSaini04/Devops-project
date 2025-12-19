@WebServlet("/returnBook")
public class ReturnBookServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        String bookId = req.getParameter("bookId");

        String record = "RETURN | bookId=" + bookId +
                        " | date=" + java.time.LocalDate.now();

        FileStorage.save(record);

        resp.getWriter().print("Book Returned Successfully");
    }
}

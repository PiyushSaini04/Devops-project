@WebServlet("/issueBook")
public class IssueBookServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        String bookId = req.getParameter("bookId");
        String student = req.getParameter("student");
        String regNo = req.getParameter("regNo");

        String record = "ISSUE | bookId=" + bookId +
                        " | student=" + student +
                        " | regNo=" + regNo +
                        " | date=" + java.time.LocalDate.now();

        FileStorage.save(record);

        resp.getWriter().print("Book Issued Successfully");
    }
}

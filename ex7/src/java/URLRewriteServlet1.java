import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/URLRewriteServlet1")
public class URLRewriteServlet1 extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("uname");

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        out.println("<html>");
        out.println("<head>");
        out.println("<title>URL Rewriting</title>");
        out.println("</head>");

        out.println("<body style='font-family:Arial;"
                + "text-align:center;"
                + "background-color:lightcyan;'>");

        out.println("<h2>URL Rewriting</h2>");

        out.println("<h3>Welcome, " + username + "</h3>");

        out.println("<p>");
        out.println("Username is passed through the URL.");
        out.println("</p>");

        out.println("<a href='URLRewriteServlet2?uname="
                + username + "'>");

        out.println("Next Page");

        out.println("</a>");

        out.println("</body>");
        out.println("</html>");
    }
}
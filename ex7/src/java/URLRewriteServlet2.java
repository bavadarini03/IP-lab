import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/URLRewriteServlet2")
public class URLRewriteServlet2 extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("uname");

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        out.println("<html>");
        out.println("<head>");
        out.println("<title>URL Rewrite Result</title>");
        out.println("</head>");

        out.println("<body style='font-family:Arial;"
                + "text-align:center;"
                + "background-color:lightpink;'>");

        out.println("<h2>Hello, " + username + "</h2>");

        out.println("<p>");
        out.println("Username successfully received using URL Rewriting.");
        out.println("</p>");

        out.println("<p>");
        out.println("Check the browser address bar.");
        out.println("</p>");

        out.println("<a href='index.html'>Back to Login</a>");

        out.println("</body>");
        out.println("</html>");
    }
}
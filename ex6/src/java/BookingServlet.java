import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String source = request.getParameter("source");
        String destination = request.getParameter("destination");

        int seats = Integer.parseInt(
                request.getParameter("seats")
        );

        Connection con = null;

        try {

            // Load MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to database
            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/busreservation"
                    + "?useSSL=false"
                    + "&allowPublicKeyRetrieval=true"
                    + "&serverTimezone=UTC",
                    "root",
                    "root123"
            );

            // Insert booking
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO bookings "
                    + "(name, phone, email, source, destination, seats) "
                    + "VALUES (?, ?, ?, ?, ?, ?)"
            );

            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, email);
            ps.setString(4, source);
            ps.setString(5, destination);
            ps.setInt(6, seats);

            int rows = ps.executeUpdate();

            out.println("<html>");
            out.println("<body bgcolor='lightgreen'>");

            if (rows > 0) {

                out.println(
                    "<h1 style='text-align:center;color:green;'>"
                    + "Bus Ticket Booked Successfully!"
                    + "</h1>"
                );

                out.println(
                    "<h3 style='text-align:center;'>"
                    + "Thank you, " + name + "!"
                    + "</h3>"
                );

                out.println(
                    "<p style='text-align:center;'>"
                    + "Your bus ticket has been booked successfully."
                    + "</p>"
                );

                out.println("<br>");

                // Display booking details

                out.println(
                    "<table border='2' cellpadding='10' "
                    + "align='center' bgcolor='white'>"
                );

                out.println("<tr>");
                out.println("<th>Name</th>");
                out.println("<th>Phone</th>");
                out.println("<th>Email</th>");
                out.println("<th>Source</th>");
                out.println("<th>Destination</th>");
                out.println("<th>Seats</th>");
                out.println("</tr>");

                out.println("<tr>");

                out.println("<td>");
                out.println(name);
                out.println("</td>");

                out.println("<td>");
                out.println(phone);
                out.println("</td>");

                out.println("<td>");
                out.println(email);
                out.println("</td>");

                out.println("<td>");
                out.println(source);
                out.println("</td>");

                out.println("<td>");
                out.println(destination);
                out.println("</td>");

                out.println("<td>");
                out.println(seats);
                out.println("</td>");

                out.println("</tr>");

                out.println("</table>");

                out.println("<br><br>");

                out.println(
                    "<center>"
                    + "<a href='bus.html'>Book Another Ticket</a>"
                    + "</center>"
                );

            } else {

                out.println(
                    "<h2 style='text-align:center;color:red;'>"
                    + "Booking Failed"
                    + "</h2>"
                );
            }

            out.println("</body>");
            out.println("</html>");

            ps.close();

        }
        catch (ClassNotFoundException e) {

            out.println(
                "<h3>MySQL Driver not found</h3>"
            );

            out.println(e.getMessage());

        }
        catch (SQLException e) {

            out.println(
                "<h3>Database Error</h3>"
            );

            out.println(e.getMessage());

        }
        finally {

            try {

                if (con != null) {
                    con.close();
                }

            }
            catch (SQLException e) {

                out.println(e.getMessage());

            }

            out.close();
        }
    }
}
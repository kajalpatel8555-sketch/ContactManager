package com.contactmanager.contactmanager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/contacts")
public class AddContactServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        if(name == null || name.trim().isEmpty()){

            response.setContentType("text/html");
            response.getWriter().println(
                    "<h2 style='color:red;text-align:center;'>❌ Name is Required</h2>" +
                            "<div style='text-align:center;'>" +
                            "<a href='contact-form.jsp'>Go Back</a>" +
                            "</div>"
            );

            return;
        }
        if(email == null || !email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            response.setContentType("text/html");
            response.getWriter().println(
                    "<h2 style='color:red;text-align:center;'>❌ Invalid Email Address</h2>" +
                            "<div style='text-align:center;'>" +
                            "<a href='contact-form.jsp'>Go Back</a>" +
                            "</div>"
            );
            return;
        }
        if(phone == null || !phone.matches("\\d{10}")){
            response.setContentType("text/html");
            response.getWriter().println(
                    "<h2 style='color:red;text-align:center;'>❌ Phone Number Must Be 10 Digits</h2>" +
                            "<div style='text-align:center;'>" +
                            "<a href='contact-form.jsp'>Go Back</a>" +
                            "</div>"
            );
            return;
        }
        try {
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO contacts(name, email, phone) VALUES (?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);

            ps.executeUpdate();

            ps.close();
            con.close();

            response.sendRedirect("contact-list.jsp");

        } catch (Exception e) {
            response.setContentType("text/html");

            e.printStackTrace();

            response.getWriter().println("<h2 style='color:red'>Error Occurred</h2>");
            response.getWriter().println("<pre>");
            e.printStackTrace(response.getWriter());
            response.getWriter().println("</pre>");
        }
    }
}
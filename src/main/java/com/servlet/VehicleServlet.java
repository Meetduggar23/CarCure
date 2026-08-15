package com.servlet;

import com.db.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// This servlet is mapped to URL pattern "/addVehicle"
// When form action="addVehicle" is submitted, this servlet runs
@WebServlet("/addVehicle")
public class VehicleServlet extends HttpServlet {

    // This method executes when form method="POST"
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // 1️⃣ Get form data from JSP page
        String vehicleNumber = request.getParameter("vehicle_number");
        String ownerName = request.getParameter("owner_name");
        String booking = request.getParameter("booking");

        try {
            // 2️⃣ Establish database connection
            Connection con = DBConnection.getConnection();

            // 3️⃣ Create SQL query using PreparedStatement
            // This inserts vehicle and booking details into database
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO bookings(vehicle_number, owner_name, booking) VALUES(?,?,?)"
            );

            // 4️⃣ Set values in query
            ps.setString(1, vehicleNumber); // Vehicle Number
            ps.setString(2, ownerName);     // Owner Name
            ps.setString(3, booking);       // Booking Type / Details

            // 5️⃣ Execute insert query
            ps.executeUpdate();

            // 6️⃣ After successful insertion, redirect to Availability page
            response.sendRedirect("Availability.jsp");

        } catch (Exception e) {
            // Print error in console if any exception occurs
            e.printStackTrace();
        }
    }
}
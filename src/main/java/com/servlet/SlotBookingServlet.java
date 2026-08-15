package com.servlet;

import com.db.DBConnection;
import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/bookSlot")
public class SlotBookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // 1️⃣ Get form data
        String vehicleNumber = request.getParameter("vehicleNumber");
        String carName = request.getParameter("carName");
        String selectedDate = request.getParameter("selectedDate");
        String slotTime = request.getParameter("slotTime");
        String serviceType = request.getParameter("serviceType");

        // 2️⃣ Safely extract service name and amount
        String serviceName = serviceType;
        int serviceAmount = 0;

        if (serviceType != null && serviceType.contains("-")) {
            try {
                String parts[] = serviceType.split("-");

                serviceName = parts[0].trim();

                if (parts.length > 1) {
                    serviceAmount = Integer.parseInt(parts[1].trim());
                }

            } catch (Exception e) {
                serviceAmount = 0; // fallback safety
            }
        }

        // 3️⃣ Generate Booking ID
        String bookingId = "BK" + System.currentTimeMillis();

        try {
            Connection con = DBConnection.getConnection();

            // 4️⃣ Check if slot already booked
            PreparedStatement check = con.prepareStatement(
                "SELECT * FROM slot_bookings WHERE slot=? AND date=?"
            );

            check.setString(1, slotTime);
            check.setString(2, selectedDate);

            ResultSet rs = check.executeQuery();

            if (rs.next()) {
                response.sendRedirect("SelectSlot.jsp?error=notavailable");
                return;
            }

            // 5️⃣ Insert booking
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO slot_bookings VALUES (?,?,?,?,?,?,?)"
            );

            ps.setString(1, bookingId);
            ps.setString(2, vehicleNumber);
            ps.setString(3, carName);
            ps.setString(4, serviceName);
            ps.setInt(5, serviceAmount);
            ps.setString(6, slotTime);
            ps.setString(7, selectedDate);

            ps.executeUpdate();

            // 6️⃣ Send data to confirmation page
            request.setAttribute("bookingId", bookingId);
            request.setAttribute("vehicleNumber", vehicleNumber);
            request.setAttribute("carName", carName);
            request.setAttribute("slotTime", slotTime);
            request.setAttribute("selectedDate", selectedDate);
            request.setAttribute("serviceName", serviceName);
            request.setAttribute("serviceAmount", serviceAmount);

            request.getRequestDispatcher("ConfirmBooking.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("SelectSlot.jsp?error=servererror");
        }
    }
}
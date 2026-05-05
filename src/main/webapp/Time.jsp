<%@ page import="java.sql.*" %>
<html>
<body>

<h2>Add Time Slot</h2>

<form method="post">
Time: <input type="text" name="time" required><br><br>
Car Name: <input type="text" name="car" required><br><br>
Vehicle Number: <input type="text" name="vnum" required><br><br>
<input type="submit" value="Add">
</form>

<%
if(request.getParameter("time") != null){

    String time = request.getParameter("time");
    String car = request.getParameter("car");
    String vnum = request.getParameter("vnum");

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/automobile_db",
        "root",""
    );

    PreparedStatement ps = con.prepareStatement(
        "INSERT INTO time_slot(time, car_name, vehicle_number) VALUES(?,?,?)"
    );

    ps.setString(1, time);
    ps.setString(2, car);
    ps.setString(3, vnum);
    ps.executeUpdate();

    out.println("Time Slot Added Successfully ✅");

    con.close();
}
%>

</body>
</html>
<%@page import="java.math.BigInteger"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reservation_Result</title>
</head>
<body>
<%

 String date=request.getParameter("date1");
 String guests=request.getParameter("guests");
 String time=request.getParameter("time");
 String first=request.getParameter("first");
 String last=request.getParameter("last");
 String email=request.getParameter("email1");	
 String phone1=request.getParameter("phone1");
 try{
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","123456");
	 String sql="insert into reservation values(?,?,?,?,?,?,?)";
	 PreparedStatement pst=conn.prepareStatement(sql);
	 pst.setString(1, date);
	 pst.setString(2, guests);
	 pst.setString(3, time);
	 pst.setString(4, first);
	 pst.setString(5, last);
	 pst.setString(6, email);
	 pst.setString(7, phone1);
	 int x=pst.executeUpdate();
	 if(x==1){
		 out.print("Welcome! "  +" "+first +" "+last +", Sucessfully Booked!");
		 out.print("\n");
	 }
 }
 catch(Exception e){
	 out.println(e.getMessage());
 }

%>
</body>
</html>
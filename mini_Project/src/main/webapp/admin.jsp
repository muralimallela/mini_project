<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	background-color: #123445;
	color: white;
}

table, th, td {
	border: 1px solid white;
	border-collapse: collapse;
	text-align : center;
	font-size : 20px;
}
th{
	color : yellow;
}

</style>
</head>
<body>
	<h1 align="center">Welcome to admin page</h1>
	<%@ page import="java.sql.*"%>
	<%
	out.print("<div align = 'center'><table > <tr> <th> First Name </th> <th> Last Name </th><th> Rollnumber</th> <th> Gender</th><th>Batch</th><th> Project Name</th><th> Incharge Name</th><th> Guide Name</th><th> HOD Name</th><th> Image File Name</th><th> Role</th><th> Project Type</th>");
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cse", "root", "");
		Statement ps = con.createStatement();
		ResultSet rs = ps.executeQuery("select * from student");
		while (rs.next())
			out.println("<tr> <td> " + rs.getString(1) + "</td><td> " + rs.getString(2) + "</td><td> " + rs.getString(3)
			+ "</td><td> " + rs.getString(4) + "</td><td> " + rs.getString(5)+ "</td><td> " + rs.getString(6)
			+ "</td><td> " + rs.getString(7)
			+ "</td><td> " + rs.getString(8)+ "</td><td> " + rs.getString(9)+ "</td><td> " + rs.getString(10)+ "</td><td> " + rs.getString(11)+ "</td><td> " + rs.getString(12)+ "</td></tr>");
		con.close();
		ps.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	out.print("</div></table> ");
	%>
	

</body>
</html>
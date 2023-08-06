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
	text-align: center;
	font-size: 20px;
}

th {
	color: yellow;
}
</style>
</head>
<body>
	<h1 align="center">Welcome to user page</h1>
	<h3>
		<a href="index.html">Home</a>
	</h3>

	<%@ page import="java.sql.*"%>
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	String username = (String) request.getAttribute("username");
	String img = null;
	out.print("<div align = 'center'><table > ");
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cse", "root", "");
		PreparedStatement ps = con.prepareStatement("select * from student where rollnumber = ?");
		ps.setString(1, username);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			img = rs.getString("img");
			out.println("<tr><th>Name</th><td>" + rs.getString(1) + " " + rs.getString(2) + "</td></tr>"
			+ "<tr><th>Rollnumber</th><td>" + rs.getString(3) + "</td></tr>" + "<tr><th>Gender</th><td>"
			+ rs.getString(4) + "</td></tr>" + "<tr><th>Batch</th><td>" + rs.getString(5) + "</td></tr>"
			+ "<tr><th>Project Name</th><td>" + rs.getString(6) + "</td></tr>" + "<tr><th>Incharge Name</th><td>"
			+ rs.getString(7) + "</td></tr>" + "<tr><th>Guide Name</th><td>" + rs.getString(8) + "</td></tr>"
			+ "<tr><th>Hod name</th><td>" + rs.getString(9) + "</td></tr>" + "<tr><th>img</th><td>"
			+ rs.getString(10) + "</td></tr>" + "<tr><th>Roll</th><td>" + rs.getString(11) + "</td></tr>"
			+ "<tr><th>Project type</th><td>" + rs.getString(12) + "</td></tr>");
			out.print("</div></table> ");
			RequestDispatcher rd;
			request.setAttribute("username", username);
		}
		con.close();
		ps.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	%>
	<img src="images/<%=img%> " width="160" height="200">

</body>
</html>
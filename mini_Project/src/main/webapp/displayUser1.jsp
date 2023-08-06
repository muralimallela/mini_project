<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>user page</title>
<link rel="stylesheet" href="userpage.css">
</head>
<%@ page import="java.sql.*"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
String username = (String) request.getAttribute("username");
String name = null, image = null;
String img = null,gender= null;

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cse", "root", "");
	PreparedStatement ps = con.prepareStatement("select * from student where rollnumber = ?");
	ps.setString(1, username);
	ResultSet rs = ps.executeQuery();

	while (rs.next()) {
		name = (rs.getString(1) + " " + rs.getString(2));
		img = rs.getString("img");
		
	}
%>
<body>
	<header>
		<h1>SSIT</h1>
		<nav class="navigation">
			<a class="nav-link" href="#">Home</a> <a class="nav-link" href="#">about</a>
			<a class="nav-link" href="#">Services</a> <a class="nav-link"
				href="#">Contact</a> <img class="user-img" src="images/<%=img%> "
				onclick="toggleMenu()">

			<div class="sub-menu-wrap" id="subMenu">

				<div class="sub-menu">

					<div class="user-info">
						<img src="images/<%=img%> " alt="">
						<h3><%=name%></h3>

					</div>
					<hr>
					<a href="#" class="sub-menu-link"> <ion-icon
							name="person-circle-outline"></ion-icon>
						<p>Edit profile</p> <span>></span>
					</a> <a href="#" class="sub-menu-link"> <ion-icon name="settings"></ion-icon>
						<p>Setting & Privacy</p> <span>></span>
					</a> <a href="#" class="sub-menu-link"> <ion-icon name="help"></ion-icon>
						<p>Help</p> <span>></span>
					</a> <a href="#" class="sub-menu-link"> <ion-icon name="log-out"></ion-icon>
						<p>Logout</p> <span>></span>
					</a>
				</div>
			</div>

		</nav>
	</header> 
	<!-- 
	<div class="buttons">
		<button
			style="width: 100px; height: 40px; margin-top: 160px; color: yellow; background-color: black; border: none; border-radius: 20px">button</button>
	</div> -->
	<div class="table1">
	
	<%
	rs = ps.executeQuery();
	out.print("<div align = 'center'><table > ");
	while (rs.next()) {

		out.println("<tr><th>Name</th><td>" + rs.getString(1) + " " + rs.getString(2) + "</td></tr>"
		+ "<tr><th>Rollnumber</th><td>" + rs.getString(3) + "</td></tr>" + "<tr><th>Gender</th><td>"
		+ rs.getString(4) + "</td></tr>" + "<tr><th>Batch</th><td>" + rs.getString(5) + "</td></tr>"
		+ "<tr><th>Project Name</th><td>" + rs.getString(6) + "</td></tr>" + "<tr><th>Incharge Name</th><td>"
		+ rs.getString(7) + "</td></tr>" + "<tr><th>Guide Name</th><td>" + rs.getString(8) + "</td></tr>"
		+ "<tr><th>HOD name</th><td>" + rs.getString(9) + "</td></tr>" + "<tr><th>img</th><td>" + rs.getString(10)
		+ "</td></tr>" + "<tr><th>Roll</th><td>" + rs.getString(11) + "</td></tr>" + "<tr><th>Project type</th><td>"
		+ rs.getString(12) + "</td></tr>");
		
		RequestDispatcher rd;
		request.setAttribute("username", username);
	}
	out.print("</table> ");
	con.close();
	ps.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
		
	<img src="images/<%=img%> " width="160" height="200">
	</div>
	</div>
	
	
	<button onclick="window.print()">Print this page</button>
	<script>
		let subMenu = document.getElementById("subMenu");

		function toggleMenu() {
			subMenu.classList.toggle("open");
		}
	</script>
	<script type="module"
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>

</html>
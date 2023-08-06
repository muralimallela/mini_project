package mini_Project.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserRegistration
 */
@WebServlet("/UserRegistration")

public class UserRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegistration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String phoneNumber = request.getParameter("phoneNumber");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/murali","root","Murali@8712");
			PreparedStatement ps = con.prepareStatement("insert into user values(?,?,?,?)");
			ps.setString(1, username);
			ps.setString(2, password);
			ps.setString(3, email);
			ps.setString(4, phoneNumber);
			ps.executeUpdate();
			con.close();
			ps.close();
			response.sendRedirect("loginRegister.html");
		} catch (Exception e) {
			
			response.getWriter().print(e.toString());
			e.printStackTrace();
		}
	}

}

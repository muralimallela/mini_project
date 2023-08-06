package mini_Project.user;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class UploadData
 */
@WebServlet("/UploadData")
@MultipartConfig
public class UploadData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadData() {
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
		String firstname = request.getParameter("fistname");
		String lastname = request.getParameter("lastname");
		String gender = request.getParameter("gender");
		String rollnumber = request.getParameter("rollnumber");
		String type = request.getParameter("projectType");
		String projectName = request.getParameter("projectname");
		String guide = request.getParameter("guidename");
		String incharge = request.getParameter("inchargename");
		String hod = request.getParameter("hodName");
		String batch = request.getParameter("batch");
		String role = request.getParameter("role");
//		String imp = request.getParameter("image");
		
		response.setContentType("text/html; characterset = UTF-8");
		String fileName;
		try (PrintWriter out = response.getWriter()) {
			Part part = request.getPart("image");
			System.out.println(part);
			fileName = part.getSubmittedFileName();
			String path = "D:\\WorkSpace\\mini_Project\\src\\main\\webapp\\images\\" + fileName;
//			String path = getServletContext().getRealPath("/"+"files/"+fileName);
//			out.print(path);
			InputStream is = part.getInputStream();
			System.out.println(firstname + " " + lastname + " " + gender + " " + rollnumber + " " + type + " " + projectName
					+ " " + guide + " " + incharge + " " + hod + " " + batch + " " + role + " " + fileName);
			boolean succ = uploadFile(is, path);
			if (succ) {
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cse", "root", "");
					PreparedStatement ps = con.prepareStatement("insert into student values(?,?,?,?,?,?,?,?,?,?,?,?)");
					ps.setString(1, firstname);
					ps.setString(2, lastname);
					ps.setString(3, rollnumber);
					ps.setString(4, gender);
					ps.setString(5, batch);
					ps.setString(6, projectName);
					ps.setString(7, incharge);
					ps.setString(8, guide);
					ps.setString(9, hod);
					ps.setString(10, fileName);
					ps.setString(11, role);
					ps.setString(12, type);
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

	}
	public boolean uploadFile(InputStream is, String path) {
		boolean test = false;
		try {
			byte[] byt = new byte[is.available()];
			is.read(byt);
			FileOutputStream fops = new FileOutputStream(path);
			fops.write(byt);
			fops.flush();
			fops.close();
			test = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return test;
	}
}

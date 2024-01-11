package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DataService;

@WebServlet("/Item_Category_servlet")
public class Item_Category_servlet extends HttpServlet {

	Object Name, code, sr_no, desc, serials_no_start_from;
	String status;
	DataService con;
	PreparedStatement pst;
	Connection c;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {

			response.setContentType("text/html;charset=UTF-8");
			System.out.println("Item_Category_servlet-------->");

			sr_no = request.getParameter("sr_no");
			System.out.println("sr_no-------->" + sr_no);

			Name = request.getParameter("Name");
			System.out.println("Name-------->" + Name);

			code = request.getParameter("code");
			System.out.println("per-------->" + code);

			desc = request.getParameter("desc");
			System.out.println("desc-------->" + desc);

			serials_no_start_from = request.getParameter("serials_no_start_from");
			System.out.println("serials_no_start_from-------->" + serials_no_start_from);

			status = request.getParameter("status");
			System.out.println("status-------->" + status);

			Class.forName("com.mysql.jdbc.Driver");
			c = DriverManager.getConnection("jdbc:mysql://localhost:3306/candicodb", "root", "admin@123456789");
			System.out.println("Connecting with database");

			switch (status) {

			case "insert":
				pst = c.prepareStatement(
						"insert into  item_category(code,name,desciption,serials_no_start_from) values(?,?,?,?)");
				pst.setObject(1, code);
				pst.setObject(2, Name);
				pst.setObject(3, desc);
				pst.setObject(4, serials_no_start_from);

				int y = pst.executeUpdate();
				System.out.println("Connecting with database");
				if (y > 0)
					System.out.println("Data inserted succcessfully");
				else
					System.out.println("Data not inserted");
				break;

			case "delete":
				System.out.println("dlete if");
				pst = c.prepareStatement("delete from item_category where sr=?");
				pst.setString(1, sr_no.toString());
				int count = pst.executeUpdate();
				if (count == 0) {
					System.out.println("not delete");
				} else {
					System.out.println("Delete succesfully");
				}
				break;

			case "edit":
				System.out.println(" edit part");
				pst = c.prepareStatement(
						"update item_category set code=?,name=?,desciption=?,serials_no_start_from=? where sr=?");
				pst.setObject(1, code);
				pst.setObject(2, Name);
				pst.setObject(3, desc);
				pst.setObject(4, serials_no_start_from);
				pst.setObject(5, sr_no);
				int y2 = pst.executeUpdate();
				System.out.println("Connecting with database");
				if (y2 > 0)
					System.out.println("update");
				else
					System.out.println("not update");
				break;

			}

			c.close();
		} catch (SQLException ex) {
//           Logger.getLogger(InsertEmpMast.class.getName()).log(Level.SEVERE, null, ex);
		}

		catch (Exception ex) {
			System.out.println("Error -->" + ex);

		}

	}
}
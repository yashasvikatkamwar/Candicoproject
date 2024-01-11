package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DataService;

@WebServlet("/Item_Master_servlet")
public class Item_Master_servlet extends HttpServlet {

	Object sr_no, name, unit, hsn, desc, qty, cat, cat_sr, temp_sr;
	String status;
	DataService con;
	PreparedStatement pst;
	public ResultSet rs, rs2;
	Connection c;
	NumberFormat nf = NumberFormat.getNumberInstance(Locale.ENGLISH);
	DecimalFormat df = (DecimalFormat) nf;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {

			response.setContentType("text/html;charset=UTF-8");
			System.out.println("Item_Master_servlet-------->");

			sr_no = request.getParameter("sr_no");
			System.out.println("sr_no-------->" + sr_no);

			name = request.getParameter("name");
			System.out.println("name-------->" + name);

			unit = request.getParameter("unit");
			System.out.println("unit-------->" + unit);

			hsn = request.getParameter("hsn");
			System.out.println("hsn-------->" + hsn);

			desc = request.getParameter("desc");
			System.out.println("v -------->" + desc);

			String category = request.getParameter("cat");
			;
			System.out.println("category-------->" + category);

			if (category != null) {
				cat = category.split("=>")[0];
				System.out.println("cat-------->" + cat);

				cat_sr = category.split("=>")[1];
				System.out.println("cat_sr-------->" + cat_sr);
			}

			qty = request.getParameter("qty");
			System.out.println("qty-------->" + qty);

			status = request.getParameter("status");
			System.out.println("status-------->" + status);

			Class.forName("com.mysql.jdbc.Driver");
			c = DriverManager.getConnection("jdbc:mysql://localhost:3306/candicodb", "root", "admin@123456789");
			System.out.println("Connecting with database");

			pst = c.prepareStatement("SELECT IFNULL(MAX(temp_sr)+1,0) FROM item_master WHERE item_category=?");
			pst.setObject(1, cat);
			rs = pst.executeQuery();
			if (rs.next()) {
				temp_sr = rs.getObject(1);
			}
			System.out.println("temp_sr >>" + temp_sr);

			switch (status) {

			case "insert":
				df.applyPattern("##000000");
				String output = df.format(temp_sr);
				String inv_Fno = cat_sr + output;

				pst = c.prepareStatement(
						"insert into  item_master(item_name,unit,HSN_code,item_desc,item_category,qty,Iid,temp_sr) values(?,?,?,?,?,?,?,?)");
				pst.setObject(1, name);
				pst.setObject(2, unit);
				pst.setObject(3, hsn);
				pst.setObject(4, desc);
				pst.setObject(5, cat);
				pst.setObject(6, qty);

				pst.setObject(7, inv_Fno);
				pst.setObject(8, temp_sr);
				int y = pst.executeUpdate();
				System.out.println("Connecting with database");
				if (y > 0)
					System.out.println("Data inserted succcessfully");
				else
					System.out.println("Data not inserted");
				break;

			case "delete":
				System.out.println("dlete if");
				pst = c.prepareStatement("delete from item_master where sr=?");
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
						"update item_master set item_name=?,unit=?,HSN_code=?,item_desc=?,item_category=?,qty=? where sr=?");
				pst.setObject(1, name);
				pst.setObject(2, unit);
				pst.setObject(3, hsn);
				pst.setObject(4, desc);
				pst.setObject(5, cat);
				pst.setObject(6, qty);
				pst.setObject(7, sr_no);
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

package bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.*;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class impMethods {
	DataService dataservice;
	public static Connection c;
	public static Statement s;
	public static ResultSet rs;
	public ResultSet rs2;
	static PreparedStatement pst;
	int status = 0;

	public impMethods() throws ClassNotFoundException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			c = DriverManager.getConnection("jdbc:mysql://localhost:3306/candicodb", "root", "admin@123456789");
			System.out.println("Connecting with DataService");
			s = c.createStatement();
		} catch (SQLException m) {
			System.out.println("==>-" + m);
		}
	}

	public String productDateWiseProductId(){

		NumberFormat nf = NumberFormat.getNumberInstance(Locale.ENGLISH);
		DecimalFormat df = (DecimalFormat) nf;
		Object no = 0;
		try {
			ResultSet rs = s.executeQuery("SELECT MAX(id) FROM newProductFormula");
			System.out.println("==>return max id");
			if (rs.next()) {
				no = rs.getObject(1);
				System.out.print("MAXID>" + no);
			}
		} catch (Exception ex) {
			System.out.println(ex);
		}
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
//		System.out.println("year >>" + year);
		df.applyPattern("##000");
		String output = df.format(no);
		String inv_Fno = "PR" + year + output;
//		System.out.println("incoice no final >>" + inv_Fno);
		return inv_Fno;

	}
	
	public String BacthIdWiseBacthNo(){

		NumberFormat nf = NumberFormat.getNumberInstance(Locale.ENGLISH);
		DecimalFormat df = (DecimalFormat) nf;
		Object no = 0;
		try {
			ResultSet rs = s.executeQuery("SELECT MAX(batch_id) FROM batch_generation");
			System.out.println("==>return max id");
			if (rs.next()) {
				no = rs.getObject(1);
				System.out.print("MAXID>" + no);
			}
		} catch (Exception ex) {
			System.out.println(ex);
		}
		df.applyPattern("##000");
		String output = df.format(no);
		String inv_Fno = "BT"+ output;
//		System.out.println("incoice no final >>" + inv_Fno);
		return inv_Fno;

	}

	public String todaysDate() {
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		String strDate = formatter.format(date);
//		System.out.println(strDate);
		return strDate;
	}

}

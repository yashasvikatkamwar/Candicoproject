package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import conn.ConnectionDao;

public class newOprations {
	static Connection connection = ConnectionDao.getConnection();
	static PreparedStatement pst = null;

	public static int createProduct(String com, String version2, String productId, String date, String batchNo,
			String batchKg, String productName) {
		int status = 0;
		/*
		 * System.out.println("prodcom>>>>" + com); System.out.println("prodversion>>>>"
		 * + version2); System.out.println("prodproductId>>>>" + productId);
		 * System.out.println("proddate>>>>" + date); System.out.println("prodbatch>>>>"
		 * + batchKg); System.out.println("prodbatch>>>>" + batchNo);
		 * System.out.println("prod productName>>>>" + productName);
		 */

		try {
			pst = connection.prepareStatement(

					"INSERT INTO newproductformula( companyId, productCode, date, batchSizeNo, batchSizeKg, productName, version) VALUES (?,?,?,?,?,?,?)");

			// "INSERT INTO
			// newProductFormula(companyId,productCode,newProductFormula.date,batchNo,batchKg,productName,newProductFormula.version)
			// VALUES(?,?,?,?,?,?,?)");
			pst.setString(1, com);
			pst.setString(2, productId);
			pst.setString(3, date);
			pst.setString(4, batchNo);
			pst.setString(5, batchKg);
			pst.setString(6, productName);
			pst.setString(7, version2);
			status = pst.executeUpdate();
			System.out.println("status>>>>" + status);

		} catch (Exception e) {
			e.getMessage();
			System.out.println(e);
		}
		return status;
	}

	public static int createProductitems(Object iId, Object qty, Object unit, Object productId, Object iName) {
		int status = 0;
		try {
			pst = connection.prepareStatement(

					"insert into newProductFormulaItems(itemId,itemQty,unit,productCode,iName) values(?,?,?,?,?)");
			pst.setObject(1, iId);
			pst.setObject(2, qty);
			pst.setObject(3, unit);
			pst.setObject(4, productId);
			pst.setObject(5, iName);
			status = pst.executeUpdate();
		} catch (Exception e) {
			e.getMessage();
			System.out.println(e);
		}
		return status;
	}
	

		
		public static int deleteProduct(String productId) {
			int status = 0;
			System.out.println("productId>>>" + productId);
			try {
				pst = connection.prepareStatement(
						"DELETE newProductFormula.*,newProductFormulaItems FROM newProductFormula INNER JOIN newProductFormulaItems ON newProductFormulaItems.productCode=newProductFormula.productCode WHERE newProductFormula.productCode=?");
				pst.setString(1, productId);
				status = pst.executeUpdate();
			} catch (Exception e) {
				System.out.println(e);
			}
			return status;
			
		}

		
		
		
		  public static int UpdatecreateProductitems(Object iId, Object qty, Object
		  unit, String productId, Object iName) { int status = 0;
		  
		  System.out.println("productId>>>" + productId); try { pst =
		  connection.prepareStatement(
				"INSERT INTO newproductformulaitems (itemId, itemQty, unit, productCode, iName) VALUES (?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE itemId = IF(productCode = '"+productId+"', ?, itemId),itemQty = IF(productCode = '" +productId+"', ?, itemQty), unit = IF(productCode = '"+productId+"', ?, unit), iName = IF(productCode = '"+productId+"', ?, iName)"); 
		  
		  pst.setObject(1, iId); pst.setObject(2, qty); pst.setObject(3, unit);
		  pst.setObject(4, productId); pst.setObject(5, iName); status =
		  pst.executeUpdate(); System.out.println("status>>>>" + status); } catch
		  (Exception e) { System.out.println(e); } return status; }
		 

		public static int UpdatecreateProduct(String com, String version2, String productId, String date,
				String batchNo, String batchKg, String productName, String obj) {
			int status = 0;
			
			System.out.println("productId>>>" + productId);
			try {
				pst = connection.prepareStatement(
						"UPDATE newproductformula SET companyId=?, productCode=?, date=?, batchSizeNo=?, batchSizeKg=?, productName=?, version=? WHERE productCode='"+productId+"'");
				
				pst.setString(1, com);
				pst.setString(2, productId);
				pst.setString(3, date);
				pst.setString(4, batchNo);
				pst.setString(5, batchKg);
				pst.setString(6, productName);
				pst.setString(7, version2);
				status = pst.executeUpdate();
				System.out.println("status>>>>" + status);
			} catch (Exception e) {
				System.out.println(e);
			}
			return status;
		}
		
          public static int createWorkOrder(String com, String pwdate, String batchcode, String productCode, String department, String dom) {
			
			int status = 0;
			
			/*
			 * System.out.println("com>>>>" + com); System.out.println("version>>>>" +
			 * pwdate); System.out.println("productId>>>>" + batchcode);
			 * System.out.println("date>>>>" + productCode); System.out.println("batch>>>>"
			 * + hmd); System.out.println("productName>>>>" + department);
			 * System.out.println("productName>>>>" + dom);
			 */
			 
			try {
				pst = connection.prepareStatement(
						"INSERT INTO work_order_ms(c_name, product_code, batch_no, proposed_work_date,  department, date_of_manufacture) VALUES(?,?,?,?,?,?)");
				pst.setString(1, com);
				pst.setString(2, productCode);
				pst.setString(3, batchcode);
				pst.setString(4, pwdate);
				//pst.setString(5, hmd);
				pst.setString(5, department);
				pst.setString(6, dom);
				status = pst.executeUpdate();
				System.out.println("status>>>>" + status);

			} catch (Exception e) {
				e.getMessage();
				System.out.println(e);
			}
			return status;
			
		}

		
	

}
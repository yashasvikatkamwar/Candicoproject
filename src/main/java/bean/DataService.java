package bean;

import java.sql.*;
import org.joda.time.LocalDate;

import web.dateFormateChnge;

//selectEmployee_UnitId
public class DataService {

	public static Connection c;
	public static Statement s;
	public static ResultSet rs;
	public ResultSet rs2;
	static PreparedStatement pst;
	int status = 0;

	public DataService() throws ClassNotFoundException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			c = DriverManager.getConnection("jdbc:mysql://localhost:3306/candicodb", "root", "admin@123456789");
			System.out.println("Connecting with DataService");
			s = c.createStatement();
		} catch (SQLException m) {
			System.out.println("==>-" + m);
		}
	}
	//pranay
	public ResultSet ProductFormulaByCFT(String Fdate, String Tdate, String Cid) {
	    try {
	        System.out.println("Fdate: " + Fdate);
	        System.out.println("Tdate: " + Tdate);
	        System.out.println("Cid: " + Cid);

	        // Create a StringBuilder to construct the SQL query
	        StringBuilder sql = new StringBuilder();
	        sql.append("SELECT newProductFormula.*, Company.Cname FROM newProductFormula ");
	        sql.append("INNER JOIN Company ON newProductFormula.companyId = Company.code ");
	        sql.append("WHERE 1=1 "); // This is always true and will serve as the base condition

	        // Check and add conditions based on input parameters
	        if (Cid != null && !Cid.isEmpty()) {
	            sql.append("AND newProductFormula.companyId = ?");
	        }

	        if (Fdate != null && !Fdate.isEmpty() && Tdate != null && !Tdate.isEmpty()) {
	            sql.append("AND newProductFormula.date BETWEEN ? AND ?");
	        }

	        // Prepare the SQL statement
	        PreparedStatement preparedStatement = c.prepareStatement(sql.toString());

	        // Set parameter values based on conditions
	        int parameterIndex = 1;
	        if (Cid != null && !Cid.isEmpty()) {
	            preparedStatement.setString(parameterIndex++, Cid);
	        }
	        
	        if (Fdate != null && !Fdate.isEmpty() && Tdate != null && !Tdate.isEmpty()) {
	            preparedStatement.setString(parameterIndex++, Fdate);
	            preparedStatement.setString(parameterIndex, Tdate);
	        }

	        // Execute the SQL query
	        ResultSet rs = preparedStatement.executeQuery();
	        
	        return rs;
	    } catch (SQLException e) {
	        System.out.println("=ProductFormula=> " + e);
	        // Handle the exception or log it as needed
	        return null; // Return null or throw an exception depending on your error handling strategy
	    }
	}

	//pranay
		public ResultSet Company_list_ById(String Ccode) {
			try {
				rs = s.executeQuery("select * from Company where code='" + Ccode + "'");
			} catch (SQLException m) {

				System.out.println("=Company_details=>" + m);
			}
			return (rs);
		}
	// ashvin
	public ResultSet WorkProCode_Dropdown_Company_List(String Cid) {

		try {
			rs = s.executeQuery("select batch_id, batch_no from batch_generation where product_code = '" + Cid + "'");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	// ashvin
	public ResultSet Work_Dropdown_Company_List(String Cid) {

		try {
			rs = s.executeQuery("select id, productCode from newproductformula where companyId = '" + Cid + "'");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

//yashashvi 
	public int save_bulkissue(String company_id, String department, String remark, String issuedate, String typeofissue, String batch_no) {
		int st = 0;
		try {
			pst = c.prepareStatement("INSERT INTO bulkissuedatass(company_id,department, remark, issuedate, typeofissue, batch_no) VALUES ('"+company_id+"','"+department+"','"+remark+"','"+issuedate+"','"+typeofissue+"','"+batch_no+"')");
	        st = pst.executeUpdate();
		} catch (Exception e) {
			e.getMessage();
			System.out.println(e);
		}
		return st;
	}
	//yashashvi
	public static int updatebulkissuestock(String Iid , String reqqty) {
		int status = 0;
		try {
			PreparedStatement ps = c.prepareStatement("update QUALITY_CONTROL_DEPARTMENT set RELEASED_QTY=RELEASED_QTY-?   where Iid=?");
			ps.setString(1, reqqty);
			ps.setString(2, Iid);
			
			status = ps.executeUpdate();
			
		}catch(Exception e) {
		   System.out.println(e);	
		}
		
		return status;
	}
	
	//yashashvi
	public ResultSet getitemBycode(String Iid) {
	    
		 try {
			   
				PreparedStatement preparedStatement = c.prepareStatement("SELECT item_master.item_name, item_master.unit, quality_control_department.CIMS_batch_no, quality_control_department.expiry_date , quality_control_department.RELEASED_QTY FROM item_master LEFT JOIN quality_control_department ON item_master.Iid = quality_control_department.Iid WHERE item_master.Iid = ?");
			    
			    
			    preparedStatement.setString(1, Iid); 
			    /*
				 * "select item_master.item_name,item_master.unit from  item_master where Iid = ?"
				 */
			    
			    rs = preparedStatement.executeQuery();
			} catch (SQLException e) {
			    // Handle any exceptions
			    e.printStackTrace();
			}
		 return (rs);
		}
	//yashashvi
	public int Save_Batch_Items_ByBatchNo(String productcode, String batchno, Object itemId, Object iName, Object unit,
			Object itemQty , Object CIMS_batch_no) {
		// TODO Auto-generated method stub
		int st = 0;
		try {
			pst = c.prepareStatement("INSERT INTO batch_product_itemlist(product_code, batch_no, itemId, iName, unit, iQuantity ,CIMS_batch_no) VALUES ('"+productcode+"','"+batchno+"','"+itemId+"','"+iName+"','"+unit+"','"+itemQty+"' ,'"+CIMS_batch_no+"' )");
	        st = pst.executeUpdate();
		} catch (Exception e) {
			e.getMessage();
			System.out.println(e);
		}
		return st;
	}
	//yashashvi
	public int save_bulkissueitem(Object Iid, Object item_name,Object unit ,Object CIMS_batch_no, Object itemQty, String batch_no) {
	    int st = 0;
	    try {
	        String sql = "INSERT INTO bulkissueitem (itemcode, itemname, unit, cimsbatchno, qty, batch_no) VALUES (?, ?, ?, ?, ?, ?)";
	        pst = c.prepareStatement(sql);
	        pst.setObject(1, Iid);
	        pst.setObject(2, item_name);
	        pst.setObject(3, unit);
	        pst.setObject(4, CIMS_batch_no);
	        pst.setObject(5, itemQty);
	        pst.setString(6, batch_no);
	        st = pst.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.println(e);
	    }
	    return st;
	}
	//yashashvi
	public ResultSet viewBatchsbyid(int batch_id) {
		try {
			System.out.println("batch_id >" + batch_id);

			// Create a PreparedStatement
			PreparedStatement pst = c.prepareStatement("SELECT * FROM batch_generation WHERE batch_id = ?");

			// Set the batch_id parameter
			pst.setInt(1, batch_id);

			// Execute the query
			rs = pst.executeQuery();
		} catch (SQLException m) {
			System.out.println("Error getting batch by ID:" + m);
		}
		return rs;
	}
	//yashashvi
	public ResultSet batch_Items(int batch_id) {
		try {
			rs = s.executeQuery("select * from batchitemsbatchid where batch_id=" + batch_id + "");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}
	//yashashvi
	public static int updateBatchitems(int batch_id,String itemName, String unit, String itemQty, String itemAmount, String remQty, String received_Qty) {
	    int status = 0;
	    try {
	    	PreparedStatement ps1 = c.prepareStatement("UPDATE batchitemsbatchid SET  itemName = ?, unit = ?, itemQty = ?, itemAmount = ?, remQty = ?, received_Qty = ?  WHERE batch_id = ?");
	     
	        
	        ps1.setString(1, itemName);
	        ps1.setString(2, unit);
	        ps1.setString(3, itemQty);
	        ps1.setString(4, itemAmount);
	        ps1.setString(5, remQty);
	        ps1.setString(6, received_Qty);
	        ps1.setInt(7, batch_id);
	        status = ps1.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return status;
	}
	//yashashvi
	
	public ResultSet viewBatchById(String batch_no) {
	    
		 try {
			    // Create a prepared statement with a parameterized query
			    //PreparedStatement preparedStatement = c.prepareStatement("SELECT * FROM batch_generation WHERE batch_no = ?");
			PreparedStatement preparedStatement = c.prepareStatement("SELECT batch_id, company_id, batch_no, product_name, product_code, product_version, batch_date, batch_sizeKg, batchSize_no,(select Cname from company as cm where cm.code = cd.company_id) as Cname FROM batch_generation as cd  where batch_no = ?	");
			    
			    
			    preparedStatement.setString(1, batch_no); 
			    
			    
			    rs = preparedStatement.executeQuery();
			} catch (SQLException e) {
			    // Handle any exceptions
			    e.printStackTrace();
			}
		 return (rs);
		}
	
	//yashshvi
	public static int updateBatch(String batch_no, String product_name, String product_code, String product_version, String batch_date, String batch_sizeKg, String batchSize_no, String company_id) {
	    int status = 0;
	    try {
	        PreparedStatement ps = c
	        		.prepareStatement("UPDATE batch_generation SET  product_name = ?, product_code = ?, product_version = ?, batch_date = ?, batch_sizeKg = ?, batchSize_no = ?, company_id = ? WHERE batch_no = ?");
	     
	        ps.setString(1, product_name);
	        ps.setString(2, product_code);
	        ps.setString(3, product_version);
	        ps.setString(4, batch_date);
	        ps.setString(5, batch_sizeKg);
	        ps.setString(6, batchSize_no);
	        ps.setString(7, company_id);
	        ps.setString(8, batch_no);
	        status = ps.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return status;
	}
	
	//yashashvi
	public ResultSet batch_product_itemlist(String batch_no) {
		try {
			rs = s.executeQuery("select * from batch_product_itemlist where batch_no=" + batch_no + "");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}
	public ResultSet view_All_Batchs(String company_id ,String Fdate, String Tdate) {
		 try {
				
				System.out.println("company_name" + company_id);
				System.out.println("Fdate" + Fdate);
				System.out.println("Tdate" + Tdate);
				String sql = "SELECT `batch_id`, `company_id`, `batch_no`, `product_name`, `product_code`, `product_version`, `batch_date`, `batch_sizeKg`, `batchSize_no`,(select Cname from company as cm where cm.code = cd.company_id) as Cname FROM `batch_generation` as cd 	";
				if (Fdate != null && Tdate != null || company_id != null && company_id != "") {
					sql = sql + "WHERE";
				}
				if (company_id != null && company_id != "") {
					sql = sql + " company_id ='" + company_id + "' ";
				}
				if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "" && company_id != null && company_id != "") {
					sql = sql + " and ";
				}
				if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "") {
					sql = sql + " batch_date BETWEEN '" + Fdate + "' AND '" + Tdate + "'";
				}
				sql = sql + " ORDER BY batch_id DESC";
				System.out.println(sql);
				rs = s.executeQuery(sql);
				System.out.println(rs);
			} catch (SQLException m) {
				System.out.println("==>" + m);
			}
			return (rs);
	    }
	
	public ResultSet view_All_Batch(String company_id ) throws SQLException {
		  try {
	            String sql = "SELECT * FROM batch_generation where  company_id ="+company_id+" ";
	            rs = s.executeQuery(sql);
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return rs;
	    }
	 
	 public ResultSet view_All_Batchbydate(String Fdate, String Tdate ) throws SQLException {
		  try {
	            String sql = "SELECT * FROM batch_generation where batch_date BETWEEN "+ Fdate +" AND  "+ Tdate +"";
	            rs = s.executeQuery(sql);
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return rs;
	    }
	
	public ResultSet view_All_batchgen() throws SQLException {
		  try {
	            String sql = "SELECT `batch_id`, `company_id`, `batch_no`, `product_name`, `product_code`, `product_version`, `batch_date`, `batch_sizeKg`, `batchSize_no`,(select Cname from company as cm where cm.code = cd.company_id) as Cname FROM `batch_generation` as cd; ";
	            rs = s.executeQuery(sql);
	           // System.out.println("sql :"+sql);
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return rs;
	    }
	
	//yashashvi
	public static int updateBatch(int batch_id, String product_name, String product_code, String product_version,
			String batch_date, String batch_sizeKg, String batchSize_no, String items) {
		int status = 0;
		try {
			PreparedStatement ps = c.prepareStatement(
					"UPDATE batch_generation SET  product_name = ?, product_code = ?, product_version = ?, batch_date = ?, batch_sizeKg = ?, batchSize_no = ?, items = ? WHERE batch_id = ?");

			ps.setString(1, product_name);
			ps.setString(2, product_code);
			ps.setString(3, product_version);
			ps.setString(4, batch_date);
			ps.setString(5, batch_sizeKg);
			ps.setString(6, batchSize_no);
			ps.setString(7, items);
			ps.setInt(8, batch_id);
			status = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return status;
	}
//yuga
public ResultSet Batch_Dropdown_Company_List(String Cid) {
		
		try {
			rs = s.executeQuery("select productName, productCode from newProductFormula where companyId = '"+Cid+"'");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}
//yuga
public ResultSet Product_Details_ByProductCode(String Pid) {
	
	try {
		rs = s.executeQuery("SELECT batchSizeNo, batchSizeKg, productName, version FROM newproductformula WHERE productCode = '"+Pid+"'");
	
	} catch (SQLException m) {

		System.out.println("==>" + m);
	}
	return (rs);
}
//yuga
public ResultSet Item_Details_ByProductCode(String Pid) {
	
	try {
		//rs = s.executeQuery("SELECT itemId, itemQty, unit, iName FROM newproductformulaitems WHERE productCode = '"+Pid+"'");
		  rs = s.executeQuery("SELECT p.itemId, p.itemQty, p.unit, p.iName , q.CIMS_batch_no , q.expiry_date  , q.RELEASED_QTY  FROM  newproductformulaitems p LEFT JOIN  quality_control_department q ON p.itemId = q.Iid WHERE p.productCode = '"+Pid+"'");
	
	} catch (SQLException m) {

		System.out.println("==>" + m);
	}
	return (rs);
}
//yuga
public int Save_Batch_Items_ByBatchNo(String productcode, String batchno, Object itemId, Object iName, Object unit,
		Object itemQty) {
	// TODO Auto-generated method stub
	int st = 0;
	try {
		pst = c.prepareStatement("INSERT INTO batch_product_itemlist(product_code, batch_no, itemId, iName, unit, iQuantity) VALUES ('"+productcode+"','"+batchno+"','"+itemId+"','"+iName+"','"+unit+"','"+itemQty+"')");
        st = pst.executeUpdate();
	} catch (Exception e) {
		e.getMessage();
		System.out.println(e);
	}
	return st;
}

//pranay

public ResultSet getproductByID(String productId) { 
	  try { 
		  System.out.println("productByID=>" +productId );
		  rs=s.executeQuery(
		 // "SELECT * FROM newProductFormula p INNER JOIN newProductFormulaItems pi ON p.productCode = pi.productCode WHERE p.productCode = '"+productId+"'");
				  "SELECT * FROM newProductFormula AS p INNER JOIN newProductFormulaItems AS pi ON p.productCode = pi.productCode WHERE p.productCode = '"+productId+"'");
		  System.out.println("qurrey run");
}catch(SQLException m) 
{ 
	  System.out.println("=getproductByID=>" + m); 
	  } 
return (rs); 
}

//pranay
public ResultSet ProductFormula() {
	try {
		rs = s.executeQuery(
				"SELECT newProductFormula.*, Company.Cname FROM newProductFormula INNER JOIN Company ON newProductFormula.companyId = Company.code");
	} catch (SQLException m) {

		System.out.println("=ProductFormula=>" + m);
	}
	return (rs);
}


public int save_batches(String cid, String batchno, String productname, String version, String date, String expdate,
		String batchsizeinkg, String productcode, String batchsizeinno) {
	int st = 0;
	try {
		pst = c.prepareStatement("INSERT INTO batch_generation(company_id,batch_no, product_name, product_code, product_version, batch_date,exdate, batch_sizeKg, batchSize_no) VALUES ('"+cid+"','"+batchno+"','"+productname+"','"+productcode+"','"+version+"','"+date+"','"+expdate+"','"+batchsizeinkg+"','"+batchsizeinno+"')");
        st = pst.executeUpdate();
	} catch (Exception e) {
		e.getMessage();
		System.out.println(e);
	}
	return st;
}



	public ResultSet unit_list() {
		try {
			rs = s.executeQuery("select unit_name from unit_Master ORDER BY unit_name ASC");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet unit_list_all() {
		try {
			rs = s.executeQuery("select * from unit_Master ORDER BY unit_name ASC");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet materials_list() {
		try {
			rs = s.executeQuery("select * from materials ORDER BY name ASC");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet Equipment_list() {
		try {
			rs = s.executeQuery("select * from equipment ORDER BY name ASC");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet labor_rate_list() {
		try {
			rs = s.executeQuery("select * from labor_rate ORDER BY name ASC");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet materials_type_list() {
		try {
			rs = s.executeQuery("select name from material_type ORDER BY name ASC");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet Equipment_type_list() {
		try {
			rs = s.executeQuery("select name from equipment_type ORDER BY name ASC");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet labor_type_list() {
		try {
			rs = s.executeQuery("select name from labor_type ORDER BY name ASC");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet Company_list() {
		try {
			rs = s.executeQuery("select * from Company ORDER BY Cname ");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet Company_details(String Cid) {
		try {
			rs = s.executeQuery("select * from Company where sr='" + Cid + "'");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet Project_list() {
		try {
			rs = s.executeQuery("select * from project_master ORDER BY sr DESC");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet Employee_list() {
		try {
			rs = s.executeQuery("select * from employee_master ORDER BY sr DESC");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet Project_details(String Pid) {
		try {
			rs = s.executeQuery("select * from project_master where sr='" + Pid + "'");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet Tax_list() {
		try {
			rs = s.executeQuery("select * from tax_master ORDER BY sr ");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet Item_category_list() {
		try {
			rs = s.executeQuery("select * from item_category ORDER BY sr DESC ");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet Item_Master_list() {
		try {
			rs = s.executeQuery("select * from item_master ORDER BY sr DESC ");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet Overhead_list() {
		try {
			rs = s.executeQuery("select * from overhead_master ORDER BY sr ");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet Vender_list() {
		try {
			System.out.println("in vender");
			rs = s.executeQuery("select * from vender ORDER BY sr DESC ");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet Manufacture_list(String Vid) {
		try {
			rs = s.executeQuery("select * from vender_manufacture_list where Vid='" + Vid + "' ORDER BY sr DESC ");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet PO_list() {
		try {
			rs = s.executeQuery("select * from Purches_order ORDER BY sr DESC");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet PO_list_with_itrms(String Fdate, String Tdate, String Cid) {
		try {
			System.out.println("Fdate" + Fdate);
			System.out.println("Tdate" + Tdate);
			System.out.println("Cid" + Cid);
			String sql = "SELECT Purches_order.*,vender.GST_no,vender.adrs,Purches_order_items.*\n"
					+ "            FROM Purches_order\n"
					+ "            JOIN vender ON (vender.code = Purches_order.vid)\n"
					+ "            JOIN Purches_order_items ON (Purches_order_items.Pid = Purches_order.sr) ";
			if (Fdate != null && Tdate != null || Cid != null && Cid != "") {
				sql = sql + "WHERE";
			}
			if (Cid != null && Cid != "") {
				sql = sql + " Purches_order.Com_id ='" + Cid + "' ";
			}
			if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "" && Cid != null && Cid != "") {
				sql = sql + " and ";
			}
			if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "") {
				
				sql = sql + " Purches_order.datee BETWEEN '" + Fdate + "' AND '" + Tdate + "'";
			}
			sql = sql + " ORDER BY Purches_order.sr DESC";
			System.out.println(sql);
			rs = s.executeQuery(sql);
		} catch (SQLException m) {
			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet PO_details(String Pid) {
		try {
			rs = s.executeQuery("select * from Purches_order where sr=" + Pid + "");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet PO_items(String Pid) {
		try {
			rs = s.executeQuery("select * from Purches_order_items where Pid=" + Pid + "");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet Vender_details(String Vid) {
		try {
			rs = s.executeQuery("select * from vender where code='" + Vid + "'");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet PO_items_Arraival(String Pid) {
		try {
			rs = s.executeQuery("select * from Purches_order_shedule_date where Pid=" + Pid + "");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet PO_getID() {
		try {
			rs = s.executeQuery("SELECT IFNULL(MAX(sr)+1,1) FROM Purches_order");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet Company_PO(String Cid) {
		try {
			rs = s.executeQuery("select * from Purches_order where Com_id='" + Cid + "'");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet GRN_getID(String Cid) {
		try {
			rs = s.executeQuery("SELECT IFNULL(MAX(com_vise_GRN_no)+1,1) FROM GRN where Com_id='" + Cid + "'");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet BILL_getID(String Cid) {
		try {
			rs = s.executeQuery("SELECT IFNULL(MAX(Com_wise_bill_id)+1,1) FROM BILL WHERE Cid='" + Cid + "'");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet Company_PO_ID_next(String Cid) {
		try {
			rs = s.executeQuery("SELECT IFNULL(MAX(com_vise_PO_no)+1,1) FROM Purches_order where Com_id='" + Cid + "'");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet GRN_list(String Fdate, String Tdate, String Cid) {
		try {
			System.out.println("Fdate" + Fdate);
			System.out.println("Tdate" + Tdate);
			System.out.println("Cid" + Cid);
			String sql = "SELECT * FROM GRN ";
			if (Fdate != null && Tdate != null || Cid != null && Cid != "") {
				sql = sql + "WHERE";
			}
			if (Cid != null && Cid != "") {
				sql = sql + " Com_id ='" + Cid + "' ";
			}
			if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "" && Cid != null && Cid != "") {
				sql = sql + " and ";
			}
			if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "") {
				sql = sql + " createAt BETWEEN '" + Fdate + "' AND '" + Tdate + "'";
			}
			sql = sql + " ORDER BY sr DESC";
			System.out.println(sql);
			rs = s.executeQuery(sql);
		} catch (SQLException m) {
			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet GRN_item_list(String Gid) {
		try {
			System.out.println("Gid >" + Gid);
			rs = s.executeQuery("select * from GRN_items where Gid='" + Gid + "'");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet GRN_Details(String Gid) {
		try {
			System.out.println("Gid >" + Gid);
			rs = s.executeQuery("select * from GRN where sr='" + Gid + "'");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet GRN_PDF_DATA(String Fdate, String Tdate, String Cid) {
		try {
			System.out.println("Fdate" + Fdate);
			System.out.println("Tdate" + Tdate);
			System.out.println("Cid" + Cid);
			String chek_cid = "";
			if (Cid.equals("null") || Cid.equals("")) {
			} else {
				chek_cid = "Com_id='" + Cid + "' AND";
			}
			String sql = "SELECT GRN.*,GRN_items.*\n" + "FROM GRN\n"
					+ "JOIN GRN_items ON (GRN.sr = GRN_items.Gid) WHERE " + chek_cid + " GRN.createAt BETWEEN '" + Fdate
					+ "' AND '" + Tdate + "' \n" + "ORDER BY GRN.sr DESC";
			System.out.println("sql >>" + sql);
			rs = s.executeQuery(sql);
		} catch (SQLException m) {
			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet GRN_PDF_Details(String GIid) {
		try {
			System.out.println("GIid >" + GIid);
			rs = s.executeQuery("SELECT GRN.*,GRN_items.*,IFNULL(Purches_order.datee,\"\")\n" + "FROM GRN\n"
					+ "JOIN GRN_items ON (GRN.sr = GRN_items.Gid)\n"
					+ "LEFT JOIN Purches_order ON (GRN.Pid = Purches_order.Pid)\n" + "WHERE GRN_items.sr='" + GIid
					+ "' \n" + "ORDER BY GRN.sr DESC");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet Get_new_BachNO() {
		try {
			rs = s.executeQuery("SELECT IFNULL(MAX(Batch)+1,1) FROM GRN_items");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet Company_GRN_ID_next(String Cid) {
		try {
			rs = s.executeQuery("SELECT IFNULL(MAX(com_vise_GRN_no)+1,1) FROM GRN where Com_id='" + Cid + "'");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet COM_GRN_list(String Cid) {
		try {
			rs = s.executeQuery("select * from GRN where Com_id='" + Cid + "' ORDER BY sr DESC ");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet QCD_list() {
		try {
			rs = s.executeQuery("select * from QUALITY_CONTROL_DEPARTMENT ORDER BY sr DESC ");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet BILL_list(String Fdate, String Tdate, String Cid) {
		try {
			System.out.println("Fdate" + Fdate);
			System.out.println("Tdate" + Tdate);
			System.out.println("Cid" + Cid);
			String sql = "SELECT * FROM BILL ";
			if (Fdate != null && Tdate != null || Cid != null && Cid != "") {
				sql = sql + "WHERE";
			}
			if (Cid != null && Cid != "") {
				sql = sql + " Cid ='" + Cid + "' ";
			}
			if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "" && Cid != null && Cid != "") {
				sql = sql + " and ";
			}
			if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "") {
				sql = sql + " Bill_date BETWEEN '" + Fdate + "' AND '" + Tdate + "'";
			}
			sql = sql + " ORDER BY sr DESC";
			System.out.println(sql);
			rs = s.executeQuery(sql);
		} catch (SQLException m) {
			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet BILL_Details(String Bid) {
		try {
			System.out.println("Bid >" + Bid);
			rs = s.executeQuery("select * from BILL where sr='" + Bid + "'");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet BILL_item_list(String Bid) {
		try {
			System.out.println("Bid >" + Bid);
			rs = s.executeQuery("select * from BILL_DETAILS where Bid='" + Bid + "'");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet QCD_Details(String Qid) {
		try {
			rs = s.executeQuery("select * from QUALITY_CONTROL_DEPARTMENT where sr='" + Qid + "'  ");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet GRN_list_with_items(String Fdate, String Tdate, String Cid) {
		try {
			System.out.println("Fdate" + Fdate);
			System.out.println("Tdate" + Tdate);
			System.out.println("Cid" + Cid);
			String sql = "SELECT GRN.*,GRN_items.* FROM GRN LEFT JOIN GRN_items ON (GRN_items.Gid = GRN.sr) ";
			if (Fdate != null && Tdate != null || Cid != null && Cid != "") {
				sql = sql + "WHERE";
			}
			if (Cid != null && Cid != "") {
				sql = sql + " GRN.Com_id ='" + Cid + "' ";
			}
			if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "" && Cid != null && Cid != "") {
				sql = sql + " and ";
			}
			if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "") {
				sql = sql + " GRN.createAt BETWEEN '" + Fdate + "' AND '" + Tdate + "'";
			}
			sql = sql + " ORDER BY GRN.sr DESC";
			System.out.println(sql);
			rs = s.executeQuery(sql);
		} catch (SQLException m) {
			System.out.println("==>" + m);
		}
		return (rs);
	}

	/*
	 * public ResultSet Product_Company_list() { try { rs =
	 * s.executeQuery("select * from Company ORDER BY Cname "); } catch
	 * (SQLException m) {
	 * 
	 * System.out.println("==>" + m); } return (rs); }
	 */

	public ResultSet StockDetails() {
		
		
		
		  String sql = "SELECT DISTINCT  \r\n"
		  		
		  		+ "grn.gid,\r\n"
		  		+ "grn.com_name,\r\n"
		  		+ "grn_items.Iid ,\r\n"
		  		+ "grn_items.Iname ,"
		  		+ "\"-\" AS CIMS_batch_no,\r\n"
		  		+ "\"-\" AS RELEASED_QTY,\r\n"
		  		+ "\"-\" AS AR_no,\r\n"
		  		+ "\"-\" AS vender_batch_no,\r\n"
		  		+ "\"-\" AS MFG_date,\r\n"
		  		+ "\"-\" AS expiry_date,\r\n"
		  		+ "\"-\" AS received_QTY,\r\n"
		  		+ "\"-\" AS REANALYSIS_DATE,\r\n"
		  		+ "\"-\" AS MFG_retest_date,\r\n"
		  		+ "\"-\" AS MFG_name,\r\n"
		  		+ "\"-\" AS Vname,\r\n"
		  		+ "\"-\" AS result\r\n"
		  		+ "FROM grn\r\n"
		  		+ "Left JOIN grn_items ON grn.sr = grn_items.Gid\r\n"
		  		+ "LEFT JOIN quality_control_department ON grn.gid = quality_control_department.Gid\r\n"
		  		+ "WHERE quality_control_department.Gid IS NULL\r\n"
		  		+ "\r\n"
		  		+ "UNION ALL\r\n"
		  		+ "\r\n"
		  		+ "SELECT \r\n"
		  		
		  		+ "grn.gid,\r\n"
		  		+ "grn.com_name,\r\n"
		  		+ "quality_control_department.Iid,\r\n"
		  		+ "quality_control_department.Iname,\r\n"
		  		+ "quality_control_department.CIMS_batch_no,\r\n"
		  		+ "quality_control_department.RELEASED_QTY,\r\n"
		  		+ "quality_control_department.AR_no,\r\n"
		  		+ "quality_control_department.vender_batch_no,\r\n"
		  		+ "quality_control_department.MFG_date,\r\n"
		  		+ "quality_control_department.expiry_date,\r\n"
		  		+ "quality_control_department.received_QTY,\r\n"

		  		+ "quality_control_department.REANALYSIS_DATE,\r\n"
		  		+ "quality_control_department.MFG_retest_date,\r\n"
		  		+ "quality_control_department.MFG_name,\r\n"
		  		+ "quality_control_department.Vname,\r\n"
		  		+ "quality_control_department.result\r\n"
		  		+ "FROM grn, QUALITY_CONTROL_DEPARTMENT\r\n"
		  		+ "WHERE grn.gid = QUALITY_CONTROL_DEPARTMENT.gid;";
		  		
			try { rs = s.executeQuery(sql); } catch (SQLException e) {
		  e.printStackTrace(); }
		 
		return rs;
	}

	public ResultSet ProductFormulaMaxId() {
		try {
			rs = s.executeQuery("SELECT MAX(id) FROM newProductFormula");
			System.out.println("==>return max id");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return rs;
	}



	public ResultSet selectProductItems() {
		try {
			rs = s.executeQuery("select * from newProductFormulaItems where");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	public ResultSet getAllInspectionElement() {
		try {
			rs = s.executeQuery(
					"SELECT item_master.item_name,SUM(received_QTY),SUM(RELEASED_QTY) FROM QUALITY_CONTROL_DEPARTMENT INNER JOIN item_master ON item_master.Iid=QUALITY_CONTROL_DEPARTMENT.Iid GROUP BY item_master.Iid");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}

	

	public ResultSet viewBatchs() throws SQLException {
		try {
			String sql = "SELECT * FROM batch_generation";
			rs = s.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	public static int updateStock(String inputBoxValue, String buttonId) {
		int status = 0;
		try {
			PreparedStatement ps = c.prepareStatement(
					"update QUALITY_CONTROL_DEPARTMENT set received_QTY=received_QTY-? , approvedQty=approvedQty+?  where Qid=?");
			ps.setString(1, inputBoxValue);
			ps.setString(2, inputBoxValue);
			ps.setString(3, buttonId);
			status = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return status;
	}
	public int savebatchmrn(String cid, String department, String remark, String batchmrn_date, String batchno) {
		int st = 0;
		try {
			pst = c.prepareStatement("INSERT INTO batch_mrn(com_id,mrn_date, department, batch_no, remark) VALUES ('"+cid+"','"+batchmrn_date+"','"+department+"','"+batchno+"','"+remark+"')");
	        st = pst.executeUpdate();
		} catch (Exception e) {
			e.getMessage();
			System.out.println(e);
		}
		return st;
	}
	public int savebatchmrnitem(Object itemId, Object iName, Object itemQty, Object unit, Object cIMS_batch_no,
			String batchno) {
		int st = 0;
	    try {
	        String sql = "INSERT INTO batchmrnitem (itemcode, iName, unit, CIMS_batch_no, itemQty, batchno) VALUES (?, ?, ?, ?, ?, ?)";
	        pst = c.prepareStatement(sql);
	        pst.setObject(1, itemId);
	        pst.setObject(2, iName);
	        pst.setObject(3, itemQty);
	        pst.setObject(4, unit);
	        pst.setObject(5, cIMS_batch_no);
	        pst.setString(6, batchno);
	        st = pst.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.println(e);
	    }
	    return st;
	}
	public static int updatebatchmrnitem(Object cIMS_batch_no, Object itemQty) {
		int status = 0;
		try {
			PreparedStatement ps = c.prepareStatement("update QUALITY_CONTROL_DEPARTMENT set RELEASED_QTY=RELEASED_QTY+?   where CIMS_batch_no=?");
			ps.setString(1, (String) itemQty);
			ps.setString(2, (String) cIMS_batch_no);
			
			status = ps.executeUpdate();
			
		}catch(Exception e) {
		   System.out.println(e);	
		}
		
		return status;
	}
	
	
	public ResultSet Company_DeliveryChallan(String Cid) {
		try {
			rs = s.executeQuery("select * from deliverychallan where cid='" + Cid + "'");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
	}
	
	
	public ResultSet Company_deliveryChallanNo(String Cid) {
		try {
			
			rs=s.executeQuery(" SELECT company.shot_name, IFNULL(MAX(deliverychallan.delivery_challan_no) + 1, 1) AS next_delivery_challan_no\r\n"
					+ "FROM company \r\n"
					+ "Left JOIN deliverychallan\r\n"
					+ "ON  deliverychallan.cid = company.code \r\n"
					+ "WHERE code = '"+Cid+"'");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
}
	public static int createDeliveryChallan(String com, String cid, String comaddress, String statecode, String statename,
			String uniqueid, String trmode, String dlno, String dlstate, String dcno, String dcdate, String odno,
			String oddate, String lrno, String lrdate, String ewaybillno, String ewaybilldate, String vno,
			String trname, String total, String igst, String cgst, String sgst, String compcess, String roundoff,
			String totalamount) 
	{int st = 0;
    try {
        String sql = "INSERT INTO `candicodb`.`deliverychallan`\r\n"
        		+ "(`Cname`,\r\n"
        		+ "`cid`,\r\n"
        		+ "`com_address`,\r\n"
        		+ "`state_code`,\r\n"
        		+ "`state_name`,\r\n"
        		+ "`unique_id`,\r\n"
        		+ "`mode_of_transport`,\r\n"
        		+ "`d_l_no`,\r\n"
        		+ "`d_l_state`,\r\n"
        		+ "`delivery_challan_no`,\r\n"
        		+ "`delivery_challan_date`,\r\n"
        		+ "`outward_delivery_no`,\r\n"
        		+ "`outward_delivery_date`,\r\n"
        		+ "`l_r_no`,\r\n"
        		+ "`l_r_date`,\r\n"
        		+ "`e_way_bill_no`,\r\n"
        		+ "`e_way_bill_date`,\r\n"
        		+ "`vehicle_no`,\r\n"
        		+ "`transporter_name`,\r\n"
        		+ "`total`,\r\n"
        		+ "`igst`,\r\n"
        		+ "`cgst`,\r\n"
        		+ "`sgst`,\r\n"
        		+ "`comp_cess`,\r\n"
        		+ "`roundoff`,\r\n"
        		+ "`total_amount`)\r\n"
        		+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        pst = c.prepareStatement(sql);
        pst.setObject(1, com);
        pst.setString(2, cid);
        pst.setObject(3, comaddress);
        pst.setObject(4, statecode);
        pst.setObject(5, statename);
        pst.setObject(6, uniqueid);
        pst.setString(7, trmode);
        pst.setString(8, dlno);
        pst.setString(9, dlstate);
        pst.setString(10, dcno);
        pst.setString(11, dcdate);
        pst.setString(12, odno);
        pst.setString(13, oddate);
        pst.setString(14, lrno);
        pst.setString(15, lrdate);
        pst.setString(16, ewaybillno);
        pst.setString(17, ewaybilldate);
        pst.setString(18, vno);
        pst.setString(19, trname);
        pst.setString(20, total);
        pst.setString(21, igst);
        pst.setString(22, cgst);
        pst.setString(23, sgst);
        pst.setString(24, compcess);
        pst.setString(25, roundoff);
        pst.setString(26, totalamount);
        
        st = pst.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
        System.out.println(e);
    }
    return st;
	}

	public static int DeliveryChallanItem(String dcno, String odno, Object itemid, Object qty, Object iName, Object hsncode,
			Object batchno, Object unit, Object unitprice, Object taxvalue) {
		int st = 0;
	    try {
	        String sql = "INSERT INTO `candicodb`.`delivery_challan_item`\r\n"
	        		+ "(`delivery_challan_no`,\r\n"
	        		+ "`outward_delivery_no`,\r\n"
	        		+ "`delivery_challan_itemcol`,\r\n"
	        		+ "`item_name`,\r\n"
	        		+ "`hsn_code`,\r\n"
	        		+ "`batch_no`,\r\n"
	        		+ "`quantity`,\r\n"
	        		+ "`unit`,\r\n"
	        		+ "`price_per_unit`,\r\n"
	        		+ "`tax_value`)\r\n"
	        		+ "VALUES(?,?,?,?,?,?,?,?,?,?)";
	        pst = c.prepareStatement(sql);
	       
	        pst.setString(1, dcno);
	        pst.setString(2, odno);
	        pst.setObject(3, itemid); 
	        pst.setObject(4, iName);
	        pst.setObject(5, hsncode);
	        pst.setObject(6, batchno);
	        pst.setObject(7, qty);
	        pst.setObject(8, unit);
	        pst.setObject(9, unitprice);
	        pst.setObject(10, taxvalue);
	        
	        st = pst.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.println(e);
	    }
	    return st;
	}
	
	public ResultSet getAllDeliveryData() {
		try {
			
			rs=s.executeQuery("select * from ogp Join company On ogp.Cname = company.code;");
		} catch (SQLException m) {

			System.out.println("==>" + m);
		}
		return (rs);
}
	
	
	//Item Wise Stock And Ar Wise Stock
	
	
	public ResultSet getStockItemWiseArwise(String Cid, String Fdate, String Tdate) {
		try {
				System.out.println("Fdate: " + Fdate);
		        System.out.println("Tdate: " + Tdate);
		        System.out.println("Cid: " + Cid);
		        //StringBuilder sql = new StringBuilder();
			    String sql=("SELECT "
			            + "    grn.gid,"
			            + "    grn.com_name,"
			            + "    quality_control_department.Iid,"
			            + "    quality_control_department.Iname,"
			            + "    quality_control_department.CIMS_batch_no,"
			            + "    quality_control_department.RELEASED_QTY,"
			            + "    quality_control_department.AR_no,"
			            + "    quality_control_department.vender_batch_no,"
			            + "	   quality_control_department.sample_date,"
			            + "    quality_control_department.MFG_date,"
			            + "    quality_control_department.expiry_date,"
			            + "    quality_control_department.received_QTY,"
			            + "    quality_control_department.REANALYSIS_DATE,"
			            + "    quality_control_department.MFG_retest_date,"
			            + "    quality_control_department.MFG_name,"
			            + "    quality_control_department.Vname,"
			            + "    quality_control_department.result"
			            + " FROM grn"
			            + " JOIN QUALITY_CONTROL_DEPARTMENT ON grn.gid = QUALITY_CONTROL_DEPARTMENT.gid"
			            + " WHERE quality_control_department.AR_no IS NOT NULL  ");
			    if (Fdate != null && Tdate != null || Cid != null && Cid != "") {
					sql = sql + "and ";
				}
				if (Cid != null && Cid != "") {
					sql = sql + " quality_control_department.Cid ='" + Cid + "' ";
				}
				if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "" && Cid != null && Cid != "") {
					sql = sql + " and ";
				}
				if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "") {
					Fdate=dateFormateChnge.dateFormateChnge(Fdate);
					Tdate=dateFormateChnge.dateFormateChnge(Tdate);
					sql = sql + " quality_control_department.sample_date BETWEEN '" + Fdate + "' AND '" + Tdate + "'";
				}
				sql = sql + "  and quality_control_department.AR_no <> '-'ORDER BY Iid";
				System.out.println(sql);
				rs = s.executeQuery(sql);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return rs;
	}

	
	// Under Process Stock
		public ResultSet getUnderProcessStock(String Cid, String Fdate, String Tdate) {
			
			try {
				System.out.println("Fdate: " + Fdate);
		        System.out.println("Tdate: " + Tdate);
		        System.out.println("Cid: " + Cid);
			
			String sql =  "SELECT \r\n"
					+ "    quality_control_department.gid,\r\n"
					+ "    quality_control_department.Cname,\r\n"
					+ "    quality_control_department.Iid,\r\n"
					+ "    quality_control_department.Iname,\r\n"
					+ "    quality_control_department.CIMS_batch_no,\r\n"
					+ "    quality_control_department.RELEASED_QTY,\r\n"
					+ "    quality_control_department.AR_no,\r\n"
					+ "    quality_control_department.vender_batch_no,\r\n"
					+ "	   quality_control_department.sample_date,"
					+ "    quality_control_department.MFG_date,\r\n"
					+ "    quality_control_department.expiry_date,\r\n"
					+ "    quality_control_department.received_QTY,\r\n"
					+ "    quality_control_department.REANALYSIS_DATE,\r\n"
					+ "    quality_control_department.MFG_retest_date,\r\n"
					+ "    quality_control_department.MFG_name,\r\n"
					+ "    quality_control_department.Vname,\r\n"
					+ "    quality_control_department.result\r\n"
					+ "FROM\r\n"
					+ "   \r\n"
					+ "    QUALITY_CONTROL_DEPARTMENT \r\n"
					+ "WHERE\r\n"
					+ "    quality_control_department.result = 'under process'";
					  		
			if (Fdate != null && Tdate != null || Cid != null && Cid != "") {
				sql = sql + "and ";
			}
			if (Cid != null && Cid != "") {
				sql = sql + " quality_control_department.Cid ='" + Cid + "' ";
			}
			if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "" && Cid != null && Cid != "") {
				sql = sql + " and ";
			}
			if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "") {
				Fdate=dateFormateChnge.dateFormateChnge(Fdate);
				Tdate=dateFormateChnge.dateFormateChnge(Tdate);
				sql = sql + " quality_control_department.sample_date BETWEEN '" + Fdate + "' AND '" + Tdate + "'";
			}
			sql = sql + "  and quality_control_department.AR_no <> '-'ORDER BY Iid";
			System.out.println(sql);
			rs = s.executeQuery(sql);
			
				} catch (SQLException e) {
			  e.printStackTrace(); }
			 
			return rs;
		}
		
		// Released Stock
				public ResultSet getReleasedStock(String Cid, String Fdate, String Tdate) {
					try {
						System.out.println("Fdate: " + Fdate);
				        System.out.println("Tdate: " + Tdate);
				        System.out.println("Cid: " + Cid);
					
					  String sql =  "SELECT \r\n"
								+ "    quality_control_department.gid,\r\n"
								+ "    quality_control_department.Cname,\r\n"
								+ "    quality_control_department.Iid,\r\n"
								+ "    quality_control_department.Iname,\r\n"
								+ "    quality_control_department.CIMS_batch_no,\r\n"
								+ "    quality_control_department.RELEASED_QTY,\r\n"
								+ "    quality_control_department.AR_no,\r\n"
								+ "    quality_control_department.vender_batch_no,\r\n"
								+ "	   quality_control_department.sample_date,"
								+ "    quality_control_department.MFG_date,\r\n"
								+ "    quality_control_department.expiry_date,\r\n"
								+ "    quality_control_department.received_QTY,\r\n"
								+ "    quality_control_department.REANALYSIS_DATE,\r\n"
								+ "    quality_control_department.MFG_retest_date,\r\n"
								+ "    quality_control_department.MFG_name,\r\n"
								+ "    quality_control_department.Vname,\r\n"
								+ "    quality_control_department.result\r\n"
								+ "FROM\r\n"
								+ "   \r\n"
								+ "    QUALITY_CONTROL_DEPARTMENT \r\n"
								+ "WHERE\r\n"
								+ "    quality_control_department.result = 'RELEASED'";
					  if (Fdate != null && Tdate != null || Cid != null && Cid != "") {
							sql = sql + "and ";
						}
						if (Cid != null && Cid != "") {
							sql = sql + " quality_control_department.Cid ='" + Cid + "' ";
						}
						if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "" && Cid != null && Cid != "") {
							sql = sql + " and ";
						}
						if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "") {
							Fdate=dateFormateChnge.dateFormateChnge(Fdate);
							Tdate=dateFormateChnge.dateFormateChnge(Tdate);
							sql = sql + " quality_control_department.sample_date BETWEEN '" + Fdate + "' AND '" + Tdate + "'";
						}
						sql = sql + "  and quality_control_department.AR_no <> '-'ORDER BY Iid";
						System.out.println(sql);
						rs = s.executeQuery(sql);
						} catch (SQLException e) {
					  e.printStackTrace(); }
					 
					return rs;
				}
				
		// Released Stock
		public ResultSet getRejectedStock(String Cid, String Fdate, String Tdate) {
			
				try {
					
					
					
					 
					System.out.println("Fdate: " + Fdate);
			        System.out.println("Tdate: " + Tdate);
			        System.out.println("Cid: " + Cid);
			
			String sql =  "SELECT \r\n"
						+ "    quality_control_department.gid,\r\n"
						+ "    quality_control_department.Cname,\r\n"
						+ "    quality_control_department.Iid,\r\n"
						+ "    quality_control_department.Iname,\r\n"
						+ "    quality_control_department.CIMS_batch_no,\r\n"
						+ "    quality_control_department.RELEASED_QTY,\r\n"
						+ "    quality_control_department.AR_no,\r\n"
						+ "    quality_control_department.vender_batch_no,\r\n"
						+ "    quality_control_department.MFG_date,\r\n"
						+ "	   quality_control_department.sample_date,"
						+ "    quality_control_department.expiry_date,\r\n"
						+ "    quality_control_department.received_QTY,\r\n"
						+ "    quality_control_department.REANALYSIS_DATE,\r\n"
						+ "    quality_control_department.MFG_retest_date,\r\n"
						+ "    quality_control_department.MFG_name,\r\n"
						+ "    quality_control_department.Vname,\r\n"
						+ "    quality_control_department.result\r\n"
						+ "FROM\r\n"
						+ "   \r\n"
						+ "    QUALITY_CONTROL_DEPARTMENT \r\n"
						+ "WHERE\r\n"
						+ "    quality_control_department.result = 'rejected'";
					  		
							
						if (Fdate != null && Tdate != null || Cid != null && Cid != "") {
							sql = sql + "and ";
						}
						if (Cid != null && Cid != "") {
							sql = sql + " quality_control_department.Cid ='" + Cid + "' ";
						}
						if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "" && Cid != null && Cid != "") {
							sql = sql + " and ";
						}
						if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "") {
							Fdate=dateFormateChnge.dateFormateChnge(Fdate);
							Tdate=dateFormateChnge.dateFormateChnge(Tdate);
							sql = sql + " quality_control_department.sample_date BETWEEN '" + Fdate + "' AND '" + Tdate + "'";
						}
						sql = sql + "  and quality_control_department.AR_no <> '-'ORDER BY Iid";
						System.out.println(sql);
						rs = s.executeQuery(sql);
							
						} catch (SQLException e) {
					  e.printStackTrace(); }
					 
					return rs;
		}
		
		// Near Exp
				public ResultSet getNearExpStock(String Cid, String Fdate, String Tdate) {
					try {
						System.out.println("Fdate: " + Fdate);
				        System.out.println("Tdate: " + Tdate);
				        System.out.println("Cid: " + Cid);
				        String  sql =  "SELECT \r\n"
								+ "    quality_control_department.gid,\r\n"
								+ "    quality_control_department.Cname,\r\n"
								+ "    quality_control_department.Iid,\r\n"
								+ "    quality_control_department.Iname,\r\n"
								+ "    quality_control_department.CIMS_batch_no,\r\n"
								+ "    quality_control_department.RELEASED_QTY,\r\n"
								+ "    quality_control_department.AR_no,\r\n"
								+ "    quality_control_department.vender_batch_no,\r\n"
								+ "	   quality_control_department.sample_date,"
								+ "    quality_control_department.MFG_date,\r\n"
								+ "    quality_control_department.expiry_date,\r\n"
								+ "    quality_control_department.received_QTY,\r\n"
								+ "    quality_control_department.REANALYSIS_DATE,\r\n"
								+ "    quality_control_department.MFG_retest_date,\r\n"
								+ "    quality_control_department.MFG_name,\r\n"
								+ "    quality_control_department.Vname,\r\n"
								+ "    quality_control_department.result\r\n"
								+ "FROM\r\n"
								+ "    QUALITY_CONTROL_DEPARTMENT \r\n"
								+ "	";
					         
							       
									if (Fdate != null && Tdate != null || Cid != null && Cid != "") {
										sql = sql + "Where ";
									}
									if (Cid != null && Cid != "") {
										sql = sql + " quality_control_department.Cid ='" + Cid + "' ";
									}
									if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "" && Cid != null && Cid != "") {
										sql = sql + " and ";
									}
									if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "") {
										Fdate=dateFormateChnge.dateFormateChnge(Fdate);
										Tdate=dateFormateChnge.dateFormateChnge(Tdate);
										sql = sql + " quality_control_department.sample_date BETWEEN '" + Fdate + "' AND '" + Tdate + "'";
									}
									sql = sql + " ORDER BY  quality_control_department.expiry_date";
									System.out.println(sql);
									rs = s.executeQuery(sql);
										
									} catch (SQLException e) 
								  {
								     e.printStackTrace(); 
								  }
							return rs;
				}
		
				//  Expire Stocks
				public ResultSet getExpireStock(String Cid, String Fdate, String Tdate) {
					
					try {
						System.out.println("Fdate: " + Fdate);
				        System.out.println("Tdate: " + Tdate);
				        System.out.println("Cid: " + Cid);
					
					String sql = "SELECT \r\n"
							+ "    quality_control_department.gid,\r\n"
							+ "    quality_control_department.Cname,\r\n"
							+ "    quality_control_department.Iid,\r\n"
							+ "    quality_control_department.Iname,\r\n"
							+ "    quality_control_department.CIMS_batch_no,\r\n"
							+ "    quality_control_department.RELEASED_QTY,\r\n"
							+ "    quality_control_department.AR_no,\r\n"
							+ "    quality_control_department.vender_batch_no,\r\n"
							+ "	   quality_control_department.sample_date,"
							+ "    quality_control_department.MFG_date,\r\n"
							+ "    quality_control_department.expiry_date,\r\n"
							+ "    quality_control_department.received_QTY,\r\n"
							+ "    quality_control_department.REANALYSIS_DATE,\r\n"
							+ "    quality_control_department.MFG_retest_date,\r\n"
							+ "    quality_control_department.MFG_name,\r\n"
							+ "    quality_control_department.Vname,\r\n"
							+ "    quality_control_department.result\r\n"
							+ "FROM\r\n"
							+ "    QUALITY_CONTROL_DEPARTMENT \r\n"
							+ "    WHERE\r\n"
							+ "    quality_control_department.expiry_date < CURRENT_DATE\r\n"
							
							+ "";
								
					if (Fdate != null && Tdate != null || Cid != null && Cid != "") {
						sql = sql + "and ";
					}
					if (Cid != null && Cid != "") {
						sql = sql + " quality_control_department.Cid ='" + Cid + "' ";
					}
					if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "" && Cid != null && Cid != "") {
						sql = sql + " and ";
					}
					if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "") {
						Fdate=dateFormateChnge.dateFormateChnge(Fdate);
						Tdate=dateFormateChnge.dateFormateChnge(Tdate);
						sql = sql + " quality_control_department.sample_date BETWEEN '" + Fdate + "' AND '" + Tdate + "'";
					}
					sql = sql + " ORDER BY quality_control_department.expiry_date";
					System.out.println(sql);
					
							rs = s.executeQuery(sql); 
						} catch (SQLException e) {
					  e.printStackTrace(); }
					 
					return rs;
				}
				
				
				public ResultSet consumptionReportFromGRN(String Fdate, String Tdate, String Cid) {
					try {
						System.out.println("Fdate" + Fdate);
						System.out.println("Tdate" + Tdate);
						System.out.println("Cid" + Cid);
						String sql = "SELECT GRN.*,GRN_items.* FROM GRN LEFT JOIN GRN_items ON (GRN_items.Gid = GRN.sr) ";
						if (Fdate != null && Tdate != null || Cid != null && Cid != "") {
							sql = sql + "WHERE";
						}
						if (Cid != null && Cid != "") {
							sql = sql + " GRN.Com_id ='" + Cid + "' ";
						}
						if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "" && Cid != null && Cid != "") {
							sql = sql + " and ";
						}
						if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "") {
							Fdate=dateFormateChnge.dateFormateChnge(Fdate);
							Tdate=dateFormateChnge.dateFormateChnge(Tdate);
							sql = sql + " GRN.createAt BETWEEN '" + Fdate + "' AND '" + Tdate + "'";
						}
						sql = sql + " ORDER BY GRN.sr DESC";
						System.out.println(sql);
						rs = s.executeQuery(sql);
					} catch (SQLException m) {
						System.out.println("==>" + m);
					}
					return (rs);
				}
	
				public ResultSet supplier_Wise_Ledger(String Fdate, String Tdate, String Cid,String Supplier) {
					try {
						System.out.println("Fdate" + Fdate);
						System.out.println("Tdate" + Tdate);
						System.out.println("Cid" + Cid);
						System.out.println("Supplier" + Supplier);
						String sql = "SELECT GRN.*,GRN_items.* FROM GRN LEFT JOIN GRN_items ON (GRN_items.Gid = GRN.sr) ";
						if (Fdate != null && Tdate != null || Cid != null && Cid != ""|| Supplier != null && Supplier!="" ) {
					
							sql = sql + "WHERE";
						}
						if (Cid != null && Cid != "") {
							sql = sql + " GRN.Com_id ='" + Cid + "' ";
						}
						
						if ( Cid != null && Cid != "" && Supplier != null && Supplier!="") {
							sql = sql + " and ";
						}
						
						if (Supplier != null && Supplier!="") {
							sql = sql + " GRN.Vid ='" + Supplier + "' ";
						}
						
						if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "" && Cid != null && Cid != "" && Supplier != null && Supplier!="") {
							sql = sql + " and ";
						}
						if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "") {
							sql = sql + " GRN.createAt BETWEEN '" + Fdate + "' AND '" + Tdate + "'";
						}
						sql = sql + " ORDER BY GRN.Vid";
						System.out.println(sql);
						rs = s.executeQuery(sql);
					} catch (SQLException m) {
						System.out.println("==>" + m);
					}
					return (rs);
				}
			
				public ResultSet itemWiseLedger( String ItemId) {
					try {
						System.out.println("ItemId" + ItemId);
						String sql = "SELECT \r\n"
								+ "    grn.gid,  \r\n"
								+ "    grn_items.Iname,\r\n"
								+ "    grn_items.QTY_in_unit_of_Entry, \r\n"
								+ "    NULL as sample_QTY,\r\n"
								+ "    NULL as sample_date,\r\n"
								+ "    NULL as qty,\r\n"
								+ "    NULL as itemQty\r\n"
								+ "FROM candicodb.grn\r\n"
								+ "JOIN candicodb.grn_items ON grn_items.Gid = grn.sr \r\n"
								+ "WHERE grn_items.Iid = '"+ItemId+"'\r\n"
								+ "\r\n"
								+ "UNION ALL\r\n"
								+ "\r\n"
								+ "SELECT\r\n"
								+ "    gid,\r\n"
								+ "    Iname,\r\n"
								+ "    NULL as QTY_in_unit_of_Entry,\r\n"
								+ "    sample_QTY,\r\n"
								+ "    sample_date,\r\n"
								+ "    NULL as qty,\r\n"
								+ "    NULL as itemQty\r\n"
								+ "FROM candicodb.quality_control_department\r\n"
								+ "WHERE Iid = '"+ItemId+"'\r\n"
								+ "\r\n"
								+ "UNION ALL\r\n"
								+ "\r\n"
								+ "SELECT\r\n"
								+ "    NULL as gid,\r\n"
								+ "    itemname as Iname,\r\n"
								+ "    NULL as QTY_in_unit_of_Entry,\r\n"
								+ "    NULL as sample_QTY,\r\n"
								+ "    NULL as sample_date,\r\n"
								+ "    qty,\r\n"
								+ "    NULL as itemQty\r\n"
								+ "FROM candicodb.bulkissueitem\r\n"
								+ "WHERE itemcode = ' "+ItemId+" '\r\n"
								+ "\r\n"
								+ "UNION ALL\r\n"
								+ "\r\n"
								+ "SELECT\r\n"
								+ "    NULL as gid,\r\n"
								+ "    iName as Iname,\r\n"
								+ "    NULL as QTY_in_unit_of_Entry,\r\n"
								+ "    NULL as sample_QTY,\r\n"
								+ "    NULL as sample_date,\r\n"
								+ "    NULL AS qty,\r\n"
								+ "    itemQty\r\n"
								+ "FROM candicodb.batchmrnitem\r\n"
								+ "WHERE itemcode = '"+ItemId+"' ";
						
						System.out.println(sql);
						rs = s.executeQuery(sql);
					} catch (SQLException m) {
						System.out.println("==>" + m);
					}
					return (rs);
				}
				
				
				public ResultSet getworkorderBybatchCode(String bcode) {
			 		
			 		
			 		try {
			 			rs = s.executeQuery("select * from work_order_ms where batch_no = '" + bcode + "'");
			 			
			 		} catch (SQLException m) {

			 			System.out.println("==>" + m);
			 		}
			 		return (rs);
			 		
			 	}
				
				public ResultSet getDataBybatchCodeforissuework(String bcode) {
					
					try {
						rs = s.executeQuery("SELECT * FROM workorderitemsss WHERE batch_no = '"+bcode+"'"); 
						//rs = s.executeQuery("SELECT iName, unit, iQuantity, (select * from quality_control_department as qcd where qcd.CIMS_batch_no = cd.CIMS_batch_no) as quality FROM batch_product_itemlist as cd  where batch_no = '" + bcode + "'	");
						 
					} catch (SQLException m) {

						System.out.println("==>" + m);
					}
					return (rs);
					
					
				}
				
				public ResultSet getPrNameBybatchCode(String bcode) {
					
					
					try {
						rs = s.executeQuery("select * from batch_generation where batch_no = '" + bcode + "'");
						
					} catch (SQLException m) {

						System.out.println("==>" + m);
					}
					return (rs);
					
				}
				
				public ResultSet getDataBybatchCode(String bcode) {
					
					try {
						rs = s.executeQuery("SELECT batch_product_itemlist.*, quality_control_department.* FROM batch_product_itemlist LEFT JOIN quality_control_department ON batch_product_itemlist.CIMS_batch_no = quality_control_department.CIMS_batch_no WHERE batch_product_itemlist.batch_no = '" + bcode + "'"); 
						//rs = s.executeQuery("SELECT iName, unit, iQuantity, (select * from quality_control_department as qcd where qcd.CIMS_batch_no = cd.CIMS_batch_no) as quality FROM batch_product_itemlist as cd  where batch_no = '" + bcode + "'	");
						 
					} catch (SQLException m) {

						System.out.println("==>" + m);
					}
					return (rs);
					
					
				}
				
			
				public int saveogpdata(String cid, String ogpdate, String OgpNo, String modeOfTransport, String Purpose , String Remark , String suplierno , String Vehicleno ) {
					int st = 0;
					try {
						pst = c.prepareStatement("INSERT INTO ogpdata(cid,ogpdate, OgpNo, modeOfTransport, Purpose , Remark , suplierno , Vehicleno) VALUES ('"+cid+"','"+ogpdate+"','"+OgpNo+"','"+modeOfTransport+"','"+Purpose+"' , '"+Remark+"' , '"+suplierno+"' , '"+Vehicleno+"')");
				        st = pst.executeUpdate();
					} catch (Exception e) {
						e.getMessage();
						System.out.println(e);
					}
					return st;
				}
					
				
				public int saveogpitem(Object itemId, Object iName, Object unit, Object CIMS_batch_no, Object itemQty, String OgpNo) {
				    int st = 0;
				    try {
				        String query = "INSERT INTO ogpitem (itemId, iName, unit, CIMS_batch_no, itemQty, OgpNo) VALUES (?, ?, ?, ?, ?, ?)";
				        PreparedStatement pst = c.prepareStatement(query);

				        // Set parameters for the prepared statement
				        pst.setObject(1, itemId);
				        pst.setObject(2, iName);
				        pst.setObject(3, unit);
				        pst.setObject(4, CIMS_batch_no);
				        pst.setObject(5, itemQty);
				        pst.setString(6, OgpNo);

				        // Execute the prepared statement
				        st = pst.executeUpdate();
				    } catch (SQLException e) {
				        e.printStackTrace();
				    }
				    return st;
				}

				public static int updateogpitem(Object cIMS_batch_no, Object itemQty) {
					int status = 0;
					try {
						PreparedStatement ps = c.prepareStatement("update QUALITY_CONTROL_DEPARTMENT set RELEASED_QTY=RELEASED_QTY-?   where CIMS_batch_no=?");
						ps.setString(1, (String) itemQty);
						ps.setString(2, (String) cIMS_batch_no);
						
						status = ps.executeUpdate();
						
					}catch(Exception e) {
					   System.out.println(e);	
					}
					
					return status;
				}
				
				
				public ResultSet Company_ogpno(String Cid) {
					try {
						
						rs=s.executeQuery(" SELECT company.shot_name, IFNULL(MAX(deliverychallan.delivery_challan_no) + 1, 1) AS next_delivery_challan_no\r\n"
								+ "FROM company \r\n"
								+ "Left JOIN deliverychallan\r\n"
								+ "ON  deliverychallan.cid = company.code \r\n"
								+ "WHERE code = '"+Cid+"'");
					} catch (SQLException m) {

						System.out.println("==>" + m);
					}
					return (rs);
			}
				
             public ResultSet getogpdata(String ogpno) {
					
					
					try {
						rs = s.executeQuery("select * from ogpdata where OgpNo = '" + ogpno + "'");
						
					} catch (SQLException m) {

						System.out.println("==>" + m);
					}
					return (rs);
					
				}
			
             public ResultSet view_All_ogp(String company_id ,String Fdate, String Tdate) {
        		 try {
        				
        				System.out.println("company_name" + company_id);
        				System.out.println("Fdate" + Fdate);
        				System.out.println("Tdate" + Tdate);
        				String sql = "SELECT  `cid`, `ogpdate`, `OgpNo`, `modeOfTransport`, `Purpose`, `Remark`, `suplierno`, `Vehicleno`,(select Cname from company as cm where cm.code = cd.cid) as Cname FROM `ogpdata` as cd 	";
        				if (Fdate != null && Tdate != null || company_id != null && company_id != "") {
        					sql = sql + "WHERE";
        				}
        				if (company_id != null && company_id != "") {
        					sql = sql + " cid ='" + company_id + "' ";
        				}
        				if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "" && company_id != null && company_id != "") {
        					sql = sql + " and ";
        				}
        				if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "") {
        					sql = sql + " ogpdate BETWEEN '" + Fdate + "' AND '" + Tdate + "'";
        				}
        				sql = sql + " ORDER BY OgpNo DESC";
        				System.out.println(sql);
        				rs = s.executeQuery(sql);
        				System.out.println(rs);
        			} catch (SQLException m) {
        				System.out.println("==>" + m);
        			}
        			return (rs);
        	    }
             
             
             public ResultSet viewogpByogpno(String ogpno) {
            	    try {
            	        // Create a prepared statement with a parameterized query
            	        PreparedStatement preparedStatement = c.prepareStatement("SELECT `cid`, `ogpdate`, `OgpNo`, `modeOfTransport`, `Purpose`, `Remark`, `suplierno`, `Vehicleno`, (SELECT Cname  FROM company AS cm WHERE cm.code = cd.cid) AS Cname FROM `ogpdata` AS cd WHERE OgpNo = ?");
            	        
            	        preparedStatement.setString(1, ogpno); 
            	        ResultSet rs = preparedStatement.executeQuery();
            	        
            	        return rs;
            	    } catch (SQLException e) {
            	        // Handle any exceptions
            	        e.printStackTrace();
            	    }
            	    return null; // Return null if an exception occurs
            	}


			
			
             public ResultSet ogp_itemlist(String ogpno) {
            	    try {
            	        // Assuming 's' is your PreparedStatement object
            	        PreparedStatement ps = c.prepareStatement("SELECT itemId, iName, unit, CIMS_batch_no, itemQty, " +
            	                "(SELECT HSN FROM quality_control_department AS q WHERE q.CIMS_batch_no = og.CIMS_batch_no) AS HSN " +
            	                "FROM ogpitem AS og WHERE OgpNo = ?");
            	        ps.setString(1, ogpno); // Set the parameter safely

            	        rs = ps.executeQuery();
            	    } catch (SQLException m) {
            	        System.out.println("==>" + m);
            	    }
            	    return rs;
            	}

             
             public ResultSet view_All_delievry_challan(String company_id ,String Fdate, String Tdate) {
        		 try {
        				
        				System.out.println("company_name" + company_id);
        				System.out.println("Fdate" + Fdate);
        				System.out.println("Tdate" + Tdate);
        				String sql = "SELECT  * FROM deliverychallan";
        				if (Fdate != null && Tdate != null || company_id != null && company_id != "") {
        					sql = sql + "WHERE";
        				}
        				if (company_id != null && company_id != "") {
        					sql = sql + " cid ='" + company_id + "' ";
        				}
        				if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "" && company_id != null && company_id != "") {
        					sql = sql + " and ";
        				}
        				if (Fdate != null && Tdate != null && Fdate != "" && Tdate != "") {
        					sql = sql + " outward_delivery_date BETWEEN '" + Fdate + "' AND '" + Tdate + "'";
        				}
        				sql = sql + " ORDER BY delivery_challan_no DESC";
        				System.out.println(sql);
        				rs = s.executeQuery(sql);
        				System.out.println(rs);
        			} catch (SQLException m) {
        				System.out.println("==>" + m);
        			}
        			return (rs);
        	    }
             public ResultSet viewdeliverybyno(String delivery_challan_no) {
         	    try {
         	        // Create a prepared statement with a parameterized query
         	        PreparedStatement preparedStatement = c.prepareStatement("SELECT dc.*, (SELECT Cname FROM company AS cm WHERE cm.code = dc.cid) AS Cname FROM deliverychallan AS dc WHERE delivery_challan_no = ?");
         	        
         	        preparedStatement.setString(1, delivery_challan_no); 
         	        ResultSet rs = preparedStatement.executeQuery();
         	        
         	        return rs;
         	    } catch (SQLException e) {
         	        // Handle any exceptions
         	        e.printStackTrace();
         	    }
         	    return null; // Return null if an exception occurs
         	}
             
             public ResultSet delivery_itemlistbyno(String delivery_challan_no) {
          		try {
          			rs = s.executeQuery("SELECT itemId, iName, unit, CIMS_batch_no, itemQty,price_per_unit , tax_value (SELECT HSN FROM quality_control_department AS q WHERE q.CIMS_batch_no = og.CIMS_batch_no) AS HSN FROM ogpitem AS og WHERE OgpNo = "+delivery_challan_no+"");
          					
          		} catch (SQLException m) {

          			System.out.println("==>" + m);
          		}
          		return (rs);
          	}
}

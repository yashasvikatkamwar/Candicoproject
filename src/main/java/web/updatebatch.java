package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DataService;

/**
 * Servlet implementation class updatebatch
 */
@WebServlet("/updatebatch")
public class updatebatch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String batch_no = request.getParameter("batch_no");

		String product_name = request.getParameter("product_name");
		String product_code = request.getParameter("product_code");
		String product_version = request.getParameter("product_version");
		String batch_date = request.getParameter("batch_date");
		String batch_sizeKg = request.getParameter("batch_sizeKg");
		String batchSize_no = request.getParameter("batchSize_no");
		String items = request.getParameter("items");
		String company_id = request.getParameter("company_id");
		
		int status = DataService.updateBatch(batch_no, product_name, product_code, product_version, batch_date, batch_sizeKg, batchSize_no, company_id);
		if(status == 0)
		{
			System.out.println("Operation not successfull");
			request.getRequestDispatcher("/batch_generation_edit.jsp").forward(request, response);
		}
		else {
			System.out.println("status"+status);
			request.getRequestDispatcher("/batch_generation_edit.jsp").forward(request, response);
		}
		
	}

}

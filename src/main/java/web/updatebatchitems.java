package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DataService;

/**
 * Servlet implementation class updatebatchitems
 */
@WebServlet("/updatebatchitems")
public class updatebatchitems extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int batch_id = Integer.parseInt(request.getParameter("batch_id"));
		String itemName = request.getParameter("itemName");
		String unit = request.getParameter("unit");
		String itemQty = request.getParameter("itemQty");
		String itemAmount = request.getParameter("itemAmount");
		String remQty = request.getParameter("remQty");
		String received_Qty = request.getParameter("received_Qty");
		
		int status = DataService.updateBatchitems(batch_id, itemName, unit, itemQty, itemAmount, remQty, received_Qty);
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

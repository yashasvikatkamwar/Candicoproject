package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DataService;

/**
 * Servlet implementation class Updatebulkissue
 */
@WebServlet("/Updatebulkissue")
public class Updatebulkissue extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reqqty = request.getParameter("reqqty");
		String Iid = request.getParameter("Iid");
		
		System.out.println(reqqty);
		System.out.println(Iid);
		
		int status = DataService.updatebulkissuestock(Iid, reqqty);
		System.out.println(status);

		
		
	}

}

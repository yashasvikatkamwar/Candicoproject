package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProductCodeDropdownServlet
 */
@WebServlet("/ProductCodeDropdownServlet")
public class ProductCodeDropdownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ProductCodeDropdownServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Hello");
		doGet(request, response);
		
		
	}

}

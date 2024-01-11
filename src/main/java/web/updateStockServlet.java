package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DataService;

@WebServlet("/updateStockServlet")
public class updateStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String inputBoxValue = request.getParameter("inputBoxValue");
		String buttonId = request.getParameter("buttonId");

		int status = DataService.updateStock(inputBoxValue, buttonId);
		System.out.println(status);

	}

}

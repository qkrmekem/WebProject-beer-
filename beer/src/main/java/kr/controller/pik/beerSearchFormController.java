package kr.controller.pik;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class beerSearchFormController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String name = (String)request.getParameter("name");
			request.setAttribute("name", name);
		return "search";
	}

}

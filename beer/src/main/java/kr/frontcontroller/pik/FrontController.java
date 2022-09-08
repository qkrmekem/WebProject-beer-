package kr.frontcontroller.pik;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.frontcontroller.pik.HandlerMapping;
import kr.frontcontroller.pik.ViewResolver;
import kr.controller.pik.Controller;


@WebServlet("*.pik")
public class FrontController extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String reqPath = request.getRequestURI();
		String cpath = request.getContextPath();
		String command = reqPath.substring(cpath.length());
		System.out.println(command);
		
		String nextPage = null;
		
		Controller controller = null;
		
		
		HandlerMapping mapping = new HandlerMapping();
		controller = mapping.getController(command);
		nextPage = controller.requestProcessor(request, response);
		
		if(nextPage!=null) {
			if(nextPage.indexOf("redirect:")==-1) {
				
				RequestDispatcher rd =  request.getRequestDispatcher(ViewResolver.makeView(nextPage));
				rd.forward(request, response);
			}else {
				
				response.sendRedirect(cpath+nextPage.split(":")[1]);
			}
		}
	}
}

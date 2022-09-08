package kr.controller.pik;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dao.pik.EventMapper;

public class EventDeleteController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		EventMapper dao = new EventMapper();
		int b_seq =Integer.parseInt(request.getParameter("b_seq"));	
		dao.eventDelete(b_seq);	
		
		return "redirect:/eventList.pik";

	}

}

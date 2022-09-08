package kr.controller.pik;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dao.pik.EventMapper;
import kr.entity.pik.Article;
import kr.entity.pik.Event;

public class EventUpdateFormController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		EventMapper dao =new EventMapper();
		int b_seq = Integer.parseInt(request.getParameter("b_seq"));
		Event vo = dao.eventView(b_seq);
		
		request.setAttribute("vo", vo);
		return "eventUpdate";
	}

}

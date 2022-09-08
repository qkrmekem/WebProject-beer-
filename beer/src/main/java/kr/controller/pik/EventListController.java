package kr.controller.pik;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dao.pik.EventMapper;
import kr.entity.pik.Event;
public class EventListController implements Controller{

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		EventMapper dao = new EventMapper();
		List<Event> list = dao.eventAllList();
		
		
		request.setAttribute("list", list);
		
		return "eventList";
	}
	
}

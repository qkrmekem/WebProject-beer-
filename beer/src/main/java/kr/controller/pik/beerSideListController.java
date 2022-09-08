package kr.controller.pik;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.dao.pik.BeerMapper;
import kr.entity.pik.Member;
import kr.entity.pik.MemberFavorite;

public class beerSideListController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			HttpSession session = request.getSession();
			Member mvo = (Member)session.getAttribute("mvo");
			if (mvo != null) {
				BeerMapper dao = new BeerMapper();
				List<MemberFavorite> favor = dao.getfavor( mvo.getM_id() );
				String str = favor.get(0).getBeer_seq();
				
				if (str != null) {
					response.setContentType("text/html;charset=utf-8"); 
					PrintWriter out = response.getWriter();
					out.println(str);
				}				
			} 
			
		return null;
	}

}

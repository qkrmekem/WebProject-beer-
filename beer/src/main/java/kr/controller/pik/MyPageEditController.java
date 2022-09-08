package kr.controller.pik;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.dao.pik.BeerMapper;
import kr.dao.pik.MemberMapper;
import kr.entity.pik.Member;
import kr.entity.pik.MemberFavorite;


public class MyPageEditController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String update = request.getParameter("update");
		HttpSession session = request.getSession();
		Member vo = (Member)session.getAttribute("mvo");
		MemberMapper dao = new MemberMapper();
				
		if(update.equals("nickname")) {
				
			String m_nickname = request.getParameter("m_nickname");
			vo.setM_nickname(m_nickname);		
			
			dao.updateNickName(vo);
					
		}else if(update.equals("email")){
			
			String m_email = request.getParameter("m_email");
			vo.setM_email(m_email);
			
			dao.updateEmail(vo);
				
		}else if(update.equals("pw")){
			
			String new_pw = request.getParameter("new_pw");
			vo.setM_pw(new_pw);
			
			dao.updatePassword(vo);		
								
		}else if(update.equals("birth")){
			
			String m_birthdate = request.getParameter("m_birthdate");
			vo.setM_birthdate(m_birthdate);
			
			dao.updateBirthdate(vo);	
			
		}else if(update.equals("favorite")) {
			int aroma_seq = Integer.parseInt(request.getParameter("beer_aroma"));
			int from_seq = Integer.parseInt(request.getParameter("beer_from"));
			int taste_seq = Integer.parseInt(request.getParameter("beer_taste"));
			
			MemberFavorite fvo = new MemberFavorite();
			
			fvo.setM_id(vo.getM_id());
			fvo.setAroma_seq(aroma_seq);
			fvo.setFrom_seq(from_seq);
			fvo.setTaste_seq(taste_seq);
			
			dao.updateFavorite(fvo);	

		}
			
		return null;
	}

}

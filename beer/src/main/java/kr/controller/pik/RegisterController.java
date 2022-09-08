package kr.controller.pik;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dao.pik.MemberMapper;
import kr.entity.pik.Member;
import kr.entity.pik.MemberFavorite;

public class RegisterController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//회원정보 테이블
		String m_id = request.getParameter("m_id");
		String m_pw =request.getParameter("m_pw");
		String m_name=request.getParameter("m_name");
		String m_birthdate = request.getParameter("m_birthdate");
		char m_gender = request.getParameter("m_gender").charAt(0);
		String m_email=request.getParameter("m_email");
		String m_joindate = null;
		// 회원가입 시 회원타입 기본값 normal 
		char m_type ='n';
		
		Member member = new Member(m_id, m_pw, m_name, m_birthdate, m_gender, m_email, m_joindate, m_type);
		
		
		//회원 취향 테이블
		int taste_seq = Integer.parseInt(request.getParameter("beer_taste"));
		int aroma_seq = Integer.parseInt(request.getParameter("beer_aroma"));
		int from_seq = Integer.parseInt(request.getParameter("beer_from"));
		//선호국가 기본값은 한국
		String country_cd = "c25";
		
		MemberFavorite memberFavorite = new MemberFavorite(m_id, taste_seq, aroma_seq, from_seq, country_cd);
		
		MemberMapper dao = new MemberMapper();
		int cnt = dao.register(member);
		System.out.println("====================");
		int cntFavorite = dao.registerFavorite(memberFavorite);
		
		
		if(cnt>0 && cntFavorite>0) {
			
			return "redirect:/index.pik";
		}else {
			return "register";
		}
	}

}


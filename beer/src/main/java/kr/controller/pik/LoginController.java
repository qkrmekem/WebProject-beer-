package kr.controller.pik;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.dao.pik.MemberMapper;
import kr.entity.pik.Member;
import kr.entity.pik.MemberFavorite;

public class LoginController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String m_id = request.getParameter("m_id"); 
		String m_pw = request.getParameter("m_pw");
		
		MemberMapper dao = new MemberMapper();		
		Member m = new Member();
		/*  */
		Calendar cal = Calendar.getInstance();
		String Tdate = "";
		Tdate += (cal.get(Calendar.YEAR));
		Tdate += (cal.get(Calendar.MONTH) + 1);
		Tdate += (cal.get(Calendar.DATE) - 1);
		m.setM_recomdate(Tdate);
		/*  */
		m.setM_id(m_id);
		m.setM_pw(m_pw);
		Member mvo = dao.logIn(m);			
		MemberFavorite fvo = dao.getFavorite(m_id);		
		PrintWriter out = response.getWriter();
		
		if(mvo != null) {
			HttpSession session = request.getSession();
			session.setAttribute("mvo", mvo);
			session.setAttribute("fvo", fvo);						
			/*  */
			Calendar cal2 = Calendar.getInstance();
			String date = "";
			date += (cal2.get(Calendar.YEAR));
			date += (cal2.get(Calendar.MONTH) + 1);
			date += (cal2.get(Calendar.DATE));
			session.setAttribute("date", date);
			/*  */			
			out.println("aa");
		}
		else {
			out.println("bb");
		}
		return null;
	}

}

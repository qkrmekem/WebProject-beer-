package kr.controller.pik;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dao.pik.MemberMapper;
import kr.entity.pik.Member;

public class DoubleCheckController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String m_id = request.getParameter("m_id");
		PrintWriter out = response.getWriter();
		if(m_id.length()==0 || m_id.length()<3 || m_id.length()>9) {
			out.println(0);
			return null;
		}
		
		MemberMapper dao = new MemberMapper();
		Member mvo = null;
		mvo = dao.doubleCheck(m_id);
		
		if(mvo != null) {
			out.println(1);
		}else {
			out.println(2);
		}
		return null;
	}

}

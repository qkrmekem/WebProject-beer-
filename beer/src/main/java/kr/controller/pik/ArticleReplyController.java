package kr.controller.pik;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.dao.pik.ArticleMapper;
import kr.entity.pik.Reply;

public class ArticleReplyController implements Controller{

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String reply = request.getParameter("reply");
		ArticleMapper dao = new ArticleMapper();
		
		if(reply.equals("delete")) {
			int r_seq = Integer.parseInt(request.getParameter("r_seq"));
			System.out.println(r_seq);
			int cnt = dao.replyDelete(r_seq);
						
		}else if(reply.equals("write")) {
			int b_seq = Integer.parseInt(request.getParameter("b_seq"));
			String m_id = request.getParameter("m_id");
			String r_re = request.getParameter("r_re");

			
			Reply rvo = new Reply(b_seq, m_id, r_re);
			dao.replyWrite(rvo);
			
			Reply rvo1 = dao.replyWriteView(m_id);
			

			Gson gson = new Gson();
			String json=gson.toJson(rvo1);
			response.setContentType("text/json;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(json);


		}
		
		return null;
	}

}

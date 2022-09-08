package kr.controller.pik;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.dao.pik.ArticleMapper;
import kr.entity.pik.Article;
import kr.entity.pik.Member;
import kr.entity.pik.Reply;

public class MyPageController implements Controller{

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member mvo = (Member)session.getAttribute("mvo");
		String m_id = mvo.getM_id();
		
		ArticleMapper dao = new ArticleMapper();
		
		List<Reply> latestRe = dao.latestReply(m_id);		
		request.setAttribute("latestRe",latestRe);
		
		
		List<Article> latestArticle = dao.latestArticle(m_id);
		request.setAttribute("latestArticle", latestArticle);
		
		return "myPage";
	}

}

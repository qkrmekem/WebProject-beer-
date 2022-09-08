package kr.controller.pik;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dao.pik.ArticleMapper;
import kr.entity.pik.Article;
import kr.entity.pik.Reply;

public class ArticleViewController implements Controller{

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ArticleMapper dao =new ArticleMapper();
		int b_seq = Integer.parseInt(request.getParameter("b_seq"));
		Article vo = dao.articleView(b_seq);
		
		request.setAttribute("vo", vo);
		dao.articleCountUpdate(b_seq);
		
		
		List<Reply> list = dao.replyAllList(b_seq);
		request.setAttribute("list", list);
		
		return "articleView";
	}

}

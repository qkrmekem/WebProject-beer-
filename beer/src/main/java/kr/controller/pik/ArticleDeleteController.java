package kr.controller.pik;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dao.pik.ArticleMapper;

public class ArticleDeleteController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ArticleMapper dao = new ArticleMapper();
		int b_seq =Integer.parseInt(request.getParameter("b_seq"));	
		dao.articleDelete(b_seq);
		
		return "redirect:/articleList.pik?page=1";

	}

}

package kr.controller.pik;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dao.pik.ArticleMapper;
import kr.dao.pik.MemberMapper;
import kr.entity.pik.Article;
import kr.entity.pik.Paging;

public class ArticleListController implements Controller{

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArticleMapper dao = new ArticleMapper();
		
		int page = Integer.parseInt(request.getParameter("page"));
		
		int totalArticleCount = dao.countArticleList();
		
		Paging paging = new Paging(page, totalArticleCount);
		
		request.setAttribute("paging", paging);
		
		List<Article> list = dao.articleAllList(paging);
		request.setAttribute("list", list);
		
		List<Article> list2 = dao.reviewUpdate();
		request.setAttribute("list2", list2);
		
		return "articleList";
	}
	
}

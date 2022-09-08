package kr.controller.pik;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.dao.pik.ArticleMapper;
import kr.dao.pik.EventMapper;
import kr.dao.pik.MemberMapper;
import kr.entity.pik.Article;
import kr.entity.pik.Member;
import kr.entity.pik.Reply;
import kr.entity.pik.Event;
public class ProfileUpdateController implements Controller {
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");
		String path = "C:\\img\\member";
		String encType = "UTF-8";
		int sizeLimit = 20*1024*1024;
		
		MultipartRequest multi = new MultipartRequest(request,path,sizeLimit, 
						encType,new DefaultFileRenamePolicy());
		
		String m_id = multi.getParameter("m_id");
		String m_profile=multi.getFilesystemName("m_profile");
		
		Member vo = (Member) session.getAttribute("mvo");
		vo.setM_profile(m_profile);
		
		MemberMapper dao =new MemberMapper();
		dao.updateProfile(vo);
		
		
		ArticleMapper adao = new ArticleMapper();
		
		List<Reply> latestRe = adao.latestReply(m_id);		
		request.setAttribute("latestRe",latestRe);
		
		
		List<Article> latestArticle = adao.latestArticle(m_id);
		request.setAttribute("latestArticle", latestArticle);
		
		return "myPage";
	}
}
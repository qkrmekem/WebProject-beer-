package kr.controller.pik;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.dao.pik.ArticleMapper;
import kr.dao.pik.EventMapper;
import kr.entity.pik.Article;
import kr.entity.pik.Event;
import kr.entity.pik.Member;

public class EventUpdateController implements Controller{

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String path = "C:\\img\\notice";
		String encType = "UTF-8";
		int sizeLimit = 20*1024*1024;
		MultipartRequest multi = new MultipartRequest(request,path,sizeLimit, 
						encType,new DefaultFileRenamePolicy());
		int b_seq = Integer.parseInt(multi.getParameter("b_seq"));
		String b_title = multi.getParameter("b_title");
		String b_content = multi.getParameter("b_content");
		String b_file=multi.getFilesystemName("b_file");
		
		EventMapper dao =new EventMapper();
		Event vo = new Event();
		
		
		if (b_file==null) {
			vo.setB_seq(b_seq);
			vo.setB_title(b_title);
			vo.setB_content(b_content);
			
			dao.eventUpdate2(vo);	
			
		}else {
			vo.setB_seq(b_seq);
			vo.setB_title(b_title);
			vo.setB_content(b_content);
			vo.setB_file(b_file);
			
			dao.eventUpdate(vo);
		}
		
		return "redirect:/eventView.pik?b_seq="+b_seq;
	}

}


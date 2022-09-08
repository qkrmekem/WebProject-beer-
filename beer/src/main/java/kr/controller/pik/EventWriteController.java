package kr.controller.pik;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

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
import kr.entity.pik.Member;
import kr.entity.pik.Event;
public class EventWriteController implements Controller {
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String path = "C:\\img\\notice";
		String encType = "UTF-8";
		int sizeLimit = 20*1024*1024;
		File Folder = new File(path);
		
		if (!Folder.exists()) {
			try {
				Folder.mkdir();
			}catch(Exception e) {
				e.getStackTrace();
			}
		}else {
			System.out.println("폴더생성완료");
		}
		
		MultipartRequest multi = new MultipartRequest(request,path,sizeLimit, 
						encType,new DefaultFileRenamePolicy());
		
		HttpSession session = request.getSession();
		Member mvo = (Member)session.getAttribute("mvo");
		String b_title = multi.getParameter("b_title");
		String b_content = multi.getParameter("b_content");
		String b_file=multi.getFilesystemName("b_file");
		String m_id=mvo.getM_id();
		int seq;
		
		if (b_file==null) {
			Event nvo = new Event(b_title, b_content, "null" ,m_id);
			nvo.setB_seq(0);
			EventMapper dao = new EventMapper();
			seq = dao.eventWrite(nvo);
			
		}else {
			Event nvo = new Event(b_title, b_content, b_file, m_id);
			nvo.setB_seq(0);
		
			EventMapper dao = new EventMapper();
			seq = dao.eventWrite(nvo);
			
		}
		return "redirect:/eventView.pik?b_seq="+seq;
	}
}
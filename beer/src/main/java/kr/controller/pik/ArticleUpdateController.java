package kr.controller.pik;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.dao.pik.ArticleMapper;
import kr.dao.pik.EventMapper;
import kr.entity.pik.Article;

public class ArticleUpdateController implements Controller{

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArticleMapper dao =new ArticleMapper();
		request.setCharacterEncoding("UTF-8");
		String path = "C:\\img\\review";
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
		
		int b_seq = Integer.parseInt(multi.getParameter("b_seq"));
		
		String b_title = multi.getParameter("b_title");
		String b_content = multi.getParameter("b_content");
		String b_file = multi.getFilesystemName("b_file");
		
		Article vo = new Article();
		
		if (b_file==null) {
			vo.setB_seq(b_seq);
			vo.setB_title(b_title);
			vo.setB_content(b_content);
			dao.articleUpdate2(vo);
					
		}else {
			
			vo.setB_seq(b_seq);
			vo.setB_title(b_title);
			vo.setB_content(b_content);
			vo.setB_file(b_file);
			dao.articleUpdate(vo);
			
		}
		
		return "redirect:/articleView.pik?b_seq="+b_seq;
	}

}

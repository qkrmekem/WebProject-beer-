package kr.controller.pik;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.dao.pik.EventMapper;
import kr.entity.pik.Event;

public class EventDownloadController implements Controller{

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String realname =request.getParameter("b_file");
		
		// 파일 업로드된 경로
		String savePath = "C:\\img";
		
		// 서버에 실제 저장된 파일명
		String filename = realname ;
		
		// 실제 내보낼 파일명
		String orgfilename = realname ;
		 

		InputStream in = null;
		OutputStream os = null;
		File file = null;
		boolean skip = false;
		String client = "";


		try{
			

			// 파일을 읽어 스트림에 담기
			try{
				file = new File(savePath, filename);
				in = new FileInputStream(file);
			}catch(FileNotFoundException fe){
				skip = true;
			}



			
			client = request.getHeader("User-Agent");

			// 파일 다운로드 헤더 지정
			response.reset() ;
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Description", "JSP Generated Data");


			if(!skip){

				
				// IE
				if(client.indexOf("MSIE") != -1){
					response.setHeader ("Content-Disposition", "attachment; filename="+new String(orgfilename.getBytes("KSC5601"),"ISO8859_1"));

				}else{
					// 한글 파일명 처리
					orgfilename = new String(orgfilename.getBytes("utf-8"),"iso-8859-1");

					response.setHeader("Content-Disposition", "attachment; filename=\"" + orgfilename + "\"");
					response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
				}  
				
				response.setHeader ("Content-Length", ""+file.length() );


		  
				os = response.getOutputStream();
				byte b[] = new byte[(int)file.length()];
				int leng = 0;
				
				while( (leng = in.read(b)) > 0 ){
					os.write(b,0,leng);
				}

			}else{
				response.setContentType("text/html;charset=UTF-8");

			}
			
			in.close();
			os.close();

		}catch(Exception e){
		  e.printStackTrace();
		}
	
		return "eventList";
	}

}

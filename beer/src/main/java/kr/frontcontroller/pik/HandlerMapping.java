 package kr.frontcontroller.pik;

import java.util.HashMap;

import kr.controller.pik.ArticleDeleteController;
import kr.controller.pik.ArticleListController;
import kr.controller.pik.ArticleReplyController;
import kr.controller.pik.ArticleUpdateController;
import kr.controller.pik.ArticleUpdateFormController;
import kr.controller.pik.ArticleViewController;
import kr.controller.pik.ArticleWriteController;
import kr.controller.pik.ArticleWriteFormController;
import kr.controller.pik.Controller;
import kr.controller.pik.DoubleCheckController;
import kr.controller.pik.EventDeleteController;
import kr.controller.pik.EventDownloadController;
import kr.controller.pik.EventListController;
import kr.controller.pik.EventUpdateController;
import kr.controller.pik.EventUpdateFormController;
import kr.controller.pik.EventViewController;
import kr.controller.pik.EventWriteController;
import kr.controller.pik.EventWriteFormController;
import kr.controller.pik.IndexController;
import kr.controller.pik.LogInFormController;
import kr.controller.pik.LoginController;
import kr.controller.pik.LogoutController;
import kr.controller.pik.MyPageController;
import kr.controller.pik.MyPageEditController;
import kr.controller.pik.ProfileUpdateController;
import kr.controller.pik.RegisterController;
import kr.controller.pik.RegisterFormController;
import kr.controller.pik.beerCountyListController;
import kr.controller.pik.beerRecommendFormController;
import kr.controller.pik.beerRecommendListController;
import kr.controller.pik.beerSearchFormController;
import kr.controller.pik.beerSearchListController;
import kr.controller.pik.beerSideListController;

public class HandlerMapping {
	
	private HashMap<String , Controller> mappings;
	
	public HandlerMapping() {
		mappings = new HashMap<String , Controller>();
		// main 가기
		mappings.put("/index.pik", new IndexController());
		
		// beer관련 
		mappings.put("/beerRecommendForm.pik", new beerRecommendFormController());
		mappings.put("/beerRecommendList.pik", new beerRecommendListController());
		mappings.put("/beerSearchForm.pik", new beerSearchFormController());
		mappings.put("/beerSearchList.pik", new beerSearchListController());
		mappings.put("/beerCountyList.pik", new beerCountyListController());
		mappings.put("/beerSideList.pik", new beerSideListController());
		
		// 게시판관련
		mappings.put("/articleView.pik", new ArticleViewController());
		mappings.put("/articleUpdate.pik", new ArticleUpdateController());
		mappings.put("/articleUpdateForm.pik", new ArticleUpdateFormController());
		mappings.put("/articleList.pik", new ArticleListController());
		mappings.put("/articleWriteForm.pik", new ArticleWriteFormController());
		mappings.put("/articleWrite.pik", new ArticleWriteController());
		mappings.put("/articleDelete.pik", new ArticleDeleteController());
		mappings.put("/articleReply.pik", new ArticleReplyController());
		
		// 로그인관련
		mappings.put("/login.pik", new LoginController());
		mappings.put("/loginForm.pik", new LogInFormController());
		mappings.put("/logout.pik", new LogoutController());
		
		
		// 회원정보관련
		mappings.put("/myPage.pik", new MyPageController());
		mappings.put("/myPageEdit.pik", new MyPageEditController());
		mappings.put("/registerForm.pik", new RegisterFormController());
		mappings.put("/register.pik", new RegisterController());
		mappings.put("/doubleCheck.pik", new DoubleCheckController());
		mappings.put("/profileUpdate.pik", new ProfileUpdateController());
		
		//이벤트
		mappings.put("/eventList.pik", new EventListController());
		mappings.put("/eventWriteForm.pik", new EventWriteFormController());
		mappings.put("/eventWrite.pik", new EventWriteController());
		mappings.put("/eventDelete.pik", new EventDeleteController());
		mappings.put("/eventUpdateForm.pik", new EventUpdateFormController());
		mappings.put("/eventUpdate.pik", new EventUpdateController());
		mappings.put("/eventDownload.pik", new EventDownloadController());
		mappings.put("/eventView.pik", new EventViewController()); 
		
		
	}
	
	public Controller getController (String command) {
		return mappings.get(command);
	}
	

}

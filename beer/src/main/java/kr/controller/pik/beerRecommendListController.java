package kr.controller.pik;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.dao.pik.BeerMapper;
import kr.entity.pik.BEER2;
import kr.entity.pik.Member;
import kr.entity.pik.MemberFavorite;

public class beerRecommendListController implements Controller {

	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 List<BEER2> list = new ArrayList<BEER2>();
		 List<BEER2> list2 = new ArrayList<BEER2>(3);
		 List<BEER2> list3 = new ArrayList<BEER2>(3);
		 HttpSession session = request.getSession();
		 Member mvo = (Member)session.getAttribute("mvo");
		 String date = (String)session.getAttribute("date");
		 if (mvo != null) {
			 String m_id = mvo.getM_id();
			 BeerMapper dao = new BeerMapper(); 			 
			 List<MemberFavorite> m_list = dao.getfavor(m_id);		
			 
			 MemberFavorite vo = new MemberFavorite(
					 m_list.get(0).getM_id(),
					 m_list.get(0).getTaste_seq(),
					 m_list.get(0).getAroma_seq(),					 
					 m_list.get(0).getFrom_seq()					 
					 );
			 list = dao.recommendList(vo);		 
			 if (mvo.getM_recomdate() != date)
			 {				 
				 mvo.setM_recomdate(date);				 				 
				 /* 랜덤으로 뽑기 */			 
				 Random random = new Random();
				 List<Integer> arr = new ArrayList<Integer>(3);			 
				 for (int i = 0; i < 3; i++) {				 
					 Integer num = random.nextInt(list.size());	 
					 if ( arr.indexOf(num) == -1  ) {
						 arr.add(num);
						 //System.out.println(arr.get(i));
						 list2.add(i, list.get(arr.get(i)));					
					 } else {
						 i--;
					 }
				 }
				 list = list2;
				 //System.out.println(list);
				 String str = list.get(0).getBEER_NAME() + "/" + list.get(1).getBEER_NAME() + "/" + list.get(2).getBEER_NAME();
				 vo.setBeer_seq(str);			 
				 dao.setfavor(vo);
			 } else {
				 String beer00 = dao.getBeer3(mvo.getM_id());					 
				 String beer1 = beer00.split("/")[0];
				 String beer2 = beer00.split("/")[1];
				 String beer3 = beer00.split("/")[2];				 
				 
				 list3.add(dao.getBeerList1(beer1).get(0));
				 list3.add(dao.getBeerList2(beer2).get(0));
				 list3.add(dao.getBeerList3(beer3).get(0));
				 
				 list = list3;				 
			 }
			 
		 } else {
			 BeerMapper dao = new BeerMapper(); 
			 list = dao.allList();
		 }
		 
		 if (list != null) {
			 Gson gson = new Gson();		 
			 String json=gson.toJson(list);
			 response.setContentType("text/json;charset=utf-8"); 
			 PrintWriter out = response.getWriter(); 
			 out.println(json); 
		 }				 

		return null;
	}
}

package kr.controller.pik;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.dao.pik.BeerMapper;
import kr.entity.pik.BEER;
import kr.entity.pik.BEER2;


public class beerSearchListController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<BEER2> list;	
		String name = request.getParameter("beer_name");		
		String beer_from = request.getParameter("beer_from");
		String beer_aroma = request.getParameter("beer_aroma");		
		String beer_taste = request.getParameter("beer_taste");	
		
		if (name != "") {				
			BeerMapper dao = new BeerMapper();
			list = dao.viewList3( name );
		} else if ( beer_from != null && beer_aroma != null && beer_taste != null) {
			BEER vo = new BEER( Integer.parseInt(beer_from), Integer.parseInt(beer_taste), Integer.parseInt(beer_taste));				
			BeerMapper dao = new BeerMapper();
			list = dao.viewList(vo);
		} else {
			BEER vo = new BEER(name, Integer.parseInt(beer_from), Integer.parseInt(beer_taste), Integer.parseInt(beer_taste));		
			BeerMapper dao = new BeerMapper();
			list = dao.viewList2(vo);
		} 
		
		Gson gson = new Gson();
		String json = gson.toJson(list);		
		response.setContentType("text/json;charset=utf-8");		
		PrintWriter out = response.getWriter();
		out.println(json);
		
		return null;
	}

}

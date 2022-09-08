package kr.controller.pik;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.dao.pik.BeerMapper;
import kr.entity.pik.BEER2;

public class beerCountyListController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			String cd = request.getParameter("country");			
			BeerMapper dao = new BeerMapper();
			List<BEER2> list = dao.countryList(cd);
			
			Gson gson = new Gson();
			String json = gson.toJson(list);
			response.setContentType("text/json;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(json);			
			
		return null;
	}

}

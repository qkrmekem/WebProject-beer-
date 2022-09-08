package kr.frontcontroller.pik;

public class ViewResolver {
	public static String makeView(String nextPage) {
		return "WEB-INF/beer/"+nextPage+".jsp";
	}
}

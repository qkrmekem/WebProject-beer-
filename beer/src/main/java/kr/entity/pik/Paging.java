package kr.entity.pik;
//페이징 처리
public class Paging {
	
	private int total_page_count;
	private int page_per_article;
	private int total_article;
	private int page;
	private int start_page;
	private int end_page;
	private int start_article;
	private int end_article;
	
	public Paging(int page, int total_article) {
		super();
		this.page_per_article = 12;
		this.page = page;
		this.total_article = total_article;
		this.total_page_count = total_article/page_per_article;
		if(total_article%page_per_article != 0) {
			total_page_count++;
		}
		//5개 미만일때
		if(total_page_count<5) {
			end_page = total_page_count;
			start_page=1;
		//페이지가 최대페이지 -1일때
		}else if(page>=total_page_count-1) {
			end_page = total_page_count;
			start_page = total_page_count-4;
		//페이지가 5개 이상인데 현재 페이지가 2보다 작거나 같을 때
		}else if(page<=2) {
			end_page = 5;
			start_page = 1;
		//페이지가 5개 이상이고 현재 페이지가 3이상이고 최대페이지 -2미만일 때 
		}else {
			start_page = page-2;
			end_page = page+2;
		}
		this.start_article = (page-1)*page_per_article+1;
		this.end_article = page*page_per_article > total_article? total_article : page*page_per_article;
	}

	public int getTotal_page_count() {
		return total_page_count;
	}

	public void setTotal_page_count(int total_page_count) {
		this.total_page_count = total_page_count;
	}

	public int getPage_per_article() {
		return page_per_article;
	}

	public void setPage_per_article(int page_per_article) {
		this.page_per_article = page_per_article;
	}

	public int getTotal_article() {
		return total_article;
	}

	public void setTotal_article(int total_article) {
		this.total_article = total_article;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getStart_page() {
		return start_page;
	}

	public void setStart_page(int start_page) {
		this.start_page = start_page;
	}

	public int getEnd_page() {
		return end_page;
	}

	public void setEnd_page(int end_page) {
		this.end_page = end_page;
	}

	public int getStart_article() {
		return start_article;
	}

	public void setStart_article(int start_article) {
		this.start_article = start_article;
	}

	public int getEnd_article() {
		return end_article;
	}

	public void setEnd_article(int end_article) {
		this.end_article = end_article;
	}

	@Override
	public String toString() {
		return "Paging [total_page_count=" + total_page_count + ", page_per_article=" + page_per_article
				+ ", total_article=" + total_article + ", page=" + page + ", start_page=" + start_page + ", end_page="
				+ end_page + ", start_article=" + start_article + ", end_article=" + end_article + "]";
	}
	
	
	
}
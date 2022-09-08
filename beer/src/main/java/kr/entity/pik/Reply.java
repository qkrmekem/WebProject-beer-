package kr.entity.pik;

public class Reply {
	
	@Override
	public String toString() {
		return "Reply [b_seq=" + b_seq + ", r_seq=" + r_seq + ", m_id=" + m_id + ", r_re=" + r_re + ", r_date=" + r_date
				+ "]";
	}
	private int b_seq;
	private int r_seq;
	private String m_id;
	private String r_re;
	private String r_date;
	
	
	
	
	
	public Reply() {
		super();
	}
	
	public Reply(int b_seq, String m_id, String r_re) {
		super();
		this.b_seq = b_seq;
		this.m_id = m_id;
		this.r_re = r_re;
	}
	
	public Reply(int b_seq, int r_seq, String m_id, String r_re, String r_date) {
		super();
		this.b_seq = b_seq;
		this.r_seq = r_seq;
		this.m_id = m_id;
		this.r_re = r_re;
		this.r_date = r_date;
	}

	public int getB_seq() {
		return b_seq;
	}
	public void setB_seq(int b_seq) {
		this.b_seq = b_seq;
	}
	public int getR_seq() {
		return r_seq;
	}
	public void setR_seq(int r_seq) {
		this.r_seq = r_seq;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getR_re() {
		return r_re;
	}
	public void setR_re(String r_re) {
		this.r_re = r_re;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	
	
}

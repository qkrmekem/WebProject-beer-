package kr.entity.pik;

public class MemberFavorite {
	private String m_id;
	private int taste_seq;
	private int aroma_seq;
	private int from_seq;
	private String country_cd;
	private String beer_seq;
	
	public MemberFavorite() {};
	
	public MemberFavorite(String m_id, int taste_seq, int aroma_seq, int from_seq, String country_cd, String beer_seq) {
		super();
		this.m_id = m_id;
		this.taste_seq = taste_seq;
		this.aroma_seq = aroma_seq;
		this.from_seq = from_seq;
		this.country_cd = country_cd;
		this.beer_seq = beer_seq;
	}
	
	public MemberFavorite(String m_id, int taste_seq, int aroma_seq, int from_seq, String country_cd) {
		super();
		this.m_id = m_id;
		this.taste_seq = taste_seq;
		this.aroma_seq = aroma_seq;
		this.from_seq = from_seq;
		this.country_cd = country_cd;
	}

	public MemberFavorite(String m_id, int taste_seq, int aroma_seq, int from_seq) {
		super();
		this.m_id = m_id;
		this.taste_seq = taste_seq;
		this.aroma_seq = aroma_seq;
		this.from_seq = from_seq;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getTaste_seq() {
		return taste_seq;
	}

	public void setTaste_seq(int taste_seq) {
		this.taste_seq = taste_seq;
	}

	public int getAroma_seq() {
		return aroma_seq;
	}

	public void setAroma_seq(int aroma_seq) {
		this.aroma_seq = aroma_seq;
	}

	public int getFrom_seq() {
		return from_seq;
	}

	public void setFrom_seq(int from_seq) {
		this.from_seq = from_seq;
	}

	public String getCountry_cd() {
		return country_cd;
	}

	public void setCountry_cd(String country_cd) {
		this.country_cd = country_cd;
	}

	public String getBeer_seq() {
		return beer_seq;
	}

	public void setBeer_seq(String beer_seq) {
		this.beer_seq = beer_seq;
	}

	@Override
	public String toString() {
		return "MemberFavorite [m_id=" + m_id + ", taste_seq=" + taste_seq + ", aroma_seq=" + aroma_seq + ", from_seq="
				+ from_seq + ", country_cd=" + country_cd + ", beer_seq=" + beer_seq + "]";
	}
	
	
}

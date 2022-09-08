package kr.entity.pik;

public class Member {

	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_birthdate;
	private char m_gender;
	private String m_email;
	private String m_joindate;
	private char m_type;
	private String m_nickname;
	private String m_profile;
	/* 임시방편 */
	private String m_recomdate;
	/* 임시방편 */
	
	public Member() {
		
	}
	
	public Member(String m_id, String m_pw, String m_name, String m_birthdate, char m_gender, String m_email,
			String m_joindate, char m_type, String m_nickname, String m_profile) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_birthdate = m_birthdate;
		this.m_gender = m_gender;
		this.m_email = m_email;
		this.m_joindate = m_joindate;
		this.m_type = m_type;
		this.m_nickname = m_nickname;
		this.m_profile = m_profile;
	}
	
	
	// 회원 가입용 insert 생성자()
	public Member(String m_id, String m_pw, String m_name, String m_birthdate, char m_gender, String m_email,
			char m_type) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_birthdate = m_birthdate;
		this.m_gender = m_gender;
		this.m_email = m_email;
		this.m_type = m_type;
	}
	
	// 회원 정보 select * 생성자
	public Member(String m_id, String m_pw, String m_name, String m_birthdate, char m_gender, String m_email,
			String m_joindate, char m_type) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_birthdate = m_birthdate;
		this.m_gender = m_gender;
		this.m_email = m_email;
		this.m_joindate = m_joindate;
		this.m_type = m_type;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_birthdate() {
		return m_birthdate;
	}

	public void setM_birthdate(String m_birthdate) {
		this.m_birthdate = m_birthdate;
	}

	public char getM_gender() {
		return m_gender;
	}

	public void setM_gender(char m_gender) {
		this.m_gender = m_gender;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_joindate() {
		return m_joindate;
	}

	public void setM_joindate(String m_joindate) {
		this.m_joindate = m_joindate;
	}

	public char getM_type() {
		return m_type;
	}

	public void setM_type(char m_type) {
		this.m_type = m_type;
	}

	public String getM_nickname() {
		return m_nickname;
	}

	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}

	public String getM_profile() {
		return m_profile;
	}

	public void setM_profile(String m_profile) {
		this.m_profile = m_profile;
	}
	
	/* 임시방편 */
	public String getM_recomdate() {
		return m_recomdate;
	}
	
	public void setM_recomdate(String m_recomdate) {
		this.m_recomdate = m_recomdate;
	}
	/* 임시방편 */
	
	
}
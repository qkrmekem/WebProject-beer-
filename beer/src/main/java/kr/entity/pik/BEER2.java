package kr.entity.pik;

public class BEER2 {
	
	private int BEER_SEQ;
	private String BEER_NAME;
	private String BEER_ABV;
	private String FROM_SEQ;
	private String AROMA_SEQ;
	private String COUNTRY_CD;
	private String TASTE_SEQ;
	private String BEER_SRC;
	private String TASTE_SEQ2;
	private String TASTE_SEQ3;
	
	public BEER2() {
		super();		
	}

	public BEER2(int bEER_SEQ, String bEER_NAME, String bEER_ABV, String fROM_SEQ, String aROMA_SEQ, String cOUNTRY_CD,
			String tASTE_SEQ, String bEER_SRC, String tASTE_SEQ2, String tASTE_SEQ3) {
		super();
		BEER_SEQ = bEER_SEQ;
		BEER_NAME = bEER_NAME;
		BEER_ABV = bEER_ABV;
		FROM_SEQ = fROM_SEQ;
		AROMA_SEQ = aROMA_SEQ;
		COUNTRY_CD = cOUNTRY_CD;
		TASTE_SEQ = tASTE_SEQ;
		BEER_SRC = bEER_SRC;
		TASTE_SEQ2 = tASTE_SEQ2;
		TASTE_SEQ3 = tASTE_SEQ3;
	}

	@Override
	public String toString() {
		return "BEER2 [BEER_SEQ=" + BEER_SEQ + ", BEER_NAME=" + BEER_NAME + ", BEER_ABV=" + BEER_ABV + ", FROM_SEQ="
				+ FROM_SEQ + ", AROMA_SEQ=" + AROMA_SEQ + ", COUNTRY_CD=" + COUNTRY_CD + ", TASTE_SEQ=" + TASTE_SEQ
				+ ", BEER_SRC=" + BEER_SRC + ", TASTE_SEQ2=" + TASTE_SEQ2 + ", TASTE_SEQ3=" + TASTE_SEQ3 + "]";
	}

	public int getBEER_SEQ() {
		return BEER_SEQ;
	}

	public void setBEER_SEQ(int bEER_SEQ) {
		BEER_SEQ = bEER_SEQ;
	}

	public String getBEER_NAME() {
		return BEER_NAME;
	}

	public void setBEER_NAME(String bEER_NAME) {
		BEER_NAME = bEER_NAME;
	}

	public String getBEER_ABV() {
		return BEER_ABV;
	}

	public void setBEER_ABV(String bEER_ABV) {
		BEER_ABV = bEER_ABV;
	}

	public String getFROM_SEQ() {
		return FROM_SEQ;
	}

	public void setFROM_SEQ(String fROM_SEQ) {
		FROM_SEQ = fROM_SEQ;
	}

	public String getAROMA_SEQ() {
		return AROMA_SEQ;
	}

	public void setAROMA_SEQ(String aROMA_SEQ) {
		AROMA_SEQ = aROMA_SEQ;
	}

	public String getCOUNTRY_CD() {
		return COUNTRY_CD;
	}

	public void setCOUNTRY_CD(String cOUNTRY_CD) {
		COUNTRY_CD = cOUNTRY_CD;
	}

	public String getTASTE_SEQ() {
		return TASTE_SEQ;
	}

	public void setTASTE_SEQ(String tASTE_SEQ) {
		TASTE_SEQ = tASTE_SEQ;
	}

	public String getBEER_SRC() {
		return BEER_SRC;
	}

	public void setBEER_SRC(String bEER_SRC) {
		BEER_SRC = bEER_SRC;
	}

	public String getTASTE_SEQ2() {
		return TASTE_SEQ2;
	}

	public void setTASTE_SEQ2(String tASTE_SEQ2) {
		TASTE_SEQ2 = tASTE_SEQ2;
	}

	public String getTASTE_SEQ3() {
		return TASTE_SEQ3;
	}

	public void setTASTE_SEQ3(String tASTE_SEQ3) {
		TASTE_SEQ3 = tASTE_SEQ3;
	}
		
}

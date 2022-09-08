package kr.entity.pik;

public class BEER {
	
	private int BEER_SEQ;
	private String BEER_NAME;
	private String BEER_ABV;
	private int FROM_SEQ;
	private int AROMA_SEQ;
	private String COUNTRY_CD;
	private int TASTE_SEQ;
	private String BEER_SRC;
	private int TASTE_SEQ2;
	private int TASTE_SEQ3;
	
	public BEER() {
		super();		
	}

	public BEER(int fROM_SEQ, int aROMA_SEQ, int tASTE_SEQ) {
		super();
		FROM_SEQ = fROM_SEQ;
		AROMA_SEQ = aROMA_SEQ;		
		TASTE_SEQ = tASTE_SEQ;		
	}
	
	public BEER(String bEER_NAME, int fROM_SEQ, int aROMA_SEQ, int tASTE_SEQ) {
		super();		
		BEER_NAME = bEER_NAME;		
		FROM_SEQ = fROM_SEQ;
		AROMA_SEQ = aROMA_SEQ;		
		TASTE_SEQ = tASTE_SEQ;		
	}
	
	public BEER(int bEER_SEQ, String bEER_NAME, String bEER_ABV, int fROM_SEQ, int aROMA_SEQ, String cOUNTRY_CD,
			int tASTE_SEQ, String bEER_SRC, int tASTE_SEQ2, int tASTE_SEQ3) {
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
		return "BEER [BEER_SEQ=" + BEER_SEQ + ", BEER_NAME=" + BEER_NAME + ", BEER_ABV=" + BEER_ABV + ", FROM_SEQ="
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

	public int getFROM_SEQ() {
		return FROM_SEQ;
	}

	public void setFROM_SEQ(int fROM_SEQ) {
		FROM_SEQ = fROM_SEQ;
	}

	public int getAROMA_SEQ() {
		return AROMA_SEQ;
	}

	public void setAROMA_SEQ(int aROMA_SEQ) {
		AROMA_SEQ = aROMA_SEQ;
	}

	public String getCOUNTRY_CD() {
		return COUNTRY_CD;
	}

	public void setCOUNTRY_CD(String cOUNTRY_CD) {
		COUNTRY_CD = cOUNTRY_CD;
	}

	public int getTASTE_SEQ() {
		return TASTE_SEQ;
	}

	public void setTASTE_SEQ(int tASTE_SEQ) {
		TASTE_SEQ = tASTE_SEQ;
	}

	public String getBEER_SRC() {
		return BEER_SRC;
	}

	public void setBEER_SRC(String bEER_SRC) {
		BEER_SRC = bEER_SRC;
	}

	public int getTASTE_SEQ2() {
		return TASTE_SEQ2;
	}

	public void setTASTE_SEQ2(int tASTE_SEQ2) {
		TASTE_SEQ2 = tASTE_SEQ2;
	}

	public int getTASTE_SEQ3() {
		return TASTE_SEQ3;
	}

	public void setTASTE_SEQ3(int tASTE_SEQ3) {
		TASTE_SEQ3 = tASTE_SEQ3;
	}
		
}

package kr.dao.pik;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.entity.pik.BEER;
import kr.entity.pik.BEER2;
import kr.entity.pik.Member;
import kr.entity.pik.MemberFavorite;

// MyBatis Framework : Java <--SQL Mapping--> SQL(XML파일)
// MyBatis => SQL Mapping Framework
// http://mybatis.org
// https://blog.mybatis.org/
public class BeerMapper {
	private static SqlSessionFactory sqlSessionFactory;
	//초기화 블럭(프로그램 실행시 딱 한번만 실행이 되는 블럭)
	
	static {
		try {
			String resource = "kr/dao/pik/mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory =
			  new SqlSessionFactoryBuilder().build(inputStream);
			//
		} catch (Exception e) {
			e.printStackTrace();
		}
		//게시판 전체리스트 가져오기 메서드
	}
	
	public List<BEER2> countryList(String cd) {		
		SqlSession session = sqlSessionFactory.openSession();
		List<BEER2> list = session.selectList("countryList", cd); 		
		session.close(); 
		return list;
	}
	
	public void setfavor(MemberFavorite vo) {			
		SqlSession session = sqlSessionFactory.openSession();
		session.update("setfavor",vo);
		session.commit();
		session.close(); 		
	}
	
	/* 추가 */
	public String getBeer3 (String m_id) {		
		SqlSession session = sqlSessionFactory.openSession();
		String str = session.selectOne("getBeer3", m_id);		
		session.close(); 
		return str;
	}
	
	public List<BEER2> getBeerList1 (String beer1) {		
		SqlSession session = sqlSessionFactory.openSession();
		List<BEER2> list = session.selectList("getBeerList1", beer1);		
		session.close(); 
		return list;
	}
	public List<BEER2> getBeerList2 (String beer2) {		
		SqlSession session = sqlSessionFactory.openSession();
		List<BEER2> list = session.selectList("getBeerList2", beer2);		
		session.close(); 
		return list;
	}
	public List<BEER2> getBeerList3 (String beer3) {		
		SqlSession session = sqlSessionFactory.openSession();
		List<BEER2> list = session.selectList("getBeerList3", beer3);		
		session.close(); 
		return list;
	}
	/* 추가 */
	
	public List<MemberFavorite> getfavor(String m_id) {		
		SqlSession session = sqlSessionFactory.openSession();
		List<MemberFavorite> list = session.selectList("getfavor", m_id); 		
		session.close(); 
		return list;
	}
	
	public List<BEER2> recommendList(MemberFavorite vo) {		
		SqlSession session = sqlSessionFactory.openSession();		
		List<BEER2> list = session.selectList("recommendList", vo); 		
		session.close();
		return list;
	}
	
	public List<BEER2> allList() {		
		SqlSession session = sqlSessionFactory.openSession();
		List<BEER2> list = session.selectList("allList"); 		
		session.close();
		return list;
	}
	// 정보 검색한 리스트 가져오기
	public List<BEER2> viewList(BEER vo) {
		SqlSession session = sqlSessionFactory.openSession();
		List<BEER2> list = session.selectList("viewList", vo);
		session.close();
		return list;

	}	
	// 정보 검색한 리스트 가져오기
	public List<BEER2> viewList2(BEER vo) {
		SqlSession session = sqlSessionFactory.openSession();
		List<BEER2> list = session.selectList("viewList2", vo);
		session.close();
		return list;
	}	
	// 정보 검색한 리스트 가져오기
	public List<BEER2> viewList3(String name) {
		SqlSession session = sqlSessionFactory.openSession();
		List<BEER2> list = session.selectList("viewList3", name);
		session.close();
		return list;
	}
	
		
}
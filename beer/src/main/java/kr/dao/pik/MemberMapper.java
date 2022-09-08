package kr.dao.pik;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.entity.pik.Member;
import kr.entity.pik.MemberFavorite;

public class MemberMapper {
	
	private static SqlSessionFactory sqlSessionFactory = null;
	
	static {
		try {
			String resource = "/kr/dao/pik/mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int registerFavorite(MemberFavorite memberFavorite) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = 0;
		System.out.println(memberFavorite.toString());
		try {
			cnt = session.insert("registerFavorite",memberFavorite);
		}catch (Exception e) {
			e.printStackTrace();
		}
		session.commit();
		session.close();
		return cnt;
	}
	public int register (Member member) {
		 SqlSession session = sqlSessionFactory.openSession();
		 int cnt =0;
		 System.out.println(member.toString());
		 try {
			 cnt= session.insert("register",member);
		 }catch (Exception e) {
			 e.printStackTrace();
			 
		 }
		 session.commit();
		 session.close();
		 return cnt;
	}
	public Member logIn(Member vo) {
		SqlSession session = sqlSessionFactory.openSession();
		Member mvo = null;
		 try {
			mvo = session.selectOne("logIn",vo);
			 session.close();
		 }catch (Exception e) {
			 e.printStackTrace();
		 }
		 return mvo;
	}
	public Member doubleCheck(String m_id) {
		SqlSession session = sqlSessionFactory.openSession();
		Member mvo = null;
		try {
			mvo = session.selectOne("doubleCheck",m_id);
			System.out.println(mvo.toString());
		}catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return mvo;
	}
	
	
	public int updateNickName(Member vo) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = 0;
		try {
			cnt = session.update("updateNickName",vo);
			session.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public int updateEmail(Member vo) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = 0;
		try {
			cnt = session.update("updateEmail",vo);
			session.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public int updatePassword(Member vo) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = 0;
		try {
			cnt = session.update("updatePassword",vo);
			session.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public int updateBirthdate(Member vo) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = 0;
		try {
			cnt = session.update("updateBirthdate",vo);
			session.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	public int updateFavorite(MemberFavorite fvo) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = 0;
		try {
			cnt = session.update("updateFavorite",fvo);
			session.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public MemberFavorite getFavorite(String m_id) {
		SqlSession session = sqlSessionFactory.openSession();
		MemberFavorite fvo = null;
		try {
			fvo = session.selectOne("getFavorite",m_id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return fvo;
	}
	
	public int updateProfile(Member vo) {
		SqlSession session = sqlSessionFactory.openSession();
		System.out.println(vo.toString());
		int cnt = 0;
		try {
			cnt = session.update("updateProfile",vo);
			session.commit();
			session.close();
			System.out.println("여기까지");
		} catch (Exception e) {
			e.printStackTrace();
		}		
		System.out.println(cnt);
		return cnt;
	}
	
	
	
	
	
}

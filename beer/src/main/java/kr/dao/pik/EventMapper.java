package kr.dao.pik;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.entity.pik.Article;
import kr.entity.pik.Event;

public class EventMapper {
	private static SqlSessionFactory sqlSessionFactory = null;
		
		static {
			try {
				String resource = "kr/dao/pik/mybatis-config.xml";
				InputStream inputStream = Resources.getResourceAsStream(resource);
				sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public List<Event> eventAllList() {
			SqlSession session= sqlSessionFactory.openSession();
			List<Event> list = session.selectList("eventAllList");
			
			session.close();
			return list;
		}
		public Event eventView(int b_seq) {
			SqlSession session = sqlSessionFactory.openSession();

			Event vo = null;
			try {
				vo = session.selectOne("eventView", b_seq);
				session.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return vo;	
		}
		public int eventWrite(Event nvo) {
			SqlSession session = sqlSessionFactory.openSession();
			int seq = 0;
			int cnt = 0;
			try {
				cnt = session.insert("eventWrite", nvo);
				session.commit();
				seq = session.selectOne("getEventSeq", nvo);
			} catch (Exception e) {
				e.printStackTrace();
			}
			session.close();
			return seq;
		}
		
		public int eventWrite2(Event nvo) {
			SqlSession session = sqlSessionFactory.openSession();
			int seq = 0;
			int cnt = 0;
			try {
				cnt = session.insert("eventWrite2", nvo);
				session.commit();
				seq = session.selectOne("getEventSeq", nvo);
			} catch (Exception e) {
				e.printStackTrace();
			}
			session.close();
			return seq;
		}
		
		public int eventDelete(int b_seq) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt = 0;

			try {
				cnt = session.delete("eventDelete",b_seq);
				session.commit();
				session.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return cnt;			
		}
		public int eventUpdate(Event vo) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt = 0;
			try {
				cnt = session.update("eventUpdate", vo);
				session.commit();
				session.close();
			} catch (Exception e) {
				e.printStackTrace();
			}		
			return cnt;
		}
		public int eventUpdate2(Event vo) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt = 0;
			try {
				cnt = session.update("eventUpdate2", vo);
				session.commit();
				session.close();
			} catch (Exception e) {
				e.printStackTrace();
			}		
			return cnt;
		}
		public void eventCountUpdate(int b_cnt) {
			SqlSession session = sqlSessionFactory.openSession();
			try {
				session.update("eventCountUpdate", b_cnt);
				session.commit();
				session.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// EventCheckOut end
}

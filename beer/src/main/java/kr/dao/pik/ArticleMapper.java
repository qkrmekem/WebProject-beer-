package kr.dao.pik;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.entity.pik.Article;
import kr.entity.pik.Paging;
import kr.entity.pik.Reply;

public class ArticleMapper {
	private static SqlSessionFactory sqlSessionFactory = null;

	static {
		try {
			String resource = "kr/dao/pik/mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 게시물 전체보기 메소드
	public List<Article> articleAllList(Paging paging) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Article> list = null;
		try {
			list = session.selectList("articleAllList", paging);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
	// articleAllList end

	// 게시물 하나 보기 메소드
	public Article articleView(int b_seq) {
		SqlSession session = sqlSessionFactory.openSession();
		Article vo = null;
		try {
			vo = session.selectOne("articleView", b_seq);
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return vo;
	}
	// articleView end

	// 게시판 조회수 +1
	public void articleCountUpdate(int b_cnt) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.update("articleCountUpdate", b_cnt);
			session.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// articleCountUpdate end

	// 게시물 수정하기 메소드 파일 있음
	public int articleUpdate(Article vo) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = 0;
		try {
			cnt = session.update("articleUpdate", vo);
			session.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	// articleUpdate end

	// 게시물 수정하기 메소드 파일 없음
	public int articleUpdate2(Article vo) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = 0;
		try {
			cnt = session.update("articleUpdate2", vo);
			session.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	// articleUpdate2 end
	
	
	// 게시판 글쓰기 메소드
	public int articleWrite(Article avo) {
		SqlSession session = sqlSessionFactory.openSession();
		int seq = 0;
		try {
			session.insert("articleWrite", avo);
			session.commit();
			seq = session.selectOne("getArticleSeq", avo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		session.close();
		return seq;
	}
	// articleWrite end

	 
	// 게시판 글쓰기(파일 있음) 메소드
	public int articleWrite2(Article avo) {
		SqlSession session = sqlSessionFactory.openSession();
		int seq = 0;
		try {
			session.insert("articleWrite2", avo);
			session.commit();
			seq = session.selectOne("getArticleSeq", avo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		session.close();
		return seq;	
	}
	// articleWrite2 end
	
	
	// 게시판 삭제 메소드
	public int articleDelete(int b_seq) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = 0;

		try {
			cnt = session.delete("articleDelete", b_seq);
			session.commit();
			session.delete("replyAllDelete", b_seq);
			session.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return cnt;
	}
	// articleDelete end

	// 게시판 체크용 메소드
	public Article articleCheckOut() {
		SqlSession session = sqlSessionFactory.openSession();
		Article avo = null;
		try {
			avo = session.selectOne("articleCheckOut");
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}

		session.close();
		return avo;
	}
	// articleCheckOut end
	
	// 게시판 페이지네이션
	public int countArticleList() {
		SqlSession session = sqlSessionFactory.openSession();
		int size=0;
		try {
			size=session.selectOne("countArticleList");
		}catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return size;
	}
	// countArticleList end
	
	// 댓글 저장하기 메소드
	public int replyWrite(Reply vo) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt=0;
		try {
			cnt = session.insert("replyWrite", vo);
			session.commit();
			session.close();	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	// replyWrite end
		
	// 직전에 쓴 댓글 보기 메소드 
	public Reply replyWriteView(String m_id) {
		SqlSession session = sqlSessionFactory.openSession();
		Reply rvo = null;
		try {
			rvo = session.selectOne("replyWriteView", m_id);
			
			session.close();	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rvo;
	}
	// replyWriteView end
	
	// 댓글가져오기 메소드
	public List<Reply> replyAllList(int b_seq) {
		SqlSession session = sqlSessionFactory.openSession();

		List<Reply> list = session.selectList("replyAllList", b_seq);
		session.close();
		return list;
	}
	// replyAllList end

	// 댓글 삭제하기 메소드
	public int replyDelete(int r_seq) {
		SqlSession session = sqlSessionFactory.openSession();

		int cnt = session.delete("replyDelete", r_seq);
		session.commit();
		session.close();
		return cnt;

	}
	// replyDelete end
	
	// 리뷰게시판 사진 업데이트
	public List<Article> reviewUpdate() {
		SqlSession session = sqlSessionFactory.openSession();
		List<Article> list2 =session.selectList("reviewUpdate");
		session.close();
		return list2;
	}
	// reviewUpdate end
	
	
	// myPage 최근 댓글 3개
	public List<Reply> latestReply(String m_id){
		SqlSession session = sqlSessionFactory.openSession();
		List<Reply> latestRe = session.selectList("latestReply",m_id);
		session.close();
		return latestRe;
	}
	// latestReply end
	
	// myPage 최근 게시글 3개
	public List<Article> latestArticle(String m_id){
		SqlSession session = sqlSessionFactory.openSession();
		List<Article> latestTitle = session.selectList("latestArticle",m_id);
		session.close();
		return latestTitle;
	}
	// latestArticle end


}

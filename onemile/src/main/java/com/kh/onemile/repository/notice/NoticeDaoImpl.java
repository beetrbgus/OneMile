package com.kh.onemile.repository.notice;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.kh.onemile.entity.notice.NoticeDTO;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	@Autowired
	private SqlSession sqlSession;

	private static String namespace = "notice";

	//리스트
	
	@Override
	public List<NoticeDTO> list() throws Exception {
		return sqlSession.selectList(namespace + ".list");
	}
	
	
    //가장나중게시물번호
	@Override
	public Integer getMaxSeq() {
		return sqlSession.selectOne(namespace+".maxSeq");
	}
	
	//등록하기
	@Override
	public int write(NoticeDTO noticedto) {
		return sqlSession.insert(namespace+".write", noticedto);
	}
	

	@Override
	public BoardDTO view(int seq) {
		return sqlSession.selectOne(namespace+".view", seq);
	}

	@Override
	public void updateReadCount(int seq) {
		sqlSession.update(namespace+".updateReadCount", seq);
	}

	@Override
	public int update(BoardDTO dto) {
		return sqlSession.update(namespace+".update", dto);
	}

	@Override
	public int delete(int seq) {
		return sqlSession.update(namespace+".delete", seq);
	}

}
	
		


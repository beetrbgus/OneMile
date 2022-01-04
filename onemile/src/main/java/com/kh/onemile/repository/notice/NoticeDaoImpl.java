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

	@Override
	public List<NoticeDTO> list() throws Exception {
		return sqlSession.selectList(namespace + ".list");
	}

}

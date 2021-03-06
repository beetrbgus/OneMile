package com.kh.onemile.repository.social;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.social.SocialDTO;
import com.kh.onemile.vo.PaginationVO;
import com.kh.onemile.vo.social.SocialDetailVO;
import com.kh.onemile.vo.social.SocialIndexVO;
import com.kh.onemile.vo.social.SocialListVO;
import com.kh.onemile.vo.social.SocialRegVO;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class SocialDaoImpl implements SocialDao{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void reg(SocialDTO socialDto) {
		log.debug("SocialDTO     "+socialDto.toString());
		sqlSession.insert("social.reg", socialDto);
	}

	@Override
	public List<SocialListVO> getList(PaginationVO paginationVO) {
		return sqlSession.selectList("social.getList",paginationVO);
	}

	@Override
	public SocialDetailVO getDetail(int socialNo) {
		return sqlSession.selectOne("social.getDetail", socialNo);
	}

	@Override
	public List<SocialDTO> getCount(int memberNo) {
		return sqlSession.selectList("social.getCount",memberNo);
	}

	@Override

	public List<SocialListVO> getMemberByList(int memberNo) {
		return sqlSession.selectList("social.getMemberByList",memberNo);
	}
	public void modify(SocialRegVO socialRegVO) {
		sqlSession.update("social.modify",socialRegVO);

	}

	@Override
	public List<SocialIndexVO> getIndexList() {
		return sqlSession.selectList("social.indexList");
	}

	@Override
	public void delete(int socialNo) {
		sqlSession.update("social.delete", socialNo);
	}

	@Override
	public boolean getIsMytown(int socialNo,String goo) {
		Map<String,Object> map = new HashMap<>();
		map.put("socialNo", socialNo);
		map.put("goo", goo);
		int result = sqlSession.selectOne("social.getIsMytown", map);
		
		return result > 0;
	}

	@Override
	public List<SocialListVO> dayCheck() {
		return sqlSession.selectList("social.getStatusCheck");
	}

	@Override
	public void statusUpdate(int socialNo, int memberNo) {
		Map<String,Object> map = new HashMap<>();
		log.debug(""+socialNo,memberNo);
		
		map.put("socialNo", socialNo);
		map.put("memberNo", memberNo);
		sqlSession.update("social.statusUpdate",map);
		
	}

	@Override
	public List<SocialListVO> getMemberByList2(int memberNo) {
		return sqlSession.selectList("social.getMemberByList2",memberNo);
	}

	@Override
	public List<SocialListVO> getMemberByList3(int memberNo) {
		return sqlSession.selectList("social.getMemberByList3",memberNo);
	}

	}
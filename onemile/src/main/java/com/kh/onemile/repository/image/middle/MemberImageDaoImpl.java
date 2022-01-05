package com.kh.onemile.repository.image.middle;

import java.io.File;
import java.io.IOException;
import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.kh.onemile.entity.image.ImageDTO;
import com.kh.onemile.entity.image.middle.MemberProfileMidDTO;

@Repository
public class MemberImageDaoImpl implements MemberImageDao{

	@Autowired
	private SqlSession sqlSession;
	
	//저장용 폴더
	private File directory = new File("D:/upload/member");
	
	//회원 이미지 테이블에 등록
	@Override
	public void reg(MemberProfileMidDTO memberProfileMidDto) {
		for(int imgIdx : memberProfileMidDto.getImgNoList()) {
			memberProfileMidDto.setImageNo(imgIdx);
			
			sqlSession.insert("mei.regMei", memberProfileMidDto);
		}
	}
	//회원이미지 불러오기
	@Override
	public MemberProfileMidDTO get(int memberNo) {
		return sqlSession.selectOne("mei.getMei",memberNo);
	}
	
	//이미지번호(imageNo)로 프로필 이미지 파일정보를 구한다.
	@Override
	public ImageDTO getImage(int imageNo) {
		return sqlSession.selectOne("mei.getImage",imageNo);
	}
	
	//이미지번호(imageNo)로 실제 파일 정보를 불러온다
	@Override
	public byte[] load(int imageNo) throws IOException {
		File target = new File(directory, String.valueOf(imageNo));
		byte[] data = FileUtils.readFileToByteArray(target);
		return data;
	}
}
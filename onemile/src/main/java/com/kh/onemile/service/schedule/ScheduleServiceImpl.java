package com.kh.onemile.service.schedule;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kh.onemile.repository.certi.CertiDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired
	private CertiDao certiDao;
	
	//스케줄러 설정
	@Scheduled(cron = "0 0 9 * * *")//매일 오전 9시
	@Override
	public void execute() {
		log.debug("DB 스케줄러 테스트중");
		certiDao.clean();
	}
}
package com.kh.onemile.service.schedule;

import java.net.URISyntaxException;

public interface ScheduleService {
	//이메일 인증번호(누적된 DB) 삭제 스케줄러
	void execute();
	//멤버십 정기결제 스케줄러
	void regularPayment() throws URISyntaxException;
	//소셜링 참가상태 변경
	void socialStatus();
}

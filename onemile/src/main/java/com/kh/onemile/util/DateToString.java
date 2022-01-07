package com.kh.onemile.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Component;

@Component
public class DateToString {
	public String dateToString(Date d) {
		SimpleDateFormat tranDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREAN);
		return tranDate.format(d);
	}
}

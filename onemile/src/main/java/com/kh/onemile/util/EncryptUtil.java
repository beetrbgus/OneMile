package com.kh.onemile.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class EncryptUtil {
	@Autowired
	private PasswordEncoder encoder;

	public String encryptPw(String password) {
		return encoder.encode(password);
	}
}
package com.fpoly.Utils;

import java.nio.charset.StandardCharsets;
import java.util.Base64;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

@Service
public class HashPass {

	public String hash(String pass) {
		String hash_pass = BCrypt.gensalt();
		return BCrypt.hashpw(pass, hash_pass);
	}

	public Boolean verify(String pass, String pass_hash) {
		return BCrypt.checkpw(pass, pass_hash);
	}

}

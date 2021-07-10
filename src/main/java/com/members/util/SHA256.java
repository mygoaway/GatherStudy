package com.members.util;

import java.security.MessageDigest;
import java.util.Base64;
import java.util.Base64.Encoder;

public class SHA256 {
	public static String pwD(String pw) throws Exception {

		String regiNo = pw;
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		byte[] mdResult = md.digest(regiNo.getBytes());
//		sun.misc.BASE64Encoder encoder = new sun.misc.BASE64Encoder();
//		String str = encoder.encode(mdResult);

		Encoder encoder = Base64.getEncoder();
		String str = encoder.encodeToString(mdResult);

		return str;
	}

}

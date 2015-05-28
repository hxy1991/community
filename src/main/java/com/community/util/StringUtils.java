package com.community.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class StringUtils {
	private static final String EMAIL_REGEX = "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$";
	private static final String NUMBER_REGEX = "[0-9]*";

	public static boolean isEmail(String email) {
		if (null == email) {
			return false;
		}
		return email.matches(EMAIL_REGEX);
	}

	public static String md5(String str) {
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			byte b[] = md.digest();
			int i;
			StringBuffer buf = new StringBuffer("");
			for (int offset = 0; offset < b.length; ++offset) {
				i = b[offset];
				if (i < 0)
					i += 256;
				if (i < 16)
					buf.append("0");
				buf.append(Integer.toHexString(i));
			}
			str = buf.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return str;
	}

	public static boolean isNumber(String numberStr) {
		if (null == numberStr || numberStr.equals("")) {
			return false;
		}
		return numberStr.matches(NUMBER_REGEX);
	}
}

package com.community.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CookieUtils {

	private static final Logger logger = LoggerFactory
			.getLogger(CookieUtils.class);
	private static final int COOKIE_MAX_AGE = 24 * 60 * 60 * 30;
	private static final String SECURITY_KEY = "builtByWynlqxm";
	private static final String AUTHORITY_TOKEN = "community-token";

	public static void setCookie(HttpServletRequest request,
			HttpServletResponse response, long uid) {
		String ip = ServletUtils.getRemoteAddress(request);
		try {
			String token = DESUtils.encrypt(uid + ";" + ip, SECURITY_KEY);
			Cookie cookie = new Cookie(AUTHORITY_TOKEN, token);
			cookie.setMaxAge(COOKIE_MAX_AGE);
			response.addCookie(cookie);
		} catch (Exception e) {
			logger.error("{}", e);
		}
	}

	// 判断cookies是否存在
	public static long getUidFromCookie(HttpServletRequest request) {
		String token = ServletUtils.getCookie(request, AUTHORITY_TOKEN);
		long uid = 0;
		if (token != null) {
			try {
				token = DESUtils.decrypt(token, SECURITY_KEY);
				String[] arr = token.split(";");
				if (arr.length == 2) {
					String idStr = arr[0];
					String ip = arr[1];
					// 验证ip
					if (ip.equals(ServletUtils.getRemoteAddress(request))) {
						uid = Long.parseLong(idStr);
					}
				}
			} catch (Exception e) {
				logger.error("{}", e);
			}
		}
		return uid;
	}

	public static void removeAuthorityCookie(HttpServletResponse response) {
		removeCookie(response, AUTHORITY_TOKEN);
	}

	public static void removeCookie(HttpServletResponse response, String name) {
		Cookie cookie = new Cookie(name, null);
		cookie.setMaxAge(0); // 立即删除型
		response.addCookie(cookie); // 重新写入，将覆盖之前的
	}
}

package com.community.web;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

public class Common {

	/**
	 * 设置createAt的表示形式“2月7日16:41”或者“16:41”
	 * 
	 * @param createAt
	 * @return
	 */

	private static final ThreadLocal<SimpleDateFormat> HH_mm = new ThreadLocal<SimpleDateFormat>() {
		protected SimpleDateFormat initialValue() {
			return new SimpleDateFormat("HH:mm");
		}
	};

	private static final ThreadLocal<SimpleDateFormat> MM_dd_HH_mm = new ThreadLocal<SimpleDateFormat>() {
		protected SimpleDateFormat initialValue() {
			return new SimpleDateFormat("MM月dd日 HH:mm");
		}
	};

	private static final ThreadLocal<SimpleDateFormat> yy_MM_dd_HH_mm = new ThreadLocal<SimpleDateFormat>() {
		protected SimpleDateFormat initialValue() {
			return new SimpleDateFormat("yy年MM月dd日 HH:mm");
		}
	};

	public static String friendlyTime(Timestamp createAt) {
		Calendar createAtCalendar = Calendar.getInstance();
		createAtCalendar.setTime(createAt);
		Calendar currentCalendar = Calendar.getInstance();
		int createAtYear = createAtCalendar.get(Calendar.YEAR);
		int createAtMonth = createAtCalendar.get(Calendar.MONTH);
		int createAtDay = createAtCalendar.get(Calendar.DAY_OF_MONTH);

		SimpleDateFormat sdf = null;
		if (createAtYear == currentCalendar.get(Calendar.YEAR)) {
			if (createAtMonth == currentCalendar.get(Calendar.MONTH)) {
				if (createAtDay == currentCalendar.get(Calendar.DAY_OF_MONTH)) {// 同年同月同日
					sdf = HH_mm.get();
				} else {
					sdf = MM_dd_HH_mm.get();
				}
			} else {
				sdf = MM_dd_HH_mm.get();
			}
		} else {
			sdf = yy_MM_dd_HH_mm.get();
		}
		return sdf.format(createAt);
	}

	public static boolean isLocalTest() {
		return (System.getProperties().getProperty("os.name").toUpperCase()
				.indexOf("WINDOWS") != -1);
	}

	/**
	 * 获得请求是地址栏的地址
	 * 
	 * @param request
	 * @return
	 */
	public static String getCurrentURL(HttpServletRequest request) {
		StringBuilder sb = new StringBuilder(request.getScheme());
		sb.append("://");
		sb.append(request.getServerName());
		if (isLocalTest()) {// 本地测试
			sb.append(":");// TODO
			sb.append(request.getLocalPort());// TODO
		}
		sb.append(request.getRequestURI());
		String queryStr = request.getQueryString();
		if (queryStr != null) {
			sb.append("?");
			sb.append(queryStr);
		}
		return sb.toString();
	}

	public static String getBasePath(HttpServletRequest request) {
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort() + path;
		return basePath;
	}

	/**
	 * 删除请求地址中的某个参数，如果该参数不存在，返回原地址
	 * 
	 * @param request
	 * @return
	 */
	public static String deleteParam(String url, String param) {
		int pageIndex = url.indexOf(param);
		if (pageIndex == -1) {
			return url;
		}
		int nextIndex = url.indexOf("&", pageIndex);
		if (nextIndex == -1) {// http://localhost:8080/community/home.html?tab=followedGroupPosts&page=2"
			return url.substring(0, pageIndex - 1);
		} else {// http://localhost:8080/community/home.html?page=2&tab=followedGroupPosts"
			String temp = url.substring(pageIndex, nextIndex + 1);
			return url.replaceAll(temp, "");
		}
	}

	/**
	 * 获取“页”未完全连接,如http://localhost:8080/community/home.html?tab=myPosts&page=
	 * 
	 * @param currentURL
	 * @return
	 */
	public static String getPageHref(String currentURL) {
		StringBuilder temp = new StringBuilder(deleteParam(currentURL,
				Constants.PAGE));
		if (temp.indexOf("?") != -1) {
			temp.append("&");
		} else {
			temp.append("?");
		}
		temp.append(Constants.PAGE);
		temp.append("=");
		return temp.toString();
	}

	public static int getCurrentPage(int currentPage, int pageCount) {
		if (pageCount < 1) {
			return 1;
		}
		if (currentPage < 1) {
			return 1;
		}
		if (currentPage > pageCount) {
			return pageCount;
		}
		return currentPage;
	}

	/**
	 * 设置页数
	 * 
	 * @param amount
	 *            总共有多少
	 * @param pageSize
	 *            每页多少个
	 * @return
	 */
	public static int getPageCount(int amount, int pageSize) {// 总共有多少页
		int pageCount = amount / pageSize;// 共有多少页
		if (amount % pageSize != 0) {
			++pageCount;
		}
		return pageCount;
	}

	/**
	 * 
	 * @param size
	 * @return
	 */
	public static String getFileSizeStr(Long size) {
		double kb = 1024;
		double mb = 1024 * kb;
		double gb = 1024 * mb;
		double a = 10;
		double b = 100;
		double c = 1000;
		StringBuilder sizeStr = new StringBuilder();
		if (size < kb) {
			sizeStr.append(size);
			sizeStr.append("B");
			return sizeStr.toString();
		}
		if (size < mb) {
			long temp = (long) (size * a / kb);
			sizeStr.append(temp / a);// 截取小数点后1位
			sizeStr.append("KB");
			return sizeStr.toString();
		}
		if (size < gb) {
			long temp = (long) (size * b / mb);// 截取小数点后2位
			sizeStr.append(temp / b);
			sizeStr.append("MB");
			return sizeStr.toString();
		}

		long temp = (long) (size * c / mb);// 截取小数点后3位
		sizeStr.append(temp / c);
		sizeStr.append("GB");
		return sizeStr.toString();
	}

	public static String getFileExtension(String filepath) {
		if (filepath != null) {
			int index = filepath.lastIndexOf(".");
			if (index != -1) {
				return filepath.substring(index + 1);
			}
		}
		return "";
	}
	
	public static Integer getFloor(Integer currentPage, Integer index){
		return (currentPage-1) * Constants.COMMENT_PAGE_SIZE + index + 1;
	}
}

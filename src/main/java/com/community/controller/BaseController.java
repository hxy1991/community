package com.community.controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.community.domain.User;
import com.community.service.PostService;
import com.community.service.UserService;
import com.community.util.CookieUtils;
import com.community.util.StringUtils;

@Controller
public class BaseController {
	private static final Logger logger = LoggerFactory
			.getLogger(BaseController.class);

	@Autowired
	private UserService userService;
	@Autowired
	private PostService postService;

	/**
	 * 网站首页
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model, HttpServletRequest request) {
		return "redirect:login";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index1(Model model, HttpServletRequest request) {
		return "index";
	}

	@RequestMapping(value = "/login")
	public String login(
			Model model,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "inputEmail", required = false) String email,
			@RequestParam(value = "inputPassword", required = false) String password,
			@RequestParam(value = "rememberPassword", required = false) String rememberPassword,
			@RequestParam(value = "gotoPage", required = false) String gotoPage) {
		if (email == null) {
			return "login";
		}
		User user = userService.getUserByEmail(email);
		if (user != null) {
			if (user.getPassword().equals(StringUtils.md5(password))) {
				long myUid = user.getId();
				if (myUid != 0) {
					if (rememberPassword != null) {
						CookieUtils.setCookie(request, response, myUid);
					}
					user.setLastLoginTime(user.getLoginTime());
					user.setLoginTime(new Timestamp(System.currentTimeMillis()));
					user.setStatus(1);
					boolean success = userService.updateUser(user);
					if(!success){
						logger.warn("更新登录时间失败，uid:{}", myUid);
					}
					request.getSession().setAttribute("myUid", myUid);
					if (gotoPage != null) {
						return "redirect:" + gotoPage;
					} else {
						return "redirect:home";
					}
				}
			}
		}
		model.addAttribute("tip", "账号或密码错误");
		return "login";
	}

	@RequestMapping(value = "/register")
	public String register(
			Model model,
			HttpServletRequest request,
			@RequestParam(value = "inputEmail", required = false) String email,
			@RequestParam(value = "inputPassword", required = false) String password,
			@RequestParam(value = "inputConfirmPassword", required = false) String confirmPassword,
			@RequestParam(value = "inputNickname", required = false) String nickname,
			@RequestParam(value = "inputTokenValue", required = false) String tokenValue) {
		if (email == null) {
			return "register";
		}
		if (password == null || password.equals("")) {// 密码不能为空
			model.addAttribute("tip", "密码不能为空！");
			return "register";
		}
		if (!password.equals(confirmPassword)) {
			model.addAttribute("tip", "密码与确认密码必须相同！");
			return "register";
		}
		if (email == null || email.equals("")) {// 邮箱不能为空
			model.addAttribute("tip", "邮箱不能为空！");
			return "register";
		}
		if (!StringUtils.isEmail(email)) {// 验证邮箱是否满足正则表达式
			model.addAttribute("tip", "请输入正确的邮箱！");
			return "register";

		}
		if (userService.getUserByEmail(email) != null) {// 这里要判断邮箱是否已经存在的情况
			model.addAttribute("tip", "该邮箱已经被注册！");
			return "register";
		}
		if (nickname == null || nickname.equals("")) {// 昵称不能为空
			model.addAttribute("tip", "昵称不能为空！");
			return "register";

		}
		if (userService.getUserByNickname(nickname) != null) {// 这里要判断昵称是否已经存在情况
			model.addAttribute("tip", "该昵称已经存在！");
			return "register";
		}
		HttpSession session = request.getSession();
		if (tokenValue.equals(tokenValue)) {
			session.removeAttribute("tokenValue");
			User user = new User();
			user.setEmail(email);
			user.setPassword(password);
			user.setNickname(nickname);
			userService.insertUser(user);// 改为返回一个id
			long myUid = user.getId();
			if (myUid != -1) {
				session.setAttribute("myUid", myUid);
				return "login";
			} else {
				model.addAttribute("tip", "注册失败，请稍后再试！");
				return "register";
			}
		} else {// 令牌值出现问题
			session.setAttribute("tokenValue", System.currentTimeMillis());
			return "register";
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(SessionStatus status, HttpSession session, HttpServletResponse response) {
		Object obj = session.getAttribute("myUid");
		if(obj != null){
			User user = userService.getUserById((Long)obj);
			user.setStatus(0);
			userService.updateUser(user);
		}
		status.setComplete();
		CookieUtils.removeAuthorityCookie(response);
		return "redirect:login";
	}
}

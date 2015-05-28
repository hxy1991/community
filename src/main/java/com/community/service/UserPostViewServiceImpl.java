package com.community.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.dao.UserPostViewDao;
import com.community.domain.UserPostView;

/**
 * 
 * @author wynlqxm
 * @create 2015年5月12日 下午10:22:27
 */
@Service
public class UserPostViewServiceImpl implements UserPostViewService {
	private static final Logger logger = LoggerFactory
			.getLogger(UserPostViewServiceImpl.class);
	@Autowired
	private UserPostViewDao userPostViewDao;

	@Override
	public void createUserPostView(long uid, long pid) {
		UserPostView userPostView = new UserPostView();
		userPostView.setUid(uid);
		userPostView.setPid(pid);
		userPostViewDao.createUserPostView(userPostView);
	}

}

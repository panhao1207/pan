package service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import common.Response;
import dao.Admin_wqDao;
import dao.User_wqDao;
import service.Admin_wqService;
import service.User_wqService;
import entity.Admin_wqBean;
import entity.User_wqBean;

@Service
@Transactional
public class User_wqServiceImpl implements User_wqService{
	
	@Autowired
	User_wqDao dao;

	@Override
	public User_wqBean login(User_wqBean user_wqBean) {
		// TODO Auto-generated method stub
		return dao.login(user_wqBean);
	}

	@Override
	public List<User_wqBean> findUserAll() {
		// TODO Auto-generated method stub
		return dao.findUserAll();
	}

	@Override
	public User_wqBean findUserById(Integer id) {
		// TODO Auto-generated method stub
		return dao.findUserById(id);
	}

	@Override
	public void updateUserInfo(User_wqBean user_wqBean) {
		// TODO Auto-generated method stub
		dao.updateUserInfo(user_wqBean);
	}

	@Override
	public int UserRegist(User_wqBean user_wqBean) {
		// TODO Auto-generated method stub
		return dao.UserRegist(user_wqBean);
	}

	@Override
	public void deleteUserById(Integer id) {
		// TODO Auto-generated method stub
		dao.deleteUserById(id);
	}

	@Override
	public void updateUserInfo2(User_wqBean user_wqBean) {
		// TODO Auto-generated method stub
		dao.updateUserInfo2(user_wqBean);
	}

	@Override
	public User_wqBean findUserByShen(String shen) {
		// TODO Auto-generated method stub
		return dao.findUserByShen(shen);
	}

	@Override
	public int InserUserInfo(User_wqBean user_wqBean) {
		// TODO Auto-generated method stub
		return dao.InserUserInfo(user_wqBean);
	}

	@Override
	public User_wqBean checkLogin(User_wqBean user_wqBean) {
		// TODO Auto-generated method stub
		return dao.checkLogin(user_wqBean);
	}

	@Override
	public void updateUserInfoByShen(User_wqBean user_wqBean) {
		// TODO Auto-generated method stub
		dao.updateUserInfoByShen(user_wqBean);
	}

	@Override
	public User_wqBean findUserInfoByUserShen(String shen) {
		// TODO Auto-generated method stub
		return dao.findUserInfoByUserShen(shen);
	}

	
}

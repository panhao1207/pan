package service;

import java.util.List;

import common.Response;
import entity.Admin_wqBean;
import entity.User_wqBean;

public interface User_wqService {

	//app相关
	public User_wqBean checkLogin(User_wqBean user_wqBean);
	public void updateUserInfoByShen(User_wqBean user_wqBean);
	
	//系统相关
	public User_wqBean login(User_wqBean user_wqBean);
	
	public List<User_wqBean> findUserAll();
	
	public User_wqBean findUserById(Integer id);
	
	public void updateUserInfo(User_wqBean user_wqBean);
	
	public void updateUserInfo2(User_wqBean user_wqBean);
	
	public int UserRegist(User_wqBean user_wqBean);
	
	public void deleteUserById(Integer id);
	
	public User_wqBean findUserByShen(String shen);
	
	public int InserUserInfo(User_wqBean user_wqBean);
	
	public User_wqBean findUserInfoByUserShen(String shen);
	
}

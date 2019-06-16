package service;

import java.util.List;

import common.Response;
import entity.Admin_wqBean;

public interface Admin_wqService {

public Admin_wqBean login(Admin_wqBean st);
	
	public List<Admin_wqBean> findAdminAll();
	
	public Admin_wqBean findAdminById(Integer id);
	
	public void updateAdminInfo(Admin_wqBean admin_wqBean);
	
	public int addAdminInfo(Admin_wqBean admin_wqBean);
	
	public List<Admin_wqBean> findAdminByIds(Integer id);
	
}

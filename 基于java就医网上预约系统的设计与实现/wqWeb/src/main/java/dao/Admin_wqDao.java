package dao;

import java.util.List;

import entity.Admin_wqBean;

public interface Admin_wqDao {
	
	public Admin_wqBean login(Admin_wqBean st);
	
	public List<Admin_wqBean> findAdminAll();
	
	public Admin_wqBean findAdminById(Integer id);
	
	public void updateAdminInfo(Admin_wqBean admin_wqBean);
	
	public int addAdminInfo(Admin_wqBean admin_wqBean);
	
	public List<Admin_wqBean> findAdminByIds(Integer id);
	
}

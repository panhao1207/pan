package service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import common.Response;
import dao.Admin_wqDao;
import service.Admin_wqService;
import entity.Admin_wqBean;

@Service
@Transactional
public class Admin_wqServiceImpl implements Admin_wqService{
	
	@Autowired
	Admin_wqDao dao;
	
	@Override
	public Admin_wqBean login(Admin_wqBean student) {
		// TODO Auto-generated method stub
		
		return dao.login(student);
	}

	@Override
	public List<Admin_wqBean> findAdminAll() {
		// TODO Auto-generated method stub
		return dao.findAdminAll();
	}

	@Override
	public Admin_wqBean findAdminById(Integer id) {
		// TODO Auto-generated method stub
		return dao.findAdminById(id);
	}

	@Override
	public void updateAdminInfo(Admin_wqBean admin_wqBean) {
		// TODO Auto-generated method stub
		dao.updateAdminInfo(admin_wqBean);
	}

	@Override
	public int addAdminInfo(Admin_wqBean admin_wqBean) {
		// TODO Auto-generated method stub
		return dao.addAdminInfo(admin_wqBean);
	}

	@Override
	public List<Admin_wqBean> findAdminByIds(Integer id) {
		// TODO Auto-generated method stub
		return dao.findAdminByIds(id);
	}
	
}

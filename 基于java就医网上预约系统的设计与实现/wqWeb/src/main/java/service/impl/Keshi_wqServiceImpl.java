package service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import common.Response;
import dao.Admin_wqDao;
import dao.Dock_wqDao;
import dao.Keshi_wqDao;
import service.Admin_wqService;
import service.Dock_wqService;
import service.Keshi_wqService;
import entity.Admin_wqBean;
import entity.Dock_wqBean;
import entity.Keshi_wqBean;

@Service
@Transactional
public class Keshi_wqServiceImpl implements Keshi_wqService{
	
	@Autowired
	Keshi_wqDao dao;

	@Override
	public List<Keshi_wqBean> findKeshiAll() {
		// TODO Auto-generated method stub
		return dao.findKeshiAll();
	}

	@Override
	public Keshi_wqBean findKeshiById(Integer id) {
		// TODO Auto-generated method stub
		return dao.findKeshiById(id);
	}

	@Override
	public void deleteKeshiById(Integer id) {
		// TODO Auto-generated method stub
		dao.deleteKeshiById(id);
	}

	@Override
	public Keshi_wqBean findKeshiInfoByName(String name) {
		// TODO Auto-generated method stub
		return dao.findKeshiInfoByName(name);
	}

	@Override
	public void updateKeshiInfo(Keshi_wqBean keshi_wqBean) {
		// TODO Auto-generated method stub
		dao.updateKeshiInfo(keshi_wqBean);
	}

	@Override
	public int insertKeshiInfo(Keshi_wqBean keshi_wqBean) {
		// TODO Auto-generated method stub
		return dao.insertKeshiInfo(keshi_wqBean);
	}


	
}

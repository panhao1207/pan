package service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import common.Response;
import dao.Admin_wqDao;
import dao.Dock_wqDao;
import service.Admin_wqService;
import service.Dock_wqService;
import entity.Admin_wqBean;
import entity.Dock_wqBean;

@Service
@Transactional
public class Dock_wqServiceImpl implements Dock_wqService{
	
	@Autowired
	Dock_wqDao dao;

	@Override
	public Dock_wqBean login(Dock_wqBean dock_wqBean) {
		// TODO Auto-generated method stub
		return dao.login(dock_wqBean);
	}

	@Override
	public List<Dock_wqBean> findDockAll() {
		// TODO Auto-generated method stub
		return dao.findDockAll();
	}

	@Override
	public Dock_wqBean findDockById(Integer id) {
		// TODO Auto-generated method stub
		return dao.findDockById(id);
	}

	@Override
	public void deleteDockById(Integer id) {
		// TODO Auto-generated method stub
		dao.deleteDockById(id);
	}

	@Override
	public int insertDockInfo(Dock_wqBean dock_wqBean) {
		// TODO Auto-generated method stub
		return dao.insertDockInfo(dock_wqBean);
	}

	@Override
	public void updateDockInfo1(Dock_wqBean dock_wqBean) {
		// TODO Auto-generated method stub
		dao.updateDockInfo1(dock_wqBean);
	}

	@Override
	public void updateDockInfo2(Dock_wqBean dock_wqBean) {
		// TODO Auto-generated method stub
		dao.updateDockInfo2(dock_wqBean);
	}

	@Override
	public List<Dock_wqBean> findDockAllBykeshiId(Integer id) {
		// TODO Auto-generated method stub
		return dao.findDockAllBykeshiId(id);
	}

	@Override
	public List<Dock_wqBean> findDockAllBykeshiName(String name) {
		// TODO Auto-generated method stub
		return dao.findDockAllBykeshiName(name);
	}

	@Override
	public Dock_wqBean findDockByIdByUser(Integer id) {
		// TODO Auto-generated method stub
		return dao.findDockByIdByUser(id);
	}

	@Override
	public List<Dock_wqBean> findDockAllByDockName(String name) {
		// TODO Auto-generated method stub
		return dao.findDockAllByDockName(name);
	}

	@Override
	public List<Dock_wqBean> findDockDataBydid(Integer id) {
		// TODO Auto-generated method stub
		return dao.findDockDataBydid(id);
	}
	
	
	
}

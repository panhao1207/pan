package service;

import java.util.List;

import common.Response;
import entity.Admin_wqBean;
import entity.Dock_wqBean;

public interface Dock_wqService {

	public Dock_wqBean login(Dock_wqBean dock_wqBean);
	
	public List<Dock_wqBean> findDockAll();
	
	public Dock_wqBean findDockById(Integer id);
	
	public void deleteDockById(Integer id);
	
	public int insertDockInfo(Dock_wqBean dock_wqBean);
	
	public void updateDockInfo1(Dock_wqBean dock_wqBean);
	
	public void updateDockInfo2(Dock_wqBean dock_wqBean);
	
	public List<Dock_wqBean> findDockAllBykeshiId(Integer id);
	
	public List<Dock_wqBean> findDockAllBykeshiName(String name);
	
	public List<Dock_wqBean> findDockAllByDockName(String name);
	
	public Dock_wqBean findDockByIdByUser(Integer id);
	
	public List<Dock_wqBean> findDockDataBydid(Integer id);
}

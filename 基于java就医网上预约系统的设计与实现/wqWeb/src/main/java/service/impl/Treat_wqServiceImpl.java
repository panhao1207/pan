package service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import common.Response;
import dao.Admin_wqDao;
import dao.Treat_wqDao;
import dao.User_wqDao;
import service.Admin_wqService;
import service.Treat_wqService;
import service.User_wqService;
import entity.Admin_wqBean;
import entity.Treat_wqBean;
import entity.User_wqBean;

@Service
@Transactional
public class Treat_wqServiceImpl implements Treat_wqService{
	
	@Autowired
	Treat_wqDao dao;

	@Override
	public List<Treat_wqBean> findTreatAll() {
		// TODO Auto-generated method stub
		return dao.findTreatAll();
	}

	@Override
	public Treat_wqBean findTreatById(Integer id) {
		// TODO Auto-generated method stub
		return dao.findTreatById(id);
	}

	@Override
	public void deleteTreatById(Integer id) {
		// TODO Auto-generated method stub
		dao.deleteTreatById(id);
	}

	@Override
	public void updateTreatInfo(Treat_wqBean treat_wqBean) {
		// TODO Auto-generated method stub
		dao.updateTreatInfo(treat_wqBean);
	}

	@Override
	public int insertTreatInfo(Treat_wqBean treat_wqBean) {
		// TODO Auto-generated method stub
		return dao.insertTreatInfo(treat_wqBean);
	}

	@Override
	public List<Treat_wqBean> findTreatByDid(Integer id) {
		// TODO Auto-generated method stub
		return dao.findTreatByDid(id);
	}

	@Override
	public List<Treat_wqBean> findYijiuzhenTreatAll() {
		// TODO Auto-generated method stub
		return dao.findYijiuzhenTreatAll();
	}

	@Override
	public List<Treat_wqBean> findWeijiuzhenTreatAll() {
		// TODO Auto-generated method stub
		return dao.findWeijiuzhenTreatAll();
	}

	@Override
	public void updateDelTreatInfo(Treat_wqBean treat_wqBean) {
		// TODO Auto-generated method stub
		dao.updateDelTreatInfo(treat_wqBean);
	}

	@Override
	public void updateWanchengTreatInfo(Treat_wqBean treat_wqBean) {
		// TODO Auto-generated method stub
		dao.updateWanchengTreatInfo(treat_wqBean);
	}

	@Override
	public Treat_wqBean findTreatOneByDockId(Integer id) {
		// TODO Auto-generated method stub
		return dao.findTreatOneByDockId(id);
	}

	@Override
	public Treat_wqBean findTreatTotalPreIndexByStaus(Integer id) {
		// TODO Auto-generated method stub
		return dao.findTreatTotalPreIndexByStaus(id);
	}

	@Override
	public Treat_wqBean findTreatTotalByStaus(Integer id) {
		// TODO Auto-generated method stub
		return dao.findTreatTotalByStaus(id);
	}

	@Override
	public Treat_wqBean findTreatTotalMaxByStaus(Integer id) {
		// TODO Auto-generated method stub
		return dao.findTreatTotalMaxByStaus(id);
	}

	@Override
	public Treat_wqBean findTreatPreIndexMaxByStaus(Integer id) {
		// TODO Auto-generated method stub
		return dao.findTreatPreIndexMaxByStaus(id);
	}

	@Override
	public List<Treat_wqBean> findTreatPreIndexJianyiByStaus(Treat_wqBean treat_wqBean) {
		// TODO Auto-generated method stub
		return dao.findTreatPreIndexJianyiByStaus(treat_wqBean);
	}

	@Override
	public List<Treat_wqBean> findTreatPreIndexYanzhengByStaus(Treat_wqBean treat_wqBean) {
		// TODO Auto-generated method stub
		return dao.findTreatPreIndexYanzhengByStaus(treat_wqBean);
	}

	@Override
	public void updatePreAndTotalTreatInfo(Treat_wqBean treat_wqBean) {
		// TODO Auto-generated method stub
		dao.updatePreAndTotalTreatInfo(treat_wqBean);
	}

	@Override
	public List<Treat_wqBean> findTreatAllOneByDockId(Integer id) {
		// TODO Auto-generated method stub
		return dao.findTreatAllOneByDockId(id);
	}

	@Override
	public List<Treat_wqBean> findDockYijiuzhenTreatAll(Integer id) {
		// TODO Auto-generated method stub
		return dao.findDockYijiuzhenTreatAll(id);
	}

	@Override
	public List<Treat_wqBean> findDockWeijiuzhenTreatAll(Integer id) {
		// TODO Auto-generated method stub
		return dao.findDockWeijiuzhenTreatAll(id);
	}

	@Override
	public Treat_wqBean GetTtreatByUidAndDockId(Treat_wqBean treat_wqBean) {
		// TODO Auto-generated method stub
		return dao.GetTtreatByUidAndDockId(treat_wqBean);
	}

	@Override
	public List<Treat_wqBean> GetAllPreTreatByUserIdByUser(Integer id) {
		// TODO Auto-generated method stub
		return dao.GetAllPreTreatByUserIdByUser(id);
	}

	@Override
	public List<Treat_wqBean> GetAllYijiuzhenTreatByUserIdByUser(Integer id) {
		// TODO Auto-generated method stub
		return dao.GetAllYijiuzhenTreatByUserIdByUser(id);
	}

	@Override
	public List<Treat_wqBean> findTreatAllOneByDockShen(String shen) {
		// TODO Auto-generated method stub
		return dao.findTreatAllOneByDockShen(shen);
	}

	@Override
	public Treat_wqBean findTreatByTreatId(Integer id) {
		// TODO Auto-generated method stub
		return dao.findTreatByTreatId(id);
	}



	
}

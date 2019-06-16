package service;

import java.util.List;

import common.Response;
import entity.Admin_wqBean;
import entity.Treat_wqBean;
import entity.User_wqBean;

public interface Treat_wqService {
	
	public List<Treat_wqBean> findTreatAll();
	
	public Treat_wqBean findTreatById(Integer id);
	
	public void deleteTreatById(Integer id);
	
	public void updateTreatInfo(Treat_wqBean treat_wqBean);
	
	public int insertTreatInfo(Treat_wqBean treat_wqBean);
	
	public List<Treat_wqBean> findTreatByDid(Integer id);
	
	public List<Treat_wqBean> findYijiuzhenTreatAll();
	
	public List<Treat_wqBean> findWeijiuzhenTreatAll();
	
	public List<Treat_wqBean> findDockYijiuzhenTreatAll(Integer id);
	
	public List<Treat_wqBean> findDockWeijiuzhenTreatAll(Integer id);
	
	public void updateDelTreatInfo(Treat_wqBean treat_wqBean);
	
	public void updateWanchengTreatInfo(Treat_wqBean treat_wqBean);
	
	public Treat_wqBean findTreatOneByDockId(Integer id);
	
	public List<Treat_wqBean> findTreatAllOneByDockId(Integer id);
	
	public Treat_wqBean findTreatTotalPreIndexByStaus(Integer id);
	
	public Treat_wqBean findTreatTotalByStaus(Integer id);
	
	public Treat_wqBean findTreatTotalMaxByStaus(Integer id);
	
	public Treat_wqBean findTreatPreIndexMaxByStaus(Integer id);
	
	public List<Treat_wqBean> findTreatPreIndexJianyiByStaus(Treat_wqBean treat_wqBean);
	
	public List<Treat_wqBean> findTreatPreIndexYanzhengByStaus(Treat_wqBean treat_wqBean);
	
	public void updatePreAndTotalTreatInfo(Treat_wqBean treat_wqBean);
	
	public Treat_wqBean GetTtreatByUidAndDockId(Treat_wqBean treat_wqBean);
	
	public List<Treat_wqBean> GetAllPreTreatByUserIdByUser(Integer id);
	
	public List<Treat_wqBean> GetAllYijiuzhenTreatByUserIdByUser(Integer id);
	
	public List<Treat_wqBean> findTreatAllOneByDockShen(String shen);
	
    public Treat_wqBean findTreatByTreatId(Integer id);
	
}

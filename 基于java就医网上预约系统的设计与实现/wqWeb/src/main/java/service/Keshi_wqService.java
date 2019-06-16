package service;

import java.util.List;

import common.Response;
import entity.Keshi_wqBean;

public interface Keshi_wqService {

public List<Keshi_wqBean> findKeshiAll();
	
	public Keshi_wqBean findKeshiById(Integer id);
	
	public void deleteKeshiById(Integer id);
	
	public Keshi_wqBean findKeshiInfoByName(String name);
	
	public void updateKeshiInfo(Keshi_wqBean keshi_wqBean);
	
	public int insertKeshiInfo(Keshi_wqBean keshi_wqBean);
	
}

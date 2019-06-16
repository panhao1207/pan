package entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class Admin_wqBean implements Serializable{

	private static final long serialVersionUID = 1L;
	private int Aid_wq;
	private String Aname_wq;
	private String Apwd_wq;
	private int AtypeId_wq;
	private Timestamp AloginTime_wq;
	private String Abianhao_wq;
	
	public String getAbianhao_wq() {
		return Abianhao_wq;
	}
	public void setAbianhao_wq(String abianhao_wq) {
		Abianhao_wq = abianhao_wq;
	}
	private String userType;
	
	
	
	
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public Timestamp getAloginTime_wq() {
		return AloginTime_wq;
	}
	public void setAloginTime_wq(Timestamp aloginTime_wq) {
		AloginTime_wq = aloginTime_wq;
	}
	public int getAid_wq() {
		return Aid_wq;
	}
	public void setAid_wq(int aid_wq) {
		Aid_wq = aid_wq;
	}
	public String getAname_wq() {
		return Aname_wq;
	}
	public void setAname_wq(String aname_wq) {
		Aname_wq = aname_wq;
	}
	public String getApwd_wq() {
		return Apwd_wq;
	}
	public void setApwd_wq(String apwd_wq) {
		Apwd_wq = apwd_wq;
	}
	public int getAtypeId_wq() {
		return AtypeId_wq;
	}
	public void setAtypeId_wq(int atypeId_wq) {
		AtypeId_wq = atypeId_wq;
	}
	

	
	
}

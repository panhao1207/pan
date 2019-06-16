package entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class Treat_wqBean implements Serializable{

	private static final long serialVersionUID = 1L;
	private int Tid_wq;
	private String Ttitle_wq;
	private int TUid_wq;
	private int TDid_wq;
	private int TKeshiId_wq;
	private Timestamp Ttreattime_wq;
	private Timestamp TpreTime_wq;
	public int TpreIndex_wq;
	public int Ttotal_wq;
	private String Tbianhao_wq;
	private String Tshenfenzheng_wq;
	private int Tstatus_wq;
	private String TstatusStr_wq;
	private int TisUse_wq;
	
	private int preCont;
	private int totalCont;
	
	private int totalMax;
	private int preIndexMax;
	
	public int getTotalMax() {
		return totalMax;
	}
	public void setTotalMax(int totalMax) {
		this.totalMax = totalMax;
	}
	public int getPreIndexMax() {
		return preIndexMax;
	}
	public void setPreIndexMax(int preIndexMax) {
		this.preIndexMax = preIndexMax;
	}
	public int getTotalCont() {
		return totalCont;
	}
	public void setTotalCont(int totalCont) {
		this.totalCont = totalCont;
	}
	public int getPreCont() {
		return preCont;
	}
	public void setPreCont(int preCont) {
		this.preCont = preCont;
	}
	public int getTisUse_wq() {
		return TisUse_wq;
	}
	public void setTisUse_wq(int tisUse_wq) {
		TisUse_wq = tisUse_wq;
	}
	public String getTstatusStr_wq() {
		return TstatusStr_wq;
	}
	public void setTstatusStr_wq(String tstatusStr_wq) {
		TstatusStr_wq = tstatusStr_wq;
	}
	public int getTstatus_wq() {
		return Tstatus_wq;
	}
	public void setTstatus_wq(int tstatus_wq) {
		Tstatus_wq = tstatus_wq;
	}
	private String Tuanme;
	private String Tdanme;
	private String Tkname;
	
	public String getTshenfenzheng_wq() {
		return Tshenfenzheng_wq;
	}
	public void setTshenfenzheng_wq(String tshenfenzheng_wq) {
		Tshenfenzheng_wq = tshenfenzheng_wq;
	}

	
	
	public String getTkname() {
		return Tkname;
	}
	public void setTkname(String tkname) {
		Tkname = tkname;
	}
	public String getTdanme() {
		return Tdanme;
	}
	public void setTdanme(String tdanme) {
		Tdanme = tdanme;
	}
	public String getTuanme() {
		return Tuanme;
	}
	public void setTuanme(String tuanme) {
		Tuanme = tuanme;
	}

	
	
	public int getTid_wq() {
		return Tid_wq;
	}
	public void setTid_wq(int tid_wq) {
		Tid_wq = tid_wq;
	}
	public String getTtitle_wq() {
		return Ttitle_wq;
	}
	public void setTtitle_wq(String ttitle_wq) {
		Ttitle_wq = ttitle_wq;
	}
	public int getTUid_wq() {
		return TUid_wq;
	}
	public void setTUid_wq(int tUid_wq) {
		TUid_wq = tUid_wq;
	}
	public int getTDid_wq() {
		return TDid_wq;
	}
	public void setTDid_wq(int tDid_wq) {
		TDid_wq = tDid_wq;
	}
	public int getTKeshiId_wq() {
		return TKeshiId_wq;
	}
	public void setTKeshiId_wq(int tKeshiId_wq) {
		TKeshiId_wq = tKeshiId_wq;
	}
	public Timestamp getTtreattime_wq() {
		return Ttreattime_wq;
	}
	public void setTtreattime_wq(Timestamp ttreattime_wq) {
		Ttreattime_wq = ttreattime_wq;
	}
	public Timestamp getTpreTime_wq() {
		return TpreTime_wq;
	}
	public void setTpreTime_wq(Timestamp tpreTime_wq) {
		TpreTime_wq = tpreTime_wq;
	}
	public int getTpreIndex_wq() {
		return TpreIndex_wq;
	}
	public void setTpreIndex_wq(int tpreIndex_wq) {
		TpreIndex_wq = tpreIndex_wq;
	}
	public int getTtotal_wq() {
		return Ttotal_wq;
	}
	public void setTtotal_wq(int ttotal_wq) {
		Ttotal_wq = ttotal_wq;
	}
	public String getTbianhao_wq() {
		return Tbianhao_wq;
	}
	public void setTbianhao_wq(String tbianhao_wq) {
		Tbianhao_wq = tbianhao_wq;
	}
	
	
	
	
	
}

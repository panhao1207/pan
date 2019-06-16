package entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class Dock_wqBean implements Serializable{

	private static final long serialVersionUID = 1L;
	private int Yid_wq;
	private String Ybianhao_wq;
	private String Yname_wq;
	private String Ypwd_wq;
	private String Ytel_wq;
	private String Ysex_wq;
	private String Yimg_wq;
	private String Yattr_wq;
	private String Yjianjie_wq;
	private Timestamp yaddTime_wq;
	private int Yage_wq;

	
	private int code;
	private String msg;
	private Object obj;
	
	public Dock_wqBean(){
		
	}
	
	public Dock_wqBean(int code,String msg,Object obj){
		this.code=code;
		this.msg=msg;
		this.obj=obj;
	}
	
	public static Dock_wqBean getJsonResult(int code,String msg,Object obj){
		return new Dock_wqBean(code,msg,obj);
	}
	
	
	
	
	
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getObj() {
		return obj;
	}

	public void setObj(Object obj) {
		this.obj = obj;
	}





	private int YkeshiId_wq;
	private String YkeshiName;
	
	public String getYkeshiName() {
		return YkeshiName;
	}
	public void setYkeshiName(String ykeshiName) {
		YkeshiName = ykeshiName;
	}
	public int getYid_wq() {
		return Yid_wq;
	}
	public void setYid_wq(int yid_wq) {
		Yid_wq = yid_wq;
	}
	public String getYbianhao_wq() {
		return Ybianhao_wq;
	}
	public void setYbianhao_wq(String ybianhao_wq) {
		Ybianhao_wq = ybianhao_wq;
	}
	public String getYname_wq() {
		return Yname_wq;
	}
	public void setYname_wq(String yname_wq) {
		Yname_wq = yname_wq;
	}
	public String getYpwd_wq() {
		return Ypwd_wq;
	}
	public void setYpwd_wq(String ypwd_wq) {
		Ypwd_wq = ypwd_wq;
	}
	public String getYtel_wq() {
		return Ytel_wq;
	}
	public void setYtel_wq(String ytel_wq) {
		Ytel_wq = ytel_wq;
	}
	public String getYsex_wq() {
		return Ysex_wq;
	}
	public void setYsex_wq(String ysex_wq) {
		Ysex_wq = ysex_wq;
	}
	public String getYimg_wq() {
		return Yimg_wq;
	}
	public void setYimg_wq(String yimg_wq) {
		Yimg_wq = yimg_wq;
	}
	public String getYattr_wq() {
		return Yattr_wq;
	}
	public void setYattr_wq(String yattr_wq) {
		Yattr_wq = yattr_wq;
	}
	public String getYjianjie_wq() {
		return Yjianjie_wq;
	}
	public void setYjianjie_wq(String yjianjie_wq) {
		Yjianjie_wq = yjianjie_wq;
	}
	public Timestamp getYaddTime_wq() {
		return yaddTime_wq;
	}
	public void setYaddTime_wq(Timestamp yaddTime_wq) {
		this.yaddTime_wq = yaddTime_wq;
	}
	public int getYkeshiId_wq() {
		return YkeshiId_wq;
	}
	public void setYkeshiId_wq(int ykeshiId_wq) {
		YkeshiId_wq = ykeshiId_wq;
	}
	public int getYage_wq() {
		return Yage_wq;
	}
	public void setYage_wq(int yage_wq) {
		Yage_wq = yage_wq;
	}
	
	
	
}

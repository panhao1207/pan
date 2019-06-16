package entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class Keshi_wqBean implements Serializable{

	private static final long serialVersionUID = 1L;
	private int Kid_wq;
	private String Kname_wq;
	private String Kfuzeren_wq;
	private String Ktel_wq;
	private Timestamp Ktime_wq;
	private String Kjianjie_wq;
	
	private int code;
	private String msg;
	private Object obj;
	
	public Keshi_wqBean(){
		
	}
	
	public Keshi_wqBean(int code,String msg,Object obj){
		this.code=code;
		this.msg=msg;
		this.obj=obj;
	}
	
	public static Keshi_wqBean getJsonResult(int code,String msg,Object obj){
		return new Keshi_wqBean(code,msg,obj);
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

	public int getKid_wq() {
		return Kid_wq;
	}
	public void setKid_wq(int kid_wq) {
		Kid_wq = kid_wq;
	}
	public String getKname_wq() {
		return Kname_wq;
	}
	public void setKname_wq(String kname_wq) {
		Kname_wq = kname_wq;
	}
	public String getKfuzeren_wq() {
		return Kfuzeren_wq;
	}
	public void setKfuzeren_wq(String kfuzeren_wq) {
		Kfuzeren_wq = kfuzeren_wq;
	}
	public String getKtel_wq() {
		return Ktel_wq;
	}
	public void setKtel_wq(String ktel_wq) {
		Ktel_wq = ktel_wq;
	}
	public Timestamp getKtime_wq() {
		return Ktime_wq;
	}
	public void setKtime_wq(Timestamp ktime_wq) {
		Ktime_wq = ktime_wq;
	}
	public String getKjianjie_wq() {
		return Kjianjie_wq;
	}
	public void setKjianjie_wq(String kjianjie_wq) {
		Kjianjie_wq = kjianjie_wq;
	}
	
	

	
}

/*
 * @(#)Response.java 
 * 
 * Copyright 2013 by 青岛腾信汽车网络科技服务有限公司 . 
 * All rights reserved.
 *
 */
package common;

/**
 *	功能		:	公共服务返回javaBean<br>
 */
public class Response {
	
	//执行是否正确
	private boolean result;
	//信息
	private String message;
	//返回数据
	private Object object;
	private Object object1;
	
	/**
	 * 默认返回成功构造函数
	 */
	public Response(){
		this.result = true;
	}
	
	
	public boolean isResult() {
		return result;
	}
	public void setResult(boolean result) {
		this.result = result;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Object getObject() {
		return object;
	}
	public void setObject(Object object) {
		this.object = object;
	}


	public Object getObject1() {
		return object1;
	}


	public void setObject1(Object object1) {
		this.object1 = object1;
	}


	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		
		return "Result:" + result + "          message:" + message;
	}
	
	

}

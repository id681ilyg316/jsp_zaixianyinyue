/**
 * 
 */
package com.haiyan.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.haiyan.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class UserAction extends ActionSupport implements ServletRequestAware {
	private String page; 
	private String rows;
	private String s_username;	
	private String delIds;
	private String id;
	private String error;
	private String imageCode;
	private String old_password;
	
	UserService userService = new UserService();
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session;

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		session = request.getSession();
	}
	
	
	public String index() {
		String account = request.getParameter("username");
		String pwd = request.getParameter("password");
		int flag = this.userService.login(account, pwd);
		
		/*if("admin".equals(account) && "admin".equals(pwd)){
			return "r1";
		}*/
		if(flag==1){
			if("admin".equals(account)){
				return "r1";
			}else{
				return "Fmusic";
			}
		}
        return ERROR;
	}
	
	public String logout() {
		return "logout";
	}
	
	public String regist(){
		String account = request.getParameter("account");
		String pwd = request.getParameter("password");
		String name = request.getParameter("nicheng");
		String tell = request.getParameter("question");
		String email = request.getParameter("answer");
		userService.regist(account, pwd, name, tell, email);
		return "regist";
	}
	
	
	
	
	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getRows() {
		return rows;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

	public String getS_username() {
		return s_username;
	}

	public void setS_username(String s_username) {
		this.s_username = s_username;
	}

	public String getDelIds() {
		return delIds;
	}

	public void setDelIds(String delIds) {
		this.delIds = delIds;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	public String getImageCode() {
		return imageCode;
	}
	public void setImageCode(String imageCode) {
		this.imageCode = imageCode;
	}
	public String getOld_password() {
		return old_password;
	}
	public void setOld_password(String old_password) {
		this.old_password = old_password;
	}
}


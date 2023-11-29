/**
 * 
 */
package com.haiyan.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.haiyan.model.User;
import com.haiyan.util.DBUtil;

public class UserService {
	
	DBUtil dbUtil = new DBUtil();
	ResultSet rs = null;
	public String logout() {
		return null;
	}
	
	/*public User checkUser (String account,String pwd) {
		User u = new User();
		Connection conn = dbUtil.getConnection();
		String sql = "select * from t_user where account = ? and pwd=?  ";
		PreparedStatement pstm = null;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, account);
			pstm.setString(2, pwd);
			rs = pstm.executeQuery();
			while(rs.next()) {
				u.setId(rs.getInt(1));
				u.setAccount(rs.getString(2));
				u.setPwd(rs.getString(3));
				u.setName(rs.getString(4));
				u.setTell(rs.getString(5));
				u.setEmail(rs.getString(6));
				u.setFlag(rs.getInt(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbUtil.close(conn, pstm, rs);
		}
		return u;
	}*/
	
	
	
	/**
	 * 注册
	 * 
	 * 
	 */
	public void regist(String account,String pwd,String name,String tell,String email){
		Connection conn = dbUtil.getConnection();
		String sql = "insert into t_user(account,pwd,name,sex,email) values(?,?,?,?,?)";
		PreparedStatement pstm = null;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, account);
			pstm.setString(2, pwd);
			pstm.setString(3, name);
			pstm.setString(4, tell);
			pstm.setString(5, email);
		    pstm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbUtil.close(conn, pstm, rs);
		}
		
	}
	
	//登陆
	public int login(String userName,String pwd){
		Connection conn = dbUtil.getConnection();
		String sql = "select * from t_user where account=? and pwd=?";
		PreparedStatement pstm = null;
		int flag=0;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, userName);
			pstm.setString(2, pwd);
			ResultSet rs = pstm.executeQuery();
			if(rs.next()){
				flag=1;
			}
		} catch (Exception e) {
			e.printStackTrace();
			flag=-1;
		} finally {
			dbUtil.close(conn, pstm, rs);
		}
		
		return flag;
		
	}
	
}


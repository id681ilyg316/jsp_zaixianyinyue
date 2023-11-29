package com.haiyan.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.haiyan.model.Music;
import com.haiyan.model.PageBean;
import com.haiyan.model.User;

public class ServiceR1 {

	/** ----------------------------------------------------------------------------------------------------------*/
	public ResultSet selectMusic(Connection conn, PageBean pageBean) throws SQLException {
		StringBuffer sb = new StringBuffer(" select * from t_music where type2 is null ");
		if(pageBean != null) {
			sb.append(" LIMIT "+ pageBean.getStart() +","+ pageBean.getRows());
		}
		PreparedStatement pstm = conn.prepareStatement(sb.toString());
		return pstm.executeQuery();
	} 
	public ResultSet selectMusic2(Connection conn, PageBean pageBean) throws SQLException {
		StringBuffer sb = new StringBuffer(" select * from t_video");
		if(pageBean != null) {
			sb.append(" LIMIT "+ pageBean.getStart() +","+ pageBean.getRows());
		}
		PreparedStatement pstm = conn.prepareStatement(sb.toString());
		return pstm.executeQuery();
	} 

	public int countMusic(Connection conn) throws SQLException{
		StringBuffer sb = new StringBuffer(" select  COUNT(*) AS total from t_video ");
		PreparedStatement pstm = conn.prepareStatement(sb.toString());
		ResultSet rs = pstm.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		} else {
			return 0;
		}
	}

	public void addMusic(Connection conn,String src,String auth,String type,String name) {
		String sql = "insert into t_music(id,src,auth,click,type,name,insert_time) values(null,?,?,?,?,?,now())";
		PreparedStatement pstm = null;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,src);
			pstm.setString(2,auth);
			pstm.setString(3,"0");
			pstm.setString(4,type);
			pstm.setString(5,name);
			pstm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
	}

	public int deleteMusic(Connection conn,String delIds) throws SQLException {
		String sql = "DELETE FROM t_music WHERE id IN ("+ delIds +")";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.executeUpdate();

		sql = "DELETE FROM t_video WHERE id IN ("+ delIds +")";
		pstm = conn.prepareStatement(sql);
		pstm.executeUpdate();
		return 1;
	}

	/** ----------------------------------------------------------------------------------------------------------*/

	public ResultSet selectUser(Connection conn, PageBean pageBean) throws SQLException {
		StringBuffer sb = new StringBuffer(" select * from t_user ");
		if(pageBean != null) {
			sb.append(" LIMIT "+ pageBean.getStart() +","+ pageBean.getRows());
		}
		PreparedStatement pstm = conn.prepareStatement(sb.toString());
		return pstm.executeQuery();
	} 

	public int countUser(Connection conn) throws SQLException{
		StringBuffer sb = new StringBuffer(" select  COUNT(*) AS total from t_user ");
		PreparedStatement pstm = conn.prepareStatement(sb.toString());
		ResultSet rs = pstm.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		} else {
			return 0;
		}
	}

	public int deleteUser(Connection conn,String delIds) throws SQLException {
		String sql = "DELETE FROM t_user WHERE id IN ("+ delIds +")";
		PreparedStatement pstm = conn.prepareStatement(sql);
		return pstm.executeUpdate();
	}


	/** ----------------------------------------------------------------------------------------------------------*/	  
	public void regist(Connection conn,String account,String pwd,String name,String sex,String email){
		String sql = "insert into t_user values(null,?,?,?,?,?)";
		PreparedStatement pstm = null;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, account);
			pstm.setString(2, pwd);
			pstm.setString(3, name);
			pstm.setString(4, sex);
			pstm.setString(5, email);
			pstm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
	}

	public User checkUser (Connection conn,String account,String pwd) {
		User u = null;
		String sql = "select * from t_user where account = ? and pwd=?  ";
		PreparedStatement pstm = null;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, account);
			pstm.setString(2, pwd);
			ResultSet rs = pstm.executeQuery();
			while(rs.next()) {
				u = new User();
				u.setId(rs.getInt(1));
				u.setAccount(rs.getString(2));
				u.setPwd(rs.getString(3));
				u.setName(rs.getString(4));
				u.setSex(rs.getString(5));
				u.setEmail(rs.getString(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return u;
	}

	public List Fmusic(Connection conn,String type,String name){
		List<Music> list = new ArrayList<Music>();
		String sql = "";
		if(name==null){
			if(type != null){
				if(type.equals("1")){
					sql = " select * from t_music where type2 is null order by id desc ";
				}else if(type.equals("2")){
					sql = " select * from t_music where type2 is null order by click desc ";
				}else if(type.equals("3")){
					sql = " select * from t_music where type2 is null and type='纯音乐' order by click desc ";
				}else if(type.equals("4")){
					sql = " select * from t_music where type2 is null and type='DJ' order by click desc ";
				}
			}else{
				sql = " select * from t_music where type2 is null  ";
			}
		}else{
			sql = " select * from t_music where type2 is null  and auth like ? or name like ?";
		}

		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			if(name!=null){
				pstm.setString(1, "%"+name+"%");
				pstm.setString(2, "%"+name+"%");
			}
			ResultSet r = pstm.executeQuery();
			while(r.next()){
				Music m = new Music();
				m.setId(r.getInt(1));
				m.setSrc(r.getString(2));
				m.setAuth(r.getString(3));
				m.setClick(r.getInt(4));
				m.setType(r.getString(5));
				m.setName(r.getString(6));
				m.setInsertTime(new Date(r.getDate(7).getTime()));
				list.add(m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return list;
	}



	public List Fsc(Connection conn){
		List<Music> list = new ArrayList<Music>();
		String sql = " select * from t_music ";
		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			ResultSet r = pstm.executeQuery();
			while(r.next()){
				Music m = new Music();
				m.setId(r.getInt(1));
				m.setSrc(r.getString(2));
				m.setAuth(r.getString(3));
				m.setClick(r.getInt(4));
				m.setType(r.getString(5));
				m.setName(r.getString(6));
				m.setInsertTime(new Date(r.getDate(7).getTime()));
				list.add(m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return list;
	}

	public boolean scMusic(Connection conn,int uid,String mid){
		String sql = "insert into t_um values(null,?,?)";
		PreparedStatement pstm = null;
		boolean falg = true;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, uid);
			pstm.setInt(2, Integer.valueOf(mid));
			falg =  pstm.execute();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
		}
		return falg;
	}

	public ResultSet Fsc(Connection conn,int uid) throws SQLException {
		StringBuffer sb = new StringBuffer(" select t1.* from t_music t1,t_um t2 where t1.id=t2.mid and uid="+uid);
		PreparedStatement pstm = conn.prepareStatement(sb.toString());
		return pstm.executeQuery();
	} 


	public void  updateClick(Connection conn,String id){
		String sql = "update t_music set click=click+1 where id=? ";
		PreparedStatement pstm = null;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, Integer.valueOf(id));
			pstm.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
		}
	}

	public Integer selectNextId(Connection conn){
		String sql = " select max(id) from t_music  ";
		Integer i = 0;
		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			ResultSet r = pstm.executeQuery();
			while(r.next()){
				i = r.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return i;
	} 


	public ResultSet musicDetail(Connection conn,String  id) throws SQLException {
		StringBuffer sb = new StringBuffer("select t2.id,t1.name,t2.pingjia from t_music t1 left JOIN t_pj t2 on t1.id=t2.mid where  t2.mid="+id);
		PreparedStatement pstm = conn.prepareStatement(sb.toString());
		return pstm.executeQuery();
	} 


	public boolean pjMusic(Connection conn,String mid,String pingjia){
		String sql = "insert into t_pj(id,mid,pingjia) values(null,?,?) ";
		PreparedStatement pstm = null;
		boolean falg = true;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, Integer.valueOf(mid));
			pstm.setString(2, pingjia);
			falg =  pstm.execute();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
		}
		return falg;
	}


	public boolean delPj(Connection conn,int id){
		String sql = "delete from t_pj where id=?";
		PreparedStatement pstm = null;
		boolean flag = true;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, id);
			pstm.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
			flag=false;
		} finally {
		}
		return flag;
	}

	public void addMusic(Connection conn, String src, String auth, String type, String name, int type2) {
		String sql = "";

		if(src.contains(".mp4")) {
			sql = "insert into t_video(id,src,auth,click,type,name,insert_time) values(null,?,?,?,?,?,now())";
		}
		else {
			sql = "insert into t_music(id,src,auth,click,type,name,insert_time) values(null,?,?,?,?,?,now())";
		}

		PreparedStatement pstm = null;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,src);
			pstm.setString(2,auth);
			pstm.setString(3,"0");
			pstm.setString(4,type);
			pstm.setString(5,name);
			pstm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
	}
	public List<Music> Fmusic2(Connection conn, String type, String name) {

		List<Music> list = new ArrayList<Music>();
		String sql = "";
		if(name==null){
			if(type != null){
				if(type.equals("1")){
					sql = " select * from t_video order by id desc ";
				}else if(type.equals("2")){
					sql = " select * from t_music where type2=2 order by click desc ";
				}else if(type.equals("3")){
					sql = " select * from t_music where type2=2 and type='纯音乐' order by click desc ";
				}else if(type.equals("4")){
					sql = " select * from t_music where type2=2 and type='DJ' order by click desc ";
				}
			}else{
				sql = " select * from t_music where type2=2 ";
			}
		}else{
			sql = " select * from t_music where type2=2 and auth like ? or name like ?";
		}

		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			if(name!=null){
				pstm.setString(1, "%"+name+"%");
				pstm.setString(2, "%"+name+"%");
			}
			ResultSet r = pstm.executeQuery();
			while(r.next()){
				Music m = new Music();
				m.setId(r.getInt(1));
				m.setSrc(r.getString(2));
				m.setAuth(r.getString(3));
				m.setClick(r.getInt(4));
				m.setType(r.getString(5));
				m.setName(r.getString(6));
				m.setInsertTime(new Date(r.getDate(7).getTime()));
				list.add(m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return list;
	}

}

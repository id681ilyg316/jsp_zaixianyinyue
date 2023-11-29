/**
 * 
 */
package com.haiyan.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.haiyan.model.Music;
import com.haiyan.model.PageBean;
import com.haiyan.model.User;
import com.haiyan.service.ServiceR1;
import com.haiyan.util.DBUtil;
import com.haiyan.util.JsonUtil;
import com.haiyan.util.ResponseUtil;

public class ActionR1 {

	private String page; 
	private String rows; 
	private String id; 
    private String delIds;
	private String s_outtime;
	private User user;
	private File file;
	private String fileFileName;
	
	private String auth;
	private String type;
	private String name;
	private int type2;
	

	public int getType2() {
		return type2;
	}

	public void setType2(int type2) {
		this.type2 = type2;
	}

	DBUtil dbUtil = new DBUtil();
	ResultSet rs = null;
	ServiceR1 service =  new ServiceR1();
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response=ServletActionContext.getResponse();
	
/** ----------------------------------------------------------------------------------------------------------*/
	public String addMusic() throws Exception {
	
		Connection conn = dbUtil.getConnection();
		JSONObject result = new JSONObject();
		try {
			
			service.addMusic(conn, fileFileName, auth, type, name,type2);
			result.put("success", "true");
			result.put("errorMsg", "添加成功");
			ResponseUtil.write(ServletActionContext.getResponse(), result);
			
			//String root = ServletActionContext.getServletContext().getRealPath("/server/music");
			String root = Thread.currentThread().getContextClassLoader().getResource("").getPath().substring(0,Thread.currentThread().getContextClassLoader().getResource("").getPath().length()-16)
+"/server/music";
			InputStream is = new FileInputStream(file);
			OutputStream os = new FileOutputStream(new File(root, fileFileName));
			System.out.println("fileFileName: " + fileFileName);
		    System.out.println("file: " + file.getName());
		    System.out.println("file: " + file.getPath());
		    byte[] buffer = new byte[500];
	        int length = 0;
	        while(-1 != (length = is.read(buffer, 0, buffer.length)))
	        {
	            os.write(buffer);
	        }
	        os.close();
	        is.close();
	        
		} catch (Exception e) {
			System.out.println(e.toString());
			throw (e);
		} finally {
			dbUtil.close(conn, null, rs);
		}
		return null;
	}
	
	public String selectMusic() throws SQLException {
	    Connection conn = dbUtil.getConnection();
		PageBean pageBean = new PageBean (Integer.parseInt(page), Integer.parseInt(rows));
		JSONObject result = new JSONObject();
		JSONArray jsonArray;
		try {
			jsonArray = JsonUtil.formatRsToJsonArray(service.selectMusic(conn, pageBean));
			int total = service.countMusic(conn);
			result.put("rows", jsonArray);
			result.put("total", total);
			ResponseUtil.write(ServletActionContext.getResponse(), result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbUtil.close(conn, null, rs);
		}
		return null;
	}

	
	public String selectMusic2() throws SQLException {
	    Connection conn = dbUtil.getConnection();
		PageBean pageBean = new PageBean (Integer.parseInt(page), Integer.parseInt(rows));
		JSONObject result = new JSONObject();
		JSONArray jsonArray;
		try {
			jsonArray = JsonUtil.formatRsToJsonArray(service.selectMusic2(conn, pageBean));
			int total = service.countMusic(conn);
			result.put("rows", jsonArray);
			result.put("total", total);
			ResponseUtil.write(ServletActionContext.getResponse(), result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbUtil.close(conn, null, rs);
		}
		return null;
	}
	
	public String deleteMusic () throws SQLException {
        Connection conn = dbUtil.getConnection();
        try {
            JSONObject result = new JSONObject();
            int delNums = service.deleteMusic(conn, delIds);
            if(delNums > 0 ) {
                result.put("success", "true");
                result.put("delNums", delNums);
            } else {
                result.put("errorMsg", "删除失败");
            }
            ResponseUtil.write(ServletActionContext.getResponse(), result);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbUtil.close(conn, null, rs);
        }
        return null;
    }
	
	
	public String delPj() throws SQLException {
		Connection conn = dbUtil.getConnection();
		String id = request.getParameter("id");
        try {
            JSONObject result = new JSONObject();
            boolean delPj = service.delPj(conn, Integer.parseInt(id));
            if(delPj){
            	result.put("flag", "1");
            }else{
            	result.put("flag", "-1");
            }
            ResponseUtil.write(ServletActionContext.getResponse(), result);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbUtil.close(conn, null, rs);
        }
        return null;
    }
	
	public void downMusic() throws  Exception {
		Connection conn = dbUtil.getConnection();
		String path = request.getParameter("path");
		try {
			String realPath = request.getRealPath("/");
			System.out.println(realPath);
			path=realPath+path;
			File file = new File(path);// path是根据日志路径和文件名拼接出来的
		    String filename = file.getName();// 获取日志文件名称
		    InputStream fis = new BufferedInputStream(new FileInputStream(path));
		    byte[] buffer = new byte[fis.available()];
		    fis.read(buffer);
		    fis.close();
		    response.reset();
		    // 先去掉文件名称中的空格,然后转换编码格式为utf-8,保证不出现乱码,这个文件名称用于浏览器的下载框中自动显示的文件名
		    response.addHeader("Content-Disposition", "attachment;filename=" + new String(filename.replaceAll(" ", "").getBytes("utf-8"),"iso8859-1"));
		    response.addHeader("Content-Length", "" + file.length());
		    OutputStream os = new BufferedOutputStream(response.getOutputStream());
		    response.setContentType("application/octet-stream");
		    os.write(buffer);// 输出文件
		    os.flush();
		    os.close();
           /* JSONObject result = new JSONObject();
            ResponseUtil.write(ServletActionContext.getResponse(), result);*/
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbUtil.close(conn, null, rs);
        }
    }
	
	
/** ----------------------------------------------------------------------------------------------------------*/
	
	public String selectUser() throws SQLException {
	    Connection conn = dbUtil.getConnection();
		PageBean pageBean = new PageBean (Integer.parseInt(page), Integer.parseInt(rows));
		JSONObject result = new JSONObject();
		JSONArray jsonArray;
		try {
			jsonArray = JsonUtil.formatRsToJsonArray(service.selectUser(conn, pageBean));
			int total = service.countUser(conn);
			result.put("rows", jsonArray);
			result.put("total", total);
			ResponseUtil.write(ServletActionContext.getResponse(), result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbUtil.close(conn, null, rs);
		}
		return null;
	}
	
	public String deleteUser () throws SQLException {
        Connection conn = dbUtil.getConnection();
        try {
            JSONObject result = new JSONObject();
            int delNums = service.deleteUser(conn, delIds);
            if(delNums > 0 ) {
                result.put("success", "true");
                result.put("delNums", delNums);
            } else {
                result.put("errorMsg", "删除失败");
            }
            ResponseUtil.write(ServletActionContext.getResponse(), result);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbUtil.close(conn, null, rs);
        }
        return null;
    }
/** ----------------------------------------------------------------------------------------------------------*/
	
	public String frontIndex(){
		return "frontIndex";
	}
	
	public String Aregist(){
		return "Aregist";
	}
	
	public String Alogin(){
		return "Alogin";
	}
	
	public String UserUpload(){
		return "UserUpload";
	}
	
	public String loginOut(){
		request.getSession().invalidate();
		return "frontIndex";
	}
	
	public String login(){
		String retstr = "";
		Connection conn = dbUtil.getConnection();
		String account = request.getParameter("account");
		String pwd = request.getParameter("pwd");
		User u = service.checkUser(conn, account, pwd);
		if(u == null){
			retstr = "Alogin";
		}else{
			retstr = "frontIndex";
			request.getSession().setAttribute("user", u);
		}
		return retstr;
	}
	
	public String regist() throws Exception{
		Connection conn = dbUtil.getConnection();
		String account = request.getParameter("account");
		String pwd = request.getParameter("pwd");
		String names = request.getParameter("name");
		String name = new String(names.getBytes("iso-8859-1"),"UTF-8");
		String sexs = request.getParameter("sex");
		String sex = new String(sexs.getBytes("iso-8859-1"),"UTF-8");
		String email = request.getParameter("email");
		service.regist(conn, account, pwd, name, sex, email);
		dbUtil.close(conn, null, rs);
		User u = new User();
		u.setAccount(account);
		u.setPwd(pwd);
		u.setName(name);
		u.setSex(sex);
		u.setEmail(email);
		request.getSession().setAttribute("user", u);
		return "frontIndex";
	}

	public String Fmusic(){
		Connection conn = dbUtil.getConnection();
		String type = request.getParameter("type");
		String name=request.getParameter("name");
		List<Music> list = service.Fmusic(conn,type,name);
		dbUtil.close(conn, null, rs);
		request.setAttribute("music", list);
		return "Fmusic";
	}
	public String Fmusic2(){
		Connection conn = dbUtil.getConnection();
		String type = request.getParameter("type");
		String name=request.getParameter("name");
		List<Music> list = service.Fmusic2(conn,type,name);
		dbUtil.close(conn, null, rs);
		request.setAttribute("music", list);
		return "Fmusic";
	}
	
	public String scMusic() throws Exception{
		String id = request.getParameter("id");
		User u = (User)request.getSession().getAttribute("user");
		Connection conn = dbUtil.getConnection();
		boolean flag = service.scMusic(conn, u.getId(), id);
		service.updateClick(conn, id);
		dbUtil.close(conn, null, rs);
		JSONObject result = new JSONObject();
		result.put("flag", flag);
        ResponseUtil.write(ServletActionContext.getResponse(), result);
        return null;
	}
	
	public String Fsc(){
		Connection conn = dbUtil.getConnection();
		User u = (User)request.getSession().getAttribute("user");
		JSONObject result = new JSONObject();
		JSONArray jsonArray;
		try {
			jsonArray = JsonUtil.formatRsToJsonArray(service.Fsc(conn,u.getId()));
			//result.put("rows", jsonArray);
			//ResponseUtil.write(ServletActionContext.getResponse(), result);
			request.setAttribute("o",jsonArray);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbUtil.close(conn, null, rs);
		}
		return "Fsc";
	}
	
	public String addmymusic(){
		Connection conn = dbUtil.getConnection();
		service.addMusic(conn, fileFileName, auth, type, fileFileName);
		
		User u = (User)request.getSession().getAttribute("user");
		
		Integer i = service.selectNextId(conn);
		
		service.scMusic(conn, u.getId(), String.valueOf(i));
		
		dbUtil.close(conn, null, rs);
		return "UserUpload";
	}
	
	public String musicDetail() throws Exception{
		Connection conn = dbUtil.getConnection();
		String id = request.getParameter("id");
		JSONArray jsonArray = JsonUtil.formatRsToJsonArray(service.musicDetail(conn, id));
		dbUtil.close(conn, null, rs);
		request.setAttribute("o", jsonArray);
		request.setAttribute("oid", id);
		return "musicDetail";
	}
	
	public String pjMusic() throws SQLException, Exception{
		Connection conn = dbUtil.getConnection();
		String mid = request.getParameter("mid");
		String pingjias = request.getParameter("pingjia");
		request.setCharacterEncoding("UTF-8");
		String pingjia = new String(pingjias.getBytes("iso-8859-1"),"UTF-8");
		boolean flag = service.pjMusic(conn, mid, pingjia);
		JSONArray jsonArray = JsonUtil.formatRsToJsonArray(service.musicDetail(conn, mid));
		request.setAttribute("o", jsonArray);
		request.setAttribute("oid", mid);
		dbUtil.close(conn, null, rs);
		return "musicDetail";
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}


	public String getS_outtime() {
		return s_outtime;
	}

	public void setS_outtime(String s_outtime) {
		this.s_outtime = s_outtime;
	}
	
	  public String getDelIds() {
	        return delIds;
	    }

    public void setDelIds(String delIds) {
        this.delIds = delIds;
    }
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}
	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	
	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public void scpj(){
		String sql="delete a.t_pj,b.t_music from  where a.id=b.id";
	}
	
}

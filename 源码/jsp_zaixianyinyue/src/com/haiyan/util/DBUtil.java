/**
 * 
 */
package com.haiyan.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.apache.log4j.Logger;
public class DBUtil {

	protected final Logger logger = Logger.getLogger(getClass());
	
	ConnectionPool pool = ConnectionPool.getInstance(); 
	Connection conn = null;
	PreparedStatement pstmt = null;
	public Connection getConnection() {
		conn = pool.getConnection();
		return conn;
	}
	public void close(Connection connection, PreparedStatement statement, ResultSet result) {
		try {
			if (result != null)
				result.close();
			if (statement != null)
				statement.close();
			if (conn != null) 
				this.pool.release(conn);
		} catch (SQLException e) {
			e.printStackTrace();
			logger.error("关闭数据库连接时出现异常！");
		}
	}
	
}


package util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 * DB연동을 위한 로드 연결 닫기
 *  : DBCP기술 적용 (context.xml 참조)
 *  */
public class DbUtil {
	private static DataSource ds;
	/**
	 * 로드
	 * */
	static {
		try {
			/*
			 * initContext = new InitialContext(); 
			 * Context envContext = (Context)initContext.lookup("java:/comp/env"); 
			 * DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
			 */
			Context initContext = new InitialContext();
			ds = (DataSource)initContext.lookup("java:/comp/env/jdbc/myoracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}//static끝
	
	/**
	 * 연결
	 * */
	public static Connection getConnection() throws SQLException{
		Connection conn = ds.getConnection();
		return conn;
	}
	
		/**
	    *  닫기 - 사용된 객체 닫기 - select인 경우
	    * */
	   public static void dbClose(Connection con, Statement st, ResultSet rs) {
	      try{
	         if(rs != null) rs.close();
	         dbClose(con, st);
	      }catch(SQLException e) {
	         e.printStackTrace();
	      }
	   }
	   /**
	    *  닫기 - 사용된 객체 닫기 - DML or DDL 인 경우
	    * */
	   public static void dbClose(Connection con, Statement st) {
	      try {
	         if(st != null) st.close();
	         if(con != null) con.close();
	      }catch(SQLException e) {
	         e.printStackTrace();
	      }
	   }
	   public static void main(String[] args) {
			try {
				System.out.println("***** 메인 시작 *****");
				Connection con = DbUtil.getConnection();
				System.out.println("con = " + con);
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
	   

}//classEnd

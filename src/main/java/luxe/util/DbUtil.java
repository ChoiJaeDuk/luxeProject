package luxe.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 * DB������ ���� �ε� ���� �ݱ�
 *  : DBCP��� ���� (context.xml ����)
 *  */
public class DbUtil {
	private static DataSource ds;
	/**
	 * �ε�
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
	}//static��
	
	/**
	 * ����
	 * */
	public static Connection getConnection() throws SQLException{
		Connection conn = ds.getConnection();
		return conn;
	}
	
		/**
	    *  �ݱ� - ���� ��ü �ݱ� - select�� ���
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
	    *  �ݱ� - ���� ��ü �ݱ� - DML or DDL �� ���
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
				System.out.println("***** ���� ���� *****");
				Connection con = DbUtil.getConnection();
				System.out.println("con = " + con);
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
	   

}//classEnd

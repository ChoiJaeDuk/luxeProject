package luxeProject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import util.DbUtil;

public class Start {
	 public String test() throws SQLException {
	  Connection con = null;
	  PreparedStatement ps = null;
	  ResultSet rs = null;
	  String id ="";
	  try {
	   con = DbUtil.getConnection();
	   ps = con.prepareStatement("select * from users");
	   rs  = ps.executeQuery();
	   
	   while(rs.next()){
		   id = rs.getString(1);
	   }
	  } finally {
	   DbUtil.dbClose(con, ps, rs);
	  }
	  return id;
	 }

	

}

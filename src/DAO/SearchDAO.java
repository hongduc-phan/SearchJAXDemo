package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import BEAN.Employee;

public class SearchDAO {

	
	public static List<Employee> DisplayComment(Connection conn,HttpServletRequest request,String nameSearch) throws SQLException
	{
		List<Employee> list = new ArrayList<Employee>();
		
		String sql = "select * from employeetable where name like '%"+nameSearch+"%'";
		
		PreparedStatement ptmt;
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			
			if (!rs.isBeforeFirst())
			{
				request.setAttribute("result", "No result for searching");
			}
			
			while ( rs.next())
			{
				Employee cmt = new Employee();
				
				String name = rs.getString("name");
				
				cmt.setName(name);
				
				list.add(cmt);
							
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		return list;
	
	}
}

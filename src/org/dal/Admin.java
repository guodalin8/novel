package org.dal;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.common.Conn;
import org.model.AdminInfo;

public class Admin {
	Conn conn=new Conn();
	/**
	 * 判断登陆用户是否合法
	 * @param adminName
	 * @param adminPassword
	 * @return
	 * @throws SQLException
	 */
	public boolean isExist(String adminName,String adminPassword)throws SQLException{
		boolean result=false;
		AdminInfo ainfo=new AdminInfo();
		String sql="select * from admin a where adminName='"+adminName+"'and adminPassword='"+adminPassword+"'";
		System.out.println(sql);
		ResultSet rs=conn.executeQuery(sql);
		if(rs.next()){
			ainfo.setAdminName(rs.getString("adminName"));
			ainfo.setAdminPassword(rs.getString("adminPassword"));
			result=true;
		}
		conn.close();
		return result;
	}
}

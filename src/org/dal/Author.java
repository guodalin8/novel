package org.dal;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.common.Conn;
import org.common.DataValidator;
import org.model.AuthorInfo;

public class Author {
	Conn conn=new Conn();
	/**
	 *  判断登陆用户是否合法
	 * @param authorName
	 * @param authorPassword
	 * @return
	 * @throws SQLException
	 */
	public boolean isExist(String authorName,String authorPassword)throws SQLException{
		boolean result=false;
		AuthorInfo auinfo =new AuthorInfo();
		String sql="select * from author a where authorName='"+authorName+"'and authorPassword='"+authorPassword+"'";
		System.out.println(sql);
		ResultSet rs=conn.executeQuery(sql);
		if(rs.next()){
			auinfo.setAuthorName(rs.getString("authorName"));
			auinfo.setAuthorPassword(rs.getString("authorPassword"));
			result=true;
		}
		conn.close();
		return result;
	}
	/**
	 * 判断注册用户是否已经存在
	 * @param username
	 * @return
	 * @throws SQLException
	 */
	public boolean isExistAuthorInfo(String authorName)throws SQLException{
		boolean result=false;
		AuthorInfo auInfo=new AuthorInfo();
		String sql="select * from author au where authorName='"+authorName+"'";
		ResultSet rs=conn.executeQuery(sql);
		if(rs.next()){
			auInfo.setAuthorName(rs.getString("authorName"));
			result=true;
		}
		conn.close();
		return result;
	}
	/**
	 *用户注册
	 * @param info
	 * @return
	 */
	public int insert(AuthorInfo info)throws SQLException{
		String sql="insert into author(authorName,authorPassword,authorEmail) values";
		sql=sql+"('"+info.getAuthorName()+"','"+info.getAuthorPassword()+"','"+info.getAuthorEmail()+"')";
		int result=0;
		result=conn.executeUpdate(sql);
		conn.close();
		return result;
	}
	/**
	 * 修改用户信息
	 * @param info
	 * @return
	 */
	public int update(AuthorInfo info){
		String sql="update author set authorPassword='"+info.getAuthorPassword()+"',authorEmail='"+info.getAuthorEmail()+"'"
				+ "where authorName='"+info.getAuthorName()+"'";
		int result=0;
		result=conn.executeUpdate(sql);
		conn.close();
		return result;
	}
	/**
	 * 删除已注册的用户
	 * @param info
	 * @return
	 */
	public int delete(String authorName){
		String sql="delete from author where authorName='"+authorName+"'";
		int result=0;
		result=conn.executeUpdate(sql);
		conn.close();
		return result;
	}
	/**
	 *获取用户列表
	 * @param keyword
	 * @return
	 * @throws SQLException
	 */
	public List<AuthorInfo>getList(String keyword)throws SQLException{
		List<AuthorInfo> list=new ArrayList<AuthorInfo>();
		String sql="select * from author";
		if(DataValidator.isNullOrEmpty(keyword)){
			sql=sql+ " order by id desc";
		}else{
			sql=sql+" where authorName like '%"+keyword+"%' order by id desc";
		}
		ResultSet rs=conn.executeQuery(sql);
		while(rs.next()){
			AuthorInfo ainfo=new AuthorInfo();
			ainfo.setId(rs.getInt("id"));
			ainfo.setAuthorName(rs.getString("authorName"));
			ainfo.setAuthorPassword(rs.getString("authorPassword"));
			ainfo.setAuthorEmail(rs.getString("authorEmail"));
			list.add(ainfo);
		}
		conn.close();
		return list;
		
	}
}

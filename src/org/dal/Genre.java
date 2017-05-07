package org.dal;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.common.Conn;
import org.model.GenreInfo;

public class Genre {
	Conn conn=new Conn();
	/**
	 * 获取分类列表
	 * @return
	 * @throws SQLException
	 */
	public List<GenreInfo> getList()throws SQLException{
		List<GenreInfo> list=new ArrayList<GenreInfo>();
		String sql="select * from genre order by Sort asc";
		ResultSet rs=conn.executeQuery(sql);
		while(rs.next()){
			GenreInfo info=new GenreInfo();
			info.setId(rs.getInt("Id"));
			info.setName(rs.getString("Name"));
			info.setSort(rs.getInt("Sort"));
			list.add(info);
	}
		conn.close();
		return list;
	}
	/**
	 * 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public GenreInfo getGenreInfo(int id)throws SQLException{
		GenreInfo info=new GenreInfo();
		String sql="select * from genre g where id="+id+"";
		ResultSet rs=conn.executeQuery(sql);
		while(rs.next()){
			info.setId(rs.getInt("Id"));
			info.setName(rs.getString("Name"));
			info.setSort(rs.getInt("Sort"));
	}
		conn.close();
		return info;
	}
	/**
	 * 增加分类
	 * @param info
	 * @return
	 */
	public int insert(GenreInfo info){
		String sql="insert into genre(Name,Sort) values";
		sql=sql+"('"+info.getName()+"','"+info.getSort()+"')";
		int result=0;
		result=conn.executeUpdate(sql);
		conn.close();
		return result;
	}
	/**
	 * 更新分类
	 * 
	 * @param info
	 * @return
	 */
	public int update(GenreInfo info){
		String sql="update genre set "+" Name='"+info.getName()+"',Sort= '"+info.getSort()+"' where id="+info.getId()+"";
		int result=0;
		result=conn.executeUpdate(sql);
		return result;
		
	}
	public int delete(int id){
		String sql="delete from genre where id="+id+"";
		int result=0;
		result=conn.executeUpdate(sql);
		conn.close();
		return result;
	}
	
}

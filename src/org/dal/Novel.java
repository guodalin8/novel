package org.dal;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.common.Conn;
import org.common.DataValidator;
import org.model.NovelInfo;


public class Novel {
	Conn conn=new Conn();
	/**
	 * 获取小说列表
	 * @param keyword
	 * @return
	 * @throws SQLException
	 */
	
	public List<NovelInfo>getList(String keyword)throws SQLException{
		List<NovelInfo> list=new ArrayList<NovelInfo>();

		String sql="select n.*,g.name as genreName from novel n left join genre g on n.genreId=g.id";
		if(DataValidator.isNullOrEmpty(keyword)){
			sql=sql+ " order by id desc";
		}else{
			sql=sql+" where n.title like '%"+keyword+"%' order by id desc";
		}
		ResultSet rs=conn.executeQuery(sql);
		while(rs.next()){
			NovelInfo ninfo=new NovelInfo();
			ninfo.setId(rs.getInt("Id"));
			ninfo.setTitle(rs.getString("Title"));
			ninfo.setContext(rs.getString("Context"));
			ninfo.setCreatedTime(rs.getDate("CreatedTime"));
			ninfo.setGenreId(rs.getInt("GenreId"));
			ninfo.setGenreName(rs.getString("genreName"));
			ninfo.setVoteNumber(rs.getInt("voteNumber"));
			list.add(ninfo);
		}
		conn.close();
		return list;
	}
	/**
	 * 获取某分类下的小说列表
	 * @param classId
	 * @return
	 * @throws SQLException
	 */
	public List<NovelInfo> getListBygenreId(int genreId) throws SQLException{
		List<NovelInfo> list=new ArrayList<NovelInfo>();
		String sql="select n.*,g.name as genreName from novel n left join genre g on n.genreId=g.id"
				+ " where n.genreId="+genreId+" order by id desc";
		ResultSet rs=conn.executeQuery(sql);
		while(rs.next()){
			NovelInfo info=new NovelInfo();
			info.setId(rs.getInt("Id"));
			info.setTitle(rs.getString("Title"));
			info.setContext(rs.getString("Context"));
			info.setCreatedTime(rs.getDate("CreatedTime"));
			info.setGenreId(rs.getInt("GenreId"));
			info.setGenreName(rs.getString("genreName"));
			info.setVoteNumber(rs.getInt("voteNumber"));
			list.add(info);
		}
		conn.close();
		return list;
	}
	/**
	 * 根据ID获取小说
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public NovelInfo getNovelInfo(int id) throws SQLException{
		NovelInfo info=new NovelInfo();
		String sql="select n.*,g.name as genreName from novel n left join genre g on n.genreId=g.id where n.id="+id+"";
		ResultSet rs=conn.executeQuery(sql);
		while(rs.next()){
			info.setId(rs.getInt("Id"));
			info.setTitle(rs.getString("Title"));
			info.setContext(rs.getString("Context"));
			info.setCreatedTime(rs.getDate("CreatedTime"));
			info.setGenreId(rs.getInt("GenreId"));
			info.setGenreName(rs.getString("genreName"));
			info.setVoteNumber(rs.getInt("voteNumber"));
		}
		conn.close();
		return info;
	}
	/**
	 * 写入新小说
	 * 
	 * @param info
	 * @return
	 */
	public int insert(NovelInfo info){
		String sql="insert into novel(title,conText,createdTime,genreId,voteNumber)values";
		sql=sql+"('"+info.getTitle()+"','"+info.getContext()+"',now(),'"+info.getGenreId()+"',"+info.getVoteNumber()+")";
		int result=0;
		System.out.println(sql);
		result=conn.executeUpdate(sql);
		conn.close();
		return result;
	}

	/**
	 *更新小说
	 * @param info
	 * @return
	 */
	public int update(NovelInfo info){
		String sql="update novel set "+" Title='"+info.getTitle()+"',Context='"+info.getContext()+"',"
				+ "genreId='"+info.getGenreId()+"'where id="+info.getId()+"";
		int result=0;
		System.out.println(sql);
		result=conn.executeUpdate(sql);
		conn.close();
		return result;
	}
	/**
	 * 删除小说
	 * @param id
	 * @return
	 */
	
	public int delete(int id){
		String sql="delete from novel where id="+id+"";
		int result=0;
		result=conn.executeUpdate(sql);
		conn.close();
		return result;
	}
	/**
	 * 增加票数
	 * @return
	 */
	public int addVote(int num){
		
		return 0;
		
	}
}

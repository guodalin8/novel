package org.dal;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.common.Conn;
import org.model.CommentInfo;


public class Comment {
	Conn conn=new Conn();
	/**
	 * 获取评论列表
	 * @return
	 * @throws SQLException
	 */
	public List<CommentInfo> getList() throws SQLException{
		List<CommentInfo> list=new ArrayList<CommentInfo>();
		String sql="select * from comment order by id desc";
		ResultSet rs=conn.executeQuery(sql);
		while(rs.next()){
			CommentInfo info=new CommentInfo();
			info.setId(rs.getInt("Id"));
			info.setContext(rs.getString("Context"));
			info.setNovelId(rs.getInt("NovelId"));
			info.setCreatedTime(rs.getDate("CreatedTime"));
			info.setReaderName(rs.getString("ReaderName"));
			list.add(info);
			System.out.print(list);
		}
		conn.close();
		return list;
	}
	/**
	 * 
	 * @param classId
	 * @return
	 * @throws SQLException
	 */
	public CommentInfo getCommentInfo(int id)throws SQLException{
		CommentInfo info=new CommentInfo();
		String sql="select * from Comment c where id="+id+"";
		ResultSet rs=conn.executeQuery(sql);
		while(rs.next()){
			info.setId(rs.getInt("Id"));
			info.setContext(rs.getString("Context"));
			info.setNovelId(rs.getInt("NovelId"));
			info.setCreatedTime(rs.getDate("CreatedTime"));
			info.setReaderName(rs.getString("ReaderName"));
		}
		conn.close();
		return info;
		
	}
	/**
	 *  获取某小说下的评论
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public List<CommentInfo> getListByNovelId(int novelid) throws SQLException{
		List<CommentInfo> list=new ArrayList<CommentInfo>();
		String sql="select * from comment  where novelId="+novelid+" order by id desc";
		ResultSet rs=conn.executeQuery(sql);
		while(rs.next()){
			CommentInfo info=new CommentInfo();
			info.setId(rs.getInt("Id"));
			info.setContext(rs.getString("Context"));
			info.setNovelId(rs.getInt("NovelId"));
			info.setCreatedTime(rs.getDate("CreatedTime"));
			info.setReaderName(rs.getString("ReaderName"));
			list.add(info);
		}
		conn.close();
		return list;
	}
	/**
	 * 插入评论
	 * @param info
	 * @return
	 */
	public int insert(CommentInfo info){
		String sql="insert into Comment(Context,CreatedTime,readerName,novelId)values";
		sql=sql+"('"+info.getContext()+"',now(),'"+info.getReaderName()+"',"+info.getNovelId()+")";
		int result=0;
		System.out.println(sql);
		result=conn.executeUpdate(sql);
		conn.close();
		return result;
	}
	/**
	 * 更新评论
	 * @param info
	 * @return
	 */
	public int update(CommentInfo info){
		String sql="update Comment set "+" Context='"+info.getContext()+"',novelId='"+info.getNovelId()+"',"
				+ "CreatedTime='"+info.getCreatedTime()+"',readerName='"+info.getReaderName()+"' where id="+info.getId()+"";
		int result=0;
		System.out.println(sql);
		result=conn.executeUpdate(sql);
		conn.close();
		return result;
	}
	/**
	 * 删除评论
	 * @param id
	 * @return
	 */
	public int delete(int id){
		String sql="delete from Comment where id="+id+"";
		int result=0;
		result=conn.executeUpdate(sql);
		conn.close();
		return result;
	}
}

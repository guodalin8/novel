package org.dal;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.registry.infomodel.User;

import org.common.Conn;
import org.common.DataValidator;
import org.model.PageModel;
import org.model.ReaderInfo;

public class Reader {
	Conn conn=new Conn();
	/**
	 *判断登陆用户是否合法
	 * @param readerName
	 * @param readerPassword
	 * @return
	 * @throws SQLException
	 */
	public boolean isExist(String readerName,String readerPassword)throws SQLException{
		boolean result=false;
		ReaderInfo rinfo=new ReaderInfo();
		String sql="select * from reader a where readerName='"+readerName+"'and readerPassword='"+readerPassword+"'";
		System.out.println(sql);
		ResultSet rs=conn.executeQuery(sql);
		if(rs.next()){
			rinfo.setReaderName(rs.getString("readerName"));
			rinfo.setReaderPassword(rs.getString("readerPassword"));
			result=true;
		}
		conn.close();
		return result;
	}
	/**
	 * 当前注册用户是否存在
	 * @param username
	 * @return
	 * @throws SQLException
	 */
	public boolean isExistReaderInfo(String readerName)throws SQLException{
		boolean result=false;
		ReaderInfo rinfo=new ReaderInfo();
		String sql="select * from reader au where readerName='"+readerName+"'";
		ResultSet rs=conn.executeQuery(sql);
		if(rs.next()){
			rinfo.setReaderName(rs.getString("readerName"));
			result=true;
		}
		conn.close();
		return result;
	}
	/**
	 * ߲用户注册
	 * @param info
	 * @return
	 */
	public int insert(ReaderInfo info)throws SQLException{
		String sql="insert into reader(readerName,readerPassword,readerEmail) values";
		sql=sql+"('"+info.getReaderName()+"','"+info.getReaderPassword()+"','"+info.getReaderEmail()+"')";
		int result=0;
		result=conn.executeUpdate(sql);
		conn.close();
		return result;
	}
	/**
	 * 用户信息更新
	 * @param info
	 * @return
	 */
	public int update(ReaderInfo info){
		String sql="update reader set readerPassword='"+info.getReaderPassword()+"',readerEmail='"+info.getReaderEmail()+"'"
				+ "where areaderName='"+info.getReaderName()+"'";
		int result=0;
		result=conn.executeUpdate(sql);
		conn.close();
		return result;
	}
	/**
	 * 注册用户的删除
	 * @param info
	 * @return
	 */
	public int delete(String readerName){
		String sql="delete from reader where readerName='"+readerName+"'";
		int result=0;
		result=conn.executeUpdate(sql);
		conn.close();
		return result;
	}
	/**
	 * 获取注册用户的列表
	 * @param keyword
	 * @return
	 * @throws SQLException
	 */
	public List<ReaderInfo>getList(String keyword)throws SQLException{
		List<ReaderInfo> list=new ArrayList<ReaderInfo>();
		String sql="select * from reader";
		if(DataValidator.isNullOrEmpty(keyword)){
			sql=sql+ " order by id desc";
		}else{
			sql=sql+" where readerName like '%"+keyword+"%' order by id desc";
		}
		ResultSet rs=conn.executeQuery(sql);
		while(rs.next()){
			ReaderInfo ainfo=new ReaderInfo();
			ainfo.setId(rs.getInt("id"));
			ainfo.setReaderName(rs.getString("readerName"));
			ainfo.setReaderPassword(rs.getString("readerPassword"));
			ainfo.setReaderEmail(rs.getString("readerEmail"));
			list.add(ainfo);
		}
		conn.close();
		return list;
		
	}
	//根据页码和每页的容量来得到数据
    public PageModel getPage(int pageNo, int pageSize) {
        ResultSet rs = null;
        List<ReaderInfo> list = new ArrayList<ReaderInfo>();
        PageModel page = null;
        try {
            //获取总数据条数
            int totalCount = 0; 
            String sql="select * from reader";
            rs = conn.executeQuery(sql);
            while(rs.next()){
                totalCount = rs.getInt(1);
            }
            while(rs.next()){
                ReaderInfo rin=new ReaderInfo();
                rin.setId(rs.getInt("id"));
    			rin.setReaderName(rs.getString("readerName"));
    			rin.setReaderPassword(rs.getString("readerPassword"));
    			rin.setReaderEmail(rs.getString("readerEmail"));
    			list.add(rin);
            }
            page = new PageModel(pageSize, totalCount);
            page.setData(list);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
        	conn.close();
        }

        return page;
    }
}

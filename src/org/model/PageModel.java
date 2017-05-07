package org.model;

import java.util.List;

/**
 * @author dalin
 *	小说分页查询类
 * @param <T>
 */
public class PageModel {
	// 当前页页码(1,2,3....)
    private int pageNo;

    // 每页显示条数
    private int pageSize;

    // 总记录(条数)
    private int totalCount;

    // 当前页数据集合
    private List data;

    // 总页数
    private int totalPage;

    /**
     * 构造方法，传递每页条数和总记录数
     * 
     * @param 每页显示条数
     * @param 总记录数
     */
    public PageModel(int pageSize, int totalCount) {
        this.pageSize = pageSize;
        this.totalCount = totalCount;
        if (this.totalCount % this.pageSize == 0) {
            // 计算总页数
            this.totalPage = this.totalCount / this.pageSize;
        } else {
            this.totalPage = this.totalCount / this.pageSize + 1;
        }
    }

    public List getData() {
        return data;
    }

    public void setData(List data) {
        this.data = data;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

}

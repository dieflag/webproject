package com.cqkj.bean;

import java.util.List;

public class PageList<T>
{
    // 查询结果集合
    private List<T> data;

    // 查询页数
    private int pageIndex = 1;

    // 每页的在结果数
    private int pageSize = 5;

    // 总查询结果数
    private int count = 0;

    public int getPageIndex()
    {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex)
    {
        this.pageIndex = pageIndex;
    }

    public int getPageSize()
    {
        return pageSize;
    }

    public void setPageSize(int pageSize)
    {
        this.pageSize = pageSize;
    }

    public List<T> getData()
    {
        return data;
    }

    public void setData(List<T> data)
    {
        this.data = data;
    }

    public int getCount()
    {
        return count;
    }

    public void setCount(int count)
    {
        this.count = count;
    }

    /**
     * 计算首行序号
     * 
     * @return
     */
    public int getFirstSeq()
    {
        return (this.pageIndex - 1) * this.pageSize + 1;
    }

    /**
     * 计算总页数
     * 
     * @return 总页数
     */
    public int getPageCount()
    {
        return this.count % this.pageSize == 0 ? this.count / this.pageSize : (this.count / this.pageSize) + 1;
    }

}

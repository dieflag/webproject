package com.cqkj.bean;

public class PageListIndex<T>
{
    // 分页查询结果
    private PageList<T> pl;

    // 分页查询总页数
    private int pageCount;

    public PageList<T> getPl()
    {
        return pl;
    }

    public void setPl(PageList<T> pl)
    {
        this.pl = pl;
    }

    public int getPageCount()
    {
        return pageCount;
    }

    public void setPageCount(int pageCount)
    {
        this.pageCount = pageCount;
    }

}

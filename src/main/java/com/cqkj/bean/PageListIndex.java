package com.cqkj.bean;

public class PageListIndex<T>
{
    // ��ҳ��ѯ���
    private PageList<T> pl;

    // ��ҳ��ѯ��ҳ��
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

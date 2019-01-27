package com.cqkj.bean;

import java.util.List;

public class PageList<T>
{
    // ��ѯ�������
    private List<T> data;

    // ��ѯҳ��
    private int pageIndex = 1;

    // ÿҳ���ڽ����
    private int pageSize = 5;

    // �ܲ�ѯ�����
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
     * �����������
     * 
     * @return
     */
    public int getFirstSeq()
    {
        return (this.pageIndex - 1) * this.pageSize + 1;
    }

    /**
     * ������ҳ��
     * 
     * @return ��ҳ��
     */
    public int getPageCount()
    {
        return this.count % this.pageSize == 0 ? this.count / this.pageSize : (this.count / this.pageSize) + 1;
    }

}

package com.cqkj.service;

import com.cqkj.bean.PageList;
import com.cqkj.bean.TSC;
import com.cqkj.bean.TSCInfo;
import com.cqkj.dao.TSCDao;
import com.cqkj.dao.TSCInfoDao;
import com.cqkj.dao.factory.DaoFactory;

public class TSCService
{
    TSCInfoDao tscd = DaoFactory.<TSCInfoDao>createDao("TSCInfoDaoImpl");
    TSCDao scd = DaoFactory.<TSCDao>createDao("TSCDaoImpl");

    /**
     * 分页查询
     * 
     * @param sql
     *            查询语句（单个select）
     * @param pl
     *            包含查询的页数及每页多少行
     * @param objs
     *            替代sql中的？的参数
     * @throws Exception
     */
    public void selectByPage(PageList<TSCInfo> pl, int stuId) throws Exception
    {
        tscd.select(pl, stuId);
    }

    /**
     * 学生选课
     * 
     * @param sc
     * @return
     * @throws Exception
     */
    public int insert(TSC sc) throws Exception
    {
        return scd.insert(sc);
    }

    public int deleteTSC(TSC sc) throws Exception
    {
        return scd.delete(sc);
    }

    public int update(TSC sc) throws Exception
    {
        return scd.update(sc);
    }
}

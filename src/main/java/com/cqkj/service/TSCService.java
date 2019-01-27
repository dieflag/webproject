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
     * ��ҳ��ѯ
     * 
     * @param sql
     *            ��ѯ��䣨����select��
     * @param pl
     *            ������ѯ��ҳ����ÿҳ������
     * @param objs
     *            ���sql�еģ��Ĳ���
     * @throws Exception
     */
    public void selectByPage(PageList<TSCInfo> pl, int stuId) throws Exception
    {
        tscd.select(pl, stuId);
    }

    /**
     * ѧ��ѡ��
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

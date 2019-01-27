package com.cqkj.service;

import java.util.List;

import com.cqkj.bean.DeptInfo;
import com.cqkj.bean.PageList;
import com.cqkj.dao.DeptInfoDao;
import com.cqkj.dao.factory.DaoFactory;

public class DeptInfoService
{
    DeptInfoDao did = DaoFactory.<DeptInfoDao>createDao("DeptInfoDaoImpl");

    public List<DeptInfo> selectAllDeptInfo() throws Exception
    {
        return did.selectAll(DeptInfo.class);
    }

    public DeptInfo selectById(DeptInfo di) throws Exception
    {
        return did.selectById(di);
    }

    public List<DeptInfo> selectAll() throws Exception
    {
        return did.selectAll(DeptInfo.class);

    }

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
    public void selectByPage(String sql, PageList<DeptInfo> pl, Object... objs) throws Exception
    {
        did.selectByPage(DeptInfo.class, sql, pl, objs);
    }

    /**
     * ���DeptInfo����
     * 
     * @param di
     * @return
     * @throws Exception
     */
    public int insert(DeptInfo di) throws Exception
    {
        return did.insert(di);
    }

    /**
     * ����DeptInfo����
     * 
     * @param di
     * @return
     * @throws Exception
     */
    public int update(DeptInfo di) throws Exception
    {
        return did.update(di);
    }

    /**
     * �ж����ݿ����Ƿ��������û���
     * 
     * @param str
     * @return
     * @throws Exception
     */
    public boolean exit(String repeatName, String repeatValue) throws Exception
    {
        return did.isExists(repeatName, repeatValue);
    }

    public int deleteById(DeptInfo di) throws Exception
    {
        return did.delete(di);
    }
}

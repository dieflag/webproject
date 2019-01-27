package com.cqkj.service;

import java.util.List;

import com.cqkj.bean.PageList;
import com.cqkj.bean.TCourseInfo;
import com.cqkj.dao.TCourseInfoDao;
import com.cqkj.dao.factory.DaoFactory;

public class TCourseInfoService
{
    TCourseInfoDao tid = DaoFactory.<TCourseInfoDao>createDao("TCourseInfoDaoImpl");

    public List<TCourseInfo> selectAllTCourseInfo() throws Exception
    {
        return tid.selectAll(TCourseInfo.class);
    }

    public TCourseInfo selectById(TCourseInfo tci) throws Exception
    {
        return tid.selectById(tci);
    }

    public List<TCourseInfo> selectAll() throws Exception
    {
        return tid.selectAll(TCourseInfo.class);

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
    public void selectByPage(String sql, PageList<TCourseInfo> pl, Object... objs) throws Exception
    {
        tid.selectByPage(TCourseInfo.class, sql, pl, objs);
    }

    /**
     * ���DeptInfo����
     * 
     * @param di
     * @return
     * @throws Exception
     */
    public int insert(TCourseInfo tci) throws Exception
    {
        return tid.insert(tci);
    }

    /**
     * ����DeptInfo����
     * 
     * @param di
     * @return
     * @throws Exception
     */
    public int update(TCourseInfo tci) throws Exception
    {
        return tid.update(tci);
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
        return tid.isExists(repeatName, repeatValue);
    }

    /**
     * ģ����ѯ
     * 
     * @param name
     *            ��ѯ����
     * @return
     * @throws Exception
     */
    public void getSelectCName(PageList<TCourseInfo> pl, String keyWord) throws Exception
    {
        tid.selectCName(pl, keyWord);
    }

    /**
     * ͨ��cIdɾ��
     * 
     * @param cId
     * @return
     * @throws Exception
     */
    public int deleteById(int cId) throws Exception
    {
        TCourseInfo tci = new TCourseInfo();
        tci.setcId(cId);
        return tid.delete(tci);
    }

    // ��ѯstuIdδѡ�Ŀγ�
    public List<TCourseInfo> unSelect(int stuId) throws Exception
    {
        return tid.unSelect(stuId);
    }
}

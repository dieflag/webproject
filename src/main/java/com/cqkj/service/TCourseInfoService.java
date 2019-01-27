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
    public void selectByPage(String sql, PageList<TCourseInfo> pl, Object... objs) throws Exception
    {
        tid.selectByPage(TCourseInfo.class, sql, pl, objs);
    }

    /**
     * 添加DeptInfo对象
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
     * 更改DeptInfo对象
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
     * 判断数据库中是否有重名用户名
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
     * 模糊查询
     * 
     * @param name
     *            查询条件
     * @return
     * @throws Exception
     */
    public void getSelectCName(PageList<TCourseInfo> pl, String keyWord) throws Exception
    {
        tid.selectCName(pl, keyWord);
    }

    /**
     * 通过cId删除
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

    // 查询stuId未选的课程
    public List<TCourseInfo> unSelect(int stuId) throws Exception
    {
        return tid.unSelect(stuId);
    }
}

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
    public void selectByPage(String sql, PageList<DeptInfo> pl, Object... objs) throws Exception
    {
        did.selectByPage(DeptInfo.class, sql, pl, objs);
    }

    /**
     * 添加DeptInfo对象
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
     * 更改DeptInfo对象
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
     * 判断数据库中是否有重名用户名
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

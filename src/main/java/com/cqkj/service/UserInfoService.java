package com.cqkj.service;

import java.util.List;

import com.cqkj.bean.PageList;
import com.cqkj.bean.UserInfo;
import com.cqkj.dao.UserInfoDao;
import com.cqkj.dao.factory.DaoFactory;

public class UserInfoService
{
    UserInfoDao uid = DaoFactory.<UserInfoDao>createDao("UserInfoDaoImpl");

    public UserInfo login(String loginName, String loginPwd)
    {
        UserInfo ui = uid.selectLoginName(loginName);
        if (ui != null)
        {
            if (ui.getLoginPwd().equals(loginPwd))
            {
                return ui;
            }
        }
        return null;
    }

    public UserInfo selectById(UserInfo ui) throws Exception
    {
        return uid.selectById(ui);
    }

    public List<UserInfo> selectAll() throws Exception
    {
        return uid.selectAll(UserInfo.class);

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
    public void selectByPage(String sql, PageList<UserInfo> pl, Object... objs) throws Exception
    {
        uid.selectByPage(UserInfo.class, sql, pl, objs);
    }

    /**
     * 添加UserInfo对象
     * 
     * @param ui
     * @return
     * @throws Exception
     */
    public int insert(UserInfo ui) throws Exception
    {
        return uid.insert(ui);
    }

    /**
     * 逻辑删除
     * 
     * @param ui
     * @return
     * @throws Exception
     */
    public int deleteById(UserInfo ui) throws Exception
    {
        return uid.deleteByIsDelete(ui);
    }

    /**
     * 更改UserInfo对象
     * 
     * @param ui
     * @return
     * @throws Exception
     */
    public int update(UserInfo ui) throws Exception
    {
        return uid.update(ui);
    }

    /**
     * 判断数据库中是否有重名用户名
     * 
     * @param str
     * @return
     * @throws Exception
     */
    public boolean exit(String loginName) throws Exception
    {
        return uid.loginNameIsExists(loginName);
    }
}

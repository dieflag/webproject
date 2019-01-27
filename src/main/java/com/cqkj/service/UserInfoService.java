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
    public void selectByPage(String sql, PageList<UserInfo> pl, Object... objs) throws Exception
    {
        uid.selectByPage(UserInfo.class, sql, pl, objs);
    }

    /**
     * ���UserInfo����
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
     * �߼�ɾ��
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
     * ����UserInfo����
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
     * �ж����ݿ����Ƿ��������û���
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

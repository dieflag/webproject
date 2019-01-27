package com.cqkj.dao.impl.oracle;

import com.cqkj.bean.UserInfo;
import com.cqkj.dao.UserInfoDao;

public class UserInfoDaoImpl extends BaseDaoImpl<UserInfo> implements UserInfoDao
{
    public UserInfo selectLoginName(String loginName)
    {
        String sql = "select * from UserInfo where loginName = ?";
        UserInfo ui = new UserInfo();
        try
        {
            executeQuery(sql, loginName);
            while (rs.next())
            {
                ui.setLoginName(rs.getString("loginName"));
                ui.setUserId(rs.getInt("userId"));
                ui.setLoginPwd(rs.getString("loginPwd"));
                ui.setDeptId(rs.getInt("deptId"));
                return ui;
            }
        } catch (Exception e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    public boolean loginNameIsExists(String loginName) throws Exception
    {
        int temp = Integer.parseInt(executeQueryObj(
                "select count(1) from dual where exists(select loginname from UserInfo where loginname = ?)", loginName)
                        .toString());
        return temp > 0 ? true : false;
    }

}

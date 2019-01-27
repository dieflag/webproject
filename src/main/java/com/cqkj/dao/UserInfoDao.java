package com.cqkj.dao;

import com.cqkj.bean.UserInfo;

public interface UserInfoDao extends BaseDao<UserInfo>
{

    public UserInfo selectLoginName(String loginName);

    public boolean loginNameIsExists(String loginName) throws Exception;
}

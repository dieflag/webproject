package com.cqkj.dao;

import com.cqkj.bean.DeptInfo;

public interface DeptInfoDao extends BaseDao<DeptInfo>
{
    public boolean isExists(String repeatName, String repeatValue) throws Exception;
}

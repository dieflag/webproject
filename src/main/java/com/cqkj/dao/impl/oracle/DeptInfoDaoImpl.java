package com.cqkj.dao.impl.oracle;

import com.cqkj.bean.DeptInfo;
import com.cqkj.dao.DeptInfoDao;

public class DeptInfoDaoImpl extends BaseDaoImpl<DeptInfo> implements DeptInfoDao
{
    public boolean isExists(String repeatName, String repeatValue) throws Exception
    {
        int temp = Integer.parseInt(
                executeQueryObj("select count(1) from DeptInfo where " + repeatName + " = ?", repeatValue).toString());
        return temp > 0 ? true : false;
    }
}

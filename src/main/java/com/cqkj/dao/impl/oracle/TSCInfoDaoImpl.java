package com.cqkj.dao.impl.oracle;

import com.cqkj.bean.PageList;
import com.cqkj.bean.TSCInfo;
import com.cqkj.dao.TSCInfoDao;

public class TSCInfoDaoImpl extends BaseDaoImpl<TSCInfo> implements TSCInfoDao
{
    public void select(PageList<TSCInfo> pl, int stuId) throws Exception
    {
        String sql = "select scId,cNo,cName,score,sc.crateDate from TSC sc join TCourse c on sc.cid = c.cid where sc.stuid = ?";

        selectByPage(TSCInfo.class, sql, pl, stuId);
    }
}

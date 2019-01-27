package com.cqkj.dao;

import com.cqkj.bean.PageList;
import com.cqkj.bean.TSCInfo;

public interface TSCInfoDao extends BaseDao<TSCInfo>
{
    // ≤È—Ø
    public void select(PageList<TSCInfo> pl, int stuId) throws Exception;
}
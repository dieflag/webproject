package com.cqkj.dao;

import com.cqkj.bean.PageList;
import com.cqkj.bean.Select;

public interface SelectDao extends BaseDao<Select>
{
    public void allStu(PageList<Select> pl) throws Exception;

    public void exitsScore(PageList<Select> pl) throws Exception;

    public void alTscStu(PageList<Select> pl) throws Exception;

    public void allSC(PageList<Select> pl, int stuId) throws Exception;

    public void getStuCou(PageList<Select> pl, int stuId) throws Exception;

    public void selectByStuIdcId(PageList<Select> pl, int stuId, int cId) throws Exception;

    public void selectTSCByStuId(PageList<Select> pl, int stuId) throws Exception;
}

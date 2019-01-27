package com.cqkj.dao.impl.oracle;

import java.util.List;

import com.cqkj.bean.PageList;
import com.cqkj.bean.TCourseInfo;
import com.cqkj.dao.TCourseInfoDao;

public class TCourseInfoDaoImpl extends BaseDaoImpl<TCourseInfo> implements TCourseInfoDao
{

    public boolean isExists(String repeatName, String repeatValue) throws Exception
    {
        int temp = Integer.parseInt(
                executeQueryObj("select count(1) from TCourse where " + repeatName + " = ?", repeatValue).toString());
        return temp > 0 ? true : false;
    }

    public void selectCName(PageList<TCourseInfo> pl, String keyWord) throws Exception
    {
        String sql = "select * from TCourse";

        if (!(keyWord == null || keyWord.isEmpty()))
        {
            sql = sql + " where cName like ?";
            selectByPage(TCourseInfo.class, sql, pl, "%" + keyWord + "%");
        } else
        {
            selectByPage(TCourseInfo.class, sql, pl);
        }

    }

    public List<TCourseInfo> unSelect(int stuId) throws Exception
    {
        String sql = "select * from Tcourse c where not exists(select 1 from TSC sc where sc.cid = c.cid and sc.stuid = ?)";

        return selectAll(TCourseInfo.class, sql, stuId);
    }
}

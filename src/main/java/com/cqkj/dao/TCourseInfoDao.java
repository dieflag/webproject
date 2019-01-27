package com.cqkj.dao;

import java.util.List;

import com.cqkj.bean.PageList;
import com.cqkj.bean.TCourseInfo;

public interface TCourseInfoDao extends BaseDao<TCourseInfo>
{
    // 判断重名
    public boolean isExists(String repeatName, String repeatValue) throws Exception;

    // 查询
    public void selectCName(PageList<TCourseInfo> pl, String keyWord) throws Exception;

    // 查询stuId未选的课程
    public List<TCourseInfo> unSelect(int stuId) throws Exception;
}

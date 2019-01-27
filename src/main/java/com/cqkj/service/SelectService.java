package com.cqkj.service;

import com.cqkj.bean.PageList;
import com.cqkj.bean.Select;
import com.cqkj.dao.SelectDao;
import com.cqkj.dao.factory.DaoFactory;

public class SelectService
{
    SelectDao sd = DaoFactory.<SelectDao>createDao("SelectDaoImpl");

    // 获取已设置成绩的学生选课
    public void exitsScore(PageList<Select> pl) throws Exception
    {
        sd.exitsScore(pl);
    }

    // 获取已选课的学生信息
    public void alTscStu(PageList<Select> pl) throws Exception
    {
        sd.alTscStu(pl);
    }

    // 获取stuId的学生已选的所有课程信息
    public void getStuCou(PageList<Select> pl, int stuId) throws Exception
    {
        sd.getStuCou(pl, stuId);
    }

    // 根据学生id和课程id查询选课对象
    public void selectByStuIdcId(PageList<Select> pl, int stuId, int cId) throws Exception
    {
        sd.selectByStuIdcId(pl, stuId, cId);
    }

    // 根据学生Id查询选课
    public void selectTSCByStuId(PageList<Select> pl, int stuId) throws Exception
    {
        sd.selectTSCByStuId(pl, stuId);
    }

    public void allStu(PageList<Select> pl) throws Exception
    {
        sd.allStu(pl);
    }

    public void allSC(PageList<Select> pl, int stuId) throws Exception
    {
        sd.allSC(pl, stuId);
    }
}

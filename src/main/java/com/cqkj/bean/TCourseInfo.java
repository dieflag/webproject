package com.cqkj.bean;

import java.util.Date;

/**
 * 用于储存课程表的查询结果
 * @author cys
 * @createDate 2019-01-16
 *
 */
@TbInfoName(name = "TCourse")
public class TCourseInfo
{
    // 课程ID
    @PK
    private int cId;

    // 课程编号
    private String cNo;

    // 课程姓名
    private String cName;

    // 创建时间
    private Date crateDate;

    public int getcId()
    {
        return cId;
    }

    public void setcId(int cId)
    {
        this.cId = cId;
    }

    public String getcNo()
    {
        return cNo;
    }

    public void setcNo(String cNo)
    {
        this.cNo = cNo;
    }

    public String getcName()
    {
        return cName;
    }

    public void setcName(String cName)
    {
        this.cName = cName;
    }

    public Date getCrateDate()
    {
        return crateDate;
    }

    public void setCrateDate(Date crateDate)
    {
        this.crateDate = crateDate;
    }

}

package com.cqkj.bean;

import java.util.Date;

public class TSCInfo
{
    // 主键
    private int scId;

    // 课程编号
    private String cNo;

    // 课程名称
    private String cName;

    // 课程成绩
    private double score;

    // 选课时间
    private Date crateDate;

    public int getScId()
    {
        return scId;
    }

    public void setScId(int scId)
    {
        this.scId = scId;
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

    public double getScore()
    {
        return score;
    }

    public void setScore(double score)
    {
        this.score = score;
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

package com.cqkj.bean;

import java.util.Date;

public class TSC
{
    @PK
    private int scId;
    private int stuId;
    private int cId;
    private double score;
    private Date crateDate;

    public int getScId()
    {
        return scId;
    }

    public void setScId(int scId)
    {
        this.scId = scId;
    }

    public int getStuId()
    {
        return stuId;
    }

    public void setStuId(int stuId)
    {
        this.stuId = stuId;
    }

    public int getcId()
    {
        return cId;
    }

    public void setcId(int cId)
    {
        this.cId = cId;
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

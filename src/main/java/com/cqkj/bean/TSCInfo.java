package com.cqkj.bean;

import java.util.Date;

public class TSCInfo
{
    // ����
    private int scId;

    // �γ̱��
    private String cNo;

    // �γ�����
    private String cName;

    // �γ̳ɼ�
    private double score;

    // ѡ��ʱ��
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

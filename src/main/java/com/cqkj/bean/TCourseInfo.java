package com.cqkj.bean;

import java.util.Date;

/**
 * ���ڴ���γ̱�Ĳ�ѯ���
 * @author cys
 * @createDate 2019-01-16
 *
 */
@TbInfoName(name = "TCourse")
public class TCourseInfo
{
    // �γ�ID
    @PK
    private int cId;

    // �γ̱��
    private String cNo;

    // �γ�����
    private String cName;

    // ����ʱ��
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

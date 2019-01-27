package com.cqkj.service;

import com.cqkj.bean.PageList;
import com.cqkj.bean.Select;
import com.cqkj.dao.SelectDao;
import com.cqkj.dao.factory.DaoFactory;

public class SelectService
{
    SelectDao sd = DaoFactory.<SelectDao>createDao("SelectDaoImpl");

    // ��ȡ�����óɼ���ѧ��ѡ��
    public void exitsScore(PageList<Select> pl) throws Exception
    {
        sd.exitsScore(pl);
    }

    // ��ȡ��ѡ�ε�ѧ����Ϣ
    public void alTscStu(PageList<Select> pl) throws Exception
    {
        sd.alTscStu(pl);
    }

    // ��ȡstuId��ѧ����ѡ�����пγ���Ϣ
    public void getStuCou(PageList<Select> pl, int stuId) throws Exception
    {
        sd.getStuCou(pl, stuId);
    }

    // ����ѧ��id�Ϳγ�id��ѯѡ�ζ���
    public void selectByStuIdcId(PageList<Select> pl, int stuId, int cId) throws Exception
    {
        sd.selectByStuIdcId(pl, stuId, cId);
    }

    // ����ѧ��Id��ѯѡ��
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

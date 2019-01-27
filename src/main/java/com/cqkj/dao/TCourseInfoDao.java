package com.cqkj.dao;

import java.util.List;

import com.cqkj.bean.PageList;
import com.cqkj.bean.TCourseInfo;

public interface TCourseInfoDao extends BaseDao<TCourseInfo>
{
    // �ж�����
    public boolean isExists(String repeatName, String repeatValue) throws Exception;

    // ��ѯ
    public void selectCName(PageList<TCourseInfo> pl, String keyWord) throws Exception;

    // ��ѯstuIdδѡ�Ŀγ�
    public List<TCourseInfo> unSelect(int stuId) throws Exception;
}

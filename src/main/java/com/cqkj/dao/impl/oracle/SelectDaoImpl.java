package com.cqkj.dao.impl.oracle;

import com.cqkj.bean.PageList;
import com.cqkj.bean.Select;
import com.cqkj.dao.SelectDao;

public class SelectDaoImpl extends BaseDaoImpl<Select> implements SelectDao
{
    // ��ȡ����ѧ��
    public void allStu(PageList<Select> pl) throws Exception
    {
        String sql = "select ui.name,ui.userId from deptInfo d,Userinfo ui where ui.deptId = d.deptId and d.deptCode = 'student' group by ui.name,ui.userId";

        selectAllByPage(Select.class, sql, pl);
    }

    // ��ȡ�����óɼ���ѧ��ѡ��
    public void exitsScore(PageList<Select> pl) throws Exception
    {
        String sql = "select ui.name, cou.cno, cou.cname,sc.score,sc.cratedate from TSC sc,TCourse cou,Userinfo ui where sc.stuid = ui.userid and sc.cid = cou.cid and sc.score > 0 order by sc.stuid";

        selectAllByPage(Select.class, sql, pl);
    }

    // ��ȡѧ��ѡ��
    public void allSC(PageList<Select> pl, int stuId) throws Exception
    {
        String sql = "select cou.cno, cou.cname,sc.score,sc.cratedate from TSC sc,TCourse cou,Userinfo ui where sc.stuid = ui.userid and sc.cid = cou.cid and ui.userid= ?";

        selectAllByPage(Select.class, sql, pl, stuId);
    }

    // ��ȡ��ѡ�ε�ѧ����Ϣ
    public void alTscStu(PageList<Select> pl) throws Exception
    {
        String sql = "select ui.name,ui.userId from TSC sc,deptInfo d,Userinfo ui where sc.stuid = ui.userid and ui.deptId = d.deptId and d.deptCode = 'student' group by ui.name,ui.userId";

        selectAllByPage(Select.class, sql, pl);
    }

    // ��ȡstuId��ѧ����ѡ�����пγ���Ϣ
    public void getStuCou(PageList<Select> pl, int stuId) throws Exception
    {
        String sql = "select c.cname,c.cid from Tcourse c where exists(select 1 from TSC sc where sc.cid = c.cid and sc.stuid = ?)";

        selectAllByPage(Select.class, sql, pl, stuId);
    }

    // ����ѧ��id�Ϳγ�id��ѯѡ�ζ���
    public void selectByStuIdcId(PageList<Select> pl, int stuId, int cId) throws Exception
    {
        String sql = "select * from TSC where stuId = ? and cId = ?";

        selectAllByPage(Select.class, sql, pl, stuId, cId);
    }

    // ����ѧ��Id��ѯѡ��
    public void selectTSCByStuId(PageList<Select> pl, int stuId) throws Exception
    {
        String sql = "select c.cno, c.cname,s.score,s.cratedate from TSC s,TCourse c where s.cid = c.cid and s.stuid = ? order by c.cno";

        selectAllByPage(Select.class, sql, pl, stuId);
    }

}

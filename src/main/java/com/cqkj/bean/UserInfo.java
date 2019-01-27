package com.cqkj.bean;

import java.util.Date;

public class UserInfo
{
    // �û�ID
    @PK
    private int userId;

    // ����ID
    private int deptId;

    // �˺�
    private String loginName;

    // ����
    private String loginPwd;

    // ��ʵ����
    private String name;

    // �Ա�
    private String sex;

    // ����
    private int age;

    // �绰����
    private String phone;

    // ���֤��
    private String idCard;

    // ΢�ź�
    private String weChat;

    // ��ϵ��ַ
    private String address;

    // ɾ����ʶ 0 δɾ�� 1����ɾ��
    private int isDelete;

    // ������ʶ 1 ���� 0�������
    private int isEnable = 1;

    // ��������
    private Date crateDate;

    // �����û�
    private int createUser;

    // ������ʱ��
    private Date lastUpdateDate;

    // �������û�
    private int lastUpdateUser;

    public int getUserId()
    {
        return userId;
    }

    public void setUserId(int userId)
    {
        this.userId = userId;
    }

    public int getDeptId()
    {
        return deptId;
    }

    public void setDeptId(int deptId)
    {
        this.deptId = deptId;
    }

    public String getLoginName()
    {
        return loginName;
    }

    public void setLoginName(String loginName)
    {
        this.loginName = loginName;
    }

    public String getLoginPwd()
    {
        return loginPwd;
    }

    public void setLoginPwd(String loginPwd)
    {
        this.loginPwd = loginPwd;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getSex()
    {
        return sex;
    }

    public void setSex(String sex)
    {
        this.sex = sex;
    }

    public int getAge()
    {
        return age;
    }

    public void setAge(int age)
    {
        this.age = age;
    }

    public String getPhone()
    {
        return phone;
    }

    public void setPhone(String phone)
    {
        this.phone = phone;
    }

    public String getIdCard()
    {
        return idCard;
    }

    public void setIdCard(String idCard)
    {
        this.idCard = idCard;
    }

    public String getWeChat()
    {
        return weChat;
    }

    public void setWeChat(String weChat)
    {
        this.weChat = weChat;
    }

    public String getAddress()
    {
        return address;
    }

    public void setAddress(String address)
    {
        this.address = address;
    }

    public int getIsDelete()
    {
        return isDelete;
    }

    public void setIsDelete(int isDelete)
    {
        this.isDelete = isDelete;
    }

    public int getIsEnable()
    {
        return isEnable;
    }

    public void setIsEnable(int isEnable)
    {
        this.isEnable = isEnable;
    }

    public Date getCrateDate()
    {
        return crateDate;
    }

    public void setCrateDate(Date crateDate)
    {
        this.crateDate = crateDate;
    }

    public int getCreateUser()
    {
        return createUser;
    }

    public void setCreateUser(int createUser)
    {
        this.createUser = createUser;
    }

    public Date getLastUpdateDate()
    {
        return lastUpdateDate;
    }

    public void setLastUpdateDate(Date lastUpdateDate)
    {
        this.lastUpdateDate = lastUpdateDate;
    }

    public int getLastUpdateUser()
    {
        return lastUpdateUser;
    }

    public void setLastUpdateUser(int lastUpdateUser)
    {
        this.lastUpdateUser = lastUpdateUser;
    }

}

package com.cqkj.bean;

import java.util.Date;

public class UserInfo
{
    // 用户ID
    @PK
    private int userId;

    // 部门ID
    private int deptId;

    // 账号
    private String loginName;

    // 密码
    private String loginPwd;

    // 真实姓名
    private String name;

    // 性别
    private String sex;

    // 年龄
    private int age;

    // 电话号码
    private String phone;

    // 身份证号
    private String idCard;

    // 微信号
    private String weChat;

    // 联系地址
    private String address;

    // 删除标识 0 未删除 1代表删除
    private int isDelete;

    // 锁定标识 1 启用 0代表禁用
    private int isEnable = 1;

    // 创建日期
    private Date crateDate;

    // 创建用户
    private int createUser;

    // 最后更新时间
    private Date lastUpdateDate;

    // 最后更新用户
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

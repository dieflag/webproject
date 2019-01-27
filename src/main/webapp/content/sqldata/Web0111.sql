-- Create deptinfo table
create table DeptInfo
(
    deptId number(10),--用户ID 
    deptCode Nvarchar2(10),--用户类型
    deptName Nvarchar2(15) not null,--用户类型名
    constraint PK_deptId_DeptInfo primary key(deptId),
    constraint U_deptCode_DeptInfo unique(deptCode)
);
comment on column DeptInfo.deptId is '用户ID';
comment on column DeptInfo.deptCode is '用户类型';
comment on column DeptInfo.deptName is '用户类型名';
-- Create deptinfo sequence 
create Sequence S_DeptInfo;
  
  
-- Create Userinfo table
create table UserInfo
(
    userId number(10),--用户ID 
    deptId number(10),--部门ID
    loginName Nvarchar2(16),--账号
    loginPwd Nvarchar2(16) not null,--密码  
    name Nvarchar2(10),--真实姓名
    sex char(1),--性别
    age number(3),--年龄
    phone number(11),--电话号码
    idCard Nvarchar2(18),--身份证号
    weChat Nvarchar2(20),--微信号
    address Nvarchar2(50),--联系地址
    isDelete number(1) default(0),--删除标识 0 未删除  1代表删除
    isEnable number(1) default(1),--锁定标识 1 启用   0代表禁用
    crateDate date default(sysdate),--创建日期
    createUser number(10),--创建用户
    lastUpdateDate date default(sysdate),--最后更新时间
    lastUpdateUser number(10),--最后更新用户
    constraint PK_userId_UserInfo primary key(userId),
    constraint FK_DeptInfo_UserInfo foreign key(deptId) references DeptInfo(deptId),
    constraint U_loginName_UserInfo unique(loginName),
    constraint CK_sex_UserInfo check(sex = 'x' or sex = 'y'),
    constraint CK_age_UserInfo check(age > 0 and age < 150),
    constraint CK_isDelete_UserInfo check(isDelete = 1 or isDelete = 0),
    constraint CK_isEnable_UserInfo check(isEnable = 1 or isEnable = 0)
);
comment on column UserInfo.userId is '用户ID';
comment on column UserInfo.deptId is '部门ID';
comment on column UserInfo.loginName is '账号';
comment on column UserInfo.loginPwd is '密码';
comment on column UserInfo.name is '真实姓名';
comment on column UserInfo.sex is '性别';
comment on column UserInfo.age is '年龄';
comment on column UserInfo.phone is '电话号码';
comment on column UserInfo.idCard is '身份证号';
comment on column UserInfo.weChat is '微信号';
comment on column UserInfo.address is '联系地址';
comment on column UserInfo.isDelete is '删除标识 0 未删除  1代表删除';
comment on column UserInfo.isEnable is '锁定标识 1 启用   0代表禁用';
comment on column UserInfo.crateDate is '创建日期';
comment on column UserInfo.createUser is '创建用户';
comment on column UserInfo.lastUpdateDate is '最后更新时间';
comment on column UserInfo.lastUpdateUser is '最后更新用户';
-- Create Userinfo sequence 
create Sequence S_UserInfo;




-- Create TCourse table
create table TCourse
(
    cId number(10),--课程ID 
    cNo Nvarchar2(10),--课程编号 
    cName Nvarchar2(16),--课程名称
    crateDate date default(sysdate),--创建日期
    constraint PK_cId_TCourse primary key(cId),
    constraint U_cNo_TCourse unique(cNo)
);
comment on column TCourse.cId is '课程ID';
comment on column TCourse.cNo is '课程编号';
comment on column TCourse.cName is '课程名称';
comment on column TCourse.crateDate is '创建日期';
-- Create TCourse sequence 
create sequence S_TCourse;

insert into TCourse (cid, cno, cname) values(S_TCourse.nextval,'C000','高等数学');
insert into TCourse (cid, cno, cname) values(S_TCourse.nextval,'C001','数学分析');






-- Create TSC table
create table TSC(
       scId number primary key,
       stuId number,
       cId number,
       score number(4,1) default 0 check(score>=0 and score<=100),
       crateDate date default(sysdate),
       constraint TSC_UserInfo foreign key (stuId) references UserInfo(userId),
       constraint TSC_TCourse foreign key (cId) references TCourse(cId)
);
-- Create TSC sequence 
create sequence S_TSC;

insert into TSC (scid, stuid, cid, score) values(S_TSC.nextval,22,2,89.0); 
insert into TSC (scid, stuid, cid, score) values(S_TSC.nextval,24,3,63.0); 
insert into TSC (scid, stuid, cid, score) values(S_TSC.nextval,26,2,44.0); 

/*DeptInfo 部门表
deptId  PK
deptCode unique
deptName  not null*/
create table DeptInfo
(
    deptId number(10),--部门ID 
    deptCode Nvarchar2(10),--部门编号
    deptName Nvarchar2(15) not null,--部门名称
    constraint PK_deptId_DeptInfo primary key(deptId),
    constraint U_deptCode_DeptInfo unique(deptCode)
);
comment on column DeptInfo.deptId is '部门ID';
comment on column DeptInfo.deptCode is '部门编号';
comment on column DeptInfo.deptName is '部门名称';

create Sequence S_DeptInfo;
     
/*UserInfo用户信息表 
userId     pk
deptId     fk
loginName  unique 16char
loginPwd   not null  16
name  
sex  只能为 y 和  x
age >0 <150
phone 11位
idCard 18位
weChat 
address 
isDelete 默认为 0 未删除  1代表删除
isEnable 默认为1 启用   0代表禁用
crateDate  
createUser
lastUpdateDate
lastUpdateUser*/
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

create Sequence S_UserInfo;

--构造部门表数据
insert into deptinfo
  (deptid, deptcode, deptname)
values
  (S_DeptInfo.Nextval, 'CQ001', '技术部');
  
insert into deptinfo
  (deptid, deptcode, deptname)
values
  (S_DeptInfo.Nextval, 'CQ002', '采购部');

select * from deptinfo;

--构造用户表数据
insert into userinfo
  (userid, deptid, loginname, loginpwd, name, sex, age, phone, idcard, wechat, address, isdelete, isenable, createuser, lastupdateuser)
values
  (S_UserInfo.Nextval, 2, 'system', '888888', '管理员', 'y', 18, 110, '420103198711112345', 'wfe46584', '北京', 0, 1, 2, 2);
  
insert into userinfo
  (userid, deptid, loginname, loginpwd, name, sex, age, phone, idcard, wechat, address, isdelete, isenable, createuser, lastupdateuser)
values
  (S_UserInfo.Nextval, 2, 'dieflag', '888888', '曹云淞', 'y', 21, 15171477231, '360102199709218017', 'yunsong8017', '江西南昌', 0, 1, 3, 3);
  
select * from userinfo;

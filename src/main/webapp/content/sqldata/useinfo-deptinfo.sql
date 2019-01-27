/*DeptInfo ���ű�
deptId  PK
deptCode unique
deptName  not null*/
create table DeptInfo
(
    deptId number(10),--����ID 
    deptCode Nvarchar2(10),--���ű��
    deptName Nvarchar2(15) not null,--��������
    constraint PK_deptId_DeptInfo primary key(deptId),
    constraint U_deptCode_DeptInfo unique(deptCode)
);
comment on column DeptInfo.deptId is '����ID';
comment on column DeptInfo.deptCode is '���ű��';
comment on column DeptInfo.deptName is '��������';

create Sequence S_DeptInfo;
     
/*UserInfo�û���Ϣ�� 
userId     pk
deptId     fk
loginName  unique 16char
loginPwd   not null  16
name  
sex  ֻ��Ϊ y ��  x
age >0 <150
phone 11λ
idCard 18λ
weChat 
address 
isDelete Ĭ��Ϊ 0 δɾ��  1����ɾ��
isEnable Ĭ��Ϊ1 ����   0�������
crateDate  
createUser
lastUpdateDate
lastUpdateUser*/
create table UserInfo
(
    userId number(10),--�û�ID 
    deptId number(10),--����ID
    loginName Nvarchar2(16),--�˺�
    loginPwd Nvarchar2(16) not null,--����  
    name Nvarchar2(10),--��ʵ����
    sex char(1),--�Ա�
    age number(3),--����
    phone number(11),--�绰����
    idCard Nvarchar2(18),--���֤��
    weChat Nvarchar2(20),--΢�ź�
    address Nvarchar2(50),--��ϵ��ַ
    isDelete number(1) default(0),--ɾ����ʶ 0 δɾ��  1����ɾ��
    isEnable number(1) default(1),--������ʶ 1 ����   0�������
    crateDate date default(sysdate),--��������
    createUser number(10),--�����û�
    lastUpdateDate date default(sysdate),--������ʱ��
    lastUpdateUser number(10),--�������û�
    constraint PK_userId_UserInfo primary key(userId),
    constraint FK_DeptInfo_UserInfo foreign key(deptId) references DeptInfo(deptId),
    constraint U_loginName_UserInfo unique(loginName),
    constraint CK_sex_UserInfo check(sex = 'x' or sex = 'y'),
    constraint CK_age_UserInfo check(age > 0 and age < 150),
    constraint CK_isDelete_UserInfo check(isDelete = 1 or isDelete = 0),
    constraint CK_isEnable_UserInfo check(isEnable = 1 or isEnable = 0)
);
comment on column UserInfo.userId is '�û�ID';
comment on column UserInfo.deptId is '����ID';
comment on column UserInfo.loginName is '�˺�';
comment on column UserInfo.loginPwd is '����';
comment on column UserInfo.name is '��ʵ����';
comment on column UserInfo.sex is '�Ա�';
comment on column UserInfo.age is '����';
comment on column UserInfo.phone is '�绰����';
comment on column UserInfo.idCard is '���֤��';
comment on column UserInfo.weChat is '΢�ź�';
comment on column UserInfo.address is '��ϵ��ַ';
comment on column UserInfo.isDelete is 'ɾ����ʶ 0 δɾ��  1����ɾ��';
comment on column UserInfo.isEnable is '������ʶ 1 ����   0�������';
comment on column UserInfo.crateDate is '��������';
comment on column UserInfo.createUser is '�����û�';
comment on column UserInfo.lastUpdateDate is '������ʱ��';
comment on column UserInfo.lastUpdateUser is '�������û�';

create Sequence S_UserInfo;

--���첿�ű�����
insert into deptinfo
  (deptid, deptcode, deptname)
values
  (S_DeptInfo.Nextval, 'CQ001', '������');
  
insert into deptinfo
  (deptid, deptcode, deptname)
values
  (S_DeptInfo.Nextval, 'CQ002', '�ɹ���');

select * from deptinfo;

--�����û�������
insert into userinfo
  (userid, deptid, loginname, loginpwd, name, sex, age, phone, idcard, wechat, address, isdelete, isenable, createuser, lastupdateuser)
values
  (S_UserInfo.Nextval, 2, 'system', '888888', '����Ա', 'y', 18, 110, '420103198711112345', 'wfe46584', '����', 0, 1, 2, 2);
  
insert into userinfo
  (userid, deptid, loginname, loginpwd, name, sex, age, phone, idcard, wechat, address, isdelete, isenable, createuser, lastupdateuser)
values
  (S_UserInfo.Nextval, 2, 'dieflag', '888888', '������', 'y', 21, 15171477231, '360102199709218017', 'yunsong8017', '�����ϲ�', 0, 1, 3, 3);
  
select * from userinfo;

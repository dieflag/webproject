-- Create deptinfo table
create table DeptInfo
(
    deptId number(10),--�û�ID 
    deptCode Nvarchar2(10),--�û�����
    deptName Nvarchar2(15) not null,--�û�������
    constraint PK_deptId_DeptInfo primary key(deptId),
    constraint U_deptCode_DeptInfo unique(deptCode)
);
comment on column DeptInfo.deptId is '�û�ID';
comment on column DeptInfo.deptCode is '�û�����';
comment on column DeptInfo.deptName is '�û�������';
-- Create deptinfo sequence 
create Sequence S_DeptInfo;
  
  
-- Create Userinfo table
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
-- Create Userinfo sequence 
create Sequence S_UserInfo;




-- Create TCourse table
create table TCourse
(
    cId number(10),--�γ�ID 
    cNo Nvarchar2(10),--�γ̱�� 
    cName Nvarchar2(16),--�γ�����
    crateDate date default(sysdate),--��������
    constraint PK_cId_TCourse primary key(cId),
    constraint U_cNo_TCourse unique(cNo)
);
comment on column TCourse.cId is '�γ�ID';
comment on column TCourse.cNo is '�γ̱��';
comment on column TCourse.cName is '�γ�����';
comment on column TCourse.crateDate is '��������';
-- Create TCourse sequence 
create sequence S_TCourse;

insert into TCourse (cid, cno, cname) values(S_TCourse.nextval,'C000','�ߵ���ѧ');
insert into TCourse (cid, cno, cname) values(S_TCourse.nextval,'C001','��ѧ����');






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

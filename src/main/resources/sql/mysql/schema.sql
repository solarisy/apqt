drop table if exists t_company;

drop table if exists t_image;

drop table if exists t_personal;

drop table if exists t_proxy;

drop table if exists t_user;

/*==============================================================*/
/* Table: t_company                                             */
/*==============================================================*/
create table t_company
(
   id                   bigint not null auto_increment,
   update_date          datetime not null,
   create_date          datetime not null,
   create_user          bigint not null,
   deleted              bigint not null default 1 comment '删除标识 1：使用；0：删除；',
   orgcode              varchar(255) not null comment '组织机构代码',
   name_cn              varchar(512) not null comment '中文名',
   name_en              varchar(512) comment '英文名',
   registered_number    varchar(512) comment '营业执照注册号',
   tax_number           varchar(512) comment '税务登记证号',
   industry             varchar(512) comment '所属行业',
   unit_propertie       varchar(512) comment '单位性质',
   founded_date         datetime comment '成立时间',
   business_scope       varchar(512) comment '经营范围',
   annual_turnover      varchar(512) comment '年营业额',
   employee_number      varchar(512) comment '员工人数',
   legal_representative varchar(512) comment '法人代表',
   basic_bank           varchar(512) comment '基本账户开户行',
   basic_bank_account   varchar(512) comment '基本账户账号',
   registered_capital   varchar(512) comment '注册资金',
   website              varchar(512) comment '单位网址',
   registered_address   varchar(512) comment '注册地址',
   contacts_address     varchar(512) comment '联系人地址',
   zip                  varchar(64) comment '邮编',
   contacts             varchar(64) comment '联系人',
   contacts_phone       varchar(64) comment '联系电话',
   certcode             varchar(64) comment '认证码',
   audit_status         bigint default 0 comment '审核状态 0：未审核(代理提交)；1：未审核(平台管理员提交)；2：代理管理员审核通过；3：代理管理员审核不通过；4：平台管理员审核通过；5：平台管理员神不通过。',
   proxy                bigint comment '所属的代理',
   personal_count       bigint not null default 0 comment '审核通过的个人数',
   primary key (id)
);

alter table t_company comment '公司认证信息表';

/*==============================================================*/
/* Table: t_image                                               */
/*==============================================================*/
create table t_image
(
   id                   bigint not null auto_increment,
   update_date          datetime not null,
   create_date          datetime not null,
   create_user          bigint not null,
   deleted              bigint not null default 1 comment '删除标识 1：使用；0：删除；',
   table_name           varchar(256) comment '哪个表的附件',
   table_id             bigint comment '哪条数据的附件',
   sequence             bigint default 0 comment '排序顺序',
   name                 varchar(512),
   size                 bigint comment '附件大小，单位byte',
   new_filename         varchar(512) comment '服务端的唯一的名称，uuid+类型，如05e9cca8-ed6f-44bf-b034-03a84b6643d5.jpg',
   thumbnail_filename   varchar(512),
   thumbnail_size       bigint,
   primary key (id)
);

alter table t_image comment '附件信息表';

/*==============================================================*/
/* Table: t_personal                                            */
/*==============================================================*/
create table t_personal
(
   id                   bigint not null auto_increment,
   update_date          datetime not null,
   create_date          datetime not null,
   create_user          bigint not null,
   deleted              bigint not null default 1 comment '删除标识 1：使用；0：删除；',
   id_number            varchar(64) not null comment '身份证号',
   name                 varchar(64) not null comment '姓名',
   sex                  varchar(64),
   country              varchar(64) comment '国籍',
   ethnic               varchar(64) comment '民族',
   unit                 varchar(512) comment '工作单位',
   unit_address         varchar(512) comment '单位地址',
   duty                 varchar(64) comment '职务',
   height               varchar(64) comment '身高',
   blood                varchar(64) comment '血型',
   marriage             varchar(64) comment '婚姻状况',
   children             varchar(64) comment '子女',
   registered_address   varchar(512) comment '户籍地',
   address              varchar(512) comment '现住地',
   zip                  varchar(64),
   mobilephone          varchar(64) comment '手机',
   phone                varchar(64) comment '座机',
   qq                   varchar(64),
   email                varchar(64),
   education            varchar(64) comment '学历',
   degree               varchar(64) comment '学位',
   certcode             varchar(64) comment '认证码',
   audit_status         bigint default 0 comment '审核状态 0：未审核(代理提交)；1：未审核(平台管理员提交)；2：代理管理员审核通过；3：代理管理员审核不通过；4：平台管理员审核通过；5：平台管理员神不通过。',
   proxy                bigint comment '所属的代理',
   company              bigint comment '所属的公司',
   primary key (id)
);

alter table t_personal comment '个人认证信息表';

/*==============================================================*/
/* Table: t_proxy                                               */
/*==============================================================*/
create table t_proxy
(
   id                   bigint not null auto_increment,
   update_date          datetime not null,
   create_date          datetime not null,
   create_user          bigint not null,
   deleted              bigint not null default 1 comment '删除标识 1：使用；0：删除；',
   orgcode              varchar(255) not null comment '组织机构代码',
   name_cn              varchar(512) not null comment '中文名',
   name_en              varchar(512) comment '英文名',
   registered_number    varchar(512) comment '营业执照注册号',
   tax_number           varchar(512) comment '税务登记证号',
   industry             varchar(512) comment '所属行业',
   unit_propertie       varchar(512) comment '单位性质',
   founded_date         datetime comment '成立时间',
   business_scope       varchar(512) comment '经营范围',
   annual_turnover      varchar(512) comment '年营业额',
   employee_number      varchar(512) comment '员工人数',
   legal_representative varchar(512) comment '法人代表',
   basic_bank           varchar(512) comment '基本账户开户行',
   basic_bank_account   varchar(512) comment '基本账户账号',
   registered_capital   varchar(512) comment '注册资金',
   website              varchar(512) comment '单位网址',
   registered_address   varchar(512) comment '注册地址',
   contacts_address     varchar(512) comment '联系人地址',
   zip                  varchar(64) comment '邮编',
   contacts             varchar(64) comment '联系人',
   contacts_phone       varchar(64) comment '联系电话',
   certcode             varchar(64) comment '认证码',
   audit_status         bigint default 0 comment '审核状态 0：未审核；1：审核通过；2：审核不通过。',
   primary key (id)
);

alter table t_proxy comment '代理公司信息表';

/*==============================================================*/
/* Table: t_user                                                */
/*==============================================================*/
create table t_user
(
   id                   bigint not null auto_increment,
   login_name           varchar(64) not null,
   name                 varchar(64) not null,
   email                varchar(255),
   mobilephone          varchar(64),
   password             varchar(255) not null,
   salt                 varchar(64) not null,
   roles                varchar(255) not null,
   update_date          timestamp not null,
   create_date          timestamp not null,
   create_user          bigint not null,
   deleted              bigint not null default 1 comment '删除标识 1：使用；0：删除；',
   proxy                bigint comment '所属代理公司，代理管理员和代理人员都有所属的代理公司，平台管理员所属代理公司约定为0。',
   primary key (id),
   unique key AK_unk_login_name (login_name)
)
type = InnoDB;



/** v1.0.2 to v1.0.3 升级脚本 **/
alter table t_company add column certificate          varchar(512) comment '获得何种证书';
alter table t_company add column certificate_day      datetime comment '证书日期';
alter table t_company add column certificate_org      varchar(512) comment '证书颁发机构';
alter table t_company add column reward_certificates  varchar(512) comment '奖励证书';
alter table t_company add column reward_certificates_day datetime comment '奖励证书颁发日期';
alter table t_company add column reward_certificates_org varchar(512) comment '奖励证书颁发机构';
alter table t_company add column punishment           varchar(512) comment '处罚';
alter table t_company add column punishment_day       datetime comment '处罚日期';
alter table t_company add column punishment_org       varchar(512) comment '处罚机构';

alter table t_company add column duty_day             datetime comment '职务日期';
alter table t_company add column job_title            varchar(512) comment '职称';
alter table t_company add column job_number           varchar(512) comment '执业号';
alter table t_company add column birthday             datetime comment '出生时间';
alter table t_company add column education_day        datetime comment '学历日期';
alter table t_company add column education_school     varchar(512) comment '学历学校';
alter table t_company add column education_school_id  varchar(512) comment '学历学校ID';
alter table t_company add column degree_day           datetime comment '学位日期';
alter table t_company add column degree_school        varchar(512) comment '学位学校';
alter table t_company add column degree_school_id     varchar(512) comment '学位学校ID';
alter table t_company add column resume               varchar(2048) comment '简历';
alter table t_company add column certificate          varchar(512) comment '获得何种证书';
alter table t_company add column certificate_day      datetime comment '证书日期';
alter table t_company add column certificate_org      varchar(512) comment '证书颁发机构';
alter table t_company add column reward_certificates  varchar(512) comment '奖励证书';
alter table t_company add column reward_certificates_day datetime comment '奖励证书颁发日期';
alter table t_company add column reward_certificates_org varchar(512) comment '奖励证书颁发机构';
alter table t_company add column punishment           varchar(512) comment '处罚';
alter table t_company add column punishment_day       datetime comment '处罚日期';
alter table t_company add column punishment_org       varchar(512) comment '处罚机构';
alter table t_company add column website              varchar(512) comment '个人网站';

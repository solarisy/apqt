drop table if exists t_company;

drop table if exists t_image;

drop table if exists t_membership_apply;

drop table if exists t_membership_apply2;

drop table if exists t_personal;

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
   audit_status         bigint default 0 comment '审核状态 0：未审核；1：审核通过；2：审核不通过。',
   certcode             varchar(64) comment '认证码',
   proxy                bigint comment '所属的代理',
   is_proxy             bigint not null default 0 comment '是否是代理：0：不是；1：是',
   auth_code            varchar(64) comment '授权码',
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
   certificate          varchar(512) comment '获得何种证书',
   certificate_day      datetime comment '证书日期',
   certificate_org      varchar(512) comment '证书颁发机构',
   reward_certificates  varchar(512) comment '奖励证书',
   reward_certificates_day datetime comment '奖励证书颁发日期',
   reward_certificates_org varchar(512) comment '奖励证书颁发机构',
   punishment           varchar(512) comment '处罚',
   punishment_day       datetime comment '处罚日期',
   punishment_org       varchar(512) comment '处罚机构',
   primary key (id)
)
type = InnoDB;

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
   name                 varchar(512) comment '附件名称',
   size                 bigint comment '附件大小，单位byte',
   new_filename         varchar(512) comment '服务端的唯一的名称，uuid+类型，如05e9cca8-ed6f-44bf-b034-03a84b6643d5.jpg',
   thumbnail_filename   varchar(512) comment '缩略图文件名',
   thumbnail_size       bigint comment '缩略图大小',
   primary key (id)
)
type = InnoDB;

alter table t_image comment '附件信息表';

/*==============================================================*/
/* Table: t_membership_apply                                    */
/*==============================================================*/
create table t_membership_apply
(
   id                   bigint not null auto_increment,
   update_date          datetime not null,
   create_date          datetime not null,
   create_user          bigint not null,
   deleted              bigint not null default 1 comment '删除标识 1：使用；0：删除；',
   code                 varchar(255) comment '编号',
   register_date        datetime comment '登记日期',
   unit_name            varchar(512) comment '单位名称',
   unit_address         varchar(512) comment '单位地址',
   phone                varchar(255) comment '电话',
   zip                  varchar(64) comment '邮编',
   lead_name            varchar(64) comment '领导人姓名',
   position             varchar(64) comment '职务',
   email                varchar(255) comment 'EMAIL',
   contect_user_name    varchar(64) comment '联系人姓名',
   fax                  varchar(255) comment '电话及传真',
   base_info            varchar(1024) comment '企业基本情况',
   membership_level     varchar(255) comment '申请会员等级',
   recommend_opinion    varchar(1024) comment 'v',
   ratification_status  varchar(255) comment '批准情况',
   is_sponsor           varchar(64) comment '是否愿意成为诚信联盟的发起单位',
   primary key (id)
)
type = InnoDB;

/*==============================================================*/
/* Table: t_membership_apply2                                   */
/*==============================================================*/
create table t_membership_apply2
(
   id                   bigint not null auto_increment,
   update_date          datetime not null,
   create_date          datetime not null,
   create_user          bigint not null,
   deleted              bigint not null default 1 comment '删除标识 1：使用；0：删除；',
   code                 varchar(255) comment '档案编号',
   unit_name            varchar(512) comment '单位名称(全称)',
   unit_reg_number      varchar(255) comment '注册机关及文号',
   unit_property        varchar(255) comment '单位性质',
   unit_address         varchar(512) comment '单位地址',
   unit_zip             varchar(64) comment '邮编',
   unit_governing       varchar(64) comment '是否申请理事单位',
   unit_url             varchar(512) comment '单位网址',
   ceo_name             varchar(255) comment '负责人姓名',
   ceo_sex              varchar(255) comment '性别',
   ceo_age              varchar(255) comment '年龄',
   ceo_education        varchar(255) comment '学历',
   ceo_job_title        varchar(255) comment '职称',
   ceo_ethnic           varchar(255) comment '民族',
   ceo_id_number        varchar(255) comment '身份证号',
   ceo_position         varchar(64) comment '职务',
   ceo_phone            varchar(255) comment '电话',
   ceo_mobile_phone     varchar(255) comment '手机',
   cv_start             datetime comment '个人简历_起',
   cv_end               datetime comment '个人简历_止',
   cv_unit              varchar(255) comment '个人简历_单位',
   cv_position          varchar(255) comment '个人简历_职务/职称',
   cv_part_time         varchar(255) comment '个人简历_主要兼职',
   cv_start2            datetime comment '个人简历_起2',
   cv_end2              datetime comment '个人简历_止2',
   cv_unit2             varchar(255) comment '个人简历_单位2',
   cv_position2         varchar(255) comment '个人简历_职务/职称2',
   cv_part_time2        varchar(255) comment '个人简历_主要兼职2',
   cv_start3            datetime comment '个人简历_起3',
   cv_end3              datetime comment '个人简历_止3',
   cv_unit3             varchar(255) comment '个人简历_单位3',
   cv_position3         varchar(255) comment '个人简历_职务/职称3',
   cv_part_time3        varchar(255) comment '个人简历_主要兼职3',
   cv_start4            datetime comment '个人简历_起4',
   cv_end4              datetime comment '个人简历_止4',
   cv_unit4             varchar(255) comment '个人简历_单位4',
   cv_position4         varchar(255) comment '个人简历_职务/职称4',
   cv_part_time4        varchar(255) comment '个人简历_主要兼职4',
   cv_start5            datetime comment '个人简历_起5',
   cv_end5              datetime comment '个人简历_止5',
   cv_unit5             varchar(255) comment '个人简历_单位5',
   cv_position5         varchar(255) comment '个人简历_职务/职称5',
   cv_part_time5        varchar(255) comment '个人简历_主要兼职5',
   cv_start6            datetime comment '个人简历_起6',
   cv_end6              datetime comment '个人简历_止6',
   cv_unit6             varchar(255) comment '个人简历_单位6',
   cv_position6         varchar(255) comment '个人简历_职务/职称6',
   cv_part_time6        varchar(255) comment '个人简历_主要兼职6',
   cv_start7            datetime comment '个人简历_起7',
   cv_end7              datetime comment '个人简历_止7',
   cv_unit7             varchar(255) comment '个人简历_单位7',
   cv_position7         varchar(255) comment '个人简历_职务/职称7',
   cv_part_time7        varchar(255) comment '个人简历_主要兼职7',
   contects_name        varchar(64) comment '联系人姓名',
   contects_position    varchar(64) comment '联系人职务',
   contects_mobile_phone varchar(64) comment '联系人手机',
   contects_phone       varchar(64) comment '联系人电话',
   contects_fax         varchar(64) comment '联系人传真',
   contects_email       varchar(255) comment '联系人Email',
   unit_summary         varchar(512) comment '单位简介包括发展概况、主要业务及其规模等',
   unit_product         varchar(2048) comment '主要产品及特点',
   unit_annual_turnover varchar(64) comment '年营业额',
   unit_idea            varchar(512) comment '对协会有何希望及要求',
   approval_comments    varchar(512) comment '审批意见',
   approval_user_name   varchar(255) comment '审批人姓名',
   approval_user_id     bigint comment '审批人Id',
   approval_date        datetime comment '审批日期',
   primary key (id)
)
type = InnoDB;

alter table t_membership_apply2 comment '中国农业产业诚信联盟入会申请表';

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
   certcode             varchar(64) comment '认证码',
   audit_status         bigint default 0 comment '审核状态 0：未审核；1：审核通过；2：审核不通过。',
   proxy                bigint comment '所属的代理',
   company              bigint comment '所属的公司',
   auth_code            varchar(64) comment '授权码',
   id_number            varchar(64) not null comment '身份证号',
   name                 varchar(64) not null comment '姓名',
   sex                  varchar(64) comment '性别',
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
   zip                  varchar(64) comment '邮编',
   mobilephone          varchar(64) comment '手机',
   phone                varchar(64) comment '座机',
   qq                   varchar(64),
   email                varchar(64) comment '电子邮箱',
   education            varchar(64) comment '学历',
   degree               varchar(64) comment '学位',
   duty_day             datetime comment '职务日期',
   job_title            varchar(512) comment '职称',
   job_number           varchar(512) comment '执业号',
   birthday             datetime comment '出生时间',
   education_day        datetime comment '学历日期',
   education_school     varchar(512) comment '学历学校',
   education_school_id  varchar(512) comment '学历学校ID',
   degree_day           datetime comment '学位日期',
   degree_school        varchar(512) comment '学位学校',
   degree_school_id     varchar(512) comment '学位学校ID',
   resume               varchar(2048) comment '简历',
   certificate          varchar(512) comment '获得何种证书',
   certificate_day      datetime comment '证书日期',
   certificate_org      varchar(512) comment '证书颁发机构',
   reward_certificates  varchar(512) comment '奖励证书',
   reward_certificates_day datetime comment '奖励证书颁发日期',
   reward_certificates_org varchar(512) comment '奖励证书颁发机构',
   punishment           varchar(512) comment '处罚',
   punishment_day       datetime comment '处罚日期',
   punishment_org       varchar(512) comment '处罚机构',
   website              varchar(512) comment '个人网站',
   primary key (id)
)
type = InnoDB;

alter table t_personal comment '个人认证信息表';

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

/**
 * 升级t_personal表
 * 软件版本号要定义清楚，每个版本都要归档，比如：v1.0(源码tag，war，sql，文档)
 */
alter table `t_personal` add column duty_day             datetime comment '职务日期';
alter table `t_personal` add column job_title            varchar(512) comment '职称';
alter table `t_personal` add column job_number           varchar(512) comment '执业号';
alter table `t_personal` add column birthday             datetime comment '出生时间';
alter table `t_personal` add column education_day        datetime comment '学历日期';
alter table `t_personal` add column education_school     varchar(512) comment '学历学校';
alter table `t_personal` add column education_school_id  varchar(512) comment '学历学校ID';
alter table `t_personal` add column degree_day           datetime comment '学位日期';
alter table `t_personal` add column degree_school        varchar(512) comment '学位学校';
alter table `t_personal` add column degree_school_id     varchar(512) comment '学位学校ID';
alter table `t_personal` add column resume               varchar(2048) comment '简历';
alter table `t_personal` add column certificate          varchar(512) comment '获得何种证书';
alter table `t_personal` add column certificate_day      datetime comment '证书日期';
alter table `t_personal` add column certificate_org      varchar(512) comment '证书颁发机构';
alter table `t_personal` add column reward_certificates  varchar(512) comment '奖励证书';
alter table `t_personal` add column reward_certificates_day datetime comment '奖励证书颁发日期';
alter table `t_personal` add column reward_certificates_org varchar(512) comment '奖励证书颁发机构';
alter table `t_personal` add column punishment           varchar(512) comment '处罚';
alter table `t_personal` add column punishment_day       datetime comment '处罚日期';
alter table `t_personal` add column punishment_org       varchar(512) comment '处罚机构';
alter table `t_personal` add column website              varchar(512) comment '个人网站';
USE `SAMS`;
DROP TABLE IF EXISTS `scms_approval`;
CREATE TABLE `scms_approval`
(
`id`varchar(32) NOT NULL COMMENT'id',
`coustomer_id`varchar(32) DEFAULT NULL COMMENT'��ͬid',
`user_id`varchar(32) DEFAULT NULL COMMENT'�û�id',
`dep_id`varchar(50) DEFAULT NULL COMMENT'����id',
`approval_content`varchar(500) DEFAULT NULL COMMENT'��������',
`stutas`varchar(2) DEFAULT NULL COMMENT'״̬',
`create_by`varchar(50) DEFAULT NULL COMMENT'������',
`create_date`datetime DEFAULT NULL COMMENT'����ʱ��',
`update_by`varchar(50) DEFAULT NULL COMMENT'������',
`update_date`datetime DEFAULT NULL COMMENT'����ʱ��',
`remarks`varchar(255) DEFAULT NULL COMMENT'��ע��Ϣ',
`del_flag`char(1) DEFAULT NULL COMMENT'ɾ�����',
  PRIMARY KEY (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 LOCK TABLES `scms_approval` WRITE;
UNLOCK TABLES;

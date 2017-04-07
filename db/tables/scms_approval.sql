USE `SAMS`;
DROP TABLE IF EXISTS `scms_approval`;
CREATE TABLE `scms_approval`
(
`id`varchar(32) NOT NULL COMMENT'id',
`coustomer_id`varchar(32) DEFAULT NULL COMMENT'合同id',
`user_id`varchar(32) DEFAULT NULL COMMENT'用户id',
`dep_id`varchar(50) DEFAULT NULL COMMENT'部门id',
`approval_content`varchar(500) DEFAULT NULL COMMENT'审批内容',
`stutas`varchar(2) DEFAULT NULL COMMENT'状态',
`create_by`varchar(50) DEFAULT NULL COMMENT'创建者',
`create_date`datetime DEFAULT NULL COMMENT'创建时间',
`update_by`varchar(50) DEFAULT NULL COMMENT'更新者',
`update_date`datetime DEFAULT NULL COMMENT'更新时间',
`remarks`varchar(255) DEFAULT NULL COMMENT'备注信息',
`del_flag`char(1) DEFAULT NULL COMMENT'删除标记',
  PRIMARY KEY (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 LOCK TABLES `scms_approval` WRITE;
UNLOCK TABLES;

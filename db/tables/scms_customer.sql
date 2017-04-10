USE `SAMS`;
DROP TABLE IF EXISTS `scms_customer`;
CREATE TABLE `scms_customer`
(
`id`varchar(32) NOT NULL COMMENT'id',
`customer_name`varchar(50) DEFAULT NULL COMMENT'客户姓名',
`customer_adress`varchar(200) DEFAULT NULL COMMENT'客户地点',
`customer_tel1`varchar(50) DEFAULT NULL COMMENT'电话号码1',
`customer_tel2`varchar(50) DEFAULT NULL COMMENT'电话号码2',
`family_name`varchar(50) DEFAULT NULL COMMENT'家属姓名',
`family_tel`varchar(50) DEFAULT NULL COMMENT'家属电话',
`stutas`varchar(2) DEFAULT NULL COMMENT'状态',
`create_by`varchar(50) DEFAULT NULL COMMENT'创建者',
`create_date`datetime DEFAULT NULL COMMENT'创建时间',
`update_by`varchar(50) DEFAULT NULL COMMENT'更新者',
`update_date`datetime DEFAULT NULL COMMENT'更新时间',
`remarks`varchar(255) DEFAULT NULL COMMENT'备注信息',
`del_flag`char(1) DEFAULT NULL COMMENT'删除标记',
  PRIMARY KEY (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 LOCK TABLES `scms_customer` WRITE;
UNLOCK TABLES;

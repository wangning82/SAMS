USE `SAMS`;
DROP TABLE IF EXISTS `scms_building`;
CREATE TABLE `scms_building`
(
`id`varchar(32) NOT NULL COMMENT'id',
`build_name`varchar(50) NOT NULL COMMENT'楼盘名称',
`build_adress`varchar(200) NOT NULL COMMENT'楼盘地点',
`build_area`numeric(14,2) DEFAULT NULL COMMENT'楼盘面积',
`build_numbers`int DEFAULT NULL COMMENT'楼栋数',
`up_price`numeric(14,2) DEFAULT NULL COMMENT'价格上限',
`low_price`numeric(14,2) DEFAULT NULL COMMENT'价格下限',
`sale_time`varchar(50) DEFAULT NULL COMMENT'销售时间',
`residue_room_no`int DEFAULT NULL COMMENT'剩余房间量',
`stutas`varchar(1) DEFAULT NULL COMMENT'状态',
`create_by`varchar(50) DEFAULT NULL COMMENT'创建者',
`create_date`datetime DEFAULT NULL COMMENT'创建时间',
`update_by`varchar(50) DEFAULT NULL COMMENT'更新者',
`update_date`datetime DEFAULT NULL COMMENT'更新时间',
`remarks`varchar(255) DEFAULT NULL COMMENT'备注信息',
`del_flag`char(1) DEFAULT NULL COMMENT'删除标记',
  PRIMARY KEY (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 LOCK TABLES `scms_building` WRITE;
UNLOCK TABLES;

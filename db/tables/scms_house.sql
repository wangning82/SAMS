USE `SAMS`;
DROP TABLE IF EXISTS `scms_house`;
CREATE TABLE `scms_house`
(
`id`varchar(32) NOT NULL COMMENT'id',
`build_name`varchar(50) DEFAULT NULL COMMENT'楼盘名称',
`build_adress`varchar(200) DEFAULT NULL COMMENT'楼盘地点',
`build_area`numeric(14,2) DEFAULT NULL COMMENT'楼盘面积',
`build_no`varchar(10) DEFAULT NULL COMMENT'楼栋号',
`door_no`varchar(10) DEFAULT NULL COMMENT'楼门号',
`flloor_no`varchar(10) DEFAULT NULL COMMENT'楼层数',
`house_no`varchar(10) DEFAULT NULL COMMENT'房屋号',
`areage`numeric(14,2) DEFAULT NULL COMMENT'房屋面积',
`up_price`numeric(14,2) DEFAULT NULL COMMENT'价格上限',
`open_price`numeric(14,2) DEFAULT NULL COMMENT'公开单价',
`low_price`numeric(14,2) DEFAULT NULL COMMENT'价格下限',
`sale_time`varchar(50) DEFAULT NULL COMMENT'销售时间',
`stutas`varchar(2) DEFAULT NULL COMMENT'状态',
`create_by`varchar(50) DEFAULT NULL COMMENT'创建者',
`create_date`datetime DEFAULT NULL COMMENT'创建时间',
`update_by`varchar(50) DEFAULT NULL COMMENT'更新者',
`update_date`datetime DEFAULT NULL COMMENT'更新时间',
`remarks`varchar(255) DEFAULT NULL COMMENT'备注信息',
`del_flag`char(1) DEFAULT NULL COMMENT'删除标记',
  PRIMARY KEY (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 LOCK TABLES `scms_house` WRITE;
UNLOCK TABLES;

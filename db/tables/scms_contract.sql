USE `SAMS`;
DROP TABLE IF EXISTS `scms_contract`;
CREATE TABLE `scms_contract`
(
`id`varchar(32) NOT NULL COMMENT'id',
`house_id`varchar(50) DEFAULT NULL COMMENT'房间id',
`customer_id`varchar(32) DEFAULT NULL COMMENT'客户id',
`user_id`varchar(32) DEFAULT NULL COMMENT'用户id',
`contract_type`varchar(2) DEFAULT NULL COMMENT'合同类型',
`conclude_time`varchar(50) DEFAULT NULL COMMENT'签订时间',
`conclude_money`numeric(14,2) DEFAULT NULL COMMENT'合同金额',
`payment_type`varchar(2) DEFAULT NULL COMMENT'付款类型',
`payment_ratio`numeric(4,2) DEFAULT NULL COMMENT'付款比例',
`payment_money`numeric(14,2) DEFAULT NULL COMMENT'付款金额',
`loan_bank`varchar(100) DEFAULT NULL COMMENT'贷款银行',
`bank_tel`varchar(50) DEFAULT NULL COMMENT'银行电话',
`bank_adress`varchar(100) DEFAULT NULL COMMENT'银行地址',
`loan_limit`int DEFAULT NULL COMMENT'贷款年限',
`loan_time`varchar(50) DEFAULT NULL COMMENT'贷款时间',
`stutas`varchar(2) DEFAULT NULL COMMENT'状态',
`create_by`varchar(50) DEFAULT NULL COMMENT'创建者',
`create_date`datetime DEFAULT NULL COMMENT'创建时间',
`update_by`varchar(50) DEFAULT NULL COMMENT'更新者',
`update_date`datetime DEFAULT NULL COMMENT'更新时间',
`remarks`varchar(255) DEFAULT NULL COMMENT'备注信息',
`del_flag`char(1) DEFAULT NULL COMMENT'删除标记',
  PRIMARY KEY (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 LOCK TABLES `scms_contract` WRITE;
UNLOCK TABLES;

USE `SAMS`;
DROP TABLE IF EXISTS `scms_contract`;
CREATE TABLE `scms_contract`
(
`id`varchar(32) NOT NULL COMMENT'id',
`house_id`varchar(50) DEFAULT NULL COMMENT'����id',
`customer_id`varchar(32) DEFAULT NULL COMMENT'�ͻ�id',
`user_id`varchar(32) DEFAULT NULL COMMENT'�û�id',
`contract_type`varchar(2) DEFAULT NULL COMMENT'��ͬ����',
`conclude_time`varchar(50) DEFAULT NULL COMMENT'ǩ��ʱ��',
`conclude_money`numeric(14,2) DEFAULT NULL COMMENT'��ͬ���',
`payment_type`varchar(2) DEFAULT NULL COMMENT'��������',
`payment_ratio`numeric(4,2) DEFAULT NULL COMMENT'�������',
`payment_money`numeric(14,2) DEFAULT NULL COMMENT'������',
`loan_bank`varchar(100) DEFAULT NULL COMMENT'��������',
`bank_tel`varchar(50) DEFAULT NULL COMMENT'���е绰',
`bank_adress`varchar(100) DEFAULT NULL COMMENT'���е�ַ',
`loan_limit`int DEFAULT NULL COMMENT'��������',
`loan_time`varchar(50) DEFAULT NULL COMMENT'����ʱ��',
`stutas`varchar(2) DEFAULT NULL COMMENT'״̬',
`create_by`varchar(50) DEFAULT NULL COMMENT'������',
`create_date`datetime DEFAULT NULL COMMENT'����ʱ��',
`update_by`varchar(50) DEFAULT NULL COMMENT'������',
`update_date`datetime DEFAULT NULL COMMENT'����ʱ��',
`remarks`varchar(255) DEFAULT NULL COMMENT'��ע��Ϣ',
`del_flag`char(1) DEFAULT NULL COMMENT'ɾ�����',
  PRIMARY KEY (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 LOCK TABLES `scms_contract` WRITE;
UNLOCK TABLES;

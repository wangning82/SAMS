USE `SAMS`;
DROP TABLE IF EXISTS `scms_customer`;
CREATE TABLE `scms_customer`
(
`id`varchar(32) NOT NULL COMMENT'id',
`customer_name`varchar(50) DEFAULT NULL COMMENT'�ͻ�����',
`customer_adress`varchar(200) DEFAULT NULL COMMENT'�ͻ��ص�',
`customer_tel1`varchar(50) DEFAULT NULL COMMENT'�绰����1',
`customer_tel2`varchar(50) DEFAULT NULL COMMENT'�绰����2',
`family_name`varchar(50) DEFAULT NULL COMMENT'��������',
`family_tel`varchar(50) DEFAULT NULL COMMENT'�����绰',
`stutas`varchar(2) DEFAULT NULL COMMENT'״̬',
`create_by`varchar(50) DEFAULT NULL COMMENT'������',
`create_date`datetime DEFAULT NULL COMMENT'����ʱ��',
`update_by`varchar(50) DEFAULT NULL COMMENT'������',
`update_date`datetime DEFAULT NULL COMMENT'����ʱ��',
`remarks`varchar(255) DEFAULT NULL COMMENT'��ע��Ϣ',
`del_flag`char(1) DEFAULT NULL COMMENT'ɾ�����',
  PRIMARY KEY (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 LOCK TABLES `scms_customer` WRITE;
UNLOCK TABLES;

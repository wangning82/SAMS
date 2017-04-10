USE `SAMS`;
DROP TABLE IF EXISTS `scms_house`;
CREATE TABLE `scms_house`
(
`id`varchar(32) NOT NULL COMMENT'id',
`build_name`varchar(50) DEFAULT NULL COMMENT'¥������',
`build_adress`varchar(200) DEFAULT NULL COMMENT'¥�̵ص�',
`build_area`numeric(14,2) DEFAULT NULL COMMENT'¥�����',
`build_no`varchar(10) DEFAULT NULL COMMENT'¥����',
`door_no`varchar(10) DEFAULT NULL COMMENT'¥�ź�',
`flloor_no`varchar(10) DEFAULT NULL COMMENT'¥����',
`house_no`varchar(10) DEFAULT NULL COMMENT'���ݺ�',
`areage`numeric(14,2) DEFAULT NULL COMMENT'�������',
`up_price`numeric(14,2) DEFAULT NULL COMMENT'�۸�����',
`open_price`numeric(14,2) DEFAULT NULL COMMENT'��������',
`low_price`numeric(14,2) DEFAULT NULL COMMENT'�۸�����',
`sale_time`varchar(50) DEFAULT NULL COMMENT'����ʱ��',
`stutas`varchar(2) DEFAULT NULL COMMENT'״̬',
`create_by`varchar(50) DEFAULT NULL COMMENT'������',
`create_date`datetime DEFAULT NULL COMMENT'����ʱ��',
`update_by`varchar(50) DEFAULT NULL COMMENT'������',
`update_date`datetime DEFAULT NULL COMMENT'����ʱ��',
`remarks`varchar(255) DEFAULT NULL COMMENT'��ע��Ϣ',
`del_flag`char(1) DEFAULT NULL COMMENT'ɾ�����',
  PRIMARY KEY (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 LOCK TABLES `scms_house` WRITE;
UNLOCK TABLES;

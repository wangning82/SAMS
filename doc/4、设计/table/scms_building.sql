USE `SAMS`;
DROP TABLE IF EXISTS `scms_building`;
CREATE TABLE `scms_building`
(
`id`varchar(32) NOT NULL COMMENT'id',
`build_name`varchar(50) NOT NULL COMMENT'¥������',
`build_adress`varchar(200) NOT NULL COMMENT'¥�̵ص�',
`build_area`numeric(14,2) DEFAULT NULL COMMENT'¥�����',
`build_numbers`int DEFAULT NULL COMMENT'¥����',
`up_price`numeric(14,2) DEFAULT NULL COMMENT'�۸�����',
`low_price`numeric(14,2) DEFAULT NULL COMMENT'�۸�����',
`sale_time`varchar(50) DEFAULT NULL COMMENT'����ʱ��',
`residue_room_no`int DEFAULT NULL COMMENT'ʣ�෿����',
`stutas`varchar(1) DEFAULT NULL COMMENT'״̬',
`create_by`varchar(50) DEFAULT NULL COMMENT'������',
`create_date`datetime DEFAULT NULL COMMENT'����ʱ��',
`update_by`varchar(50) DEFAULT NULL COMMENT'������',
`update_date`datetime DEFAULT NULL COMMENT'����ʱ��',
`remarks`varchar(255) DEFAULT NULL COMMENT'��ע��Ϣ',
`del_flag`char(1) DEFAULT NULL COMMENT'ɾ�����',
  PRIMARY KEY (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 LOCK TABLES `scms_building` WRITE;
UNLOCK TABLES;

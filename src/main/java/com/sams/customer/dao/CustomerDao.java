/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.sams.customer.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.sams.customer.entity.Customer;

/**
 * 客户DAO接口
 * @author wangqingxiang
 * @version 2017-04-01
 */
@MyBatisDao
public interface CustomerDao extends CrudDao<Customer> {
	
}
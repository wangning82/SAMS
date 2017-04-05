/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.sams.order.dao;

import com.sams.order.entity.Order;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 订单管理DAO接口
 * @author wangqingxiang
 * @version 2017-03-30
 */
@MyBatisDao
public interface OrderDao extends CrudDao<Order> {
	
}
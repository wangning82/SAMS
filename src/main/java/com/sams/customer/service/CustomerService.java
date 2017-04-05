/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.sams.customer.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.sams.customer.entity.Customer;
import com.sams.customer.dao.CustomerDao;

/**
 * 客户Service
 * @author wangqingxiang
 * @version 2017-04-01
 */
@Service
@Transactional(readOnly = true)
public class CustomerService extends CrudService<CustomerDao, Customer> {

	public Customer get(String id) {
		return super.get(id);
	}
	
	public List<Customer> findList(Customer customer) {
		return super.findList(customer);
	}
	
	public Page<Customer> findPage(Page<Customer> page, Customer customer) {
		return super.findPage(page, customer);
	}
	
	@Transactional(readOnly = false)
	public void save(Customer customer) {
		super.save(customer);
	}
	
	@Transactional(readOnly = false)
	public void delete(Customer customer) {
		super.delete(customer);
	}
	
}
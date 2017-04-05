/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.sams.customer.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.sams.customer.entity.Customer;
import com.sams.customer.service.CustomerService;

/**
 * 客户Controller
 * @author wangqingxiang
 * @version 2017-04-01
 */
@Controller
@RequestMapping(value = "${adminPath}/customer/customer")
public class CustomerController extends BaseController {

	@Autowired
	private CustomerService customerService;
	
	@ModelAttribute
	public Customer get(@RequestParam(required=false) String id) {
		Customer entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = customerService.get(id);
		}
		if (entity == null){
			entity = new Customer();
		}
		return entity;
	}
	
	@RequiresPermissions("customer:customer:view")
	@RequestMapping(value = {"list", ""})
	public String list(Customer customer, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Customer> page = customerService.findPage(new Page<Customer>(request, response), customer); 
		model.addAttribute("page", page);
		return "sams/customer/customerList";
	}

	@RequiresPermissions("customer:customer:view")
	@RequestMapping(value = "form")
	public String form(Customer customer, Model model) {
		model.addAttribute("customer", customer);
		return "sams/customer/customerForm";
	}

	@RequiresPermissions("customer:customer:edit")
	@RequestMapping(value = "save")
	public String save(Customer customer, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, customer)){
			return form(customer, model);
		}
		customerService.save(customer);
		addMessage(redirectAttributes, "保存客户成功");
		return "redirect:"+Global.getAdminPath()+"/customer/customer/?repage";
	}
	
	@RequiresPermissions("customer:customer:edit")
	@RequestMapping(value = "delete")
	public String delete(Customer customer, RedirectAttributes redirectAttributes) {
		customerService.delete(customer);
		addMessage(redirectAttributes, "删除客户成功");
		return "redirect:"+Global.getAdminPath()+"/customer/customer/?repage";
	}

}
/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.sams.order.service;

import com.google.common.collect.Maps;
import com.sams.customer.service.CustomerService;
import com.sams.order.dao.OrderDao;
import com.sams.order.entity.Order;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.act.utils.ActUtils;
import com.thinkgem.jeesite.modules.oa.entity.TestAudit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * 订单管理Service
 * @author wangqingxiang
 * @version 2017-03-30
 */
@Service
@Transactional(readOnly = true)
public class OrderService extends CrudService<OrderDao, Order> {
	@Autowired
	private ActTaskService actTaskService;
	@Autowired
	private CustomerService customerService;

	public Order get(String id) {
		return super.get(id);
	}
	
	public List<Order> findList(Order order) {
		return super.findList(order);
	}
	
	public Page<Order> findPage(Page<Order> page, Order order) {
		return super.findPage(page, order);
	}
	
	@Transactional(readOnly = false)
	public void save(Order order) {
		// 申请发起
		if (StringUtils.isBlank(order.getId())){
			if(StringUtils.isBlank(order.getCustomer().getId())){
				customerService.save(order.getCustomer());
			}
			order.preInsert();
			dao.insert(order);
			// 启动流程
			actTaskService.startProcess(ActUtils.PD_ORDER[0], ActUtils.PD_ORDER[1], order.getId(), order.getCode());
		}

		// 重新编辑申请
		else{
			order.preUpdate();
			dao.update(order);
			order.getAct().setComment(("yes".equals(order.getAct().getFlag())?"[重申] ":"[销毁] ")+order.getAct().getComment());

			// 完成流程任务
			Map<String, Object> vars = Maps.newHashMap();
			vars.put("pass", "yes".equals(order.getAct().getFlag())? "1" : "0");
			actTaskService.complete(order.getAct().getTaskId(), order.getAct().getProcInsId(), order.getAct().getComment(), order.getRemark(), vars);
		}
	}
	/**
	 * 审核审批保存
	 * @param order
	 */
	@Transactional(readOnly = false)
	public void auditSave(Order order) {

		// 设置意见
		order.getAct().setComment(("yes".equals(order.getAct().getFlag())?"[同意] ":"[驳回] ")+order.getAct().getComment());

		order.preUpdate();

		// 对不同环节的业务逻辑进行操作
		String taskDefKey = order.getAct().getTaskDefKey();

		// 审核环节
		if ("audit1".equals(taskDefKey)){
			order.setTextA(order.getAct().getComment());
			dao.update(order);
		}
		else if ("audit2".equals(taskDefKey)){
			order.setTextB(order.getAct().getComment());
			dao.update(order);
		}
		else if ("audit3".equals(taskDefKey)){
			order.setTextC(order.getAct().getComment());
			dao.update(order);

		}
		else if ("apply_end".equals(taskDefKey)){

		}

		// 未知环节，直接返回
		else{
			return;
		}

		// 提交流程任务
		Map<String, Object> vars = Maps.newHashMap();
		vars.put("pass", "yes".equals(order.getAct().getFlag())? "1" : "0");
		actTaskService.complete(order.getAct().getTaskId(), order.getAct().getProcInsId(), order.getAct().getComment(), vars);

	}
	@Transactional(readOnly = false)
	public void delete(Order order) {
		super.delete(order);
	}
	
}
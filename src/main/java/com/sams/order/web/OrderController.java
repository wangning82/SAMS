/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.sams.order.web;

import com.sams.order.entity.Order;
import com.sams.order.service.OrderService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.act.entity.Act;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 订单管理Controller
 * @author wangqingxiang
 * @version 2017-03-30
 */
@Controller
@RequestMapping(value = "${adminPath}/sams/order")
public class OrderController extends BaseController {
	@Autowired
	private ActTaskService actTaskService;
	@Autowired
	private OrderService orderService;
	
	@ModelAttribute
	public Order get(@RequestParam(required=false) String id) {
		Order entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = orderService.get(id);
		}
		if (entity == null){
			entity = new Order();
		}
		return entity;
	}
	
	@RequiresPermissions("sams:order:order:view")
	@RequestMapping(value = {"list", ""})
	public String list(Order order, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Order> page = orderService.findPage(new Page<Order>(request, response), order); 
		model.addAttribute("page", page);
		return "/sams/order/orderList";
	}

	@RequiresPermissions("sams:order:order:view")
	@RequestMapping(value = "form")
	public String form(Order order, Model model) {
		model.addAttribute("order", order);
		String view = "orderForm";

		// 查看审批申请单
		if (org.apache.commons.lang3.StringUtils.isNotBlank(order.getId())){//.getAct().getProcInsId())){

			// 环节编号
			String taskDefKey = order.getAct().getTaskDefKey();

			// 查看工单
			if(order.getAct().isFinishTask()){
				view = "orderView";
			}
			// 修改环节
			else if ("modify".equals(taskDefKey)){
				view = "orderForm";
			}
			// 审核环节
			else if ("audit1".equals(taskDefKey)){
				view = "orderAudit";
//				String formKey = "/oa/testAudit";
//				return "redirect:" + ActUtils.getFormUrl(formKey, testAudit.getAct());
			}
			// 审核环节2
			else if ("audit2".equals(taskDefKey)){
				view = "orderAudit";
			}
			// 审核环节3
			else if ("audit3".equals(taskDefKey)){
				view = "orderAudit";
			}

			// 兑现环节
			else if ("apply_end".equals(taskDefKey)){
				view = "orderAudit";
			}
		}
		return "/sams/order/"+view;
	}
	/**
	 * 获取待办列表
	 * @param
	 * @return
	 */
	@RequestMapping(value = {"todo", ""})
	public String todoList(Act act, HttpServletResponse response, Model model) throws Exception {
		List<Act> list = actTaskService.todoList(act);
		model.addAttribute("list", list);
		if (UserUtils.getPrincipal().isMobileLogin()){
			return renderString(response, list);
		}
		return "/sams/order/orderAuditList";
	}

	/**
	 * 获取已办任务
	 * @param  act
	 * @return
	 */
	@RequestMapping(value = "historic")
	public String historicList(Act act, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		Page<Act> page = new Page<Act>(request, response);
		page = actTaskService.historicList(page, act);
		model.addAttribute("page", page);
		if (UserUtils.getPrincipal().isMobileLogin()){
			return renderString(response, page);
		}
		return "/sams/order/orderAuditHistoricList";
	}

	@RequiresPermissions("sams:order:order:edit")
	@RequestMapping(value = "save")
	public String save(Order order, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, order)){
			return form(order, model);
		}
		orderService.save(order);
		addMessage(redirectAttributes, "保存订单成功");
		return "redirect:"+Global.getAdminPath()+"/sams/order/form?repage";
	}
	@RequiresPermissions("sams:order:order:edit")
	@RequestMapping(value = "auditSave")
	public String auditSave(Order order, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, order)){
			return form(order, model);
		}
		orderService.auditSave(order);
		addMessage(redirectAttributes, "保存订单成功");
		return "redirect:"+Global.getAdminPath()+"/sams/order/todo?repage";
	}
	
	@RequiresPermissions("sams:order:order:edit")
	@RequestMapping(value = "delete")
	public String delete(Order order, RedirectAttributes redirectAttributes) {
		orderService.delete(order);
		addMessage(redirectAttributes, "删除订单成功");
		return "redirect:"+Global.getAdminPath()+"/sams/order/?repage";
	}

}